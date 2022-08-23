Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5463259E624
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 17:38:13 +0200 (CEST)
Received: from localhost ([::1]:39418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQVym-0005qj-Bd
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 11:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQVn6-00021p-DF
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:26:08 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQVn3-0000SE-Qi
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:26:07 -0400
Received: by mail-wr1-x430.google.com with SMTP id r16so17427183wrm.6
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 08:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=2UiPIX+dYiJbGljmyLuAxazW0KQr7rKB0A3pyVRLY6U=;
 b=zgVKv1j0au1B/yznbH1uxZ6uDYU7ODJKxvDeDZh5i1RTXyii5VK9k/PnBihfLq2t59
 5olM0PQrI1sXDUkMcUgpxZj6/5CogezBhRpzwpkFgzNMsVuQPJbBZRjJR7+BcqgsdSQG
 tgtKeRZjfvvDcldooh0I6WudMAo8Z2xHaPb0lS7QhfQSJ5KlxluaUmENbAVTTBMYt5cl
 +rsfRULxH9IQLrSF4nK1KgjnDdnxgU3r31qvnbwkgXfyIr8Yf+BjBRvLO4+6cyAFIyzx
 ieFaqw+GRxdfgzVyMxX7Hb84EO0XnAlywrEZMikYySEqbVbCGYxpJWP8dvB+REmGqa7q
 fMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=2UiPIX+dYiJbGljmyLuAxazW0KQr7rKB0A3pyVRLY6U=;
 b=DOM0SJ+5jW44ZX27CRWI9w/eIosJf/s7GYVY8SypzRciTmPdFezQAWyASYtapjgCg4
 HHs41+JxSli23FIw1fsig3eE7+4cvpqP8164APQ+X4MGDMVXmvhYYg/HtBWdUqf++vvz
 /8yR+cE3AN3gPA1Xq6F0tTHgGfbUCJu6Sxc2Sh+pmeWDw5QN27irDUl6GjNQLebyjSt1
 GkAisz0dLQ2JwgSCzWRGYvT3DgX+bX2DW5bAuIE26SMxMfyANdyNdQMOCQQNcHSOWraE
 g60nn8jwYqSwrTWxUbiBhkkADmFSZ/4UsJEnvnrB/2CpiIzwzfqMGYb24LtSiBD6dC/4
 VD/w==
X-Gm-Message-State: ACgBeo3Ne2B0zI2Umg0RrNlseSo2xZ42u8/6HtLov1KNDpTRDCqLbUPM
 gOeBHbmIL8TNWqOEFNXKZbRTTQ==
X-Google-Smtp-Source: AA6agR5tuYbDXrW5UK/asvHBLMZejqgEBnGK+x2OmyUg61zDBvucBsF4C+/FQ0XBhK6zxM3ES9wk/g==
X-Received: by 2002:a5d:620f:0:b0:225:32fc:cea3 with SMTP id
 y15-20020a5d620f000000b0022532fccea3mr13491447wru.270.1661268364204; 
 Tue, 23 Aug 2022 08:26:04 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a5d438e000000b002253604bbefsm12809090wrq.75.2022.08.23.08.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 08:26:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D6DED1FFBC;
 Tue, 23 Aug 2022 16:25:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 4/6] tests/migration/i386: Speed up the i386 migration test
 (when using TCG)
Date: Tue, 23 Aug 2022 16:25:56 +0100
Message-Id: <20220823152558.301624-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220823152558.301624-1-alex.bennee@linaro.org>
References: <20220823152558.301624-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

From: Thomas Huth <thuth@redhat.com>

When KVM is not available, the i386 migration test also runs in a rather
slow fashion, since the guest code takes a couple of seconds to print
the "B"s on the serial console, and the migration test has to wait for
this each time. Let's increase the frequency here, too, so that the
delays in the migration tests get smaller.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220819053802.296584-4-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220822165608.2980552-5-alex.bennee@linaro.org>

diff --git a/tests/migration/i386/a-b-bootblock.h b/tests/migration/i386/a-b-bootblock.h
index 7d459d4fde..b7b0fce2ee 100644
--- a/tests/migration/i386/a-b-bootblock.h
+++ b/tests/migration/i386/a-b-bootblock.h
@@ -4,17 +4,17 @@
  * the header and the assembler differences in your patch submission.
  */
 unsigned char x86_bootsect[] = {
-  0xfa, 0x0f, 0x01, 0x16, 0x74, 0x7c, 0x66, 0xb8, 0x01, 0x00, 0x00, 0x00,
+  0xfa, 0x0f, 0x01, 0x16, 0x78, 0x7c, 0x66, 0xb8, 0x01, 0x00, 0x00, 0x00,
   0x0f, 0x22, 0xc0, 0x66, 0xea, 0x20, 0x7c, 0x00, 0x00, 0x08, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xe4, 0x92, 0x0c, 0x02,
   0xe6, 0x92, 0xb8, 0x10, 0x00, 0x00, 0x00, 0x8e, 0xd8, 0x66, 0xb8, 0x41,
   0x00, 0x66, 0xba, 0xf8, 0x03, 0xee, 0xb3, 0x00, 0xb8, 0x00, 0x00, 0x10,
   0x00, 0xfe, 0x00, 0x05, 0x00, 0x10, 0x00, 0x00, 0x3d, 0x00, 0x00, 0x40,
-  0x06, 0x7c, 0xf2, 0xfe, 0xc3, 0x75, 0xe9, 0x66, 0xb8, 0x42, 0x00, 0x66,
-  0xba, 0xf8, 0x03, 0xee, 0xeb, 0xde, 0x66, 0x90, 0x00, 0x00, 0x00, 0x00,
-  0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0x00, 0x00, 0x00, 0x9a, 0xcf, 0x00,
-  0xff, 0xff, 0x00, 0x00, 0x00, 0x92, 0xcf, 0x00, 0x27, 0x00, 0x5c, 0x7c,
-  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x06, 0x7c, 0xf2, 0xfe, 0xc3, 0x80, 0xe3, 0x3f, 0x75, 0xe6, 0x66, 0xb8,
+  0x42, 0x00, 0x66, 0xba, 0xf8, 0x03, 0xee, 0xeb, 0xdb, 0x8d, 0x76, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0x00, 0x00,
+  0x00, 0x9a, 0xcf, 0x00, 0xff, 0xff, 0x00, 0x00, 0x00, 0x92, 0xcf, 0x00,
+  0x27, 0x00, 0x60, 0x7c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
diff --git a/tests/migration/i386/a-b-bootblock.S b/tests/migration/i386/a-b-bootblock.S
index 3f97f28023..3d464c7568 100644
--- a/tests/migration/i386/a-b-bootblock.S
+++ b/tests/migration/i386/a-b-bootblock.S
@@ -50,6 +50,7 @@ innerloop:
         jl innerloop
 
         inc %bl
+        andb $0x3f,%bl
         jnz mainloop
 
         mov $66,%ax
-- 
2.30.2


