Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592D15FDDD1
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 17:59:06 +0200 (CEST)
Received: from localhost ([::1]:40978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj0bx-00041c-Fs
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 11:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj0QW-0006Aw-D1
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:47:16 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:44670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj0QU-0006p1-Jz
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:47:16 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so1747528wmb.3
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 08:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ePAv0VhEcbjKAsqareEHGiLcH68DCxtUNvUnEj2ges=;
 b=Lf4sfa6zjjH/7A/lC1mrZq13RNjgBAkDRvwG1chi+I9w/3jXScSgsy4582RkU+q0zn
 xHNKKw+nMv6WXR94Ida74UmzwgpSg+0989zTldQ2pllSaOhtEiiVmgpVHjuHXpoqvFlU
 D3M7YAGoeQvA52HabI10K7xk/BEoWjo3NbQSBFDe7652EqudDGr43IdxGwxGJolpgLDa
 eFhEKDqXeOHipW8id2YZGcT0nf2igNSz2+gqaYBuKT1oYvjMbc+9OlcG9IG9esvr5Khz
 T7wkC1PgB7JxbMT3hq2SSr1ceB44p9vUKDaL3bssKtPNMaMm6BP43zQFV+YgxsDEAbeE
 Rrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ePAv0VhEcbjKAsqareEHGiLcH68DCxtUNvUnEj2ges=;
 b=tOjG6AUwfD6hqmGVgrsKOue767RtPsTd2T19HHjo2ba9RUcW8IGMXA+74vMXI9wzYc
 ryDiPQnZ4cJFzSXLN/7SGvOWgP4DCHfXJuP9wO/WWOOZ4IVr60Y0vQjy4lsdACQVvcYS
 5AC+6fCKhBmDAW3tPWaqggSAA3FmIaS5Mjxb6NGkaC1BF6yJhcEueclhgfub2Veywpbu
 a6mn8p3D1vQMnmIml7cjDAvjjwlivupEAQeFZZYRc/qVzZzW0qFOzYDBwdSysil7Z2j/
 K9hkQHT0WXSX3KAbqR8PSWWvnDp29EUWAkBjcXR0E8VDknFbmkQsRjUU2A02jsa4kWfy
 DOTw==
X-Gm-Message-State: ACrzQf3ICR0fiSF+7IrIf7ly4t87uF5WBxI/ejL/NVE5m76YrLV6kJBg
 3O3l0SldE4WCno2F7gHCwiM8jQ==
X-Google-Smtp-Source: AMsMyM7MjNI3XKKL9ueNcChRstXacF8fwbr1nZZe4YZR+MOdH/avRG45r64g7v7rU5QDQ/VnIncgRQ==
X-Received: by 2002:a05:600c:1987:b0:3b4:9b03:c440 with SMTP id
 t7-20020a05600c198700b003b49b03c440mr341478wmq.14.1665676032818; 
 Thu, 13 Oct 2022 08:47:12 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a05600c000200b003b49ab8ff53sm4683754wmc.8.2022.10.13.08.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 08:47:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4BE1B1FFBD;
 Thu, 13 Oct 2022 16:47:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 5/7] configure: fix the --enable-static --disable-pie case
Date: Thu, 13 Oct 2022 16:47:03 +0100
Message-Id: <20221013154705.1846261-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013154705.1846261-1-alex.bennee@linaro.org>
References: <20221013154705.1846261-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous tweak was incomplete as it missed a leg.

Fixes: abafb64b6d (configure: explicitly set cflags for --disable-pie)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 246651f25d..bab4e6df9f 100755
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


