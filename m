Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD642406AA5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 13:18:48 +0200 (CEST)
Received: from localhost ([::1]:42814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOeYR-0007I1-7K
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 07:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mOeVI-0005ad-62
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 07:15:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mOeVE-00005J-H9
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 07:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631272527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GnoGpfQwZNVpQsNNrOOVIDVl69nf11azaqPEse3DPNE=;
 b=TH7iLn8RLa/JN2+wODE60iklAGpFyk/9T4mptCMFbK4q1pTbR+Lx8hjEmysdA+m+T8oWDC
 /a1l8SLhuzu21+tM0fh/2oX3TuxQF8QU/I8jXUOVzPz5QnLT0kw1r/Dyn0Go8kdILqtE5r
 dCT3gJr32yrh6fDx8SGGtpPidq6GcHs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-H1TicTiCMNO82RQDYlj7Dg-1; Fri, 10 Sep 2021 07:15:26 -0400
X-MC-Unique: H1TicTiCMNO82RQDYlj7Dg-1
Received: by mail-wm1-f72.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so662838wmc.9
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 04:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GnoGpfQwZNVpQsNNrOOVIDVl69nf11azaqPEse3DPNE=;
 b=IFuA5cDFcL13yEnkhdLeYwdJQ0nnCJudXt1U90UGkvPYnVjUew4QJtQNtTHnbKkT21
 Wno6IWNk2Tz70J8JF2HwSbT0wqs1wiujXLXrk7zFShR0wuUxB+vPEMLYROPD6u+Bkv5l
 mUiFKN9BtqdCOCfKbeESTUpQ1tSWPIfK/NlUqVevxtaikMUNXPu3d0A9JK/9eJDAyt0c
 pNqmYqYszhPGzuqxwiUSKAy+QmAcQspPR+O9XP8+oHl7lUhr2UasrwfDAx9gKLBIzNtV
 NOMF2zYI9HaXP/9tgJpWw9XQKHPb3lvnN5JC4BUdIG3lvHZ114NuxG9+nDg5kKpczA+a
 gbVw==
X-Gm-Message-State: AOAM531qXjephhmX4vrjK5HKkJEsiNAjOyxKApAT6lwY6LsdztmADRf/
 tUiYOMMHER+7MXd4fVFpMi7qyiklrrwthE9OV4yyEjdFjac5LaOIwlkj4prw6dT/19eejbd086k
 lnSVsAL2c/c0fhEU=
X-Received: by 2002:a5d:58e7:: with SMTP id f7mr9057534wrd.51.1631272525070;
 Fri, 10 Sep 2021 04:15:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKKeR7lfOk+7T4CZ3dZ6Kv5/CtQB+GhbiIIMRmFLcacb03Aiza3bXRfa7G9i6/MHpKg4lpmg==
X-Received: by 2002:a5d:58e7:: with SMTP id f7mr9057513wrd.51.1631272524839;
 Fri, 10 Sep 2021 04:15:24 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c600c.dip0.t-ipconnect.de. [91.12.96.12])
 by smtp.gmail.com with ESMTPSA id
 c2sm4433078wrs.60.2021.09.10.04.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 04:15:24 -0700 (PDT)
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <163101424137.678744.18360776310711795413.stgit@pasha-ThinkPad-X280>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] softmmu: fix watchpoint processing in icount mode
Message-ID: <f103375f-9c3b-9b5b-6ef1-5437b4990c23@redhat.com>
Date: Fri, 10 Sep 2021 13:15:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <163101424137.678744.18360776310711795413.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, richard.henderson@linaro.org,
 peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.09.21 13:30, Pavel Dovgalyuk wrote:
> Watchpoint processing code restores vCPU state twice:
> in tb_check_watchpoint and in cpu_loop_exit_restore/cpu_restore_state.
> Normally it does not affect anything, but in icount mode instruction
> counter is incremented twice and becomes incorrect.
> This patch eliminates unneeded CPU state restore.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   softmmu/physmem.c |    5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 23e77cb771..4025dfab11 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -941,14 +941,11 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
>                   if (wp->flags & BP_STOP_BEFORE_ACCESS) {
>                       cpu->exception_index = EXCP_DEBUG;
>                       mmap_unlock();
> -                    cpu_loop_exit_restore(cpu, ra);
> +                    cpu_loop_exit(cpu);
>                   } else {
>                       /* Force execution of one insn next time.  */
>                       cpu->cflags_next_tb = 1 | curr_cflags(cpu);
>                       mmap_unlock();
> -                    if (ra) {
> -                        cpu_restore_state(cpu, ra, true);
> -                    }
>                       cpu_loop_exit_noexc(cpu);
>                   }
>               }
> 
> 

I'm not an expert on that code, but it looks good to me.

Maybe we could have added a comment above the tb_check_watchpoint() call 
to highlight that the restore will happen in there.

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


