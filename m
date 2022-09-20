Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2735BE6F7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:24:21 +0200 (CEST)
Received: from localhost ([::1]:58116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oadEa-0008Py-Pr
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZG-0001IL-2x
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:34 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZC-0004td-OF
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:28 -0400
Received: by mail-pl1-x62c.google.com with SMTP id f23so1913932plr.6
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=5JX7sGU3bhekd0+rl8Pgr+ORxrbUqYd0iNFII92cHyo=;
 b=kr+z9l8g3SvLJBwnCGpAxOiAMYCgCZG4eh+lDcL4FkyqE6RAFIpzMBjP0ASS0i2XAj
 J19mSKiRsW13dokt34Z4iBbzJIkS+DwLn5CaxIRxy+rS26Kf4xZK3fbqfvHLjvW1bMFW
 neAuQ2tgiLg46ZRih29o4upOLzXsyReR1BTQGBHMG7Qp6GjSyAWl889Tc5bVqmqIWkQQ
 X934lzb5CODXuSwWPQIPpwtdpUgN9lHoCaewwUQuWzdgg0lx3NRefxKN3jIomhEcTDs1
 p87Puwh0EJelZieKhVz/1DfRtEFp+BwOnOZZb3LN0vT2Ci8ZiSarCk3OrmxbibqxQpE8
 c5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5JX7sGU3bhekd0+rl8Pgr+ORxrbUqYd0iNFII92cHyo=;
 b=CaYNxOkOFFWdBc1ZpN/FH0s7WVhc58YtDQNvm3kGIP+6MfoqhxGlAbCf8pBX3Q/pJC
 l1PMwx6pfxqx7IF4p7eqC/+nGAs7mS8zzqTnthkimq9iRHtKMO5eELJXZU6Qzsb6coqI
 Mgm3Kd89S0GP3AvwYf4Ax9/tIYF4xH7ZHJ00QOlpZsYCQDRjd2DAmQ10t9z70HjHIoGm
 aorjGtDSpjntG8qQt0L1PgrFK2oOfr8b9rO7kZm8JzsOn0Z+QzXyLjHYok+E1fM35yga
 X+A68LbjNtn0OKnIyO2Xczlo31Qil/YyIAwG0VxwvM2rkVlnweDtk7FCcnqJStlBm7MF
 Kh4A==
X-Gm-Message-State: ACrzQf2tljysK2SRCLzCpFd/5o9gmQz+0uElPJvgmGh+vDiMnLiOK8mQ
 beCgPSgzw5zXuOG72hizGdSzId5CFrg=
X-Google-Smtp-Source: AMsMyM4wrPWxE3W7DvLeomr/HDEMpAKL3E65agxKDiw/0zL7BDwbnotRl/uY9HdOOgIHpUMG1emIgw==
X-Received: by 2002:a17:902:7c11:b0:178:a6ca:4850 with SMTP id
 x17-20020a1709027c1100b00178a6ca4850mr4264056pll.111.1663670004271; 
 Tue, 20 Sep 2022 03:33:24 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:24 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 26/39] tests/qtest: migration-test: Make sure QEMU process
 "to" exited after migration is canceled
Date: Tue, 20 Sep 2022 18:31:46 +0800
Message-Id: <20220920103159.1865256-27-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62c.google.com
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Make sure QEMU process "to" exited before launching another target
for migration in the test_multifd_tcp_cancel case.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

Changes in v2:
- Change to a busy wait after migration is canceled

 tests/qtest/migration-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index c87afad9e8..aedd9ddb72 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2133,6 +2133,10 @@ static void test_multifd_tcp_cancel(void)
     wait_for_migration_pass(from);
 
     migrate_cancel(from);
+    /* Make sure QEMU process "to" exited */
+    while (qtest_probe_child(to)) {
+        ;
+    }
 
     args = (MigrateStart){
         .only_target = true,
-- 
2.34.1


