Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891A4413BB9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 22:48:05 +0200 (CEST)
Received: from localhost ([::1]:51470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSmgO-0006ir-KD
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 16:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1mSmLX-0000bs-69
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:26:31 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:44985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1mSmLU-000521-JI
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:26:30 -0400
Received: by mail-pg1-x52c.google.com with SMTP id s11so223310pgr.11
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 13:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lW209IvpVGwUIHBM2lyFlNbgk6ULE4vGERsAkHEAS9I=;
 b=dXfJeVusxo//RT+OjIQ+QAV8VQXT+r3YXYsMPHGMkQL8TNXToEyag4+126TWCtG9E3
 R4FJat2TnBMUSt1aJ9PYC9K6aq0rGe9+E47H4iuUXIl4c/uhJRxuZXwvXQN5pjYN+lpy
 vbKpTkNHlpSXZLdi5VhoU7dAMmy6T6l4ZIJvEEpolJdbAf9fkCGfofaS0GhQ+mLwCcd2
 /+pyBbNhy+BUUcmpJ8GerSSYz3H2B4mXPuzuO/r0yzCFkXloRXPYn/t9KU74fqZT295+
 2lWRmkWnv51bCiAncsA3G56O3EN/zn/vtujN5sYUUUo+H+JiPfBHTZQb9nrTpZXp5w85
 KOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lW209IvpVGwUIHBM2lyFlNbgk6ULE4vGERsAkHEAS9I=;
 b=uca5O0ftr9dOpxhUszLZFat6O04C9eA9PqYggCgjzb2tVMNRbmqRBTAbQkIDiTZluy
 os8ica78BAXwSVENeaKy+2cHZJ1s1Zmed2MBDDrER5n9uvj2oZ8cGlFWhlt+/lNiZ5dl
 aQT5YEvBKp7X+y14eLTWGD1Xm7vGPBSjpzivwDRfmelsAnmfyNPXhjxtIPpaSpLCZQ4T
 2UVD9oF8/4y+7bSLo8FyO4Jemm89Hmh+ZHfAr8b2R3AlZ5gR1Zi2LYiqDXcgqkPykjFc
 wPp+5JMWAdrJ1Vn0Gc1HHImSu/Gn8Yzek3iub/IHhK61u4WgydTJQayoHl1x7nVmJEia
 VrRw==
X-Gm-Message-State: AOAM533pQd12XybBs+mbeUB66lL2Tk56Oznp8hfyY5FvmUmOsIBWqoB0
 0g6ibYnnUqIFSAH/ZK1Qn2M=
X-Google-Smtp-Source: ABdhPJyLjAJB9hY1N6Fw61m2hm5szreWKd1YqHzMr9Fx7mRWjMn3dAHCyVpgpNEjiJq5GgN8lkRcDA==
X-Received: by 2002:a63:9546:: with SMTP id t6mr30006315pgn.260.1632255985620; 
 Tue, 21 Sep 2021 13:26:25 -0700 (PDT)
Received: from localhost (g22.61-45-46.ppp.wakwak.ne.jp. [61.45.46.22])
 by smtp.gmail.com with ESMTPSA id h21sm38525pfc.118.2021.09.21.13.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 13:26:24 -0700 (PDT)
Date: Wed, 22 Sep 2021 05:26:23 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 24/30] linux-user/openrisc: Use force_sig_fault,
 force_sigsegv_for_addr
Message-ID: <YUo/7zXG993jbOVQ@antec>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-25-richard.henderson@linaro.org>
 <CAFEAcA-C_xwxZo2fGsk5Bc36DyFPwOKH_pJgLt8OkSyV=iYZhg@mail.gmail.com>
 <a031dc23-f7e6-49a6-ae90-d563172849ba@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a031dc23-f7e6-49a6-ae90-d563172849ba@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 19, 2021 at 10:49:26AM -0700, Richard Henderson wrote:
> On 8/24/21 10:17 AM, Peter Maydell wrote:
> > I think that EXCP_RANGE should for us be unreachable in user-only
> > mode (because it can only happen if the relevant bits in SR are
> > set, and SR is writeable only in supervisor mode, and its starting
> > value doesn't set these bits). So we could just delete the EXCP_RANGE
> > handling and let it hit the default g_assert_not_reached() case.
> 
> If I also disable the SR case from gdbstub.
> 
> > EXCP_FPE is more tricky -- this happens for FP exceptions, where
> > the enabling bit is in the FPCSR, which does appear to be writeable
> > from user mode. So either:
> >   * our mtspr is wrong and should either be not allowing writes
> >     to FPCSR in usermode (or at least sanitizing them)
> >   * the Linux kernel for openrisc is wrong, because a userspace
> >     program that sets FPCSR.FPEE can make it run into unhandled_exception()
> >     and die(), and it should be doing something else, like delivering
> >     a suitable SIGFPE
> 
> I believe the kernel to be buggy.  But it also point to the fact that no one
> has written fenv.h for or1k for musl, so no one has tried to use those bits.

Hi,

*On User Accessible FPCSR*

As per the spec FPCSR should not be accessible in user space. But...

I am currently working on the OpenRISC port for glibc, and at first I was
planning for FPU support but this was one thing that slowed me down.

For that reason I proposed an architecture change to allow setting fpcsr in user
space, it seems that is allowed by almost all other architectures:

 https://openrisc.io/proposals/p17-user-mode-fpcsr

I think I could also simulate it in the kernel by catching the mtspr failure and
then performing it on behalf of the user if its for MTSPR.

At the moment I am going with softfpu until I can spend time on sorting out the
FPCSR issue.

*On QEMU*

When I started to develop the glibc FPU code, I put a patch into qemu to allow
for using mtspr and mfspr in user space:

 branch:
  https://github.com/stffrdhrn/qemu/commits/or1k-glibc

 commit:
   https://github.com/stffrdhrn/qemu/commit/dfa5331bf43f71535847c585a6b3f5779a422b13

User space access it not allowed as per trans_l_mfspr, trans_l_mfspr.  I did not
post this upstream as it's not as per spec.


I hope it helps a bit.

-Stafford

