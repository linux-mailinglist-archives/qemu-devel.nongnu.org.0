Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B28461024B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 22:03:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7mR-0002ON-8t; Thu, 27 Oct 2022 14:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kG-0001L0-Pr
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:49 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kD-0003Ka-Re
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:47 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso4816942wma.1
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GnES94/DJeVFvfAsPrcBucSZj64IFR2JBDhsiBY7Dis=;
 b=mpacPcsz0mRaCu8ruJSD8UZANSJM+Zg5a6wPQ3FB5RFyrYIJd4/sIt8k0goOUS26gz
 LX6ErzLd/bt4+dpcduW+mVsyP2WwTvPMM36FnRQhcImIMfwDaFjLQw9BD4HsbRF6pwqj
 bhzJ0au3av13Et0DccgEL5fSxjnDKF/RzxO5GThOmZmobkt2VlO4CfdqdjvkOjgxZxak
 fk8fwtvo1oMPIr1QNP41Q87f2nXUaTMW9fL4L5Me/0Wpu3DvMjOqGgDeE0rEoeCkWysO
 RK00n+qFY69LyIxO20/hvIfDEM1L1qmDhpC+ntcLrJtfLf+zbwfhuMdfEfHL0vfEHiuX
 ZdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GnES94/DJeVFvfAsPrcBucSZj64IFR2JBDhsiBY7Dis=;
 b=Ac5PzoMRNAzmxHOCu0E7syY8tdpG3q2YJnaVE2r1KudHntKo705//GlrwUfis2sirm
 OZoyH/dZFerc+yjcwgCaC3IOlgQE0cWVu1orX3yhjQhhelysVhjHJFh5ekh/7nhtXlbP
 xTfIyDMtuggO5KHDBBB5wyoUDXUg7J81y17VInas8b8XX/dPjZKECjc+DnKwfZTHf1fQ
 3jU9QS8rwHTiwJQE/uI669EDIBhMrc75WYGylDC3SKhrRkZr4hWKQRyp9VHjMADkyQ4q
 qubHB+hLwGAaSD/Tb6qDBq3L6DEPAUVP2GkZITjI4ZxsBDkXyUtsPnScSuYbAnGPqanR
 q0Fg==
X-Gm-Message-State: ACrzQf0SuS9ZhO4bQJfWyovXP6eayb5Q2NahTTPQ7RXq4hfS50d0FG3b
 7Z3lJCD/9f0Lzrxkxs9O9u9IclHQ6qYuMg==
X-Google-Smtp-Source: AMsMyM4ekkbCtqVctBhLR1635J598bl/fnEvrMkQUqzDZsAM7VPwzuK8X/vuSRJ6OwV8Cyth5rp5Yg==
X-Received: by 2002:a05:600c:4ec6:b0:3c6:c469:d295 with SMTP id
 g6-20020a05600c4ec600b003c6c469d295mr7008418wmq.117.1666895801782; 
 Thu, 27 Oct 2022 11:36:41 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a056000170400b002302dc43d77sm1915743wrc.115.2022.10.27.11.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:36:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CE9F91FFBD;
 Thu, 27 Oct 2022 19:36:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 05/30] configure: fix the --enable-static --disable-pie case
Date: Thu, 27 Oct 2022 19:36:11 +0100
Message-Id: <20221027183637.2772968-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The previous tweak was incomplete as it missed a leg.

Fixes: abafb64b6d (configure: explicitly set cflags for --disable-pie)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

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


