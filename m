Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4F466A91F
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 05:10:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGXjf-0000z9-NG; Fri, 13 Jan 2023 23:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXig-0000Li-FZ
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:00:40 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXid-0005cJ-Ok
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:00:37 -0500
Received: by mail-pl1-x62a.google.com with SMTP id k12so3237294plk.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 20:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VIzIuXnMGDhlgw30ccWTCAJ4Ut4mVGKZXpj9z5H7uiA=;
 b=IaKr9fRkrocVwCKUrybjQfz66Cs4oMWztM3YBfKeSl4D6+uMuKrRoa5RzlvTG2rWbN
 uq9pkkigaxNtJOwXbo7B7O3E4YiLzpNsDIclZnqOSAlraCkcuEauKqDA18M3JGW/uJNX
 Bcz0yk6AX1i85DlOCBQeD+MKizb3pK3JVLfUqwmbXLvwXtd4YrzMc769E8Yt8hwfWU8i
 TtNgCpF0qlIpzJWvwfQVqgKPR4pjx0l+6qFXk/DWWJ8PKWLq0ylfmjcs2Zoo+fmGQauZ
 BbEsK4xZZcr2ZyppgqKXMNUNBe1fxDiv+o6OcrYHCqyMixBtqRBMMJqiHN1HbUS4rrAZ
 +rBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VIzIuXnMGDhlgw30ccWTCAJ4Ut4mVGKZXpj9z5H7uiA=;
 b=e/DIxk0wd5rAu23MKoCJM1QHHbzfK7f4C9+WOCGY/97jE2TMQ44Q/gqhZxxdmCYgi+
 KigiOss5Zg9qQZ3JNr0uNSZnyYorfpm3uJufwCSXkpsEVcAuZKh3kFEmS5LWUgfenpK5
 pnFpIVOaqctZl8xLIN3elIr6aL2SXHJIrCpRh/FnpHHQlJzxFlofvGEoMdKnNNBwLbk3
 4yCzkmzXShPgNNDwpCPS3nqMipGiwPTXp5FdnK6JsnVKI0blE6irJKQTqNV1LCfsF4nU
 Xr1iUDs8V0/ASRX2sFBnUyiDDBTriIftuVICsFwExbtuqYH+HOvDC/e33h/OQrfLlw+l
 XvcQ==
X-Gm-Message-State: AFqh2kqNxp7Zh7lT4lIOM2W12Qlm02ZpQeNWqFtujYj21cwfwvGpZHuW
 gPpm5faId+AzNRHjOw+TM2ot8A==
X-Google-Smtp-Source: AMrXdXuPRYHXszABEqaTndI87yyAAhDFPaT4mpokbvLe63X3QI63Qk9F9N3048AEZCwz1D9PD0DYRg==
X-Received: by 2002:a17:902:8643:b0:194:6f0e:987 with SMTP id
 y3-20020a170902864300b001946f0e0987mr4709372plt.61.1673668835156; 
 Fri, 13 Jan 2023 20:00:35 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a170902868f00b00189fdadef9csm910894plo.107.2023.01.13.20.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 20:00:34 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 18/19] tests/qtest/e1000e-test: Fix the code style
Date: Sat, 14 Jan 2023 12:59:18 +0900
Message-Id: <20230114035919.35251-19-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114035919.35251-1-akihiko.odaki@daynix.com>
References: <20230114035919.35251-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

igb implementation first starts off by copying e1000e code. Correct the
code style before that.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/e1000e-test.c   | 2 +-
 tests/qtest/libqos/e1000e.c | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index 3fc92046be..b63a4d3c91 100644
--- a/tests/qtest/e1000e-test.c
+++ b/tests/qtest/e1000e-test.c
@@ -1,4 +1,4 @@
- /*
+/*
  * QTest testcase for e1000e NIC
  *
  * Copyright (c) 2015 Ravello Systems LTD (http://ravellosystems.com)
diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
index 37c794b130..b90eb2d5e0 100644
--- a/tests/qtest/libqos/e1000e.c
+++ b/tests/qtest/libqos/e1000e.c
@@ -222,8 +222,10 @@ static void e1000e_register_nodes(void)
         .device_id = E1000_DEV_ID_82574L,
     };
 
-    /* FIXME: every test using this node needs to setup a -netdev socket,id=hs0
-     * otherwise QEMU is not going to start */
+    /*
+     * FIXME: every test using this node needs to setup a -netdev socket,id=hs0
+     * otherwise QEMU is not going to start
+     */
     QOSGraphEdgeOptions opts = {
         .extra_device_opts = "netdev=hs0",
     };
-- 
2.39.0


