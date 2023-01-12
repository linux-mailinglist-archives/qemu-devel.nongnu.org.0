Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67933666EEB
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:01:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuMn-0003wj-84; Thu, 12 Jan 2023 04:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuMk-0003uK-1B
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:59:22 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuMi-0004VF-FE
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:59:21 -0500
Received: by mail-pj1-x102d.google.com with SMTP id q64so18638026pjq.4
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r8E5T5p55maR9Lvi0OYUNSY6Lmry70me8eqkYiVGFIk=;
 b=mq09fwVgNnQL5SUPIKAzHaOF9iwS+hLx17ufT7+tIIRrYfK/eQcEZjqrRI8Vpe8kva
 oBmc03TbDp9yeSOnROzkaT8piHGhawP6S6MtNE6NB0qFKpCkOkOCb3VMKg4yySMmMUa4
 /jUcy5IZWVpYxq08WJDwYeTryHiAt9DunVeQeQdqfInrzoeSS/JqfvwM3pIBC+MI1HiR
 SrkAMJiEp74tudkxFkChes6CR5GQN1D25SL67YOuKEOJfcbLXKz5F2klIJFaD9M+gZST
 +J4khNWJEClu5NejYXszx+BRRTp4zvH7VkvPZjK0jRUh9WMCDYq+GAxGUkKacTm3SJfL
 73+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r8E5T5p55maR9Lvi0OYUNSY6Lmry70me8eqkYiVGFIk=;
 b=vJqOhkfzR1nWTJ/rMckP3UZJkeN2LRzAl5LfRKhIAiSeeTtc79GQpZZn8jx6Bf+unY
 3xjm5m1f/W9hznUCmHlm8BHgboL+4jONFpBsoQ8wyH8e48FPuC1tx7DKz+RHHypUCiwl
 0/kDzI3YuE/ufmOEjP8bi/BGcXxXNx9lrMZgPcHLWYdEb1MjyZi5PBWPwMBzcfMw7bRF
 nwNREmEfVaDLEc3eQcJbcXE7+WY7OxR99Owhd1bkemYySOQJQFYj2+csyjsCiu0qdg+I
 ahwK3fT5iuCryWH1p98VN8yyXln35CP/xlnudjwmKuhNOx95EYOsLunKfihZZiZ05A1b
 KAIA==
X-Gm-Message-State: AFqh2ko9fah38afGmRKYC6l33pmNxn6n2d+zNGfL1IDxHdvYEJKVxRJm
 gWvdpQspZpZky3De73iLXZj1zg==
X-Google-Smtp-Source: AMrXdXsdY/T4uxYgUwqT/yVnTaAfXGDAD2qrPs5PuERNjOXxMK9wi9lJ+BdG8VdCDtO/Ck2vAbOA/w==
X-Received: by 2002:a17:90b:48c3:b0:226:cefc:270d with SMTP id
 li3-20020a17090b48c300b00226cefc270dmr24505842pjb.5.1673517559369; 
 Thu, 12 Jan 2023 01:59:19 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.01.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:59:19 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 17/31] tests/qtest/e1000e-test: Fix the code style
Date: Thu, 12 Jan 2023 18:57:29 +0900
Message-Id: <20230112095743.20123-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102d.google.com
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


