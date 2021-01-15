Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2452F7851
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 13:09:17 +0100 (CET)
Received: from localhost ([::1]:46504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Num-0001Ek-MM
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 07:09:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0Nry-0007xm-M3; Fri, 15 Jan 2021 07:06:23 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:42818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0Nrv-0003Vu-HB; Fri, 15 Jan 2021 07:06:22 -0500
Received: by mail-pg1-x536.google.com with SMTP id g15so5862546pgu.9;
 Fri, 15 Jan 2021 04:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=A9T6du9sxukvLBvTrDzzy9owmsrvi3lkb2vYV1QBYOY=;
 b=AWI5sRvcQbQyTqTh770Vf8hgBJFYkkPco6FegEpx3rWeCCk1TAkXgUC1Mw+RwL4h+m
 vl+wWuDToWT0DeZiu6wkmTL9x8cLAC3eYLy7QQqYq9KbLahtu5x7/GE3adsLnraHATNA
 xcXF9SHDP7IzLw5tEQ39f+lU3HZlnkcXOqSHOC/9Hp32Z1RS9UpoM7EXutZ+btyGVJ+d
 ss/p+FRKPfSrSmLtAx4s9RfgMk0uv5X31GBU/n+zTkxkyrkNegs4DwhxuT2sdLBx5Fvt
 PUVXAMlCjY05Z4npyKr14raA8XA94CN4/hb5KDyo4PPQ/FXDjAwgvWm3/kYMpoVy70FJ
 U9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=A9T6du9sxukvLBvTrDzzy9owmsrvi3lkb2vYV1QBYOY=;
 b=i0OGwTa4oI9+5K5q9E6NOMgCCpjTZesLudtRzvAVDrrIB7szZVFSl2VVrywGZuc8Wv
 RihuyOKKQ87gnYlh42Lw2gcBJdBSx9OtApaBZsu3cbEwL1F6t3xabN1r4dsi1bZaE83N
 h8Sj0smC8gIrW0ivBY/0bhzWQK0iw64sZSdjejtY3edQdBara1sL3XmtNOJrc9QqODUF
 0XibAHpXVquFzVCpE4O4nZK0SPG4yA12BhkN80nBC2+Ps5yL7kF6J9KLcAP22SYQoxkv
 WHpog2ANdjQhHTO7ylHLurOWa0LsBz25h4A+6ULz/V+uB5X3p/2pp4AFQQgvPm4y20w9
 vIvg==
X-Gm-Message-State: AOAM532ToKkV3Be4rgbpykBjbdJHGEj4i9lPOiwJ2TCX5Jv0mmeHoe2y
 GdAl6kAuarbksdFNNHi4ljhWTRxMPwdv5w==
X-Google-Smtp-Source: ABdhPJyBClL+QlSbZheygKXeh2SNz8CEus6Vc/7EUHKdQ3zChpIh+fkRnF8LHfafyU/Cd6K9kCpF8g==
X-Received: by 2002:a63:3714:: with SMTP id e20mr12440910pga.410.1610712377348; 
 Fri, 15 Jan 2021 04:06:17 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id a4sm8338161pgn.40.2021.01.15.04.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 04:06:16 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH 1/5] hw/block/nvme: add controller id parameter
Date: Fri, 15 Jan 2021 21:05:54 +0900
Message-Id: <20210115120558.29313-2-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115120558.29313-1-minwoo.im.dev@gmail.com>
References: <20210115120558.29313-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x536.google.com
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

There is Contrller ID field in Identify Controller data structure and
nvme device has never set this field, 0 by default.

Added a parameter for controller identifier in a NVM subsystem.  This is
reflected to Identify Controller data structrue of the controller.  This
parameter is helpful when a user wants to set up multi-controller in a
NVM subsystem.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c | 10 ++++++++++
 hw/block/nvme.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index cf0fe28fe6eb..132e61c0ee7b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -23,6 +23,7 @@
  *              max_ioqpairs=<N[optional]>, \
  *              aerl=<N[optional]>, aer_max_queued=<N[optional]>, \
  *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]> \
+ *              cntlid=<N[optional]>
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>
  *
@@ -50,6 +51,12 @@
  *   completion when there are no outstanding AERs. When the maximum number of
  *   enqueued events are reached, subsequent events will be dropped.
  *
+ * - `cntlid`
+ *   NVM subsystem unique controller identifier (default: 0).  This property
+ *   is used if a user wants to set up multi-controller in a NVM subsystem.
+ *   This value will be reported through Identify Controller data structure
+ *   with a field named CNTLID[79:78].
+ *
  * - `zoned.append_size_limit`
  *   The maximum I/O size in bytes that is allowed in Zone Append command.
  *   The default is 128KiB. Since internally this this value is maintained as
@@ -4275,6 +4282,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     n->bar.vs = NVME_SPEC_VER;
     n->bar.intmc = n->bar.intms = 0;
+
+    id->cntlid = n->params.cntlid;
 }
 
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
@@ -4345,6 +4354,7 @@ static Property nvme_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeCtrl, namespace.blkconf),
     DEFINE_PROP_LINK("pmrdev", NvmeCtrl, pmrdev, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
+    DEFINE_PROP_UINT32("cntlid", NvmeCtrl, params.cntlid, 0),
     DEFINE_PROP_STRING("serial", NvmeCtrl, params.serial),
     DEFINE_PROP_UINT32("cmb_size_mb", NvmeCtrl, params.cmb_size_mb, 0),
     DEFINE_PROP_UINT32("num_queues", NvmeCtrl, params.num_queues, 0),
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index b7fbcca39d9f..6aa9e89ac5a8 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -11,6 +11,7 @@
 
 typedef struct NvmeParams {
     char     *serial;
+    uint32_t cntlid;
     uint32_t num_queues; /* deprecated since 5.1 */
     uint32_t max_ioqpairs;
     uint16_t msix_qsize;
-- 
2.17.1


