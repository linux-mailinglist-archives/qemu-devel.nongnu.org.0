Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD3C454C0D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:35:08 +0100 (CET)
Received: from localhost ([::1]:37594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOpv-0005pg-UV
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:35:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnOos-0004Z1-Bh
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:34:02 -0500
Received: from [2a00:1450:4864:20::32e] (port=43572
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnOop-0000GN-EO
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:34:02 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so2741171wmz.2
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 09:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=txr3kNCnf3BThmhXGPDRkUo9QlkHGmxBs7MGRqQEnO0=;
 b=O53t0a2KrsPpz0i6A5CV5qeuc1BGq2EKthmR3ACmSONvJVwMxeXA9HjClPJ3/qzSW5
 GK2xHHuI03nHyTIzfF3chU6p98/D2YcRvKpyWJh5abWvOpoBTPk9LbCLY7elGlzug8J8
 Dwg8AyEqO7mBKsbScPvirGMxR6MtAw9cykUW06CTAxhQjF84IXQvRc2PeDthV8S4N0Ij
 +vmNY5tEuKS55OhEp0S/QEdRiBweM+OxV2h/dL3s8xCMpYdR86zlTteoP81TNHcSGahs
 OG5/k/xv5q0Ppi9fzyxsjYlIdYk/ncle1mnXWprbm/Fn8wPLBSqxDJ8Z9gg5daW+Q2Rs
 pHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=txr3kNCnf3BThmhXGPDRkUo9QlkHGmxBs7MGRqQEnO0=;
 b=bcnQ+MIZ65ENbHLkD0cNosBEfORQRmPDpFuBd0bGVPdtqs0LrGEDQUjPKk8UwnAXnn
 xxoqOF7Wz3FKHKw3+OMmstqXeYpnz4Oie/yh15HvhG9c8+z4B/8MWKKrIO59g4QTunVe
 /pJJCO+1W83bZxFllCAnIeVy+3GpwoNmsL6lDmuWdWEeAXfkb6QwXNRtcun7O3dE1rou
 snbPSBCqgEiebaafUK+c59+2AMEJRNolUWwmWuw4U1UmnOw+7fowuc9+mWDvvWe9ZsFy
 7bPyq0gmbIwpCf/+Hl6/RRtWZDSuQxwmRIai4B1fTb2IPuYP6o+w7/BXm5Xyje6oMFfh
 eJBQ==
X-Gm-Message-State: AOAM532J7ChIJxVwWRyXHRPuPPJNv7j/vjvL3rNatdQLbnxrig5hDSPC
 Cdg/zEdw/QtUGS022fK0QUmasptbxX0+Fv8LogQ=
X-Google-Smtp-Source: ABdhPJy1tEGtfEYZ/T08U5DFEoI0ukgYNSEg74f8YyzkKFBWk9z30Cv5LmGRqCqz3sxNw8GBMO1XBw==
X-Received: by 2002:a05:600c:3647:: with SMTP id
 y7mr1646979wmq.39.1637170436669; 
 Wed, 17 Nov 2021 09:33:56 -0800 (PST)
Received: from localhost.localdomain
 (101.red-176-80-44.dynamicip.rima-tde.net. [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id e3sm461030wrp.8.2021.11.17.09.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 09:33:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2] tests/tcg/ppc64le: Fix compile flags for byte_reverse
Date: Wed, 17 Nov 2021 18:33:53 +0100
Message-Id: <20211117173353.7623-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With a host compiler new enough to recognize power10 insns,
CROSS_CC_HAS_POWER10 is true, but we do not supply the -cpu
option to the compiler, resulting in

/tmp/ccAVdYJd.s: Assembler messages:
/tmp/ccAVdYJd.s:49: Error: unrecognized opcode: `brh'
/tmp/ccAVdYJd.s:78: Error: unrecognized opcode: `brw'
/tmp/ccAVdYJd.s:107: Error: unrecognized opcode: `brd'
make[2]: *** [byte_reverse] Error 1

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/ppc64le/Makefile.target | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index 5e65b1590d..ba2fde5ff1 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -9,18 +9,12 @@ PPC64LE_TESTS=bcdsub
 endif
 bcdsub: CFLAGS += -mpower8-vector
 
-PPC64LE_TESTS += byte_reverse
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
+PPC64LE_TESTS += byte_reverse
+endif
+byte_reverse: CFLAGS += -mcpu=power10
 run-byte_reverse: QEMU_OPTS+=-cpu POWER10
 run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
-else
-byte_reverse:
-	$(call skip-test, "BUILD of $@", "missing compiler support")
-run-byte_reverse:
-	$(call skip-test, "RUN of byte_reverse", "not built")
-run-plugin-byte_reverse-with-%:
-	$(call skip-test, "RUN of byte_reverse ($*)", "not built")
-endif
 
 PPC64LE_TESTS += signal_save_restore_xer
 
-- 
2.25.1


