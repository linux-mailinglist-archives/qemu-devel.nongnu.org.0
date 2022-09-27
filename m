Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A355EC241
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:17:06 +0200 (CEST)
Received: from localhost ([::1]:46830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9WK-0006yD-R8
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RQ-0002qZ-UX
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:00 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RO-0004xW-Cn
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:55 -0400
Received: by mail-pf1-x433.google.com with SMTP id l65so9352340pfl.8
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=gBbYIR+cYUeZZvc5gKxNpLwekX68RaD7k9jxuyBt2nM=;
 b=ZH2vmD1Wf5G3PqqtZJ2ie7tTclMP8rHBkHWGAV1ZIlIpzobWKcktUQAH0F6EXI4asP
 FKplnaqBFk3Q2ZN6pkcTDmUpVcjnY3B4AO6TAFhIc5EY32ThRZmDxja9laZeJ2l2Ocst
 A3DRK68DqBkFx0SWrBICHlcuusTIDS6J+mUJrR7W7WeWJVehC92GeJ51IZI4fmqRHpzW
 cuKbv+EoCzQ6/mQtFnHKVFeSTI6Y/+IbYxWjLRuRqIRwfrF1xIcwREe+BMu66HjlNUrb
 OXZJQeyYd9nqsNoF/BCNuyR9S3t8kA30HMBNSwtS9Lt8l1TXi/vYSPU+OtTDbwCsGwzl
 7u6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gBbYIR+cYUeZZvc5gKxNpLwekX68RaD7k9jxuyBt2nM=;
 b=msfvwBd+eXA/2P1oMqJUiLtIafetdkrPVkA3p5G4ykXWkkBiedgbEzak8B8GUq69rr
 YV4MIS9FsI8wiJVJ4tKeQb1cuGJmwEBugITDmDkDcboWa3i/4j3heqV8cVkx/vz8gE9g
 OOUBCSSRRdAPtXreGJllQ5C8FjyUtenQjtnI0N1lrvAfmjpTLStKBVUpaQuwJMGlVlSD
 OqHvln0tAFziHuXwJx809tWhX+6C8bBaknuBSlbFnKxjYK4rP9aW39XWjO/1rPRkA6DA
 sc9Nj/0lMa74HATFx1WjDx0y8pumYcxGIgUiLvdGMBkVkLPghwI1CAQ6tZp6U3kCoewg
 YQkg==
X-Gm-Message-State: ACrzQf0MvXzlHluuh5DFcs32iMExOlHr2smKUzQiI+U1A2/apgsJ3noy
 p2N8zC0Od9eJYByXd38dKqjHOZk2njc=
X-Google-Smtp-Source: AMsMyM7ootSD71GeBb73+8dniz07/PXoyp5mjwIXqXPFnCBD01r9EH6VF2eDPeoAPsLOdv/XsK7OGw==
X-Received: by 2002:a05:6a00:1d82:b0:541:1ea2:e7e with SMTP id
 z2-20020a056a001d8200b005411ea20e7emr28909637pfw.71.1664276873457; 
 Tue, 27 Sep 2022 04:07:53 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:53 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v4 27/54] hw/usb: dev-mtp: Use g_mkdir()
Date: Tue, 27 Sep 2022 19:06:05 +0800
Message-Id: <20220927110632.1973965-28-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
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

Use g_mkdir() to create a directory on all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---

(no changes since v2)

Changes in v2:
- Change to use g_mkdir()

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


