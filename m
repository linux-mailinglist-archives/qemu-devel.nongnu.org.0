Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FBC648711
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 17:54:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3gdU-0006AW-Fl; Fri, 09 Dec 2022 11:54:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3gdP-00069y-AS
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:54:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3gd9-0000Dz-Tt
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:54:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670604827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dY4zyOLFUWkSXE2x19oA8YBP+SA7fDS6H2U/J4AxgPs=;
 b=EkRbZg9pwbugyJDJLI8dJpleRZuiIsJlh9Bqe8ibnMqhc7HaPj/Qur9qmZzY6YZE2INY1a
 h8aps+sEJ5siZR3BDdGDOMA9Rp/5SHZobtU2urmDZmOM80IWZolM0GZYHCSKv8ltjaDs7z
 kJTFsxM1LsOWuoMrPSjlnxdcioN1WHE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-244-NMZwxcb6PY2RV5q74VQYnA-1; Fri, 09 Dec 2022 11:53:44 -0500
X-MC-Unique: NMZwxcb6PY2RV5q74VQYnA-1
Received: by mail-ed1-f69.google.com with SMTP id
 z4-20020a05640240c400b0046c51875c17so1719527edb.1
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 08:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dY4zyOLFUWkSXE2x19oA8YBP+SA7fDS6H2U/J4AxgPs=;
 b=Fs8/SPU87rjY/yV77SvuRPpWZL89KiHaOG5SEzKb82lM5KlmkeGAFYWIqIeUS2zknN
 IJ7gRbwRXTWcnLUuC+Zgf/3FdPSBhhRSAjOOicTte+Rc2QkUyEN/wMZ82kPfWASjfM7A
 v99erkxBLkBStgD1QYO8iD9VEMugw1DBARycpZrp/3Yh2G+7e61tdR+O/ADLqRYgw5bN
 YmIY6ubjxlymOhqlGS3jjI/PrwOqfGVznQV8TZd+zBetd/7Q9/H6IDjkkziZrKLRktM8
 L4JlxWVhSr6xWUoaZvJL76Acm0S/Y5JyQIlOeS0b2ydeVzPAHSpG/HfZiVdSwz0TRbHt
 6lUg==
X-Gm-Message-State: ANoB5plRK9QK+zfWPiMTHsyFNBztzUWrgvMYqe8s807KcYAoKZrs3yuU
 4Ou8NaDJrEDFtXfWTvzgj75SxNmg7BR9zvhwIkzG/VKRLG4KdPQJbng6OedNFS6V2OnTPRSdbOK
 +Xin7OuhU0MP2wIQ=
X-Received: by 2002:a05:6402:1112:b0:46c:6ed1:83b0 with SMTP id
 u18-20020a056402111200b0046c6ed183b0mr42437edv.9.1670604822777; 
 Fri, 09 Dec 2022 08:53:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4q+p8D4ykha9VBlNiDwxFrTYEF/yrjCc4YhcHbq1onfYw+0a6j2ieb7jlGsiHf3U+8jcaFog==
X-Received: by 2002:a05:6402:1112:b0:46c:6ed1:83b0 with SMTP id
 u18-20020a056402111200b0046c6ed183b0mr42423edv.9.1670604822588; 
 Fri, 09 Dec 2022 08:53:42 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 y15-20020a056402134f00b0046b531fcf9fsm842296edw.59.2022.12.09.08.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 08:53:42 -0800 (PST)
Message-ID: <30eec378-779a-26ca-42f3-a7980a647ad7@redhat.com>
Date: Fri, 9 Dec 2022 17:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 14/15] block: Don't poll in bdrv_replace_child_noperm()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru, qemu-devel@nongnu.org
References: <20221118174110.55183-1-kwolf@redhat.com>
 <20221118174110.55183-15-kwolf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221118174110.55183-15-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.288, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/18/22 18:41, Kevin Wolf wrote:
> In order to make sure that bdrv_replace_child_noperm() doesn't have to
> poll any more, get rid of the bdrv_parent_drained_begin_single() call.
> 
> This is possible now because we can require that the parent is already
> drained through the child in question when the function is called and we
> don't call the parent drain callbacks more than once.
> 
> The additional drain calls needed in callers cause the test case to run
> its code in the drain handler too early (bdrv_attach_child() drains
> now), so modify it to only enable the code after the test setup has
> completed.
> 
> Signed-off-by: Kevin Wolf<kwolf@redhat.com>

I hate to bear bad news, but this breaks the Windows builds on github 
(msys-32bit, msys-64bit) with an obscure but 100% reproducible

51/88 qemu:unit / test-bdrv-drain 
ERROR           1.30s   (exit status 3221225477 or signal 3221225349 
SIGinvalid)

The exit status is 0xC0000005 aka a Windows SIGSEGV.  With some luck it 
could be reproducible with Wine (but no gdb).

Paolo


