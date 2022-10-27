Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B344760FC3B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:47:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo555-00020U-Hp; Thu, 27 Oct 2022 11:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo54p-0000Vd-Lc; Thu, 27 Oct 2022 11:45:55 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo54X-00011D-44; Thu, 27 Oct 2022 11:45:39 -0400
Received: by mail-pf1-x42a.google.com with SMTP id i3so1921555pfc.11;
 Thu, 27 Oct 2022 08:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c5hXkEGI882XKLcRqYRJTkqwhEoqEQQdvijOpbi79NI=;
 b=LafuTTtVBWhmqj8bZkuvCCszQrl3E7OqMfhQy3mh6wgBK/QMnsjZyJK0O5yhhQfDR5
 9MscuKyX9f9BUH1oDww1DvU2FrqyFUKg1s5KVdL5v6mFEAWyFcWZFf9HZ2MFwvLYv0M/
 s2f34BSeYOy4zJrzZ9AJgm0p2ciF5KpATsSU9eYZL0/PGqE/fSl24vVS8IjrHC9ROdQg
 +ciCBav814pvI1G416HkNW7mdjRj7TzH24kXB8TEUnkL1r92j7LyOMbApCscvCvX3NQH
 PFP2MOU/a56+f+h3cQABmuF79apQ1jvzvs24/17evVweAfV0yjuLagqhxUZTb9YSbysW
 jOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c5hXkEGI882XKLcRqYRJTkqwhEoqEQQdvijOpbi79NI=;
 b=e7geOTp9tQWFwRBS+Nf2+buM+A9lMHy7H43CfbgvofUAEGkJa2b6lGVch0NqR+5Kv0
 TiRHfXP9Eql19mslVX58ZqZjeXhvhSQC9EYyGMAGNpt7fJjsuHxlrJhzxDX/U2CODDxc
 DxcAipof2KsAoM7NOORx4YQG3A+vjLq9x3tLIhRMNQLcdJW0ECoibcczjUVqn7hBjvYE
 p/Ddyx09JIgTyhkezZ6E5J/0txwEArb8F6zitpsnpSFv7UQ3loAg6fxDcHfd/6JiwUO9
 +C0QepvscGjpK96fKmihtS67NyXeOt1wTSzkb/y6jtSq+yLRs/+iw8r3vXJ42AlxarnV
 2Jxw==
X-Gm-Message-State: ACrzQf26kusLLS24I5krjKecx1QhX+K7UvUmcW7HwIpkIktTzdek6Shb
 wJp8Sb8ghwmO8TPsvyxEp4ZAcPXA5k5gNzxz
X-Google-Smtp-Source: AMsMyM6NHPuDLDcr5umq+4EmhzO0KzYabXqs5+IgM4dHYruR56/pZSfR6Wj/23QC86T2b+hzdoS2mg==
X-Received: by 2002:a05:6a00:4c9c:b0:56b:a9bd:ee4f with SMTP id
 eb28-20020a056a004c9c00b0056ba9bdee4fmr25069629pfb.35.1666885528114; 
 Thu, 27 Oct 2022 08:45:28 -0700 (PDT)
Received: from roots.. ([112.44.202.248]) by smtp.gmail.com with ESMTPSA id
 q9-20020a63d609000000b004405c6eb962sm1232801pgg.4.2022.10.27.08.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 08:45:27 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 damien.lemoal@opensource.wdc.com, qemu-block@nongnu.org,
 stefanha@redhat.com, Markus Armbruster <armbru@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, dmitry.fomichev@wdc.com,
 Eric Blake <eblake@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v13 1/8] include: add zoned device structs
Date: Thu, 27 Oct 2022 23:44:57 +0800
Message-Id: <20221027154504.20684-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221027154504.20684-1-faithilikerun@gmail.com>
References: <20221027154504.20684-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 include/block/block-common.h | 43 ++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index fdb7306e78..4025df380e 100644
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
+typedef enum BlockZoneState {
+    BLK_ZS_NOT_WP = 0x0,
+    BLK_ZS_EMPTY = 0x1,
+    BLK_ZS_IOPEN = 0x2,
+    BLK_ZS_EOPEN = 0x3,
+    BLK_ZS_CLOSED = 0x4,
+    BLK_ZS_RDONLY = 0xD,
+    BLK_ZS_FULL = 0xE,
+    BLK_ZS_OFFLINE = 0xF,
+} BlockZoneState;
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
+    BlockZoneState state;
+} BlockZoneDescriptor;
+
 typedef struct BlockDriverInfo {
     /* in bytes, 0 if irrelevant */
     int cluster_size;
-- 
2.38.1


