Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4957B328
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 21:21:02 +0200 (CEST)
Received: from localhost ([::1]:35958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsXgD-0006PT-5f
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 15:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55453)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hsXfg-0005ty-Dm
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 15:20:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hsXff-0007wl-EH
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 15:20:28 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37908)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hsXff-0007vt-7n
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 15:20:27 -0400
Received: by mail-wr1-f67.google.com with SMTP id g17so66972986wrr.5
 for <qemu-devel@nongnu.org>; Tue, 30 Jul 2019 12:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/2TgMA0mYoYMd5S0AGn7Pqo7CSYyTHhdztpWfXjyaM0=;
 b=X8RsguWFGs1Mz8L5+Vs/FsZZIbTY1D20K3bSowbFz3HJUnVB7KixOwkc9ad3WhTccu
 SLnm2y7LUcDK0RgCuPtOJmC9vJblRaiTF2TN4dhdFbK0cV/Zi1V7jav099czD6NTA2to
 q/jz/Ti28+9tEfzOsiXqlmYskaDm6s6UuwHXXduFSXJiAR8RodqvGaeaYd3BT/YCZ9v9
 HvQ1v2TwZ1yE3X9Q9KwokhXwSYWBP/5+JHzAaQ4ERgYmR4+VLOiFotwBEHggr+CJb4VF
 cyYmeXULujgN+c/Zd7xQmvmjRBEyJxw/5fys+c+X4Bmg5Pk2RKN7+Q+rjXqBo3vqKTA3
 X9nQ==
X-Gm-Message-State: APjAAAUzkvSZLKWqBO0ZhmoEpYziAV25Bzpltz74BI/wKLt9u835z4Y2
 aowc5IX062SxxEBF9MRHB5RyqA==
X-Google-Smtp-Source: APXvYqxQc619Ttv8elSAbEScDJ0KLNuX3zpIM7M/dRaGKaHkghb51Vn3myAbx5BxOfb/n77rj0R3Rg==
X-Received: by 2002:adf:eacf:: with SMTP id o15mr7061714wrn.171.1564514426019; 
 Tue, 30 Jul 2019 12:20:26 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:29d3:6123:6d5f:2c04?
 ([2001:b07:6468:f312:29d3:6123:6d5f:2c04])
 by smtp.gmail.com with ESMTPSA id b15sm81335227wrt.77.2019.07.30.12.20.24
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 12:20:25 -0700 (PDT)
To: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <1564502498-805893-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1564502498-805893-4-git-send-email-andrey.shinkevich@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <14b60c5b-6ed4-0f4d-17a8-6ec861115c1e@redhat.com>
Date: Tue, 30 Jul 2019 21:20:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564502498-805893-4-git-send-email-andrey.shinkevich@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] [PATCH 3/3] i386/kvm: initialize struct at full
 before ioctl call
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
Cc: vsementsov@virtuozzo.com, berto@igalia.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mtosatti@redhat.com, mdroth@linux.vnet.ibm.com,
 armbru@redhat.com, Christian Borntraeger <borntraeger@de.ibm.com>,
 den@openvz.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/07/19 18:01, Andrey Shinkevich wrote:
> Not the whole structure is initialized before passing it to the KVM.
> Reduce the number of Valgrind reports.
> 
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Christian, is this the right fix?  It's not expensive so it wouldn't be
an issue, just checking if there's any better alternative.

Paolo

> ---
>  target/i386/kvm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
> index dbbb137..ed57e31 100644
> --- a/target/i386/kvm.c
> +++ b/target/i386/kvm.c
> @@ -190,6 +190,7 @@ static int kvm_get_tsc(CPUState *cs)
>          return 0;
>      }
>  
> +    memset(&msr_data, 0, sizeof(msr_data));
>      msr_data.info.nmsrs = 1;
>      msr_data.entries[0].index = MSR_IA32_TSC;
>      env->tsc_valid = !runstate_is_running();
> @@ -1706,6 +1707,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
>  
>      if (has_xsave) {
>          env->xsave_buf = qemu_memalign(4096, sizeof(struct kvm_xsave));
> +        memset(env->xsave_buf, 0, sizeof(struct kvm_xsave));
>      }
>  
>      max_nested_state_len = kvm_max_nested_state_length();
> @@ -3477,6 +3479,7 @@ static int kvm_put_debugregs(X86CPU *cpu)
>          return 0;
>      }
>  
> +    memset(&dbgregs, 0, sizeof(dbgregs));
>      for (i = 0; i < 4; i++) {
>          dbgregs.db[i] = env->dr[i];
>      }
> -- 
> 1.8.3.1
> 



