Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AFE610156
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:15:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7n7-0002Uy-At; Thu, 27 Oct 2022 14:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kK-0001Oy-Ep
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:53 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kH-0003MV-Rr
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:52 -0400
Received: by mail-wr1-x431.google.com with SMTP id k8so3710062wrh.1
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MAiwImJdpLFkde/JPFpGgiQK7JvaUA3H/HJ/OAPQFdQ=;
 b=N4VG243lGGmBZy2+dYnysvDiOHY5bo0eHybyu3xZP3Y5w720Uki5JTsNxzuiXCbTDX
 KcIX8RpLb9KwDxd6ed0KD5YxbSW0pwFLJlKdgcs2fuAeAGsJmTKwviw69FFM1zad5vq6
 lq2aGz9X5LU8VgNdF3nLhNtJw22Y4l0xyZbVj7EZc34kTquvh42rSC9kTcLQBvy7pWu/
 xgAd+kBnbgu2gRm+wZrURi9qnveURIyORaBAN8zcnlSQ6K5Bek5L67V/Y69gnMNv27zD
 8+qA29Z0wC1IFIOff5iY0QuaAc5UeM6SG27Q0nAjyQ/sbAz8Jdo2DV1FoWpkHVRQOJ9T
 1Z+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MAiwImJdpLFkde/JPFpGgiQK7JvaUA3H/HJ/OAPQFdQ=;
 b=zb00ZpPBjousDXPD9JD30LAVeytNFj1SX823NxmPqEFT+6d4A7zUsACJyXR+/ArrSf
 Nm5Y5IeU2oJcM5RT33VW8Z+NYQkXfudnbkkJUt8VlL3yI0boSiCheo8nCMfbgarrynhu
 PiwAOWkPlazwU8m1rbrGpGg6g99eWq5GiBY0as7MwgD1A5OJg8OV3/7OIoRblFMS493V
 6GC3n2EidCNU8Bk+SOLjl9WRAaI6LoicwLYTy9+jJB8Uj2vyXH9Qx227pi+OQ+y8//UJ
 2V+ngyEyxAL+CALwJasKEfwAidVRj49iIHN8U61D3C0WDf3hrol2U1QinpZgcQzRee6y
 8prA==
X-Gm-Message-State: ACrzQf3NBapabudG8tcVqr6Qwae+zTkRlre3RjW/7ifXDf0/+9odwJHy
 ShgJHWvtiupoGm0scn5FHBK5Wg==
X-Google-Smtp-Source: AMsMyM4GD1BmPqhGSv3mi5HZLNZCU6cJYGDo0sOheRQ7OnpV1CJeBBjvRjEszZ8L+KYMlo9QH/0RWQ==
X-Received: by 2002:a5d:564c:0:b0:236:6089:cc50 with SMTP id
 j12-20020a5d564c000000b002366089cc50mr18480773wrw.520.1666895808414; 
 Thu, 27 Oct 2022 11:36:48 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a05600c1c0300b003b4ff30e566sm10658299wms.3.2022.10.27.11.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:36:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A63B31FFC5;
 Thu, 27 Oct 2022 19:36:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Bin Meng <bin.meng@windriver.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH  v4 14/30] hw/usb: dev-mtp: Use g_mkdir()
Date: Thu, 27 Oct 2022 19:36:20 +0100
Message-Id: <20221027183637.2772968-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

Use g_mkdir() to create a directory on all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221006151927.2079583-8-bmeng.cn@gmail.com>
---
 hw/usb/dev-mtp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 5831395cef..1cac1cd435 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -14,7 +14,7 @@
 #include "qemu/error-report.h"
 #include <wchar.h>
 #include <dirent.h>
-
+#include <glib/gstdio.h>
 #include <sys/statvfs.h>
 
 
@@ -1622,7 +1622,7 @@ static void usb_mtp_write_data(MTPState *s, uint32_t handle)
         if (s->dataset.filename) {
             path = g_strdup_printf("%s/%s", parent->path, s->dataset.filename);
             if (s->dataset.format == FMT_ASSOCIATION) {
-                ret = mkdir(path, mask);
+                ret = g_mkdir(path, mask);
                 if (!ret) {
                     usb_mtp_queue_result(s, RES_OK, d->trans, 3,
                                          QEMU_STORAGE_ID,
-- 
2.34.1


