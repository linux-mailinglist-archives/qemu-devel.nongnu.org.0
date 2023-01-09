Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBD9661EAF
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 07:32:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pElh7-00067y-9z; Mon, 09 Jan 2023 01:31:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pElh3-00067a-M6
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 01:31:39 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pElh2-00005W-2r
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 01:31:37 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 cp9-20020a17090afb8900b00226a934e0e5so10407257pjb.1
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 22:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eZnuTeeIVANObJeEA8L7r+fWO2uxOrs1SPIUsHlF3po=;
 b=IoOXLdr9tl7Rz34j7O8kVgdEdUvN8BpSbMTpFzGeB0mJHoFHsdNPmfgIp+Fj8XVg1R
 4YqerKutaO/CfzV9Ne8cQFtJal+caawxjaaT2o41A4AGHrGBHE/THLjdoAtiCBInw4Th
 e+CfWLl+g8Z5eDE1fj7MugA0A4WUkgmlZLWigeVlIdPLWnCGJZe8aGnT1+hiuN88N3gC
 xjKsgfVk9U6MsM3b21PWdrIZooYlioy15p4SSPZc1KRD6S7KU1XRkNwk830RRffnkhMC
 JdW7Amxp4zLkG068yguhBVwc2YcHLIC3sxSOUGxNueNt/wiBYmXmJB6fRtbY7Uz+HMx8
 WTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eZnuTeeIVANObJeEA8L7r+fWO2uxOrs1SPIUsHlF3po=;
 b=ZRh3qM1dDlh/RZ/ua7HsZH3AGxOJ0C1KsBOjVzrZFU7Ng0S7oWtLcpEwIalYzJMERh
 pYXWFUfDrVE1g80+Lu47Mrqe6RMgH/LI8l1Dif9z7WF3ko4kiOYiMjtQZMkWGCQ47v4B
 70GHda2G7Hy4E8EsiqTOIGaTWql6wLKpTZ1ePyKjUqeP8D2hNY4l6qgGaR4uWm/lcLZX
 6y9/dY6n/u21OMYPK00p3hTZ1br6Wo4wCb2hJnyuxqs3aXC9HpA50BlfTLKZTGzgChuY
 yMWEmlMTWuGMcHkjV6KuchIEfFXyyJ0vgn8hTcuqpoq0KyPrdoHnTbVhH/VyVFpVIjXt
 1+9w==
X-Gm-Message-State: AFqh2kqb17UPK1W0p113PaISV9QWkORLc2p0SqHVmX5/0pH4HLZJnF/8
 8rVgoDT/s+kKPHCsV0I131LK+KVzo3apfqS5
X-Google-Smtp-Source: AMrXdXtNBILMcdl4pJx0nFvZSerujYKQGCDoflmETVqqyCHSB+Xlc+jp5KhrJpaz0U6sDRCfJtZm6g==
X-Received: by 2002:a17:90b:2291:b0:226:43ba:54af with SMTP id
 kx17-20020a17090b229100b0022643ba54afmr32065303pjb.2.1673245894428; 
 Sun, 08 Jan 2023 22:31:34 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 ob10-20020a17090b390a00b002187a4dd830sm6565350pjb.46.2023.01.08.22.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 22:31:34 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] vhost-user: Correct a reference of TARGET_AARCH64
Date: Mon,  9 Jan 2023 15:31:30 +0900
Message-Id: <20230109063130.81296-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Presumably TARGET_ARM_64 should be a mistake of TARGET_AARCH64.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/virtio/vhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index d9ce0501b2..6c79da953b 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -48,7 +48,7 @@
  * hardware plaform.
  */
 #if defined(TARGET_X86) || defined(TARGET_X86_64) || \
-    defined(TARGET_ARM) || defined(TARGET_ARM_64)
+    defined(TARGET_ARM) || defined(TARGET_AARCH64)
 #include "hw/acpi/acpi.h"
 #define VHOST_USER_MAX_RAM_SLOTS ACPI_MAX_RAM_SLOTS
 
-- 
2.39.0


