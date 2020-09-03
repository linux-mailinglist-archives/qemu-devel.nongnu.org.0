Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650FC25CBEE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 23:13:28 +0200 (CEST)
Received: from localhost ([::1]:51796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDwXu-0005Tk-1V
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 17:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1kDwKt-0003BI-17; Thu, 03 Sep 2020 16:59:59 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:42780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1kDwKr-0007LJ-Gy; Thu, 03 Sep 2020 16:59:58 -0400
Received: by mail-oi1-x242.google.com with SMTP id x14so4501047oic.9;
 Thu, 03 Sep 2020 13:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ScYD/f+N22CSsPzzfqJN1h5r0Ae2wuAguC3FgHuYGU4=;
 b=H81LRNwxF5ZdzSyNHD0JMolmorhhNMY/zX25y3OJmC0N+hjvvMYg66QD6qEZMBDiI4
 GYoRd53qNsx8jpsAbksd3XBS1RRC9LDVMdia4h20vFbjMjIVOIwxTbxWGDChO/i4ihmk
 tAXz54E0kAI2dzJ1xxDEG2uYZERivDA56O37C2pO6T2ydemeVossktqPPvuREFANRTnN
 2SBBAJKonHwjOfQqvrqqfcI0bfU9NqkTM5yNFVIhDZ/aWgyHouBTXYa35GA2u7+xZLlY
 Xl956Zk5fWcXl5iD3IfjrDRR8cNPMee5nxv1jiaMwXaGq6BrmvP3EHspIbyyIishEU3j
 H6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ScYD/f+N22CSsPzzfqJN1h5r0Ae2wuAguC3FgHuYGU4=;
 b=cnvY9Vmw7w9MJWugGnn6i5KM0m/qH4FpmvoJoYdbCRQuaFP0IqIcsyYqTH1LO8EE4m
 krMtPSr8T/8Nz4eZf8lG+EA0kNrxiz/JWVGSPfiP7bs4Kw8hOYFLXFmjbVVds/E18wyq
 YhOmz5hF/uPqNBkZTXdUQTIP6OKNzjgIb6WwDMoK7RZHV8oDad0oIboY9FiZSE1YCYjL
 JbQfPC/CMLxHx4l8idjOuBGdPqkI0rQrZr2RUvI5pEyWE/atYuRE02rqDWkYMIkvxLQK
 DlFzrkd5AKNmxXimSqfDob1A8xhIIhiwv/zF2WulLHnupimTAKkCehSwIwvEeDsg11to
 K3+A==
X-Gm-Message-State: AOAM530XnCPBvz6nBlU6QIXZ4nekvJ8c6/ZvGRmn9QEfy7YU/0W8PARA
 B/4UginHZ/KgFErVfN34Mv7W1RJFt4o=
X-Google-Smtp-Source: ABdhPJzFOdVXcJHSy7wdAicgs4Y8QMW3EJELJIgXDervdAgWySE37ms9/4LeSCNFVc2SDLC4woIM0w==
X-Received: by 2002:aca:fd95:: with SMTP id b143mr3224282oii.68.1599166795702; 
 Thu, 03 Sep 2020 13:59:55 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id n186sm831477oob.11.2020.09.03.13.59.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Sep 2020 13:59:55 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/77] 9pfs: include linux/limits.h for XATTR_SIZE_MAX
Date: Thu,  3 Sep 2020 15:58:30 -0500
Message-Id: <20200903205935.27832-13-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200903205935.27832-1-mdroth@linux.vnet.ibm.com>
References: <20200903205935.27832-1-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=flukshun@gmail.com; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Dan Robertson <dan@dlrobertson.com>, qemu-stable@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dan Robertson <dan@dlrobertson.com>

linux/limits.h should be included for the XATTR_SIZE_MAX definition used
by v9fs_xattrcreate.

Fixes: 3b79ef2cf488 ("9pfs: limit xattr size in xattrcreate")
Signed-off-by: Dan Robertson <dan@dlrobertson.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <20200515203015.7090-2-dan@dlrobertson.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
(cherry picked from commit 03556ea920b23c466ce7c1283199033de33ee671)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 hw/9pfs/9p.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 9e046f7acb..3301e82eb6 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -28,6 +28,7 @@
 #include "sysemu/qtest.h"
 #include "qemu/xxhash.h"
 #include <math.h>
+#include <linux/limits.h>
 
 int open_fd_hw;
 int total_open_fd;
-- 
2.17.1


