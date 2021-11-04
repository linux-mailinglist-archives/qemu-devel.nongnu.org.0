Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F29C445035
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 09:25:02 +0100 (CET)
Received: from localhost ([::1]:56616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miY3R-00048i-Ck
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 04:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1miY27-00034G-2i
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:23:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1miY24-0001sf-6y
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636014215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K77x/C+cYxpOtm+kgTohH+gkY5pfYRnXNIB2+VdbIIM=;
 b=ItZkylRHWWzdQFvO9557QBiMNaX2b/2q9DPYwQIYFoFiVvYS6GfsproOr41fzGbsOk15qv
 5NV7WmY7mHFAhNCExxCdkyc9J1PFyCXm8TaMcCSl5Xj4t8EYR+rRYWjXxYj28nh39tBfTk
 nTUQ1ri9/mz9T9rvUR6OD6P0NEn7Z84=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-E5IyNfn5NC-52mEUq1BnLg-1; Thu, 04 Nov 2021 04:23:32 -0400
X-MC-Unique: E5IyNfn5NC-52mEUq1BnLg-1
Received: by mail-wr1-f70.google.com with SMTP id
 y4-20020adfd084000000b00186b16950f3so753011wrh.14
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 01:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=K77x/C+cYxpOtm+kgTohH+gkY5pfYRnXNIB2+VdbIIM=;
 b=kv1qJJm3UUpQi7jtwAGzF8VaBp6TbA2tA6D9d1lqehso5SQEzp8lvJpVmwQByVealx
 3pd/lci8cuXjFSd93kVBcgEx6xaDxzsPYBZZ7oAWZ4zE7oNshhj7kR3hXjcSr1FLxwI+
 2WJ43y+UL4FKp0wjFS48ixZZXWpsGnrb+Ych+a7XggH6EJDp5lhjKMDFqsQ7d/3sKW89
 0EVxQe6SntHDYXj4a1fZH8RcMM0LxL0TUMFmwqsKoXgOO+r4rMtiNzgjkWX2Ved3HMg8
 FvUsuZn0pV1+NV4gP6KxMJRma0DLj0oeySeCjnqPz6FjKD2OliU6xs/86SNOKIddc1Wr
 QSvw==
X-Gm-Message-State: AOAM5328NoS3fBJr9iWEH2AuB2z8/UHiN2TcDy8UYAYaeqKWvfTBF5xk
 AcTp8/pFU8bkUDK6XDMWtvPlB7Hu0MGJZoU1SCMbU684sCSzN4xySDt18zdtYLJtng+Wd0K1Ggn
 lz2dykO3929ARDzI=
X-Received: by 2002:a05:6000:12c5:: with SMTP id
 l5mr46852727wrx.173.1636014211365; 
 Thu, 04 Nov 2021 01:23:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNk8RIuKjfaGNsn1DOeo39hHXzLFmzIERnwUO8vR1v+29MjSzcq8oJiaIS59pmbnaI98JANA==
X-Received: by 2002:a05:6000:12c5:: with SMTP id
 l5mr46852705wrx.173.1636014211082; 
 Thu, 04 Nov 2021 01:23:31 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c9c.dip0.t-ipconnect.de. [79.242.60.156])
 by smtp.gmail.com with ESMTPSA id b10sm4450691wrt.36.2021.11.04.01.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 01:23:30 -0700 (PDT)
Message-ID: <227c48c0-9736-020a-bf21-f70c850c9480@redhat.com>
Date: Thu, 4 Nov 2021 09:23:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>
References: <20211102201122.3188108-1-farman@linux.ibm.com>
 <20211102201122.3188108-3-farman@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC PATCH v2 2/2] s390x: Implement the USER_SIGP_BUSY capability
In-Reply-To: <20211102201122.3188108-3-farman@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.528, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.11.21 21:11, Eric Farman wrote:
> With the USER_SIGP capability, the kernel will pass most (but not all)
> SIGP orders to userspace for processing. But that means that the kernel
> is unable to determine if/when the order has been completed by userspace,
> and could potentially return an incorrect answer (CC1 with status bits
> versus CC2 indicating BUSY) for one of the remaining in-kernel orders.
> 
> With a new USER_SIGP_BUSY capability, the kernel will automatically
> flag a vcpu as busy for a SIGP order, and block further orders directed
> to the same vcpu until userspace resets it to indicate the order has
> been fully processed.
> 
> Let's use the new capability in QEMU.
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>

