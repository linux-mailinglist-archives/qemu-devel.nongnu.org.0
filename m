Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E5C5E92F7
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:09:57 +0200 (CEST)
Received: from localhost ([::1]:33516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQSK-0003U5-HV
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrM-0002qH-4P; Sun, 25 Sep 2022 07:31:44 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrG-0006LJ-H4; Sun, 25 Sep 2022 07:31:43 -0400
Received: by mail-pg1-x535.google.com with SMTP id 129so2789309pgc.5;
 Sun, 25 Sep 2022 04:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=m9AGKNA/tIixBbJopd2bItPygulGLgdib3k9UNSIIX4=;
 b=aSCopK1VJ1oG4iLuvwcID5s1rbh6d8iY3538bY9N22Bm/5bzEXeHRHlPfigLAftD2q
 avFOsKLrf+YyuhC6vVgZQrbkBXJ4QIDEqPL3YbJabv6c4hCHJTRgOhoMdAFRq5CnarQD
 DLA2xFFhzjjYqEpktQe1//T/IlxRIhTSdm/63FapWJ6gi+OpSegiQZikKtAVzIcWFSqq
 l46CXuyAVPKkyF2a+ZnqNNGAlO6z2pVHeKMMjltblZ6rKtNI1FSXbWRAQY8WKtgYTBb8
 6xGvpyRPlDxUIIsI3NowNmc0CzVMpgDC4A1xYTpxGK+bxP+o7imJfpzH/aZof/8s4DS1
 jgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=m9AGKNA/tIixBbJopd2bItPygulGLgdib3k9UNSIIX4=;
 b=gvL7mfXiudRQJ4hRkuphdVtC2ZnOQK7dsTKY94pyJAgCdcynVuakKkhFSW084tqkx7
 3Zn8fMBYuWaqhGUpwUhWouRul/oSwxWzrAYWaE3hiFFxhEmc/ZmzZcmVepuFwoYtgw5W
 YVDRbhw4rnp6v2FvFXxXAOkgvzzIrXptWXyTbUwYPMszIhzLis2mFEXBNN1bf6B7bvC4
 ZsYHuoTpYcgrzRuxx38Pz0VfbijDElCnW/f/6RlMlQG6h/sXljrX885Ws/CbxnOXELRs
 5hsDBrE0kCefKWhEmJ+tA+MqsZCXC6INuwDW1AtuiW1qb0lSFcRr3+DQuqjH1s/V3+oH
 dHbg==
X-Gm-Message-State: ACrzQf2AwJFu0NzKAZTCWbIhidu110erbECTIYkuHO8pfG0z3kWRv/Pj
 2S8jDklTSoEp09kap2H8wx32Dd3OAfU=
X-Google-Smtp-Source: AMsMyM78BW32mt1q50K/AXEKe47/iaVReNfA9Er+hqB8I6vG9g9imbc2OyYamgrhz255w6sSxAuqkg==
X-Received: by 2002:a63:20f:0:b0:43c:1ef6:ebd6 with SMTP id
 15-20020a63020f000000b0043c1ef6ebd6mr13844323pgc.217.1664105492286; 
 Sun, 25 Sep 2022 04:31:32 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:32 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH v3 19/54] tests/qtest: virtio-blk-test: Avoid using hardcoded
 /tmp
Date: Sun, 25 Sep 2022 19:29:57 +0800
Message-Id: <20220925113032.1949844-20-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x535.google.com
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
files. Update to use g_file_open_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- Split to a separate patch

 tests/qtest/virtio-blk-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/virtio-blk-test.c b/tests/qtest/virtio-blk-test.c
index dc5eed31c8..19c01f808b 100644
--- a/tests/qtest/virtio-blk-test.c
+++ b/tests/qtest/virtio-blk-test.c
@@ -49,10 +49,10 @@ static void drive_destroy(void *path)
 static char *drive_create(void)
 {
     int fd, ret;
-    char *t_path = g_strdup("/tmp/qtest.XXXXXX");
+    char *t_path;
 
     /* Create a temporary raw image */
-    fd = mkstemp(t_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &t_path, NULL);
     g_assert_cmpint(fd, >=, 0);
     ret = ftruncate(fd, TEST_IMAGE_SIZE);
     g_assert_cmpint(ret, ==, 0);
-- 
2.34.1


