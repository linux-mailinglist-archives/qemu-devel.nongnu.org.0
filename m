Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E79600019
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 16:54:45 +0200 (CEST)
Received: from localhost ([::1]:51540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok52K-0002sQ-Rr
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 10:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok4zF-0005xU-4V; Sun, 16 Oct 2022 10:51:33 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:35782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok4zD-0004o0-CG; Sun, 16 Oct 2022 10:51:32 -0400
Received: by mail-pf1-x42b.google.com with SMTP id y191so9023839pfb.2;
 Sun, 16 Oct 2022 07:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OlhRJBInRRHSrC5NLBZ9hSKyylPKOXnGYb9L1eqfcHo=;
 b=kMeglm+CnI+IAbeXigSMRT6MNh2g82IyKAvuVmI4OHL516J9K6MVLnyTU4Il9Gy7YM
 JeZaUJnsTXZHA8B9gRxtuBst6gCA68sjYKMyi2TICxDNhzNcU4k47WJkU1QnVdUfQHCs
 Sx/dpjeTrxkY4rfj04jdlLCa54UHZ3yRkalCvkB5zmN9o10M2yUKfXn+n3S7WLRZmSVm
 FKpYp5QoCP1dULxN5+J+fV1xxqkacRFPTDQZLqGl/QDLShurJVrmVVSkrekrlUCPeP+c
 hecrm14ySpk2pNenVOJkemZHVK5cVtUdCpAQL8MRp5XPUXWH2yrNsf2OW/9PxrQ0WqMg
 U9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OlhRJBInRRHSrC5NLBZ9hSKyylPKOXnGYb9L1eqfcHo=;
 b=bxOQs6k/pQrCD24p/Wiu/62/nv1yqhleRqRGQMa7Wm5IJQNNG1GHfZ1Hdz9kv8/ok3
 k6ar6boyrJJ2Dy4V0e1/DXPdPFrL7hM56Ns4muJ+MNQHflWHFIVqFMx8ECuKKclL2R9z
 AOXpcfmxBT+SK1WmWP3S+o40LZ3/K98KwuNi57Q/g83bEXdJxK/8EIFtMF681GLuB2EN
 O3fQ4s1pT1dwtHr2h1/i3n1Gtm7yv7BDLOUtTEoW/laMKXAnXuhXRQyG24tUiC0Wsb+r
 XpM7vd3Ph4bO+neMMSZUZWb3zeEUPCsNgkVZXjLrqbQIjzpGDugsn38rfxxFoXohEnC1
 pLqg==
X-Gm-Message-State: ACrzQf0xlulQ4ja4GIAKEvZLLrqQuDoL9iKbn3aXUWq74OcHXjzmNTQl
 1c3wbYBmlu4zVEiUs1968HtLmG4eYz/chQ==
X-Google-Smtp-Source: AMsMyM5KZiSx7KEYwjbCpdwCUOFbBPDchkmmAOr7Gd212zj/DA3ilog0Dud0p2gc1aL8M341JEKppQ==
X-Received: by 2002:a05:6a00:1943:b0:563:8173:b46a with SMTP id
 s3-20020a056a00194300b005638173b46amr7709943pfk.34.1665931889132; 
 Sun, 16 Oct 2022 07:51:29 -0700 (PDT)
Received: from roots.. ([183.221.93.248]) by smtp.gmail.com with ESMTPSA id
 z27-20020aa79e5b000000b005377c74c409sm5143619pfq.4.2022.10.16.07.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 07:51:28 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, hare@suse.de, Eric Blake <eblake@redhat.com>,
 dmitry.fomichev@wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v12 1/7] include: add zoned device structs
Date: Sun, 16 Oct 2022 22:51:04 +0800
Message-Id: <20221016145110.171262-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016145110.171262-1-faithilikerun@gmail.com>
References: <20221016145110.171262-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x42b.google.com
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

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 include/block/block-common.h | 43 ++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index fdb7306e78..36bd0e480e 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -49,6 +49,49 @@ typedef struct BlockDriver BlockDriver;
 typedef struct BdrvChild BdrvChild;
 typedef struct BdrvChildClass BdrvChildClass;
 
+typedef enum BlockZoneOp {
+    BLK_ZO_OPEN,
+    BLK_ZO_CLOSE,
+    BLK_ZO_FINISH,
+    BLK_ZO_RESET,
+} BlockZoneOp;
+
+typedef enum BlockZoneModel {
+    BLK_Z_NONE = 0x0, /* Regular block device */
+    BLK_Z_HM = 0x1, /* Host-managed zoned block device */
+    BLK_Z_HA = 0x2, /* Host-aware zoned block device */
+} BlockZoneModel;
+
+typedef enum BlockZoneCondition {
+    BLK_ZS_NOT_WP = 0x0,
+    BLK_ZS_EMPTY = 0x1,
+    BLK_ZS_IOPEN = 0x2,
+    BLK_ZS_EOPEN = 0x3,
+    BLK_ZS_CLOSED = 0x4,
+    BLK_ZS_RDONLY = 0xD,
+    BLK_ZS_FULL = 0xE,
+    BLK_ZS_OFFLINE = 0xF,
+} BlockZoneCondition;
+
+typedef enum BlockZoneType {
+    BLK_ZT_CONV = 0x1, /* Conventional random writes supported */
+    BLK_ZT_SWR = 0x2, /* Sequential writes required */
+    BLK_ZT_SWP = 0x3, /* Sequential writes preferred */
+} BlockZoneType;
+
+/*
+ * Zone descriptor data structure.
+ * Provides information on a zone with all position and size values in bytes.
+ */
+typedef struct BlockZoneDescriptor {
+    uint64_t start;
+    uint64_t length;
+    uint64_t cap;
+    uint64_t wp;
+    BlockZoneType type;
+    BlockZoneCondition cond;
+} BlockZoneDescriptor;
+
 typedef struct BlockDriverInfo {
     /* in bytes, 0 if irrelevant */
     int cluster_size;
-- 
2.37.3


