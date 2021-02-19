Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B0231FBB5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:12:42 +0100 (CET)
Received: from localhost ([::1]:45050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7ST-0000tr-ML
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:12:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73u-0002nk-OS
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:18 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73S-0003f9-Hx
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:18 -0500
Received: by mail-wr1-x432.google.com with SMTP id v15so8902609wrx.4
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zKYWvcFtzDPV4Ks85TZ4B/LPAikGy0iTqTLoenNGpWQ=;
 b=LnSyDFfrmunbU0hI1erWmjP714qjEU9EnpBFLSDkWqWs65rA/R/0LEgElqBdpxwVHU
 ZdLx6NZTN3mDfBWsaJMQP8hp0TqP8sFkFfed8a02qnb0n845MZOAhY+FtIZn4VQverEs
 kohVDGqTO37qp4bOFJ1j27ouzOcSgX2qKFVMeEaKIlym9mzLjTjiUfXLdUA4Y+HJl2v9
 aXPiXRZ9I49qrSALK4UPbf/gDrqbrsTyszuK1apaUK0SG0rQkfYeUMNa87Wzy8UpZu1j
 3YL+vspCgSEFCLZEq41a9kuCCr5SN/X21zB4M/+p/F/cwb9p5mZgg+Oo5y/Bv2upEFmG
 33cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zKYWvcFtzDPV4Ks85TZ4B/LPAikGy0iTqTLoenNGpWQ=;
 b=sf26ODiDi9Sk7T8f2Dhgx6Vv0E7pxJiE9fKxbgyIvMdklxt/YOJZ/OQVUFBb1Z2pIn
 7gW4nhX1OiHw8lmwMJCpaY0jilPoVer6jMsUsDg+PmHzQa8yOi4c6p3RxrsOF5T6MN1V
 D9NXsuk3hFo32e8pOdtjsixC/74z57gHjhljg0vHSHIZCgolw/ONRDbG3hkc17nHH3Sz
 O6JRo4ZCQ8ScuKqTyBVGnKT0NH7ZrZ3HlJcnfHC1KS8SIz9Nhvc85FNKVre1x+qWLd9u
 E9jq7RcPXm3JMjhrgSH3m5hfHuKTxx/GWf+wuGsMkS9JIHKbi8UKFgDRXq5mgxzqv/2I
 q69A==
X-Gm-Message-State: AOAM533gDaEpMs/vk6vnXDVA3m6KL2rNwDQk7He4O/coxvGy9K38DKvI
 VWhF/LmOjbIOfwV05pkF0BhwvJ+Gy3P6bw==
X-Google-Smtp-Source: ABdhPJzHGOopwb3g6ljuU2FgaZepkbBMi2WRp6SCG+k82F+HPD1evO6ySRoej9pn35HwQsLhVzW2LQ==
X-Received: by 2002:adf:b60e:: with SMTP id f14mr9588342wre.99.1613746009194; 
 Fri, 19 Feb 2021 06:46:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 39/44] hw/misc/mps2-scc: Implement changes for AN547
Date: Fri, 19 Feb 2021 14:46:12 +0000
Message-Id: <20210219144617.4782-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Implement the minor changes required to the SCC block for AN547 images:
 * CFG2 and CFG5 exist (like AN524)
 * CFG3 is reserved (like AN524)
 * CFG0 bit 1 is CPU_WAIT; we don't implement it, but note this
   in the TODO comment

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/mps2-scc.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
index 140a4b9ceba..c56aca86ad5 100644
--- a/hw/misc/mps2-scc.c
+++ b/hw/misc/mps2-scc.c
@@ -110,14 +110,14 @@ static uint64_t mps2_scc_read(void *opaque, hwaddr offset, unsigned size)
         r = s->cfg1;
         break;
     case A_CFG2:
-        if (scc_partno(s) != 0x524) {
+        if (scc_partno(s) != 0x524 && scc_partno(s) != 0x547) {
             /* CFG2 reserved on other boards */
             goto bad_offset;
         }
         r = s->cfg2;
         break;
     case A_CFG3:
-        if (scc_partno(s) == 0x524) {
+        if (scc_partno(s) == 0x524 && scc_partno(s) == 0x547) {
             /* CFG3 reserved on AN524 */
             goto bad_offset;
         }
@@ -130,7 +130,7 @@ static uint64_t mps2_scc_read(void *opaque, hwaddr offset, unsigned size)
         r = s->cfg4;
         break;
     case A_CFG5:
-        if (scc_partno(s) != 0x524) {
+        if (scc_partno(s) != 0x524 && scc_partno(s) != 0x547) {
             /* CFG5 reserved on other boards */
             goto bad_offset;
         }
@@ -185,7 +185,10 @@ static void mps2_scc_write(void *opaque, hwaddr offset, uint64_t value,
 
     switch (offset) {
     case A_CFG0:
-        /* TODO on some boards bit 0 controls RAM remapping */
+        /*
+         * TODO on some boards bit 0 controls RAM remapping;
+         * on others bit 1 is CPU_WAIT.
+         */
         s->cfg0 = value;
         break;
     case A_CFG1:
@@ -195,7 +198,7 @@ static void mps2_scc_write(void *opaque, hwaddr offset, uint64_t value,
         }
         break;
     case A_CFG2:
-        if (scc_partno(s) != 0x524) {
+        if (scc_partno(s) != 0x524 && scc_partno(s) != 0x547) {
             /* CFG2 reserved on other boards */
             goto bad_offset;
         }
@@ -203,7 +206,7 @@ static void mps2_scc_write(void *opaque, hwaddr offset, uint64_t value,
         s->cfg2 = value;
         break;
     case A_CFG5:
-        if (scc_partno(s) != 0x524) {
+        if (scc_partno(s) != 0x524 && scc_partno(s) != 0x547) {
             /* CFG5 reserved on other boards */
             goto bad_offset;
         }
-- 
2.20.1


