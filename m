Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC24B36FBFD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:17:16 +0200 (CEST)
Received: from localhost ([::1]:44494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTxD-0006tB-UZ
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTBa-0005pR-0U
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:28:02 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTBL-0003tk-OD
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:28:01 -0400
Received: by mail-wm1-x32f.google.com with SMTP id k128so37849715wmk.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 06:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1qwzMLXdwRGeNxWJ+Q36nV0Y3+oFCo/Lg4d7sP6Mlc0=;
 b=iE+YYmGyQIvAR8dtPzNup752/rEhZVq1oN4PUak8MvfiOdpKQycJk59LcVIjh0c/ws
 OZjfaRed+0KKpEYWe1LmvPo/eZqP3hyIeReV2c5DR7SgxtFYwkKazYfBXsRqN7z1lAcv
 Pf0eVwVyr2iYYK7BUpnEMlTFohN+L6NPXc6jxtRZB7VEw5Wwjtw+3iaWyiX7BuSYbTYs
 MCyO0IlkXT/ay2OkR9U5DbCvbB0BKkj9v20BOJhSfYhT1Y9LClOH/AByG5E/WQzZGZvB
 xazIlmptrsrViC3Ubb4EDS2AXS3UY1IwbaZPvVLEgruRU4UXHX/H3XwCGQCyOr2bZsXC
 jFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1qwzMLXdwRGeNxWJ+Q36nV0Y3+oFCo/Lg4d7sP6Mlc0=;
 b=K/8LeGDJewEodYoc9x173UV8P1E+cdwNnYdMCfco88VOg0MK7vaaSuea5rj0yKMQun
 gDa0oLEzfkyjvpCIsrZvPO34vZXuA/vRf4wNxoRBLAoPoez3JttUtInC9vFoEO8yLXWG
 3c3WMbYg/llD8QhRDV1DFbQtaskze6mgU7Qmr3watWUgAEb6QI+DaY8zPf0cv7LmBitt
 sEjo2eewyFAGeCrnleRc6Sn0vrUzDDbUo4atv5dYMmM4DWCaea/eLlMF54kqkQc8D/9v
 DDiuwasxc9EPTfGQxQsFksPfVnmi8eWjvLlyiaZkOQtihBEbok9BK8ntBuyhR8dEnSu5
 ZGqA==
X-Gm-Message-State: AOAM530xbGecE4tz8pIQgPfb/abSgj7+yuxrWzzR1IlP12fxZnGXpLg4
 JU6mcTaJfJbKNCyRQnQlvcaECBP3zgGhoTKD
X-Google-Smtp-Source: ABdhPJyzrknAUew8myjaWwpXOG6D3mAd090cxUu5dq5ArkS22tAv9B/7O2VujQ0QGTkpZeHWdOFL+A==
X-Received: by 2002:a05:600c:220e:: with SMTP id
 z14mr6350185wml.0.1619789262606; 
 Fri, 30 Apr 2021 06:27:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm2420349wrx.15.2021.04.30.06.27.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 06:27:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/13] target/arm: Split translate-*.c.inc into separate
 compilation units
Date: Fri, 30 Apr 2021 14:27:27 +0100
Message-Id: <20210430132740.10391-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we first converted the A32/T32 frontends to use decodetree,
we put the trans* functions for VFP and Neon into their own
separate files, but used the preprocessor to just #include those
files into translate.c. This was a pragmatic arrangement to avoid
having to also rearrange translate.c which had a lot of utility
functions shared between the main integer decode and the VFP/Neon.

However, having translate.c effectively one enormous file with
all of the integer, Neon and VFP decode in it means it can
push the limits of what some compilers can handle (especially
on 32-bit hosts if the compiler has bugs where it uses too much
memory either during optimisation or while generating debug info).

This series breaks out all the translate-*.c.inc into separate
compilation units.

Changes v1->v2:
 * rebased on current master (with rth's alignment series in)
 * patch 5 has changed because the gen_aa32 functions were all
   changed by the alignment patchset
 * patch 7: made gen_set_cpsr and gen_set_condexec not inline,
   per rth's suggestion

Only patch 5 needs review.

thanks
-- PMM

Peter Maydell (13):
  target/arm: Move constant expanders to translate.h
  target/arm: Share unallocated_encoding() and gen_exception_insn()
  target/arm: Make functions used by m-nocp global
  target/arm: Split m-nocp trans functions into their own file
  target/arm: Move gen_aa32 functions to translate-a32.h
  target/arm: Move vfp_{load,store}_reg{32,64} to translate-vfp.c.inc
  target/arm: Make functions used by translate-vfp global
  target/arm: Make translate-vfp.c.inc its own compilation unit
  target/arm: Move vfp_reg_ptr() to translate-neon.c.inc
  target/arm: Delete unused typedef
  target/arm: Move NeonGenThreeOpEnvFn typedef to translate.h
  target/arm: Make functions used by translate-neon global
  target/arm: Make translate-neon.c.inc its own compilation unit

 target/arm/translate-a32.h                    | 144 +++++++++++
 target/arm/translate-a64.h                    |   2 -
 target/arm/translate.h                        |  29 +++
 target/arm/translate-a64.c                    |  15 --
 target/arm/translate-m-nocp.c                 | 221 +++++++++++++++++
 ...{translate-neon.c.inc => translate-neon.c} |  19 +-
 .../{translate-vfp.c.inc => translate-vfp.c}  | 230 +++---------------
 target/arm/translate.c                        | 200 ++++-----------
 target/arm/meson.build                        |  15 +-
 9 files changed, 487 insertions(+), 388 deletions(-)
 create mode 100644 target/arm/translate-a32.h
 create mode 100644 target/arm/translate-m-nocp.c
 rename target/arm/{translate-neon.c.inc => translate-neon.c} (99%)
 rename target/arm/{translate-vfp.c.inc => translate-vfp.c} (94%)

-- 
2.20.1


