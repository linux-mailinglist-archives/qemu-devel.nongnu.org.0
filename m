Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4A05F6A6E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:19:55 +0200 (CEST)
Received: from localhost ([::1]:52898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogSfC-0003q2-GB
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXb-0003JC-J3
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:03 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXZ-0004aE-VP
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:03 -0400
Received: by mail-pl1-x631.google.com with SMTP id x6so1954957pll.11
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gkhXgeI8VVKYUE8bIuW2cVwuIZ0uivwbyCoudHIFJ54=;
 b=VbRlBhMB5HBvUlMnhYO8Ym/YuSbpF9W1XM5y0faNHJ4BVEjFp+KBZ4L1yHEAELw5cs
 VnBxM18+XJ5LZ8US1WE9bP/zWs0rtR7JXNFC14Emdngsb4eu9AvwBtTeV/2FbusRSM//
 W93LMry6UFLbWnsdSKt/ZNBnD6g4HMBl5EyeWS0m7OmqAefxi0fnj6yCpL2IIrCPvEPu
 sV2w141xtCac1MNwlAr9wHFPoKUWBJ6Us+hwPVCo42OmKyvk7jQbyI6xZWwweEKvYj1G
 v0BA2ThRNKwWkBKMku2YvgwLGsNoZL7ekloO162csveIv4/RPV9jdGGgT2lVqKObuVax
 oFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gkhXgeI8VVKYUE8bIuW2cVwuIZ0uivwbyCoudHIFJ54=;
 b=mvwbU+0uhJ6mvNdwA3jrzTrvPFn97KzLQgS/PO/NFyE0uSa8sKtK1eq2Ne8rzqxjg5
 hMQxtHFvNAWLLzBf3x/koZ/W56InCEBfG7uLUye9sVaFe2ZVZq27j9/K+/k1jUciHRp9
 0LOu4mm9Icb05rqcyRmRsp2iN53SOQblR4Ov4bxHU7pLihZ4dOq8bqqU34iJ2maZsKWX
 UMDlUK4/zm0a+2hpclv8nRt++64WYmE4kOsqtlMd0421MpXyJI5In/++4wNwOKLNepjF
 aFdwKjnFfZiWajsTT5WZuKdEt48LYExnFJaEvY23gt0eRK5eCVFrQzX3iF68TNYn8nv0
 oUSQ==
X-Gm-Message-State: ACrzQf3shi2X2YYOKQEXQbaMvWaCMwWEhyDJ5bZxEt4DaYeBx8ADWv5F
 5caSruAslueKPgD1NE5CdYqwPYkmW/s=
X-Google-Smtp-Source: AMsMyM5gsAoFAh9L0VkiTKJ3cSx8Leuc0bPM5bJddMQpYKhLRHTHD1XQ6grIR5CViDxzoTiyiHLXUQ==
X-Received: by 2002:a17:90b:4f87:b0:20b:12e3:32ae with SMTP id
 qe7-20020a17090b4f8700b0020b12e332aemr205892pjb.236.1665069120405; 
 Thu, 06 Oct 2022 08:12:00 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62148d000000b00540c8ed61ddsm8589067pfu.150.2022.10.06.08.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:11:59 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 06/18] fsdev/virtfs-proxy-helper: Use g_mkdir()
Date: Thu,  6 Oct 2022 23:11:23 +0800
Message-Id: <20221006151135.2078908-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151135.2078908-1-bmeng.cn@gmail.com>
References: <20221006151135.2078908-1-bmeng.cn@gmail.com>
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


