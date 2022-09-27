Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBEB5EC2A7
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:28:28 +0200 (CEST)
Received: from localhost ([::1]:34942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9hL-0008Is-5s
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RE-0002nx-F6
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:49 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8R8-0004xW-FL
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:40 -0400
Received: by mail-pf1-x433.google.com with SMTP id l65so9351812pfl.8
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=przXEUDiAX5x8qS3XNpIZJNc/LF/yJyXGJFV6SOntqw=;
 b=mGkMCRJU4PY2Hmpw7BaNmMzh1W1bvUDhl+22Iuc7jKsC8OJkgvRkiDDCSg+SK5wmvt
 ejRcCrYAvd6llRXdB0+PlLHuD1gEKrYsT1r562zg4TKbvXwiM52t+0x0kM8H1Wcp0uzJ
 3XI4T9d8GEtHrR8jIp4SXDU1BZT9SKA60QVHFOy+siLoqld+Io0duOuGyf7byYJStaX3
 4UcyKOHUotGjtYE/wkWyZ4CWDGdwbnk3c1LXgfZ7EVcnVnR1KSnTaJX06NR6sG3YNCTX
 7/+3qGw07mmuMF8MlO7ajjwuiSfKyg9hNa9L/kPrgoAgHK2m0+eNw/EzqPGPKFd2rfmr
 7I6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=przXEUDiAX5x8qS3XNpIZJNc/LF/yJyXGJFV6SOntqw=;
 b=WtezsTb4ZbJgP7+VFlptUtWnoEYsZkfCC1s37L572vKxS7BeoSuCXITJDqy8B3ozPK
 /8o0Kwwysr77HVdtmF6CqNMQD45HY/X1bzujDMjVzqzKfOiy4fdx0nTnF3gnZGaoPENR
 8PuecXqg4AnGR5wM8dEyJGvb/ajNO2yOOkSYQaDAxjPEw0e3MOJrU+7l9uzRj3KSHoG8
 RYumowrUteAg3PT7Pdr2a37mmVip55k/3FII8/BUNpROrm9Ju58N8C3cIW+v4nO4I0G2
 +J21wDLY9V/0CS/kDPThcnlpvJps5fe0Jrjusaa0HNp9UFj+Sfpms0YHd3+GqV+bidcL
 W+Hg==
X-Gm-Message-State: ACrzQf1JKN3Oe0ZzfkJwMa3iiLDUnUupZKLyED/U9QVN+lh1mu7YvLAX
 mqX/6eXqCqnccbvrOuiK5lEsd7JUSIw=
X-Google-Smtp-Source: AMsMyM7gBHjJKlErDp41PKRa66GP0E8buhVVHzMVVOCOxPvg+YttIiielQ+NOoxNIFybj2edQcaxPA==
X-Received: by 2002:a63:982:0:b0:43b:e67b:988c with SMTP id
 124-20020a630982000000b0043be67b988cmr24408566pgj.35.1664276857046; 
 Tue, 27 Sep 2022 04:07:37 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:36 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Fam Zheng <fam@euphon.net>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 20/54] tests/qtest: virtio-scsi-test: Avoid using hardcoded
 /tmp
Date: Tue, 27 Sep 2022 19:05:58 +0800
Message-Id: <20220927110632.1973965-21-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x433.google.com
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
- Ensure g_autofree variable is initialized

 tests/qtest/virtio-scsi-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/virtio-scsi-test.c b/tests/qtest/virtio-scsi-test.c
index 8ceb12aacd..ceaa7f2415 100644
--- a/tests/qtest/virtio-scsi-test.c
+++ b/tests/qtest/virtio-scsi-test.c
@@ -268,7 +268,7 @@ static void test_iothread_attach_node(void *obj, void *data,
     QVirtioSCSIPCI *scsi_pci = obj;
     QVirtioSCSI *scsi = &scsi_pci->scsi;
     QVirtioSCSIQueues *vs;
-    char tmp_path[] = "/tmp/qtest.XXXXXX";
+    g_autofree char *tmp_path = NULL;
     int fd;
     int ret;
 
@@ -282,7 +282,7 @@ static void test_iothread_attach_node(void *obj, void *data,
     vs = qvirtio_scsi_init(scsi->vdev);
 
     /* Create a temporary qcow2 overlay*/
-    fd = mkstemp(tmp_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
     g_assert(fd >= 0);
     close(fd);
 
-- 
2.34.1


