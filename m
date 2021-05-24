Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABD238E7A8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:30:36 +0200 (CEST)
Received: from localhost ([::1]:42894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llAfD-0005L0-Ds
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:30:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1ll9ob-0006k4-Gi
 for qemu-devel@nongnu.org; Mon, 24 May 2021 08:36:13 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1ll9oR-0008OW-Mr
 for qemu-devel@nongnu.org; Mon, 24 May 2021 08:36:13 -0400
Received: by mail-wr1-x436.google.com with SMTP id d11so28358077wrw.8
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 05:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=dX+baneZrL42u8FLTwlQMZVRFMnI4GuEijyTSPB0Ypw=;
 b=uLkyN6F5qO/qhjZdOJvZMyOR26aZsgAW4LZEa+flPBaV7Qv2W9pXKLOB6/HnLyFRA3
 hh+btotQxRgMnNcZa8OTRAkgv0Jg8DSKpPIGQx4pyu0nexZV8Z+CBJCB7sQ2lSHb9qBK
 fVdDYQalD8xZffPGMa4Np/f2cG8Y4iYCuNZzbrqzXGH4czOxywS6Rq/uuIevR8ZH9LFF
 sbV939i6XV0Ib76w/t1ZJcAfRqR9KsisKDTWvkPHhWYPSmaX4b4XLq3CH+dqgAMHZtHh
 5jUA//A193+aTf88QOdEQD2p6WcKorXjf0SYReeES7kV4JgxjdGvRFYs7v42LzH+rSCZ
 8v7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dX+baneZrL42u8FLTwlQMZVRFMnI4GuEijyTSPB0Ypw=;
 b=PTe2xuN7R7GGls+XJY6UtdRFQMwG+a/slR6fakQ5ArXJIS17EXLPxWFWiFRc4cTmjJ
 CEoqGrx0vrviziQInGwxpyJyGqt1SxnENvQdA6j2GMqJgQAQOkpTf6f9zxuSP+HotNTE
 rE3H3ICo2J15U6Unh74Yya6y2aUMnLXHlz1eLSYB9/0QrjIN6Imek9/a1R6Yo6PqTJTB
 M/7x0Mxg5Y+dGhLNGpinlWmMFT5OBsJN9Xvc9dqMrm3gznkvHhNM0hKYffeMcfFbIxRX
 E9tLTa37FWHVe0i0t52OGqibjkbUAQ1jqqmph50TzKmZ3A9BkRCFvytwGeS/4PPX49mH
 /dXg==
X-Gm-Message-State: AOAM530AInJdZ/FiOTBY4IUZb9JAGY/aV1WEafT4kev+3ieLfve2xPeK
 3kWi9WkJONEyPB0RPhyEMPdayw==
X-Google-Smtp-Source: ABdhPJwgw93naKtDaUT/DHB6DCOwuy2a/N3ZEChClSNrCihuIKsbdSmCL+JxKsbBAbIT+JWU+NPwXQ==
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr21508742wrz.256.1621859762171; 
 Mon, 24 May 2021 05:36:02 -0700 (PDT)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id c6sm12518374wru.50.2021.05.24.05.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 05:36:01 -0700 (PDT)
Date: Mon, 24 May 2021 13:36:01 +0100
From: Jamie Iles <jamie@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] target/arm: fix missing exception class
Message-ID: <YKudsW/Drzqcxnoa@hazel>
References: <20210524084201.1665973-1-jamie@nuviainc.com>
 <CAFEAcA_AZGK6yKy6FN=YfVC=OMdpQnDBz=nndKaibDLRXk2aDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA_AZGK6yKy6FN=YfVC=OMdpQnDBz=nndKaibDLRXk2aDw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=jamie@nuviainc.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 24 May 2021 09:27:40 -0400
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
Cc: Jamie Iles <jamie@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On Mon, May 24, 2021 at 10:41:58AM +0100, Peter Maydell wrote:
> On Mon, 24 May 2021 at 09:42, Jamie Iles <jamie@nuviainc.com> wrote:
> >
> > The DAIF and PAC checks used raise_exception_ra to raise an exception
> > and unwind CPU state but raise_exception_ra is currently designed for
> > handling data aborts as the syndrome is partially precomputed and
> > encoded in the TB and then merged in merge_syn_data_abort when handling
> > the data abort.  Using raise_exception_ra for DAIF and PAC checks
> > results in an empty syndrome being retrieved from data[2] in
> > restore_state_to_opc and setting ESR to 0.  This manifested as:
> >
> >   kvm [571]: Unknown exception class: esr: 0x000000 –
> >   Unknown/Uncategorized
> >
> > when launching a KVM guest when the host qemu used a CPU supporting
> > EL2+pointer authentication and enabling pointer authentication in the
> > guest.
> 
> raise_exception() and raise_exception_ra() are supposed to have
> the same semantics apart from one of them being passed a return
> address. So perhaps we should look at trying to fix this by
> making raise_exception_ra() not first carefully set and then
> very opaquely unconditionally trash env->exception.syndrome...

The simplest fix for this would be the patch below and that is 
consistent with the TLB fault handling code where we first restore state 
then raise the exception, is this the sort of thing you were thinking 
of?

Thanks,

Jamie

diff --git i/target/arm/op_helper.c w/target/arm/op_helper.c
index efcb60099277..0b85403cb9f4 100644
--- i/target/arm/op_helper.c
+++ w/target/arm/op_helper.c
@@ -63,8 +63,11 @@ void raise_exception(CPUARMState *env, uint32_t excp,
 void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
                         uint32_t target_el, uintptr_t ra)
 {
-    CPUState *cs = do_raise_exception(env, excp, syndrome, target_el);
-    cpu_loop_exit_restore(cs, ra);
+    CPUState *cs = env_cpu(env);
+
+    cpu_restore_state(cs, ra, true);
+    do_raise_exception(env, excp, syndrome, target_el);
+    cpu_loop_exit(cs);
 }
 
 uint64_t HELPER(neon_tbl)(CPUARMState *env, uint32_t desc,

