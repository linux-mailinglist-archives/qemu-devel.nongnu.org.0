Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DB32F9320
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 15:59:34 +0100 (CET)
Received: from localhost ([::1]:36716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l19Wf-0001TB-Mb
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 09:59:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RM-0004SE-CZ; Sun, 17 Jan 2021 09:54:04 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RJ-00044A-7y; Sun, 17 Jan 2021 09:54:04 -0500
Received: by mail-pl1-x634.google.com with SMTP id d4so7211937plh.5;
 Sun, 17 Jan 2021 06:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rE9OF6JGzyy16WYqRAitzHWBoYb2h0+LL0UAOO+IgQA=;
 b=n2ZCE2VbEJo0yWkAsvoS7iZNFQR1KmXMc79WBpNjpLyrZZSHuQUc71xF/Z0MRU9Xps
 I6Vttgjba7b1Gdxb7PjUlEPcNVPnh93dp9PfH7Tj7BryPgAIJ5lb+/+XnVWwzlRpE4Y+
 QIEo7/jyKXYnbowvFHGJmjob13UzjMu0SwpeplMz8UvIXC7hBvhXwlL1O2MmCXgqbWSr
 xYo5+dNJ8rnxZbEItuvjVxcxfRMyH3U3IqqrSX/oO1feoPZzEu3JvBTRFd9k5ib7j88Z
 XX3wRWx1gADnhk+4+gi0WYMvPuK48lDcKVO+vSUigNVStfiKBnuwjsm2IV/j4yvMpdeE
 pzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rE9OF6JGzyy16WYqRAitzHWBoYb2h0+LL0UAOO+IgQA=;
 b=IcPuGlC0cYcwCf+9ReeQL+bJ292wIvj36Gi1gvprYxNTmhi+BFztv33jJrdKnBaUwn
 LZUG8Pa2DQwEn89h75K4fkk8Z+1Ym0jOBPdB6lz+GFIS/8Kfwv6LN+twI+LFy6U1afcZ
 ULRueIya1nSFu6kFHjCVqwGHqguJkFXMsT7kFon45V5YO+7TUdtwGPGQRsGz0xGxxsio
 2WmW+heuUsOj01FomE4LsbNzHItptnD7kZsnpaMlb1Ts5Oe6jgEo0WW+/XAukCQDIUy8
 aAHPwGO9HFfPeQy3oBL6Sojq+cc/aLUjOIKbV8KDSrL/+cWi6HpWrhwUNr3k1PW3XiVu
 fyDA==
X-Gm-Message-State: AOAM530RhaWx1N4hNR2YYl9+7p240Z126dG3XxqRzHt4837zvBLhZFG9
 i9uKo34SywQ+W7g7H7I/3xf4SpIbvF/Z1A==
X-Google-Smtp-Source: ABdhPJxDCaCozuJzKgS/cCseiAVFoGqIbT5mv4HTAg+5SseqjMQxaLRYSUC1KIbC/PLrmdv6i4e02A==
X-Received: by 2002:a17:90b:1014:: with SMTP id
 gm20mr15745347pjb.5.1610895239574; 
 Sun, 17 Jan 2021 06:53:59 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x127sm13143583pfb.74.2021.01.17.06.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 06:53:59 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH V2 04/11] hw/block/nvme: split setup and register for
 namespace
Date: Sun, 17 Jan 2021 23:53:34 +0900
Message-Id: <20210117145341.23310-5-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In NVMe, namespace is being attached to process I/O.  We register NVMe
namespace to a controller via nvme_register_namespace() during
nvme_ns_setup().  This is main reason of receiving NvmeCtrl object
instance to this function to map the namespace to a controller.

To make namespace instance more independent, it should be split into two
parts: setup and register.  This patch split them into two differnt
parts, and finally nvme_ns_setup() does not have nothing to do with
NvmeCtrl instance at all.

This patch is a former patch to introduce NVMe subsystem scheme to the
existing design especially for multi-path.  In that case, it should be
split into two to make namespace independent from a controller.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-ns.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index fc42ae184e01..3f0e4e461420 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -320,10 +320,6 @@ int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
         nvme_ns_init_zoned(ns, 0);
     }
 
-    if (nvme_register_namespace(n, ns, errp)) {
-        return -1;
-    }
-
     return 0;
 }
 
@@ -361,6 +357,13 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
                                 "could not setup namespace: ");
         return;
     }
+
+    if (nvme_register_namespace(n, ns, errp)) {
+        error_propagate_prepend(errp, local_err,
+                                "could not register namespace: ");
+        return;
+    }
+
 }
 
 static Property nvme_ns_props[] = {
-- 
2.17.1


