Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FEB5E92E1
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:58:03 +0200 (CEST)
Received: from localhost ([::1]:39594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQGo-00009o-RH
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrN-0002re-Aw
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:45 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrK-0006Nc-Pi
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:45 -0400
Received: by mail-pl1-x631.google.com with SMTP id t3so3950840ply.2
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OJRDzQX/DMg/UmxTVGA3PP9Zj/iY4BqjzFCS4YP7c5A=;
 b=clST+9dxP/LsJWnC3czzJqKlnsT4x+wDqYhY+nRknlfzoNTvxmLY9tfa8gbnfQDJw/
 2kBdWsvC86dsq83LMwiL/XVrhPEjg1oAlANFSBzKmI6YAC1q4iQlcs1JI/LJMgLdrZlH
 c2ACasq3N9lB3TifUuu7bsqMfU6/CrgbUvsEoC+yyNRCVbjLiT8v6JFAtXb3Wh7FI2DD
 JkefAQybAdwteMOuUd63gTKZRVj2ErnDMy8fyPrtkE7/lG7wzA6h7lS1KKAOcmKdUKX/
 v2N9CTAB5dJI0rvf0zkDzj2+HjTgrtjJFP9DvnGew9yUrkxp89y6C3DgtJuf2Jg2KKMH
 X3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OJRDzQX/DMg/UmxTVGA3PP9Zj/iY4BqjzFCS4YP7c5A=;
 b=UZf/JxnVtdfiq1ZDe3r2Bn/9dj2rQrB0Qt5mO6DQCEbJg0RHfyQY/Matm423G7LWHw
 /4+CNN1gZJljvKZOCG+PeVCJHRV+yMuU8eZNCfS6w3KYFS2VYuZ454uujnVZMfHOQzcq
 I8N4VTsXspaSYqfOPs0Cv+d3p8p2WFwF2vn5ysNKOuPPD/QZUOSUcWRrPFmOnvi6OMIT
 o+CLNSR5uFZwlcvqz/l22klAJkzLCZWpUiqB/h/8nMuj8TU6NxyOxgsEBipqsmliQ8FT
 hSYp7xdd7CQjuHIdDNS+w01GUXZX39lY9Mrv6nky7OZwTFaYLuWAfShd3RxLKlDOhwjA
 +ipA==
X-Gm-Message-State: ACrzQf2P6ZCx441F/tBw42W8ufYpdO5EXCXy+Mo8Xrisu4L1w91Gj75c
 gnDuTCg60I8jbJhXoSBShJU+XX9t2iI=
X-Google-Smtp-Source: AMsMyM6N4i1QZwOy7KiuQRPfv3pOnIJhcxoGZoYKOk7pPnWmb+X/VRIhz96HY/HfMMf4MRR2CUE1pw==
X-Received: by 2002:a17:902:6907:b0:179:c9bc:dd73 with SMTP id
 j7-20020a170902690700b00179c9bcdd73mr9041939plk.159.1664105501489; 
 Sun, 25 Sep 2022 04:31:41 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:41 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH v3 23/54] tests/unit: test-qga: Avoid using hardcoded /tmp
Date: Sun, 25 Sep 2022 19:30:01 +0800
Message-Id: <20220925113032.1949844-24-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_get_tmp_dir() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- Split to a separate patch

 tests/unit/test-qga.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index b6ea7c7304..b4e0a14573 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -60,7 +60,7 @@ fixture_setup(TestFixture *fixture, gconstpointer data, gchar **envp)
 
     fixture->loop = g_main_loop_new(NULL, FALSE);
 
-    fixture->test_dir = g_strdup("/tmp/qgatest.XXXXXX");
+    fixture->test_dir = g_strdup_printf("%s/qgatest.XXXXXX", g_get_tmp_dir());
     g_assert_nonnull(g_mkdtemp(fixture->test_dir));
 
     path = g_build_filename(fixture->test_dir, "sock", NULL);
-- 
2.34.1


