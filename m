Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2F9541EC7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:36:14 +0200 (CEST)
Received: from localhost ([::1]:39850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyho5-0002UV-D2
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg95-0005h9-U1
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:47 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:47036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg92-0001pV-A0
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:47 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 k5-20020a17090a404500b001e8875e6242so5710596pjg.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ppeRKC6qAerZueLBefgCmuJe5thbQMtdR2XWJoewkwU=;
 b=l1eiWw9vLIWgWaKfbqmmmmUYAOhIdZOUGLDrls2J/zgJiA5KDhhf6TB4Uj0+bVVqAx
 zKrl58iU2z5gUKEpCZyaov0bu6C5QWVZCvycg9P1Bg/QqUcEQb7StZOTD+TFPovSg86R
 hM/3g9ZiwR1CQvTilSnt2xAeM6OiEJXHQw/px0J7Ew5GFHhf97pi2M/db8SQ8tdM+oqp
 t5HzzfySvLXkxb3L6WU955S9srXWffhlJ5Rqzlk7UJ4QHzZPrxBBXkOVWefWvaPekJGv
 Yt+uOPniKmViO6M+JDC2708QBJqvm+4XohugOJInwzrnaKuMRIwVuuktHMmuRwg+0GE4
 i/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ppeRKC6qAerZueLBefgCmuJe5thbQMtdR2XWJoewkwU=;
 b=BFZ5qZVCxQJILTMBaZacYH99od29z6Hbd8JkVkvoEp/cT+CT8Ir0cIMkpp8pAeo7Ux
 nNwfDS7B184umiU5dCeorm9p9BuvXwRdf4NVUXqN8FXV+9vP/nf5LrqNz/5RIgue1r4p
 p0IUnghf+f6c0Qur+WTn9lKo5Jw+/CRDCrR2U4eJzOwrA6qt80ay0fvvjVKTkWOCQLzT
 s2/DiBA4XaERY4gYLiX8QgiATyxuVcbjdYEEM03vM9BUufc+8YycI9BekKVpB/RRLYUf
 B985wrZWHuCFq5+H5gc0JsT/vxuTsQ6ldBS14iQjsCY3HQG44n6ZHR8ahK2Q1xFm2X8N
 7yTw==
X-Gm-Message-State: AOAM530svM1VEEN/rAoacVzvI6Tf/E9HMxal/wkEPCIdTRTb5Sf43CY8
 OOaghGg/FtfUv8/kFEh0sx0Jk8rlSwn0cA==
X-Google-Smtp-Source: ABdhPJwfhlAv6U2Nn4zZQi7kKIpjbLNp8cw6Wh8MI/TOdhpHt6jnHgGKkq/kiOJxN6FGyf+6GskUvA==
X-Received: by 2002:a17:902:e804:b0:164:466:e488 with SMTP id
 u4-20020a170902e80400b001640466e488mr30933793plg.161.1654634982958; 
 Tue, 07 Jun 2022 13:49:42 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 128-20020a620686000000b00518b4cfbbe0sm13152327pfg.203.2022.06.07.13.49.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:49:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 49/53] semihosting: Use console_out_gf for SYS_WRITEC
Date: Tue,  7 Jun 2022 13:45:53 -0700
Message-Id: <20220607204557.658541-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 4c8932ad54..dea5b2de8d 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -228,6 +228,15 @@ static void common_semi_cb(CPUState *cs, uint64_t ret, int err)
     common_semi_set_ret(cs, ret);
 }
 
+/*
+ * Use 0xdeadbeef as the return value when there isn't a defined
+ * return value for the call.
+ */
+static void common_semi_dead_cb(CPUState *cs, uint64_t ret, int err)
+{
+    common_semi_set_ret(cs, 0xdeadbeef);
+}
+
 /*
  * SYS_READ and SYS_WRITE always return the number of bytes not read/written.
  * There is no error condition, other than returning the original length.
@@ -341,8 +350,7 @@ static const uint8_t featurefile_data[] = {
  * The specification always says that the "return register" either
  * returns a specific value or is corrupted, so we don't need to
  * report to our caller whether we are returning a value or trying to
- * leave the register unchanged. We use 0xdeadbeef as the return value
- * when there isn't a defined return value for the call.
+ * leave the register unchanged.
  */
 void do_common_semihosting(CPUState *cs)
 {
@@ -419,8 +427,12 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_WRITEC:
-        qemu_semihosting_console_outc(env, args);
-        common_semi_set_ret(cs, 0xdeadbeef);
+        /*
+         * FIXME: the byte to be written is in a target_ulong slot,
+         * which means this is wrong for a big-endian guest.
+         */
+        semihost_sys_write_gf(cs, common_semi_dead_cb,
+                              &console_out_gf, args, 1);
         break;
 
     case TARGET_SYS_WRITE0:
-- 
2.34.1


