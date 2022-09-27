Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FBC5EC2AF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:30:05 +0200 (CEST)
Received: from localhost ([::1]:57676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9iu-0004J4-Mk
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RF-0002o0-E1; Tue, 27 Sep 2022 07:07:49 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:45896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8R6-0004xF-S9; Tue, 27 Sep 2022 07:07:40 -0400
Received: by mail-pg1-x535.google.com with SMTP id r62so5261456pgr.12;
 Tue, 27 Sep 2022 04:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=XHDxWl0yKYCxicgHp9QKyyYngaBXpOqvJcPgeDq+rGo=;
 b=dTghabO161ejNoITJDu0eYJVX4jRVEqP5MM+LlI6NTUD0U319y/i4LLjFrLvksiHC5
 Qqtd2liaZS+QnxfAQlHwtENr2bXSD2n+vaLYvOuBYEJ9trBMUDdVHG/r1VpdktYQhnwb
 LzOBbnitHsnPZtDhj06iUHVH3oTiK8tPtyeWa5ibp0TNlfVFodfq+VaBNznuXkJLD//7
 9AqZzZxNOROF4ypnkNTvjfJwFXGxxUOZ4nUrzNuFso5MPwkv3UjfMBswdCMoJI2jjiLr
 UEU6YSgFxJ8pRlF/YxQqaehzvA4N1wXID83tQ8VNAONnx8gaanhkobU8Dgu4qEQ6wb+v
 Z4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XHDxWl0yKYCxicgHp9QKyyYngaBXpOqvJcPgeDq+rGo=;
 b=6Iba0pKMy+nzNc2wYn54CfQRUEiKVesO86VnVPNjgyy9emJVYWYs4mo7tZoVm8BpSN
 dk3ev8+klnHetOvlfpQ8icfR4EzNUWvBP/e2uuzc8T68fKkdcbpa1tQI7Vf4J/Sa5AI8
 iRLz0bynpZl0zQNKShzCVth70AsDAUbz0/71vPbNJ9AvpRjll6yKjaSwsSCfbyrOdj7n
 keaiSiN1pPWFpnHCT085SnGkuWNvTKBjDzLyIU5YnH+igvQWOlpC/npWfKr0ANAvV96w
 bK2E4LMlvj0WfCX5+6YhsSwXzgh3oJgMWdN5DIjWt7AEdCiTtZYxS4f6Ff7nB8Mmp4Od
 o7rQ==
X-Gm-Message-State: ACrzQf0KLqVQZ/G812Pnld0IyHINGUo6IAEERMpeuS4xtvXrMEkuOOid
 +y/PRmazX53LTXmDSb6UIP9WlcFgfAg=
X-Google-Smtp-Source: AMsMyM7K4Vy0QfPzypkgervWWh/t8VHVFkyzUZfNMT0O5f2Rl0BnXCZCwRbmmzD9QdcgrezrtR5lrQ==
X-Received: by 2002:a63:cc4a:0:b0:439:1c48:2fed with SMTP id
 q10-20020a63cc4a000000b004391c482fedmr24724465pgi.618.1664276854411; 
 Tue, 27 Sep 2022 04:07:34 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:34 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH v4 19/54] tests/qtest: virtio-blk-test: Avoid using hardcoded
 /tmp
Date: Tue, 27 Sep 2022 19:05:57 +0800
Message-Id: <20220927110632.1973965-20-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v3)

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


