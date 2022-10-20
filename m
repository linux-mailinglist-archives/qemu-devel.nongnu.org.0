Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4E16060FF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:08:17 +0200 (CEST)
Received: from localhost ([::1]:50658 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVHT-0007ix-Te
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:08:16 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV4e-0004u2-Rl
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU6B-0002f1-Ke
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:37 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:33678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU64-0000nz-JD
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:31 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 n16-20020a05600c4f9000b003c17bf8ddecso2366030wmq.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fCN3R4afVVo4Z95z0sef0bZEZD+cnjOSeEDcY2D2eDo=;
 b=kUTTVhWRgyWtzDk6P3qiFmK7pYBb3vUlPkiJZ9nPoUjGlxaUqz6CHHwNZn7VRXoIC6
 qWJ7eE3gjv4uhqn0mQKFiylz1CbI4pKdmKDtCz3x4mGxIPk8n1EmwZXSHSPOF8HmA4FU
 63Tc0U0dSsm/YL4FHs9QjAgVpLq1Dx9Pm8vFYRzR0UBCl3TK5a/fwoXJaa8J3lg//u7B
 fGLVCUOi74gJCJ66SE7zdmIMfezlhKQV9v9OYgEj+CeIgy//sOIGiv7J7j6P2dfLOu1q
 fwdXIrFWJoOtFBu1nUboOXZZfB81bNXLJD/eyf8edw+XbtKqn/vyNc1jn7IP5YN4G7N0
 sMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fCN3R4afVVo4Z95z0sef0bZEZD+cnjOSeEDcY2D2eDo=;
 b=qVX5jC1bObjVD/yiQCNXv4xjRjZfI15TwkcRnPRalafWbon77csWdwgEj+OKXYH4kX
 JOAdo0KgLoqwSeWiAbNXqayS8XtfeUxf0PNKCZ+p4CJ7gEvi6pQDBWMkfboTuKI579vC
 TTaJL1p8Gjcs4dm6A1p5at3tXRjRcHeLq9JlZn9L723zo5kSCYcZgxsyj2OwrjqoL6XM
 6wXlxkBzj5XdGr9G9fwK2TTs8W2mSFSVHw3MyLd3v6HFafu1CWAGSHQKnFyTjQ3J/ePB
 mlIA051jheNfKBnA9D/W20KQYk4l7EchmpxHHmdmyxvyPTmRjCRgJ47SJPxh3pw/AXhY
 7yRg==
X-Gm-Message-State: ACrzQf3wU++l05e3Pm4Piz7j1XI6++lqXmunshRGHKFeYQEb2RglYUn4
 pnwzTQEsUHRyEYgLRa4zYIYjTQ==
X-Google-Smtp-Source: AMsMyM6kE/obpkl/g98jMQZUjoi+yowizlVfpg6YpPeqE5p0+isE2BtCGhSR6Y33kIn8W3XmcxBGgA==
X-Received: by 2002:a05:600c:4e52:b0:3b4:a828:1d84 with SMTP id
 e18-20020a05600c4e5200b003b4a8281d84mr28662683wmq.143.1666266742251; 
 Thu, 20 Oct 2022 04:52:22 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056000129000b0022dc6e76bbdsm16213241wrx.46.2022.10.20.04.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:52:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5C3591FFC5;
 Thu, 20 Oct 2022 12:52:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Bin Meng <bin.meng@windriver.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 14/26] hw/usb: dev-mtp: Use g_mkdir()
Date: Thu, 20 Oct 2022 12:51:57 +0100
Message-Id: <20221020115209.1761864-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Use g_mkdir() to create a directory on all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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


