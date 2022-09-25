Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40B25E92E6
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:02:10 +0200 (CEST)
Received: from localhost ([::1]:50066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQKn-0005bE-Tl
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrO-0002ur-JR
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:50 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:52033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrN-0006O1-3D
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:46 -0400
Received: by mail-pj1-x102a.google.com with SMTP id rt12so3963500pjb.1
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=1YLw5d0z7vrk2yTXPwCxIPgCJCukpGZvEFJhnHR42Jk=;
 b=kG4FEvn7Mnpo8pO9WVbI9tYYETb4riRHgLSdi6UUVvlcN6W3Y6IgXTPVAb2VXQrVLF
 I1dA3S3MBQTBKQBdcGiy3Hbu0+CkywDYC7jr1OcXXbzVeg5u9EUvQBV5FhdhsUA/+hzt
 I6tVQS1JEGaxFWVfTj9NG/TM1A7OP4PPMpHHMxgJrKTNxm3KdT4RRbXhhBAPsZ2twW0Y
 Zsprrkv1hR0TiP2Y4eGGBa7Qg0QCE21m+AtmivWt3RnozCgHpVoAX6EfQJFeFV/nruVM
 185FXfNJRKmEwtWsX1Q/01XrD9X8tFbxXOQUeyjj4GFqy6unj0uWKA453qPXy/PB78bm
 JK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1YLw5d0z7vrk2yTXPwCxIPgCJCukpGZvEFJhnHR42Jk=;
 b=GVlU4gJN/2qo0NdX6Vpj2GRmNWiCeFMGLvfWyjwAioBQULbF7vLLp4DmArwnz5Jv/J
 VX0TTPOMjkXMbrvS4UFt4wCAyOuyr2btcP2ti1HtIAY+LUlK0DmM/dRY5s5DN+aNJjw+
 cN8qCnOpX0+1njlI4NcLkzf8OcV4gnED/lXaPye1BrWii/ChGCcfG5i3udr56n3sxzUi
 STbazJyojnynmHEvtcQ3RGkFwyoihKtRlzQ8uBoIWRdlY7kYvq37giCUTzT2MPbFK3l0
 V+M0RQXnraZ7iIR9ms0VmvDWqHRrsaXvWa4zlKchFAtTINiorBKHUfWuoiHQ5uRm38v6
 L0Vw==
X-Gm-Message-State: ACrzQf3v8FtZZoC+aIGi8lwp0Ywyn3BQi8TKNzdL71+OfxauZznD3bJm
 HSe9Uapj5kUXTa24HnklJxyKuZvKytA=
X-Google-Smtp-Source: AMsMyM4DTZEQHKDkQtneJ4tKwnFxY33CIZd8Xd132Kbh18Eo/ltb660VIk8l8k11KvpyFSdaFhEw4g==
X-Received: by 2002:a17:902:efd2:b0:176:b888:2481 with SMTP id
 ja18-20020a170902efd200b00176b8882481mr16768109plb.144.1664105503371; 
 Sun, 25 Sep 2022 04:31:43 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 24/54] tests: vhost-user-bridge: Avoid using hardcoded /tmp
Date: Sun, 25 Sep 2022 19:30:02 +0800
Message-Id: <20220925113032.1949844-25-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102a.google.com
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

 tests/vhost-user-bridge.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
index 9b1dab2f28..fecdf915e7 100644
--- a/tests/vhost-user-bridge.c
+++ b/tests/vhost-user-bridge.c
@@ -631,7 +631,6 @@ static void *notifier_thread(void *arg)
 static void
 vubr_host_notifier_setup(VubrDev *dev)
 {
-    char template[] = "/tmp/vubr-XXXXXX";
     pthread_t thread;
     size_t length;
     void *addr;
@@ -639,7 +638,7 @@ vubr_host_notifier_setup(VubrDev *dev)
 
     length = qemu_real_host_page_size() * VHOST_USER_BRIDGE_MAX_QUEUES;
 
-    fd = mkstemp(template);
+    fd = g_file_open_tmp("vubr-XXXXXX", NULL, NULL);
     if (fd < 0) {
         vubr_die("mkstemp()");
     }
-- 
2.34.1


