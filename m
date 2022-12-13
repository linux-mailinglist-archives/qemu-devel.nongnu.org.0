Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5910364BE5E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:27:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cmo-0000fS-IH; Tue, 13 Dec 2022 16:26:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmm-0000eN-A1
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:00 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmk-0003FD-PE
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:00 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 z14-20020a9d65ce000000b0067059c25facso674739oth.6
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Ca1OA5nQYbr0k/TE8wJLN+t11Y9wq6hjnrCkBaDjgo=;
 b=qLr9LWKMyAP4fEaLG+14DODryiXI41PaQw94DI2wktR5q+S1j8iM0+6eO7MqMs53/v
 Yi3ZTLEohnXgk8H7jZlyQSgVIlATbq8H5YlHKpDoxUFv8uDTqw4Ytsdu6LK6ZgadXEsi
 9+eiui95TJMUFkRulR4hLfaSOvtf1zaps9avYh6VOAJNUum43FJ1tkKpmbwTOwGOf7jn
 5rZ+v84AbiGF/RbaAat1Yaes818TNMm7GUPKpe0xMKRENMiEFDMki4JmtoTtD36XPpJ/
 44B//qxYxtU+xKHx9+zpiVFobbHFePyfgLDtlN+q3JKSh95YXp1r00mhlJL9XYXzohG+
 9JNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Ca1OA5nQYbr0k/TE8wJLN+t11Y9wq6hjnrCkBaDjgo=;
 b=mOYXihDkdZjRFqEiE78CHG+RZvtg7wbS8nSL0pOAZjXyBg/ImisVZR2GyJdi1kWN64
 AcxNvgTCMos/6ZU/pWmMXcP4fhkj8Cwvz9UipS4Xzhk7dsk+Np7QwGwkK1/Dm+ZE8pMi
 dXrXXYnvbbRon4L/cmey39YcMmODNTheDYljVPdnNTG+i8d1yHkFG6t1U2LwfTDuJOH8
 FMd/NXknw6DP5O39t/dPcpmbulp+9C3FwCZPMiNMt3+bro6lTbabP2X1B8me5s0wZOVj
 VvXjHzWc9/Co0NEiV7GSwqma33EbzR/cvrgW2nhqr76sKzb1K9xxCOOgADBgyfguQse6
 nnJA==
X-Gm-Message-State: ANoB5pl89Gev6b5zpOuCbmWiGP475bhbBcSHXtWCOtSz5lfYM/Ez9zAf
 h5dc8U3vDpAU4KzHkEOfFL2vQ2iBAgbtxqCWgKU=
X-Google-Smtp-Source: AA0mqf53z3fXcks66VznapKgkmj8LbOVUNxaLUSYfPIagsTIWQXVGRMWqae4DfjGwRpn8nWlIIrSPg==
X-Received: by 2002:a9d:6c07:0:b0:66e:ab28:cced with SMTP id
 f7-20020a9d6c07000000b0066eab28ccedmr10112979otq.13.1670966756791; 
 Tue, 13 Dec 2022 13:25:56 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:25:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 13/27] tcg: Introduce TCGCallReturnKind and
 TCGCallArgumentKind
Date: Tue, 13 Dec 2022 15:25:27 -0600
Message-Id: <20221213212541.1820840-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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

Prepare to replace a bunch of separate ifdefs with a
consistent way to describe the ABI of a function call.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 2c06b5116a..f574743ff8 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -27,6 +27,21 @@
 
 #define TCG_HIGHWATER 1024
 
+/*
+ * Describe the calling convention of a given argument type.
+ */
+typedef enum {
+    TCG_CALL_RET_NORMAL,         /* by registers */
+} TCGCallReturnKind;
+
+typedef enum {
+    TCG_CALL_ARG_NORMAL,         /* by registers (continuing onto stack) */
+    TCG_CALL_ARG_EVEN,           /* like normal, but skipping odd slots */
+    TCG_CALL_ARG_EXTEND,         /* for i32, as a sign/zero-extended i64 */
+    TCG_CALL_ARG_EXTEND_U,       /*      ... as a zero-extended i64 */
+    TCG_CALL_ARG_EXTEND_S,       /*      ... as a sign-extended i64 */
+} TCGCallArgumentKind;
+
 typedef struct TCGHelperInfo {
     void *func;
     const char *name;
-- 
2.34.1


