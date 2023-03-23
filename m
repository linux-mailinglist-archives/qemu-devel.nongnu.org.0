Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB986C5E77
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 06:10:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfDCW-0005uY-CD; Thu, 23 Mar 2023 01:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfDCP-0005ny-6u; Thu, 23 Mar 2023 01:09:17 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfDCN-0002yp-MZ; Thu, 23 Mar 2023 01:09:16 -0400
Received: by mail-pl1-x62f.google.com with SMTP id kc4so6671643plb.10;
 Wed, 22 Mar 2023 22:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679548153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jtxZ8v3YWpYA+etoCTcOvJcHPgV19dkZSoY9cWpKuXw=;
 b=mD/hhCengkxBzxj3lLUAO7vRvgnCFjn1OYCrh6hYwTKFateFFaBHixsTDO/OYk5D5q
 ae8MfPal2k8ZXI4KetXk2MgACQ5OrQEGxhT+siH7iCSdu7qhNFMkyf0T76i/RXOIQP+9
 GGDfZR1af0jQzaAQjvoTnVk7XRbRDKD/JHfLkSmaptv3CLMCAi6BIEIRY6PohiDmlBDH
 nYH/vXjSofIl60ELtBa0/6d/++T5wxyApbljmjkpODbha1JZPxY7QxQHNiPDmWG3K4/X
 NgW3Wlec1WH/TxsmthepTKIZHKIJ6mMW9KHwe0IvrATQ5AdUnsnvxBmQspp3SHpMQTGV
 942g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679548153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jtxZ8v3YWpYA+etoCTcOvJcHPgV19dkZSoY9cWpKuXw=;
 b=gcn9CbHmKJXqq6XOkrFiJ1ScJOI4uTx2mKAnfn+EGD/OXcu1PaQqOcqk0QiQlb7vIC
 i2bROjLA8HZpVzBEHcHMi25iEZqQo7ZUbjZ62KJqnoIePkvWQjwH+EMMN8+mVA08kzQq
 yEBysLESQd5rPr/Xwpd0TZ3iz01eC2nUgZauYzEMNbXeZoU+LWU22HvrrNI8lhajMP4A
 QdWG8aefwYClUE8+OG9IRCyvkTMvmuSACOmA6P/N5wMYQT/T0KLokddbYhVbwrQWETuU
 PWbR1DmicSElSkF0/SpyeiLuVGpk21x+nGVZWW7ow5Vu26XPnWCCt12S9b+TP3bsrL7b
 kRRw==
X-Gm-Message-State: AO0yUKXTBzQj5CCKirIpDM+1cSRWmMUo6Pe6t2ptCHlM4s/M6Xoig1T6
 4L8zNMX8FkB+js+270pDeKORNHfLhfTnk4/eRsM=
X-Google-Smtp-Source: AK7set+Trxk+P3hshJxyvzCJcwMvBskmP6ET4IULqQsu4Y6QJQkqgWUZ25x6/T1Q5XOiKLT1PMhhhw==
X-Received: by 2002:a05:6a20:1994:b0:da:5084:2764 with SMTP id
 bz20-20020a056a20199400b000da50842764mr1880230pzb.24.1679548153183; 
 Wed, 22 Mar 2023 22:09:13 -0700 (PDT)
Received: from fedlinux.. ([106.84.129.82]) by smtp.gmail.com with ESMTPSA id
 y22-20020aa78556000000b00627eac32b11sm8157888pfn.192.2023.03.22.22.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 22:09:12 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, damien.lemoal@opensource.wdc.com,
 Fam Zheng <fam@euphon.net>, hare@suse.de, dmitry.fomichev@wdc.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v17 4/8] raw-format: add zone operations to pass through
 requests
Date: Thu, 23 Mar 2023 13:08:30 +0800
Message-Id: <20230323050834.5199-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323050834.5199-1-faithilikerun@gmail.com>
References: <20230323050834.5199-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

raw-format driver usually sits on top of file-posix driver. It needs to
pass through requests of zone commands.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 block/raw-format.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/block/raw-format.c b/block/raw-format.c
index 66783ed8e7..6e1b9394c8 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -317,6 +317,21 @@ raw_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
 
+static int coroutine_fn GRAPH_RDLOCK
+raw_co_zone_report(BlockDriverState *bs, int64_t offset,
+                   unsigned int *nr_zones,
+                   BlockZoneDescriptor *zones)
+{
+    return bdrv_co_zone_report(bs->file->bs, offset, nr_zones, zones);
+}
+
+static int coroutine_fn GRAPH_RDLOCK
+raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
+                 int64_t offset, int64_t len)
+{
+    return bdrv_co_zone_mgmt(bs->file->bs, op, offset, len);
+}
+
 static int64_t coroutine_fn GRAPH_RDLOCK
 raw_co_getlength(BlockDriverState *bs)
 {
@@ -617,6 +632,8 @@ BlockDriver bdrv_raw = {
     .bdrv_co_pwritev      = &raw_co_pwritev,
     .bdrv_co_pwrite_zeroes = &raw_co_pwrite_zeroes,
     .bdrv_co_pdiscard     = &raw_co_pdiscard,
+    .bdrv_co_zone_report  = &raw_co_zone_report,
+    .bdrv_co_zone_mgmt  = &raw_co_zone_mgmt,
     .bdrv_co_block_status = &raw_co_block_status,
     .bdrv_co_copy_range_from = &raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = &raw_co_copy_range_to,
-- 
2.39.2


