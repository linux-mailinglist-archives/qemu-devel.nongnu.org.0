Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFBA6737D9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:06:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pITfs-0008DM-MV; Thu, 19 Jan 2023 07:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pITfY-0008AZ-Ko
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:05:29 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pITfX-000277-5h
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:05:24 -0500
Received: by mail-wr1-x42b.google.com with SMTP id z5so1632387wrt.6
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 04:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QppPQJH4LZQg27COJ1eHChl/e8bOzY/wwCMPjzZoPKc=;
 b=S69AkX302tUxrYF21IM0+xRv4XMgMT8JZwnUvRMPle79KYY4R7ZJtctqpyDOVEc1St
 GKOFntovhCZZIViY5qrq4I4C+oU+JvjaX3+eLQZ3+li2hMBrRM0PBiR6cjzLlxPCLPBy
 o1/aI5/bvj9mGdKRfS7p8zYmbiacgo03EQEqj3xgSx/zu0KoFBWWJOqVA4qXmSvqBvmF
 hzG1wWquw9aGIv6uL+ub6XUxZ+8Gqh+glRJ+XNhgq4fGg08/P5UBybDhGkKJzFq5znPP
 A+fD3g6bvw6/DV+PKvw59VHDUaVzkYmZSSISdXRLuBHscRQ/bz5E4lj8KX26gBTpnnu2
 ro7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QppPQJH4LZQg27COJ1eHChl/e8bOzY/wwCMPjzZoPKc=;
 b=sPyjCQfv0CBRZM41NM9yhcNtBRbLGGkha9V0Xg710Oc1V9OLgMbxZHYJW5qcBTzDFh
 TmxmMuu2cBPdI10MPhYMQ9ruzG39Ir8uOpQfmdn2DrZim7wt4JLw4xV9wghZwSUIT0iu
 YDFZcJP7/FI9vhMl5cwk9dqyRB5u7egiv113EqtSGHe0Me6iNAT5/F4+XBXEetkwGmCB
 XR6sDPTMInjCvBRI+pAiibEcRnzjRY445qBg1VpKP/Lvvy79y0R2xu/VgrsGtlcdkl4i
 Pdaq+80LNtwx7K653pCBSroOAMAUxcww+B/u0OeF+T8ppVWJIaBCVjhuD39ygKM1uP0v
 AIQg==
X-Gm-Message-State: AFqh2koOFNkVuuN1PEPJ0FoKITyv+Jd01Yc+GDffiN2Av/2fdYb9BYzl
 ykqzAaxt54a+fxByMfyCJCYdlaoSzIxqZgFz
X-Google-Smtp-Source: AMrXdXvfDgIiwcfqamr/5hO60IbAsjHUhiP/tsWANOsHaIrTRytRa97AKzXy/QC/zYEXX8YdD9E3sQ==
X-Received: by 2002:a5d:5259:0:b0:2bb:6c90:26a0 with SMTP id
 k25-20020a5d5259000000b002bb6c9026a0mr9410471wrc.43.1674129921296; 
 Thu, 19 Jan 2023 04:05:21 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s2-20020adff802000000b00241bd7a7165sm33596139wrp.82.2023.01.19.04.05.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 04:05:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/3] tests/qtest/vnc-display-test: Suppress build warnings on
 Windows
Date: Thu, 19 Jan 2023 13:05:12 +0100
Message-Id: <20230119120514.28778-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119120514.28778-1-philmd@linaro.org>
References: <20230119120514.28778-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

While this test is skipped on Windows, we still get when building:

  tests/qtest/vnc-display-test.c:22:20: warning: unused function 'on_vnc_error' [-Wunused-function]
  static inline void on_vnc_error(VncConnection* self,
                     ^
  tests/qtest/vnc-display-test.c:28:20: warning: unused function 'on_vnc_auth_failure' [-Wunused-function]
  static inline void on_vnc_auth_failure(VncConnection *self,
                     ^
  2 warnings generated.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/vnc-display-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/vnc-display-test.c b/tests/qtest/vnc-display-test.c
index e2a9d682bb..fd63e3a881 100644
--- a/tests/qtest/vnc-display-test.c
+++ b/tests/qtest/vnc-display-test.c
@@ -19,6 +19,8 @@ typedef struct Test {
     GMainLoop *loop;
 } Test;
 
+#if !defined(WIN32)
+
 static void on_vnc_error(VncConnection* self,
                          const char* msg)
 {
@@ -31,6 +33,8 @@ static void on_vnc_auth_failure(VncConnection *self,
     g_error("vnc-auth-failure: %s", msg);
 }
 
+#endif
+
 static bool
 test_setup(Test *test)
 {
-- 
2.38.1


