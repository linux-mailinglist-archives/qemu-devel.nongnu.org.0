Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777B3606157
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:18:26 +0200 (CEST)
Received: from localhost ([::1]:35988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVRI-00066U-2S
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:18:24 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVIF-0005G0-1e
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU61-0002dU-9G
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:30 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU5w-0000nr-SI
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:18 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b4so33935162wrs.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y2r86cIkMVyRHBjasU8BLM80fUl/rbZ8N5I6eEXnTy0=;
 b=ANRU/KeoHIaJWxrGXqWgW9XdXpCwu49JRqXdEZjgqrlK3KYAvFDY8CIV+3OtnyPQQX
 BBGNb2tzvXCPA9L74+wNH5qf+0sKLhpe7aUsvr6j1N+BJdsdsX5VQnkmMju6FrAMs9us
 YdxKyqWTMLJLk40pAzC/XawUvSQz1EF9ekOWEtvr0Cpn+DttGVvaXUO2JYT2Ne7RBAAB
 dwIp6bL7FW28MY2iKr7seIp7ndGbX0pZtcqEZXp8JD38b32+oJqXB68Ot8KvJxxoUvGt
 a2OshkqSUSR4mpJYierwmKh6z45VFhKcnxZzs7LDc1nDKYmkwndxDCCWxMAo/21MDpJi
 4YwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y2r86cIkMVyRHBjasU8BLM80fUl/rbZ8N5I6eEXnTy0=;
 b=VMLN9ITIuMf7RdSmxIh53c+u8yS4AO2hxS5xv7UvE/cim3WXtimVm7PfTNQAukDw7Y
 u7nDWGtaf+kUNdQyBxSlAFNHrp8JnDN7O16lovZlndShHDYezvdX2fPe/mE1kOviiaaH
 ylQXYi89egwV0QP+TUTgtqepE+CqwetPBt/B2qdHXDIc6IGQoj62ReDAAsZLKAA9fVkP
 5JbzkZ5Rn3OHGsWAKxaCfZ98C2b1ozezRbYJ87H6IJE0EXf1oS59GAFIgoZ3spB37Ow4
 Qf3chKYS0FK7dgQC/j/aA/ewDxd7TybMGRz4TZjgFomtv1QgHG48pPqCT6k6SE+PQA80
 zIWQ==
X-Gm-Message-State: ACrzQf1RRIqCBLS9T0mCB2knL7ANoSgLnXVX5Stv4K0up70QU/TFIARd
 8bwqalXBO+m387fgsC1kj3gjCCK6A1+o/w==
X-Google-Smtp-Source: AMsMyM6t7/duI9kmBGoaBj09nBfqxwrBEEC2EWIggoIwJFuXgGRrqLB85B4nJnr9UakiGnV2dU706Q==
X-Received: by 2002:adf:db42:0:b0:22e:386e:f6af with SMTP id
 f2-20020adfdb42000000b0022e386ef6afmr8154492wrj.400.1666266735232; 
 Thu, 20 Oct 2022 04:52:15 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c3b0600b003c6c2ff7f25sm3045368wms.15.2022.10.20.04.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:52:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 832B41FFBD;
 Thu, 20 Oct 2022 12:52:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 05/26] configure: fix the --enable-static --disable-pie case
Date: Thu, 20 Oct 2022 12:51:48 +0100
Message-Id: <20221020115209.1761864-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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


