Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A64668EF43
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 13:44:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPjGe-0006HF-Nb; Wed, 08 Feb 2023 07:09:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pPjGQ-0006Bk-20
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:09:27 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pPjGL-0007vU-Tj
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:09:25 -0500
Received: by mail-wr1-x431.google.com with SMTP id h16so16499274wrz.12
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 04:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R1KjEsIGivqmk2K1yIzvCiCv9uH4m8neXzHqtilaC7k=;
 b=Cp3dCR699ZdvJSjIVe0PStARxtmQYIkDU5fFBGXcYp4+OCs37zq3GkGzYxOZWRiRek
 5eZ94pCZ/4Kyd5YfIrmsDxac2ObV1+Rx1+Vvn0T6GEitaa68+koFH9NRE6iER57aNINg
 4hbFtFJ9cTv9BEZ/APRjOHJtIuFddAD6IVOrSLPkcQarP6jCLsL7jt1Gp0AHK2LbAO89
 YHFu67RS4kvnrpVKcIovb0FvjyR28Iw1HNZVhLS4NRdR8ZoRnCo4aFlwwACJkBOu9/z8
 Rt0KpNzxWPhDF9S2f0ofJJhkpwPADC5zl8JbYOjRtznuCxaPu35qkSCnj1GMGP42X3gN
 ffnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R1KjEsIGivqmk2K1yIzvCiCv9uH4m8neXzHqtilaC7k=;
 b=wEQDwGPAn9/iz6WB52haQfiaTNZh/P0h7aoCIJO48EbxFRxXEc5FuVSMhEWHzONE17
 nippW3OO4XAvg/FkOo+ZfA+09ddb/3MWrP85HbT+ln6bMzbqNFEqIlpak5UHPAbEn9KY
 v+0VTVdUl4Ih53P3jcXGpW/gMg97czkjI7N7F9NgDkwi77UJcNVr8O+xQSHOk4E14MiX
 mceykrMP8OO350W8cUY62Mf+VD7bj1EAY1jTd3nmFG9C+O/4gZRYX9ZYEYZ4Hxtlfss4
 IsKwpoxOxizGAF4QO3MvT/TIOYOujx4ps3vqgvMPADZbaufeak5GC7yWn0mWLKVOkCbk
 GgYA==
X-Gm-Message-State: AO0yUKUFit6GgXPFLdUblhJN9LkOb0WibTrCcb+Ykn98hM5X4O2xvuT8
 6MNYYERhkeJmhSDqGPpg6DeN9w==
X-Google-Smtp-Source: AK7set9L3g0peABdtqjI1GwvyHk90RkErGk1b06C4BXzbvCj3ut0E+ZzfImbb6LtKGqEoYU+vSIwcA==
X-Received: by 2002:adf:e688:0:b0:2c3:e378:41d5 with SMTP id
 r8-20020adfe688000000b002c3e37841d5mr1549591wrm.60.1675858160331; 
 Wed, 08 Feb 2023 04:09:20 -0800 (PST)
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
 by smtp.gmail.com with ESMTPSA id
 u17-20020adfdb91000000b002bdd96d88b4sm13684240wri.75.2023.02.08.04.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 04:09:19 -0800 (PST)
Date: Wed, 8 Feb 2023 12:09:15 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, alex.bennee@linaro.org
Subject: Re: [RFC PATCH 06/16] target/arm/kvm-rme: Initialize vCPU
Message-ID: <Y+OQ607mAYqONH98@myrica>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-7-jean-philippe@linaro.org>
 <85606bc0-5e48-9280-781f-b9641c36ce03@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85606bc0-5e48-9280-781f-b9641c36ce03@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Jan 27, 2023 at 12:37:12PM -1000, Richard Henderson wrote:
> On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> > +static int kvm_arm_rme_get_core_regs(CPUState *cs)
> > +{
> > +    int i, ret;
> > +    struct kvm_one_reg reg;
> > +    ARMCPU *cpu = ARM_CPU(cs);
> > +    CPUARMState *env = &cpu->env;
> > +
> > +    for (i = 0; i < 8; i++) {
> > +        reg.id = AARCH64_CORE_REG(regs.regs[i]);
> > +        reg.addr = (uintptr_t) &env->xregs[i];
> > +        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> > +        if (ret) {
> > +            return ret;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> 
> Wow, this is quite the restriction.
> 
> I get that this is just enough to seed the guest for boot, and take SMC
> traps, but I'm concerned that we can't do much with the machine underneath,
> when it comes to other things like "info registers" or gdbstub will be
> silently unusable.  I would prefer if we can somehow make this loudly
> unusable.

For "info registers", which currently displays zero values for all regs,
we can instead return an error message in aarch64_cpu_dump_state().

For gdbstub, I suspect we should disable it entirely since it seems
fundamentally incompatible with confidential VMs, but I need to spend more
time on this.

Thanks,
Jean

