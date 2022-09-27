Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B335EC25B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:18:53 +0200 (CEST)
Received: from localhost ([::1]:45460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9Y4-00007G-79
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Qr-0002ky-Qv
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:40 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Ql-0004tL-2B
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:18 -0400
Received: by mail-pg1-x52d.google.com with SMTP id s206so9107218pgs.3
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=VeKRFtfMbwkJV5+/CUHC76GDYzCTkisYHlSIHzZHJIo=;
 b=Q1l+kHWOSGmg8aBAT1XHjB5ku4+aVRgyZYfrGjEfHxIEV1QIv526IA9a/AUNqJtMYb
 KDmEhd3ee7fa5NHvciO7PrfllZ6m4XZ2Ts7oQDBcqyH/gjXHi0T2Fe5H3xRUa0zcc8bA
 lOPOYOYzvLJViUNW9ObGLaLBFPK/YNY3QcRE6334c9MOdb5dRyXePDB6UegU8KpWqBaZ
 phK5KAgFa9rI4AksyPXzIEgSNSoRXVjjaTENOg5vpNID3nWishaoekWQSGqxVyku+DkQ
 vQV1c1q7MCLpsLfMC56aROZiGrfWJTdpXg0sXkDHqwFmoivi4dXuY5A2dYgJABOXz8Qy
 5O9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VeKRFtfMbwkJV5+/CUHC76GDYzCTkisYHlSIHzZHJIo=;
 b=BT/eZrkl+XvlRR+0UHEjowXWAgiMbBKYcCi+Py0xdUwtJtMfh0gP7JTj0m1eZ3Rir2
 eZIHwNhwJf619hK1hzqYjF3tPsgMo8slLDj++VTfpPoCQvND9lb9NcXY7USysSMieAUP
 PKGThzxIx1KGJstNZ9Fx8Ri5u2YaVC3/E4gnwJOsdzyn4UUxguKYgrP+fzWG3ykpIkbr
 Pieng2F/liK2mkhrc+6vcVp6XPvH6I8yQeqDRPKXp4QcMmXKBaYxpVf/isY280/aiNSA
 yiXkVl1mwDGZTgTfBprzaR5r2zcxOoW0k5lgEN9eFRc3o0qIs93OAiniueh8DAiemYTK
 hVDQ==
X-Gm-Message-State: ACrzQf1zInyh2dYLdVoFZxO1GloQGVVplT5TIAfAx6U68HGmt4FDa7oI
 fMnskiTWISK3oRIIZISpfkjqgQIbMCU=
X-Google-Smtp-Source: AMsMyM4ukLC1A3BD40RmwTlimWF0LfKTTwpG0FSwKSCec+veAVae3X1iuruSc3SGSdnBCZmH7+IW3Q==
X-Received: by 2002:a05:6a00:cd6:b0:546:d03:3dd7 with SMTP id
 b22-20020a056a000cd600b005460d033dd7mr28652071pfv.19.1664276833664; 
 Tue, 27 Sep 2022 04:07:13 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:13 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v4 11/54] tests/qtest: virtio_blk_fuzz: Avoid using hardcoded
 /tmp
Date: Tue, 27 Sep 2022 19:05:49 +0800
Message-Id: <20220927110632.1973965-12-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52d.google.com
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v3)

Changes in v3:
- Split to a separate patch

 tests/qtest/fuzz/virtio_blk_fuzz.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/fuzz/virtio_blk_fuzz.c b/tests/qtest/fuzz/virtio_blk_fuzz.c
index 236d078cc8..a9fb9ecf6c 100644
--- a/tests/qtest/fuzz/virtio_blk_fuzz.c
+++ b/tests/qtest/fuzz/virtio_blk_fuzz.c
@@ -181,10 +181,10 @@ static void drive_destroy(void *path)
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


