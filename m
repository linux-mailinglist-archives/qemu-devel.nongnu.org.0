Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962A258EECA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 16:51:31 +0200 (CEST)
Received: from localhost ([::1]:41816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLn3R-0006oL-Bo
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 10:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1oLmzM-0002l6-Le
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 10:47:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1oLmzJ-0003Qq-IA
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 10:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660142832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fauXD3/1hKreAKqjYhmlMmUcNZO3/krcmLFWmT0/xzs=;
 b=IqK9rwt5NJoQa7r1ooC52//lwkWt/bIj3ZsLTkRWZrZwS74f8sK1S3uuSKit16IJ12YJkR
 TclAxFb0tmxuT8/NwvYPbpEUtnswHSM2sttQM8bl3IlefUlpTHhuWF46YD2wBSV3n1zpmm
 lKTKHDtIlLKOomPQ5rnSqDSQZm58W4E=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-mlxc_A5AOJSTQwE_nnzvmQ-1; Wed, 10 Aug 2022 10:47:10 -0400
X-MC-Unique: mlxc_A5AOJSTQwE_nnzvmQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 bs33-20020a05620a472100b006b97dc17ab4so3732917qkb.6
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 07:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=fauXD3/1hKreAKqjYhmlMmUcNZO3/krcmLFWmT0/xzs=;
 b=1HQ7nGCBQtNUU1V20KLbnBFtglWsTZBMWGI+1nCk/CWv+5eFzPR3VRzzGZ98JnSC99
 8D2s8zpK9TSEvXIORl5qUuo64xlFnK75vftv13xY41Tj6gOYIaby2qE4sDJHE9dxaQTy
 pcPkvR5s3Yt1N27kd+ONLYQY8CFvlP3rax/cKa8oEORcyzPCOm8YRs6ymVXGJ77vx5lw
 2Wh6F8CJm9VSL8qOURAt+LePvM697RoUSKG+ErPjW8pgECcvy4H2UaxYFF5Lmoxd/XKH
 4ROLQ7C3Pu9CtSveYV3CdHr+ImPBSwuRTfTpfjGIdNlpHBQLIf7fjfwV7ni169leVhYG
 GkwQ==
X-Gm-Message-State: ACgBeo10PUOMTcImdpbHr1M92T6zHHITuOsc/BLYUTSsrqcs+vrG2Nq+
 vyhWSlHZu0kZoT63EwSuR2uznSqO0xrb0GN9SONHakfTShL7BNermmrS7Ar6rLWHUjiye61FLpT
 G5qK9f2jEqCOSoBw=
X-Received: by 2002:ac8:5742:0:b0:341:fed7:d0ab with SMTP id
 2-20020ac85742000000b00341fed7d0abmr23634940qtx.576.1660142830057; 
 Wed, 10 Aug 2022 07:47:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7vlCGDBCDY6pppT/P5XzeHscUqyEbr/Np6Pa5rid/P5stDpXV7UYxF5s4hSxmdt2vEYPU8tw==
X-Received: by 2002:ac8:5742:0:b0:341:fed7:d0ab with SMTP id
 2-20020ac85742000000b00341fed7d0abmr23634917qtx.576.1660142829768; 
 Wed, 10 Aug 2022 07:47:09 -0700 (PDT)
Received: from [10.35.4.238] (bzq-82-81-161-50.red.bezeqint.net.
 [82.81.161.50]) by smtp.gmail.com with ESMTPSA id
 z9-20020a05622a028900b003422c7ccbc5sm12259809qtw.59.2022.08.10.07.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 07:47:09 -0700 (PDT)
Message-ID: <11df1501c60809e5d83e2591fb43a3b660afaef4.camel@redhat.com>
Subject: Re: [PATCH RFC v1 2/2] i386: reorder kvm_put_sregs2() and
 kvm_put_nested_state() when vCPU is reset
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Date: Wed, 10 Aug 2022 17:47:06 +0300
In-Reply-To: <20220810140007.1036293-3-vkuznets@redhat.com>
References: <20220810140007.1036293-1-vkuznets@redhat.com>
 <20220810140007.1036293-3-vkuznets@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-5.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2022-08-10 at 16:00 +0200, Vitaly Kuznetsov wrote:
> Setting nested state upon migration needs to happen after kvm_put_sregs2()
> to e.g. have EFER.SVME set. This, however, doesn't work for vCPU reset:
> when vCPU is in VMX root operation, certain CR bits are locked and
> kvm_put_sregs2() may fail. As nested state is fully cleaned up upon
> vCPU reset (kvm_arch_reset_vcpu() -> kvm_init_nested_state()), calling
> kvm_put_nested_state() before kvm_put_sregs2() is OK, this will ensure
> that vCPU is *not* in VMX root opertaion.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  target/i386/kvm/kvm.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 4f8dacc1d4b5..73e3880fa57b 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -4529,18 +4529,34 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
>  
>      assert(cpu_is_stopped(cpu) || qemu_cpu_is_self(cpu));
>  
> -    /* must be before kvm_put_nested_state so that EFER.SVME is set */
> +    /*
> +     * When resetting a vCPU, make sure to reset nested state first to
> +     * e.g clear VMXON state and unlock certain CR4 bits.
> +     */
> +    if (level == KVM_PUT_RESET_STATE) {
> +        ret = kvm_put_nested_state(x86_cpu);
> +        if (ret < 0) {
> +            return ret;
> +        }

I should have mentioned this, I actually already debugged the same issue while
trying to reproduce the smm int window bug.
100% my fault.

I also share the same feeling that this might be yet another 'whack a mole' and
break somewhere else, but overall it does make sense.


Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>


Best regards,
	Maxim Levitsky

> +    }
> +
>      ret = has_sregs2 ? kvm_put_sregs2(x86_cpu) : kvm_put_sregs(x86_cpu);
>      if (ret < 0) {
>          return ret;
>      }
>  
> -    if (level >= KVM_PUT_RESET_STATE) {
> +    /*
> +     * When putting full CPU state, kvm_put_nested_state() must happen after
> +     * kvm_put_sregs{,2} so that e.g. EFER.SVME is already set.
> +     */
> +    if (level == KVM_PUT_FULL_STATE) {
>          ret = kvm_put_nested_state(x86_cpu);
>          if (ret < 0) {
>              return ret;
>          }
> +    }
>  
> +    if (level >= KVM_PUT_RESET_STATE) {
>          ret = kvm_put_msr_feature_control(x86_cpu);
>          if (ret < 0) {
>              return ret;



