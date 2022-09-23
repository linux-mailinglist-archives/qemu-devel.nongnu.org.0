Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8315E7B1F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 14:49:24 +0200 (CEST)
Received: from localhost ([::1]:40430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obi7P-0001NL-3M
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 08:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obhsu-0006QL-IK
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:34:24 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obhso-0007Vx-JW
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:34:21 -0400
Received: by mail-wr1-x430.google.com with SMTP id x18so14224760wrm.7
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 05:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OWwd1ae/Kt3B1uUkttuDu4lRYoyOUHwwnpD54tfsuag=;
 b=oACL8tsMncuYTcTb53fmmARg/PxgWhjhhIn9FCmPg6u0PXvBOR9+oG4EKnqUIWYbxN
 TKxE9bPdln4EG2Zxxq+gmywqEUa/ODwO7HvPGH+dPv9znLiuYmkls13bRaTGYqKN7hzA
 nXY3oi+n5z8lVKPuvNDuhghCRxWLTy5nVU+331clyCiy7rfobJxt0PeMSihzWeoWang3
 Jh0ErRHVL69XKmIhng+jGGUBy6kEmeWsetnWn3yMJ1KhGMRnsYhKhU21x1Qp+UTFRtUm
 jefRAP0o1aqhTH6Wv3VqQaiMw/48M31+WHmbsaFpU6C8KUdGmrBACbREQ1KkUEGHecbr
 +YQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OWwd1ae/Kt3B1uUkttuDu4lRYoyOUHwwnpD54tfsuag=;
 b=IewDKj4oO1Y5vAxB2ZP5zoqMhVclcdMRjfOzCcFtYGB7A95Wvm23wCmcn/v8E7UIjH
 hKPpMD88af3iLL7K1EBEDNJ4zhDGkn07IZXk7F8Z8yGn0nMx22yH5etRjqsNhrE7FhZA
 sNc/VdE6LGzsGyA9bk+Ul4PL/oSAhTprWxB1gINlRNX5PphIfyzGn3rxEMOHw6JmONGN
 nHwOBRdMk6CvS1iypFzCV8mbt+hok/hUR9JpfROR0y8C2Fx613ZW0YkHxG5MJzlARkku
 7fZ2COUQUYvB6v1obvrQriPclVpzoyG+2FmL9H0DlFXgB3bj7B4V+7A2mSsUk/Y4XJ4S
 Ftmg==
X-Gm-Message-State: ACrzQf0sCABYA9KJ886Rp6eE30CUpGl4jIUtwjzbXQdcGWSPIMAoYHpl
 NZ19vENqy1KXgDh+0b4NQ6wTWA==
X-Google-Smtp-Source: AMsMyM6BZ7+xazRJ3RnSOV3SEJ98Ed1Q2PttWRI8YNXfvuwpmDciuA9xf3k5bPlafjuAxL3XyqEnRw==
X-Received: by 2002:adf:d1e3:0:b0:22a:b9e2:8841 with SMTP id
 g3-20020adfd1e3000000b0022ab9e28841mr5065032wrd.184.1663936457240; 
 Fri, 23 Sep 2022 05:34:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n43-20020a05600c502b00b003b486027c8asm2504555wmr.20.2022.09.23.05.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 05:34:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PATCH 3/3] target/arm: Update SDCR_VALID_MASK to include SCCD
Date: Fri, 23 Sep 2022 13:34:12 +0100
Message-Id: <20220923123412.1214041-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220923123412.1214041-1-peter.maydell@linaro.org>
References: <20220923123412.1214041-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Our SDCR_VALID_MASK doesn't include all of the bits which are defined
by the current architecture.  In particular in commit 0b42f4fab9d3 we
forgot to add SCCD, which meant that an AArch32 guest couldn't
actually use the SCCD bit to disable counting in Secure state.

Add all the currently defined bits; we don't implement all of them,
but this makes them be reads-as-written, which is architecturally
valid and matches how we currently handle most of the others in the
mask.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 33cdbc0143e..429ed42eece 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1334,11 +1334,15 @@ FIELD(CPTR_EL3, TTA, 20, 1)
 FIELD(CPTR_EL3, TAM, 30, 1)
 FIELD(CPTR_EL3, TCPAC, 31, 1)
 
+#define MDCR_MTPME    (1U << 28)
+#define MDCR_TDCC     (1U << 27)
 #define MDCR_HLP      (1U << 26)  /* MDCR_EL2 */
 #define MDCR_SCCD     (1U << 23)  /* MDCR_EL3 */
 #define MDCR_HCCD     (1U << 23)  /* MDCR_EL2 */
 #define MDCR_EPMAD    (1U << 21)
 #define MDCR_EDAD     (1U << 20)
+#define MDCR_TTRF     (1U << 19)
+#define MDCR_STE      (1U << 18)  /* MDCR_EL3 */
 #define MDCR_SPME     (1U << 17)  /* MDCR_EL3 */
 #define MDCR_HPMD     (1U << 17)  /* MDCR_EL2 */
 #define MDCR_SDD      (1U << 16)
@@ -1353,7 +1357,9 @@ FIELD(CPTR_EL3, TCPAC, 31, 1)
 #define MDCR_HPMN     (0x1fU)
 
 /* Not all of the MDCR_EL3 bits are present in the 32-bit SDCR */
-#define SDCR_VALID_MASK (MDCR_EPMAD | MDCR_EDAD | MDCR_SPME | MDCR_SPD)
+#define SDCR_VALID_MASK (MDCR_MTPME | MDCR_TDCC | MDCR_SCCD | \
+                         MDCR_EPMAD | MDCR_EDAD | MDCR_TTRF | \
+                         MDCR_STE | MDCR_SPME | MDCR_SPD)
 
 #define CPSR_M (0x1fU)
 #define CPSR_T (1U << 5)
-- 
2.25.1


