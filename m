Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AEE5EC2A6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:27:03 +0200 (CEST)
Received: from localhost ([::1]:59282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9fx-0006ll-U4
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RH-0002oP-Og
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:49 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:34550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RF-0004yX-Kx
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:47 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 3so9116298pga.1
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ccV/jKKm3KL7GmROMpxXjxD/bkKBeUCSA+/tqyLCpI8=;
 b=KmGLikRmXmQ8Jm1bS7QSFADrmzLH0dhx/sTlCxgign2lBTnzFmTFPu4L5xaP6sWSTm
 0Yz28CG4vUQr/fP1LranX3Lzy+ZJnpi1lYTCIe/6qU/00pzR2f0adG6E+0ZlvPVE5mAO
 cMjuwWIsaft6kjmRR7NEhnD7spr4lR8bto7r2qW8aN53FuH++AtFC8MFYYXEH9nURWDk
 BxMtUp4C4T5HgFbojeWL6J5rQLMlP2yMxwTgEGrZsDFb1RA0zEdE7EhvZpzIHiS4fcAv
 N7Uvn40otCj0YbOCssGdrsd4sH6gO4PtrG/U9hUkqtkhyhsABww8Dg7XdhqqOyCqhDnX
 C+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ccV/jKKm3KL7GmROMpxXjxD/bkKBeUCSA+/tqyLCpI8=;
 b=GYKog9Yto6FRRgx8k0pjiFQEhT3sFjFDUHqnrTQ9Qxp1u4WGOkwvl+jzAGFvBdVIzi
 bdahoaxAnvMgabUy/qm95vAJLjNSTVkBEb0AmgaOSPlMmdYYYuc8+c7gcREJL8MO64iS
 IKqi64O9E5IjTau+x327u7Esio9wxFFQ5+JAdqvynRiD8U1sJ+3R7/DBopEO/HvFopcv
 6UyaSWZN6Da1gaq5hdMaOuLq/uoh6bmXXsdIi/jWdFqbqmUB/7r407s3YDFWmLonoSZa
 VFK1sdJUtiOX8YxlkXqtpJmHBF4+FeB490ERFArQiat/DxqL04gEsSIJnlXxMtaAnV8T
 0QKw==
X-Gm-Message-State: ACrzQf3SeiG9dBZ92ChhEfCE7RZCTbdexgbh8fHwy0Jhlz4p3Ce7gKeQ
 zQg4MQje5TIqQe6g6zNA2GtRqGbneXM=
X-Google-Smtp-Source: AMsMyM4PM62FEe57vDgkazJnBBGRc3hrfWLNFCUHHSVrBr9rCWmgQG2bR/JmuxDonpgPFQ2Nl6Ycjg==
X-Received: by 2002:a05:6a02:28b:b0:439:19d6:fad5 with SMTP id
 bk11-20020a056a02028b00b0043919d6fad5mr24827883pgb.591.1664276863651; 
 Tue, 27 Sep 2022 04:07:43 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH v4 23/54] tests/unit: test-qga: Avoid using hardcoded /tmp
Date: Tue, 27 Sep 2022 19:06:01 +0800
Message-Id: <20220927110632.1973965-24-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52e.google.com
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v3)

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


