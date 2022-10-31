Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC1661377C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:11:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUYw-0008VO-JC; Mon, 31 Oct 2022 09:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYX-0007tj-Ue
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:26 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYV-0001EC-13
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:20 -0400
Received: by mail-wr1-x429.google.com with SMTP id l14so15932744wrw.2
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dBvi3VZceGTEMcPqjFN49HgzxZm4w6xNmyJ+VxQfgwg=;
 b=whj1AdWjcv0micpHvXuoKDB+G5bjLxVe3JUVgwURYSCx7Bko7HEaEA6+yUDGdQ8fcI
 SYhxsOr36KNu1bPAd+mgeRE1pAbT2DSsB+ruF6woQ2Acegyf4s2FkDgTKalsBzfMsbRy
 X2QvHz086Y49Bi1w7Ts40Q5569HRn+MWr2YBxYXPM/vO+JX9rJtJgPM0DB1PDE5EhqqC
 MzD/krl5WXI4gNY2MqJb8dcYIkViTcbUqGXZ5UuoHxmKmAwzzDu3qHZj1rFQMTgMBsmV
 NW9jKyuD81RRPRlctxZiyF/hvaNjmnNhot4kLqO3XjoFlxcCw/Z2Ahc39WdwviarELfw
 Zx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dBvi3VZceGTEMcPqjFN49HgzxZm4w6xNmyJ+VxQfgwg=;
 b=5//eFp4zQkPwue0l2T7h8uEj+TIqWug657hTqi6/T7G6d/om3yiV71QUU6se3TDiMA
 fo3yf73qjeJlWCTU7/mv9+eRxxbmA5GwOJdcMYgDWDiSmyB5CqyG56MDV25kQCxX3HIx
 34guNermNl9+m5XbvXifGBCpWTXNUMOHruUasQgyQo5ZvhXGcLApnbpt3DLS4Onxyocw
 6K+7rREdgMIqJQfT0rEGsqAImnAwqgGQ1UUB5+sVEhqZ/cbSoq2LHx/GaZcHda37lL+M
 caaXYISm5HrtDcuA/xaN6GKCZugfyEaydbbZ0nCpaUKw/AigmStYQN3pitFIcsd21R90
 Lp2Q==
X-Gm-Message-State: ACrzQf1qt6th72Z0GlpxRX6KMVcc/XTPit4njtIVCxQG6Qxm0fxMRh+e
 ASVqq9ixiXa3thiQxNB81JkXzA==
X-Google-Smtp-Source: AMsMyM576Dw3OrWuvqdzEzSWijbzg9CyBaaJG19TnfCn2tJMuZCArjTAdbD1h46//oNunyHebHALSQ==
X-Received: by 2002:a5d:522f:0:b0:235:c877:5cdc with SMTP id
 i15-20020a5d522f000000b00235c8775cdcmr8172088wra.352.1667221816193; 
 Mon, 31 Oct 2022 06:10:16 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c314a00b003a1980d55c4sm7435731wmo.47.2022.10.31.06.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:10:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A4CA31FFBF;
 Mon, 31 Oct 2022 13:10:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 07/31] configure: fix the --enable-static --disable-pie case
Date: Mon, 31 Oct 2022 13:09:46 +0000
Message-Id: <20221031131010.682984-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

The previous tweak was incomplete as it missed a leg.

Fixes: abafb64b6d (configure: explicitly set cflags for --disable-pie)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221027183637.2772968-6-alex.bennee@linaro.org>

diff --git a/configure b/configure
index dd6f58dcde..8c2c4c1a04 100755
--- a/configure
+++ b/configure
@@ -1327,6 +1327,8 @@ static THREAD int tls_var;
 int main(void) { return tls_var; }
 EOF
 
+# Meson currently only handles pie as a boolean for now so if we have
+# explicitly disabled PIE we need to extend our cflags because it wont.
 if test "$static" = "yes"; then
   if test "$pie" != "no" && compile_prog "-Werror -fPIE -DPIE" "-static-pie"; then
     CONFIGURE_CFLAGS="-fPIE -DPIE $CONFIGURE_CFLAGS"
@@ -1335,13 +1337,12 @@ if test "$static" = "yes"; then
     error_exit "-static-pie not available due to missing toolchain support"
   else
     pie="no"
+    QEMU_CFLAGS="-fno-pie -no-pie $QEMU_CFLAGS"
   fi
 elif test "$pie" = "no"; then
   if compile_prog "-Werror -fno-pie" "-no-pie"; then
     CONFIGURE_CFLAGS="-fno-pie $CONFIGURE_CFLAGS"
     CONFIGURE_LDFLAGS="-no-pie $CONFIGURE_LDFLAGS"
-    # Meson currently only handles pie as a boolean for now so if we have
-    # explicitly disabled PIE we need to extend our cflags because it wont.
     QEMU_CFLAGS="-fno-pie -no-pie $QEMU_CFLAGS"
   fi
 elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
-- 
2.34.1


