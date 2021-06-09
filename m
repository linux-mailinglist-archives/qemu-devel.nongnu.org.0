Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9464A3A0E1A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 09:52:50 +0200 (CEST)
Received: from localhost ([::1]:52390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqt17-0008Pt-6z
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 03:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lqt0L-0007kD-St
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 03:52:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lqt0J-0002RA-5y
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 03:52:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623225116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4llh0l9ZeH4f0BeWfG3Huh2364iqEGVsU7V9I+1a/I8=;
 b=SvW+YnMToCU6WZJhFbBa0KbXyiG0p/0X60o8mzn2PwUmbjG+c1+ULyxMxADXHOYQ8n8alT
 pUhkCCYG1NY/rJ1BaTopoE/ZDxhARX3BfeEK08Adke4gkt+7jBW0AppyDaYfm9Z39KmzAf
 V2UzRcKe+I0uAxXAHG40fEu+DJQXVQc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-B2RVLM7AODKr88CJYDIYCw-1; Wed, 09 Jun 2021 03:51:55 -0400
X-MC-Unique: B2RVLM7AODKr88CJYDIYCw-1
Received: by mail-wm1-f71.google.com with SMTP id
 f186-20020a1c1fc30000b02901aaa08ad8f4so2188764wmf.8
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 00:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4llh0l9ZeH4f0BeWfG3Huh2364iqEGVsU7V9I+1a/I8=;
 b=l5P843pcUMn78yBG+hLMEKVywLHr0c3moIjFv2uDEqC04LkDujl80yNyouEe4ND8QA
 aDdT+tWbWaxsnr2z/srfuwz9a/ydsDYgM/v5WzOircTDWBmU4kc65xk5l8QF6qa9izLa
 6xWNbstPxZn6Y8dmvJKGUEWBntFZFmv0Y7UbI/gFNlxDjfAhnwQGu2aX4bROWqWp7U/K
 XSPrthDkklYARdQfUd8fARrhgTeJNq5ApPURsEZ+5DKXNvW2SdJyTXGx9CVwdPiOAuy0
 4GSLoKMWJ0ZFaJntew+tpTUZSSQa6AGErU++TWm740F6gwzZpk8nd6VJ5gvPucZRLLms
 YYMg==
X-Gm-Message-State: AOAM530es6sZNqjwo6MFbFsrZi2SX4xF+FYqEAVpBRbeNg48C5+kl2od
 O5iye3nkHowPsbm5XZ+hLG+/eYDmYLsKR0iDOk1T5JW/YJ7hcU3UpUGv1SH3e/JDkOUHx2+m37d
 FshYGM97Rq7C/eGc=
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr24934441wrr.188.1623225114397; 
 Wed, 09 Jun 2021 00:51:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrBD1gv/i1C3SRDJLdwzaXjpewRhw4xocs3xI7d1cY317QM539NK7Bgg1z32ng4hYKIh6icQ==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr24934434wrr.188.1623225114220; 
 Wed, 09 Jun 2021 00:51:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i9sm19267323wrn.54.2021.06.09.00.51.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 00:51:53 -0700 (PDT)
Subject: Re: [PATCH] KVM: Fix dirty ring mmap incorrect size due to renaming
 accident
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210609014355.217110-1-peterx@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <17006e0c-72ff-3c8a-dd72-b4054020eb38@redhat.com>
Date: Wed, 9 Jun 2021 09:51:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609014355.217110-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hyman Huang <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/21 03:43, Peter Xu wrote:
> Found this when I wanted to try the per-vcpu dirty rate series out, then I
> found that it's not really working and it can quickly hang death a guest.  I
> found strange errors (e.g. guest crash after migration) happens even without
> the per-vcpu dirty rate series.
> 
> When merging dirty ring, probably no one notice that the trivial renaming diff
> [1] missed two existing references of kvm_dirty_ring_sizes; they do matter
> since otherwise we'll mmap() a shorter range of memory after the renaming.
> 
> I think it didn't SIGBUS for me easily simply because some other stuff within
> qemu mmap()ed right after the dirty rings (e.g. when testing 4096 slots, it
> aligned with one small page on x86), so when we access the rings we've been
> reading/writting to random memory elsewhere of qemu.
> 
> Fix the two sizes when map/unmap the shared dirty gfn memory.
> 
> [1] https://lore.kernel.org/qemu-devel/dac5f0c6-1bca-3daf-e5d2-6451dbbaca93@redhat.com/
> 
> Cc: Hyman Huang <huangy81@chinatelecom.cn>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   accel/kvm/kvm-all.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index c7ec5388500..e5b10dd129c 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -411,7 +411,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
>       }
>   
>       if (cpu->kvm_dirty_gfns) {
> -        ret = munmap(cpu->kvm_dirty_gfns, s->kvm_dirty_ring_size);
> +        ret = munmap(cpu->kvm_dirty_gfns, s->kvm_dirty_ring_bytes);
>           if (ret < 0) {
>               goto err;
>           }
> @@ -495,7 +495,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
>   
>       if (s->kvm_dirty_ring_size) {
>           /* Use MAP_SHARED to share pages with the kernel */
> -        cpu->kvm_dirty_gfns = mmap(NULL, s->kvm_dirty_ring_size,
> +        cpu->kvm_dirty_gfns = mmap(NULL, s->kvm_dirty_ring_bytes,
>                                      PROT_READ | PROT_WRITE, MAP_SHARED,
>                                      cpu->kvm_fd,
>                                      PAGE_SIZE * KVM_DIRTY_LOG_PAGE_OFFSET);
> 

Oops, sorry.  I queued it.

Paolo			


