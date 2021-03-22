Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BCF344867
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:59:51 +0100 (CET)
Received: from localhost ([::1]:51774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOM22-0008Lr-Ah
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOLR3-00014I-J0
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:21:37 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOLR1-0007Yh-PC
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:21:37 -0400
Received: by mail-ed1-x532.google.com with SMTP id z1so19598367edb.8
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 07:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mbx6lelOby29fe7T/e9SE7R7FPlm0vRSRdCWPFbF0ik=;
 b=HAC//txQBnujqoQMFBHHbJtnR+s6naXrbTHT33W9vdwJ9YXPLkzU3Go26pk1l/8EgP
 btgyLu1cFFwLwH9t17hpzbVDjsh/IVqwUlT+nJ9BlzjXZSkcfhnRUM3IaxmJnTncobqX
 0qve5XuUhMXkiMJ6Uzy0fabvmIkrjMAaBDvi2DDaGqO1mvUjBZQgLVBzForOR173ZYVW
 JYHwel7TssQu7q4fbjjmiwQacROf/N9xAu6Ymv3krlS3DVBttLfqeCT90Fmo0r5yshZ6
 KzOkvAoev+ntlByDBO3lKdf1jAAUmnmRP9DITTaBnPFPweZbl0FI6ahfori1UednExTR
 fctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mbx6lelOby29fe7T/e9SE7R7FPlm0vRSRdCWPFbF0ik=;
 b=HeGdWQoD74yTXVseS5RFvfM94gOIfnx1yQv05XtCrfGhHXHMtLPOGDhrH7GVmh7Vxl
 fTfuHq7MJCBRWLjj3CLOtLiqGnlIZhDY/SFtjEaCz+V3RbhWq2a/t/mzgy15gI86EMM2
 iITMLRhl8NeHaK3OTx38M0hCJR9vO9SSEmwn/MOwYEp2AY+e9xvxHalFmwkniUzbAI9b
 UJTfl+wMmnh0/wbyTrittZD5re1hLotE6pN5dTq5a6yd7hPbOPiz3u/bsAqkKCPBixmO
 VzB/08EgN4H2sjbcs63zuZLQlFKmgcht7k/Ox0/CJpOzm2nt7RLLsSNR0gcLQAiCMJNR
 sc6Q==
X-Gm-Message-State: AOAM532TpdCBqN67bAlr/ltsMeLPYA2L1uS6oSK9amdeKfVmY1d0AkOA
 dm8vCSqQGqo7IZ0S30uVowe0OfoEytYCNj2UM6Y4Lg==
X-Google-Smtp-Source: ABdhPJx71lNwEpg3rkexKuaAEWf3r9r8ii3HtWPDqxNktldWJ7oNajn4Ct/0vZKrS37YHjPSKeOkYgwO3ZnsB2dUnxE=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr25993877edb.204.1616422894421; 
 Mon, 22 Mar 2021 07:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <54fb8499-0758-a554-6103-5b56d784fda3@nuviainc.com>
 <fd1e329b-1a1e-f669-95aa-9a35c5311a08@linaro.org>
In-Reply-To: <fd1e329b-1a1e-f669-95aa-9a35c5311a08@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Mar 2021 14:21:06 +0000
Message-ID: <CAFEAcA-r85AWRNLszunX8VF2p=xjY60vuyaabApj_PfAF6SrYA@mail.gmail.com>
Subject: Re: Bug in tlbi_aa64_vae2is_write: tlbbits_for_regime called with
 swapped ARMMMUIdx_ values?
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Mar 2021 at 15:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/15/21 11:33 PM, Rebecca Cran wrote:
> > I noticed the following in tlbi_aa64_vae2is_write: it appears that when calling
> > tlbbits_for_regime the ARMMMUIdx values are swapped?
> >
> > static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >                                     uint64_t value)
> > {
> >      CPUState *cs = env_cpu(env);
> >      uint64_t pageaddr = sextract64(value << 12, 0, 56);
> >      bool secure = arm_is_secure_below_el3(env);
> >      int mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
> >      int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
>
> Yep, good catch.

Would somebody like to write a patch with the fix ?

thanks
-- PMM

