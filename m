Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B8A584E08
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 11:30:28 +0200 (CEST)
Received: from localhost ([::1]:39490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHMKB-0000PZ-4r
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 05:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHMA5-0002Vw-PK
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:20:02 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHMA3-0005t2-C2
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:20:01 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h8so5277468wrw.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 02:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7CojBDnzsSadEUfkkQHrKsxO1PC9/FIoZzsN5dLDDhc=;
 b=Gyo0oAw39D9Q2vO8UwjCUhbuDDYMkqRXifp5gYOEQMkqI/JSYZ/TgtHXRkkGoH/t2e
 R50wWFLBMd1Uc5p4eLpV7JVhFX4E3QTQbEPfo0QDT4JGJE7QaHOZFptgDYdSAPXCaaw2
 gQRj2QTOuC8IrFaDvKocPorg9f6Q1vRTnGtRgThZily5+I5tJaZ1MF91jehmPw/B/IRJ
 fuXfb+hXUo+Re46sQyHTblstmZiMGio5IrfOONynd/2b8/uuOI/5kBkcTnUwZSi3aTCE
 kpZeBul2j2m8OGc+id9JaOib8FfVOBXsCuC0qrMndr/3UH/b+nDY4MApNX0FRMyFU/Km
 rCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7CojBDnzsSadEUfkkQHrKsxO1PC9/FIoZzsN5dLDDhc=;
 b=wxfpsjV/NKLKpJavKHSnpZzVVaVsRjeV87Exem5nM+zI/yu3NV69jlVXfzerrDU1Zr
 h+77YkEEXI9kkSQS0Z8dOLcQrMKp5gNv4VRidr1cpW8QSrtGozAhGQ8yO0nkZHlJUh1y
 H5Wwk0xq4kg/fvnaY90GdkdIF9Zv1FWeH6Gt+pOdt/KnWVd2IRc0gqOnbWBdPBDQqZHk
 XsVyF1Lc/ASZpc8iGRdmVdbNKa35EcbP/QVRXzPsekVLSA1nuAqIweZjzF+zyiVvlWH5
 Z5AVXSk6omIYSOLGe4tNbDbNbLPLwgLnV4MCFUH0V+5cxLlMIeCfEY7pi1hhoFaJvniU
 D3ww==
X-Gm-Message-State: ACgBeo2u/0q8BJU7sp5rpq+svR8VHOx5CMKC18LQ43xHo6nfz3gehL63
 SQrE90kBvOxQUAOH5yXVB6q1HA==
X-Google-Smtp-Source: AA6agR7kXCgHV8IfsVSODT6VpAho3pcL87V7AgYryQTzyTqeMyH+nG6e60zMJToC8uwMC4g0Ce2vgQ==
X-Received: by 2002:a05:6000:608:b0:21e:b5f4:4bc9 with SMTP id
 bn8-20020a056000060800b0021eb5f44bc9mr1890182wrb.196.1659086397986; 
 Fri, 29 Jul 2022 02:19:57 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a05600c4fcc00b003a31d200a7dsm4122665wmq.9.2022.07.29.02.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 02:19:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7FD4B1FFC0;
 Fri, 29 Jul 2022 10:19:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 08/13] semihosting: Check for errors on SET_ARG()
Date: Fri, 29 Jul 2022 10:19:38 +0100
Message-Id: <20220729091943.2152410-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729091943.2152410-1-alex.bennee@linaro.org>
References: <20220729091943.2152410-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Peter Maydell <peter.maydell@linaro.org>

The SET_ARG() macro returns an error indication; we check this in the
TARGET_SYS_GET_CMDLINE case but not when we use it in implementing
TARGET_SYS_ELAPSED.  Check for and handle the errors via the do_fault
codepath, and update the comment documenting the SET_ARG() and
GET_ARG() macros to note how they handle memory access errors.

Resolves: Coverity CID 1490287
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220719121110.225657-4-peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220725140520.515340-9-alex.bennee@linaro.org>

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 1a1e2a6960..d12288fc80 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -171,6 +171,12 @@ static LayoutInfo common_semi_find_bases(CPUState *cs)
  * Read the input value from the argument block; fail the semihosting
  * call if the memory read fails. Eventually we could use a generic
  * CPUState helper function here.
+ * Note that GET_ARG() handles memory access errors by jumping to
+ * do_fault, so must be used as the first thing done in handling a
+ * semihosting call, to avoid accidentally leaking allocated resources.
+ * SET_ARG(), since it unavoidably happens late, instead returns an
+ * error indication (0 on success, non-0 for error) which the caller
+ * should check.
  */
 
 #define GET_ARG(n) do {                                 \
@@ -739,10 +745,14 @@ void do_common_semihosting(CPUState *cs)
     case TARGET_SYS_ELAPSED:
         elapsed = get_clock() - clock_start;
         if (sizeof(target_ulong) == 8) {
-            SET_ARG(0, elapsed);
+            if (SET_ARG(0, elapsed)) {
+                goto do_fault;
+            }
         } else {
-            SET_ARG(0, (uint32_t) elapsed);
-            SET_ARG(1, (uint32_t) (elapsed >> 32));
+            if (SET_ARG(0, (uint32_t) elapsed) ||
+                SET_ARG(1, (uint32_t) (elapsed >> 32))) {
+                goto do_fault;
+            }
         }
         common_semi_set_ret(cs, 0);
         break;
-- 
2.30.2


