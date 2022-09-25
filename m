Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AAA5E9309
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:22:28 +0200 (CEST)
Received: from localhost ([::1]:35016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQeQ-0003jX-Qg
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrU-0002wB-CV
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:57 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrR-0006Oc-Bo
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:51 -0400
Received: by mail-pl1-x62f.google.com with SMTP id b21so3924206plz.7
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=gkhXgeI8VVKYUE8bIuW2cVwuIZ0uivwbyCoudHIFJ54=;
 b=o9wcy89bT6sQnxN7657PUcydunYmuA8Gjf/8K2fU6+IZvxnq8GlfuBZdpylQAHkYQm
 BlBH9AI1JoQSyXBnE+KyodT76DVNiIgnLiZlBzI+hTTU2uzKkvJyzqi5oAYzPk/a2TFp
 sKHpApeKE7B5hy2ZQXpiEEN8sssXzDWfAU3OR75HakcGswr0SDBzNhFQ8c0HMTetwAQ3
 OiDBKaSd15kx10l27zy4GVxhSM9Dx+TEGUTSfRemZrQfgohygoCw8ddIE7WIab9h4e1J
 jX4xhXxr+M0HkgrNBtG1PVxBBK2i81uCNgnCpiQrRUjH6f9rfHUHGYCkrNPoX9LHgTg1
 F0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gkhXgeI8VVKYUE8bIuW2cVwuIZ0uivwbyCoudHIFJ54=;
 b=hLjyDpEojmHtfKNjEGlrELjpxkazmyc49hQ+/vLr2W01dfShO+uqrleE3/jdv5mTr7
 +wscQViExrUZT5UFn3eYnu7jTcD9ZBaHRkpLO5/4zyfSKl/GUA1mgL2yTEMJ5NPeQZRZ
 pegquklw75IpNK22gFx2XLl2efzV7YW24PGkZ48c5fyrwxQ+x8jBiyRSiAzRmloEUrHA
 sW6rva+6QOeVah4d5v5RH3i/+oicLvAB+8wMssFAKbvHY+/ffPHhWsWinul7ESRXbez4
 Gdfts6PstoEdrEAbCRndB+uXV4oW5e+Fz0X19zoW/vhYXX8c73yUDABlclzS7wYUh2xz
 6pGQ==
X-Gm-Message-State: ACrzQf1KdRno9Z56QQAXltC9gljw6dj9g3ss7Hbjg7rRuhcbnO9rhpqW
 FNPaw/QVHr7x376JB2v56FCJkiXl2lk=
X-Google-Smtp-Source: AMsMyM72WZXM9hUfHWkF5Nag0pQ76uxeBhYeMBzN2n1ApsYXAYhPzixFqxn91yA8f7zbi0+aSwipvA==
X-Received: by 2002:a17:90b:4b88:b0:202:e381:e643 with SMTP id
 lr8-20020a17090b4b8800b00202e381e643mr30601410pjb.148.1664105507857; 
 Sun, 25 Sep 2022 04:31:47 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:47 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v3 26/54] fsdev/virtfs-proxy-helper: Use g_mkdir()
Date: Sun, 25 Sep 2022 19:30:04 +0800
Message-Id: <20220925113032.1949844-27-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62f.google.com
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

Use g_mkdir() to create a directory on all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---

(no changes since v2)

Changes in v2:
- Change to use g_mkdir()

 fsdev/virtfs-proxy-helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index 2dde27922f..5cafcd7703 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include <glib/gstdio.h>
 #include <sys/resource.h>
 #include <getopt.h>
 #include <syslog.h>
@@ -639,7 +640,7 @@ static int do_create_others(int type, struct iovec *iovec)
         if (retval < 0) {
             goto err_out;
         }
-        retval = mkdir(path.data, mode);
+        retval = g_mkdir(path.data, mode);
         break;
     case T_SYMLINK:
         retval = proxy_unmarshal(iovec, offset, "ss", &oldpath, &path);
-- 
2.34.1


