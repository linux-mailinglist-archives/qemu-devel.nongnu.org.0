Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1634368C78E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 21:22:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP7yv-00015U-PU; Mon, 06 Feb 2023 15:20:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pP7yt-000154-3S
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 15:20:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pP7yr-0005eM-Ew
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 15:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675714848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CcYgxdn21h+6BuTcVQ8mu50Au3DoZptI9uP5b2XsgR0=;
 b=Xz2jmMgRgQA8hgWw2bhscm8Vo1/VYYftp/NwZLb6xMpS5YDg28iHg2eC803yjQ14NFjvBr
 rhFJ9LnZyVkbXXaQ0MAAAZabTM8jr5CDXa07CL1AJdtnexmrCorADKOAINwRSOjJp/mbZc
 wD8QHh5CZSVQyfkHZn5RMBsAfyccNCc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-510-QtwOv_P8M4KprifR1bm5BQ-1; Mon, 06 Feb 2023 15:20:47 -0500
X-MC-Unique: QtwOv_P8M4KprifR1bm5BQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi10-20020a05600c3d8a00b003dd1b5d2a36so3861553wmb.1
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 12:20:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CcYgxdn21h+6BuTcVQ8mu50Au3DoZptI9uP5b2XsgR0=;
 b=jwQx1t9+eBQv7HSFmrE7H/bOfHIxvXgvNWf8iWfD0tRsRdJ7WzG3EQ//6dBMnLMcM1
 bW72IKuIxIbV8jVpaw0bhcxJiH6G3Z63sEn6rHRoQXiP081X75r2rfhAWdKw/6nf51Fa
 fhRRysu6pQftfhe1ugiCzovnITuXacvuNwLCUHsHOGpk2wbhZnlgS1NiWcEuo/lCtT5i
 QNMR3YyKWFtrE4uMNHGNoqE8l/bV/RhQT5wC2s9JnO5HLdQNCGdlVJXEdkf3vmqxBEqT
 i/V5bhhz0+kiuVVPZiy2t/0SC76iENDeWZOtOomAsZ/OjYqRmgIwvZ0gYLQW/lsj2sNQ
 ljKg==
X-Gm-Message-State: AO0yUKWZIWdu5PqLhbRjZ9CTBMusHDfVgxRm1p34eU1mdv1cJ12srQ/0
 JHmG/YYyAhxjXDak8glHj+lM9y78JMonH2V+URlJuDKsZH3gJmafX8NL9KsLqf3uuJmi8BKUaM1
 G75O/MJZSWiTEdVM=
X-Received: by 2002:a5d:453b:0:b0:2bf:af52:b836 with SMTP id
 j27-20020a5d453b000000b002bfaf52b836mr167566wra.16.1675714846563; 
 Mon, 06 Feb 2023 12:20:46 -0800 (PST)
X-Google-Smtp-Source: AK7set/6l4UvoWAIoA6DtrasYNLAeVKCP9xPwtQ5CKo+NT+hG0CIBBuWLf/cYFa7WazFNCLMzQ2EVQ==
X-Received: by 2002:a5d:453b:0:b0:2bf:af52:b836 with SMTP id
 j27-20020a5d453b000000b002bfaf52b836mr167550wra.16.1675714846384; 
 Mon, 06 Feb 2023 12:20:46 -0800 (PST)
Received: from [192.168.8.105] (tmo-096-216.customers.d1-online.com.
 [80.187.96.216]) by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c35cd00b003dc5b59ed7asm12669664wmq.11.2023.02.06.12.20.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 12:20:45 -0800 (PST)
Message-ID: <8669ea09-05b4-b17f-aa85-9943071232d3@redhat.com>
Date: Mon, 6 Feb 2023 21:20:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 1/5] Rename the singlestep global variable to
 one_insn_per_tb
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Markus Armbruster <armbru@redhat.com>
References: <20230206171359.1327671-1-peter.maydell@linaro.org>
 <20230206171359.1327671-2-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230206171359.1327671-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 06/02/2023 18.13, Peter Maydell wrote:
> The 'singlestep' global variable is badly misnamed, because it has
> nothing to do with single-stepping the emulation either via the gdb
> stub or by emulation of architectural debug facilities.  Instead what
> it does is force TCG to put only one instruction into each TB.
> Rename it to one_insn_per_tb, so that it reflects what it does better
> and is easier to search for in the codebase.
> 
> This misnaming is also present in user-facing interfaces: the command
> line option '-singlestep', the HMP 'singlestep' command, and the QMP
> StatusInfo object.  Those are harder to update because we need to
> retain backwards compatibility.  Subsequent patches will add
> better-named aliases so we can eventually deprecate-and-drop the old,
> bad name.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/exec/cpu-common.h   | 2 +-
>   accel/tcg/cpu-exec.c        | 4 ++--
>   bsd-user/main.c             | 4 ++--
>   linux-user/main.c           | 4 ++--
>   softmmu/globals.c           | 2 +-
>   softmmu/runstate-hmp-cmds.c | 4 ++--
>   softmmu/runstate.c          | 2 +-
>   softmmu/vl.c                | 2 +-
>   8 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 6feaa40ca7b..f2592a1967f 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -163,7 +163,7 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
>                           void *ptr, size_t len, bool is_write);
>   
>   /* vl.c */
> -extern int singlestep;
> +extern int one_insn_per_tb;

IMHO the global variable should completely go away - this should get a 
property of the tcg accel instead.

  Thomas