[...]

> +void kvm_s390_vcpu_reset_busy(S390CPU *cpu)


kvm_s390_vcpu_reset_sigp_busy ?

> +{
> +    CPUState *cs = CPU(cpu);
> +
> +    /* Don't care about the response from this */
> +    kvm_vcpu_ioctl(cs, KVM_S390_VCPU_RESET_SIGP_BUSY);
> +}
> +
>  bool kvm_arch_cpu_check_are_resettable(void)
>  {
>      return true;

[...]

>  static void sigp_sense_running(S390CPU *dst_cpu, SigpInfo *si)
> @@ -338,12 +367,14 @@ static void sigp_sense_running(S390CPU *dst_cpu, SigpInfo *si)
>      if (!tcg_enabled()) {
>          /* handled in KVM */
>          set_sigp_status(si, SIGP_STAT_INVALID_ORDER);
> +        s390_cpu_reset_sigp_busy(dst_cpu);
>          return;
>      }
>  
>      /* sensing without locks is racy, but it's the same for real hw */
>      if (!s390_has_feat(S390_FEAT_SENSE_RUNNING_STATUS)) {
>          set_sigp_status(si, SIGP_STAT_INVALID_ORDER);
> +        s390_cpu_reset_sigp_busy(dst_cpu);
>          return;
>      }
>  
> @@ -353,6 +384,7 @@ static void sigp_sense_running(S390CPU *dst_cpu, SigpInfo *si)
>      } else {
>          si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
>      }
> +    s390_cpu_reset_sigp_busy(dst_cpu);
>  }


Can't we call s390_cpu_reset_sigp_busy() directly from handle_sigp_single_dst(),
after the handle_sigp_single_dst() call?

IIRC we could clear it in case cpu->env.sigp_order wasn't set. Otherwise,
we'll have to clear it once we clear cpu->env.sigp_order -- e.g., in do_stop_interrupt(), but
also during s390_cpu_reset().

We could have a helper function that sets cpu->env.sigp_order = 0 and clears the busy indication.




>  
>  static int handle_sigp_single_dst(S390CPU *cpu, S390CPU *dst_cpu, uint8_t order,
> @@ -420,6 +452,7 @@ static int handle_sigp_single_dst(S390CPU *cpu, S390CPU *dst_cpu, uint8_t order,
>          break;
>      default:
>          set_sigp_status(&si, SIGP_STAT_INVALID_ORDER);
> +        s390_cpu_reset_sigp_busy(dst_cpu);
>      }
>  
>      return si.cc;
> @@ -444,6 +477,12 @@ int handle_sigp(CPUS390XState *env, uint8_t order, uint64_t r1, uint64_t r3)
>      int ret;
>  

Maybe rather lookup the dst once:

if (order != SIGP_SET_ARCH) {
    /* all other sigp orders target a single vcpu */
    dst_cpu = s390_cpu_addr2state(env->regs[r3]);
}

if (qemu_mutex_trylock(&qemu_sigp_mutex)) {
    if (dst_cpu) {
        s390_cpu_reset_sigp_busy(dst_cpu);
    }
    ret = SIGP_CC_BUSY;
    goto out;
}

switch (order) {
case SIGP_SET_ARCH:
    ret = sigp_set_architecture(cpu, param, status_reg);
    break;
default:
    ret = handle_sigp_single_dst(cpu, dst_cpu, order, param, status_reg);
}


BUT, I wonder if this is fully correct.

Can't it happen that another CPU is currently processing an order for
that very same dst_cpu and you would clear SIGP busy of that cpu
prematurely?

>      if (qemu_mutex_trylock(&qemu_sigp_mutex)) {
> +        if (order != SIGP_SET_ARCH) {
> +            dst_cpu = s390_cpu_addr2state(env->regs[r3]);
> +            if (dst_cpu) {
> +                s390_cpu_reset_sigp_busy(dst_cpu);
> +            }
> +        }
>          ret = SIGP_CC_BUSY;
>          goto out;
>      }
> @@ -487,6 +526,7 @@ void do_stop_interrupt(CPUS390XState *env)
>      }
>      env->sigp_order = 0;
>      env->pending_int &= ~INTERRUPT_STOP;
> +    s390_cpu_reset_sigp_busy(cpu);
>  }
>  
>  void s390_init_sigp(void)
> 


-- 
Thanks,

David / dhildenb


