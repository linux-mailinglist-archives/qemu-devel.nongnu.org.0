Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CC3562363
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 21:47:19 +0200 (CEST)
Received: from localhost ([::1]:46918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o708E-0005sG-Cn
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 15:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o702Z-00031Z-RL
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 15:41:28 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:33713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o702W-0005Z1-Fp
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 15:41:27 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 o16-20020a05600c379000b003a02eaea815so3117303wmr.0
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 12:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pPSLQDlykZ3dh1MSLWToXrQw2pSwDImSNh9oZd3sxAQ=;
 b=DTbGRTdRJvsqavRkGehoiVZS4cpDeqiOjpK2tTMFrWZH4WylNBtogwjIHFv2yfxVNX
 8xG/60cNvlsf9fFvLFOFUp1LU0wPOYtXO7d56zDuF3DUPtTUKSw6cYvZFTg+DdOJjCcZ
 HbfTexBqKUFjwybQJEB0X1j1ad6uQpEzX2OciFHqnwy/T2dVld6k2sr6RGjnd2/gEcQu
 OlscvwrumW1ujeRqlBfv0tJjgaVa+NyL3AGbWLbwtnOKCoGL7mdwnny5nO3kZPgdCERk
 mZ7GZ7yhZVqa2w8JcoH2Ms3SHPwNEJrjWcN8RVCPKx7pchpLT2lPRnUozdMsw0aWw6IM
 xlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pPSLQDlykZ3dh1MSLWToXrQw2pSwDImSNh9oZd3sxAQ=;
 b=1DSsLE0BKYfHQIn3C5EAv6dZiCkUvxRMhRBTjwVDSMVnxK4G3EsgmuDYMlwWCk2v4V
 DaSadeAGyG8aKYn+HUst4DYrYgzHrQ5COOYmqz2vFVQ4YQA940gSUeZwGE3EFnRVLSw0
 CKlN8f22QKOOz/dNkgsOdos3cMsFHync3a201JmeQcOB5u4zKb8XJhFFNfMu+Or9Pb7s
 q4ihkK1/mMUC32GG6mrsMZ8iCpt1NR5nvV0AAIBVkcwn5K0qmG4Pz2Ha2ZdnRee4dVGP
 6wUX+yTo9yOh2LftJMj6FPFCdQYnJ4INpsAgKu9Vq9MeqO9WVnq4gqNuDl55cUoFL66j
 MUVQ==
X-Gm-Message-State: AJIora8FTW8uWrpCaAvSZZTHOR+yk49FRsmAGd0/M4Ns8n5YxmzlDqvN
 9Xx1fQ3W8FxzHKdovF/vHVtt1A==
X-Google-Smtp-Source: AGRyM1sfU0a/lDZXoGzf3Z6Ox9ohS1kBzcqOd+BVhyUD0b0HVuHpIoObiAX9TywKAWpVDpeOfFrXVg==
X-Received: by 2002:a05:600c:c5:b0:3a0:3ef3:838a with SMTP id
 u5-20020a05600c00c500b003a03ef3838amr14029782wmm.50.1656618080234; 
 Thu, 30 Jun 2022 12:41:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m2-20020adffa02000000b0021d163daeb0sm13200228wrr.108.2022.06.30.12.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 12:41:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/5] target/arm: Implement (or don't) OS Lock and DoubleLock
 properly
Date: Thu, 30 Jun 2022 20:41:11 +0100
Message-Id: <20220630194116.3438513-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Continuing in my series of filling in bits of the architecture
that probably nobody much cares about, this series fixes up
Feat_DoubleLock. DoubleLock is a part of the debug architecture
which allows a guest OS to suppress debug exceptions while
it is powering down a CPU so that they don't cause updates to
bits of debug register state that then don't get preserved
across the power-down/up sequence. The reason for looking
at QEMU's support here is that recent versions of the architecture
define that the feature becomes first optional (after v8.2 or
so) and then mustn't be implemented at all at v9.

We have only ever implemented this by NOPing the OSDLR_EL1 register,
which is not correct for either the "implement the feature"
or the "don't implement the feature" case. What is supposed
to happen is that if the feature is implemented then there is
one writable bit which is set to 1 to suppress debug exceptions,
and if the feature is not implemented then the bit is RAZ/WI.
We also don't properly implement the related OS Lock which
does something very similar. There we correctly implemented
the register reading and writing parts but didn't make the
bit do anything.

The series starts with some code movement, while I was messing
with the debug code, shifting 500 lines of debug related code
out of the massive helper.c and into debug_helper.c. Patch 2
is big but almost entirely pure code motion (best reviewed with
git's --color-moved support). I think this helps in our
ongoing quest to make helper.c less of a massive grabbag
of miscellaneous things.

Patch 3 implements the required behaviour of the OS Lock
(which turns out to be very easy).

Patch 4 adds support for some AArch32 debug ID registers we
turn out to be missing. Clearly nobody was trying to read these,
but one of them is where the field for "is FEAT_DoubleLock
present" is kept, so we need the data internally.

Finally, patch 5 fixes the implementation of OSDLR_EL1 to
either be RAZ/WI or to have a bit that has the required
suppress-debug-exceptions behaviour.

thanks
-- PMM

Peter Maydell (5):
  target/arm: Fix code style issues in debug helper functions
  target/arm: Move define_debug_regs() to debug_helper.c
  target/arm: Suppress debug exceptions when OS Lock set
  target/arm: Implement AArch32 DBGDEVID, DBGDEVID1, DBGDEVID2
  target/arm: Correctly implement Feat_DoubleLock

 target/arm/cpregs.h       |   3 +
 target/arm/cpu.h          |  43 +++
 target/arm/internals.h    |   9 +
 target/arm/cpu64.c        |   6 +
 target/arm/cpu_tcg.c      |   6 +
 target/arm/debug_helper.c | 577 ++++++++++++++++++++++++++++++++++++++
 target/arm/helper.c       | 513 +--------------------------------
 7 files changed, 645 insertions(+), 512 deletions(-)

-- 
2.25.1


