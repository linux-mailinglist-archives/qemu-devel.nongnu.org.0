Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71892F0D88
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 08:52:06 +0100 (CET)
Received: from localhost ([::1]:43734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyrzi-0001rK-1X
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 02:52:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kyry2-0001H9-AI
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 02:50:22 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:44985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kyrxt-00040w-FZ
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 02:50:19 -0500
Received: by mail-pg1-x52c.google.com with SMTP id p18so12016393pgm.11
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 23:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SHt3jdK8HRUxLCLd39Lhkxa3d93LbLM4362CcotLgeI=;
 b=sLjf9Jkd64CMeAXXwTWAZ595UxouHVnBZzcH+beD+NkA12WcuKMb3kijcdJ4b9kfUl
 Zkn1O3reyujISBCG/IEcyxZ7Wq0sqQt/UjEH+DK6D3IC6v9FtimQqFkSagJCQfthiFp5
 PFM/dljRcFcTbnH3QUfGzAY1RCTmTeEDxOKNjFTNyIT80vHZQxKRi+SkKPK75nSUrh+d
 gQd4p+iDa96skKVPWuQ1jffa89QO09FC27dMgEEJGcnJ6G4A1hN008aO8tKdHm9kC/6L
 XFeWZjQ9EukNvKc6vAAXp89frIff0l9HgWMRo4hxYemsKZ3+tpQpSaBx1jAPU3lcqt1w
 ir4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SHt3jdK8HRUxLCLd39Lhkxa3d93LbLM4362CcotLgeI=;
 b=g1eDFHtbSGYEhcCB2cu+wZUoJV1cvfaNr1qHC0K4Oc/A6xj7jfTREoaPlx8oLAJbGO
 vqfBc0CzLH2OvUVX8EjJ4C1sab7NkaU/W2qpgfXrFikwH0B8K4nkxf5nPlR39Z4UoDKl
 LBhGM22zCfOVcJxR0Uq7Bz4iZXvSsjEisp7Y5ZHlJLHX9LqotX9mijkMd3i4tMw+c0zm
 6HzjRLZVi04gQhKcvGPfoYpIKFrq8r+8M0Soqhc96yOE9DME9pADrox5OujmHHMktQPf
 CKHLSiuNSBVJ1s3ATQnM86wcOoPPUvfnpjUPAjewJGDUEVYKoXfr1Lb/+poXTlKdmKwG
 EQzQ==
X-Gm-Message-State: AOAM533FR2G2UDVoA+r55ovPiA2hoiIXUmIqQIf2lgKp8GHZ/XQmi5aK
 MYPb8tgQbparg4oKV0Xi/xPYvA==
X-Google-Smtp-Source: ABdhPJwPb+i4I2P/Nrv3jTSSskwbvMYF0itOTpf8X935lXfQY0av3r/wa+R1PM7OXTIIUc9DkmTVJg==
X-Received: by 2002:aa7:8a99:0:b029:1a6:c8b8:1414 with SMTP id
 a25-20020aa78a990000b02901a6c8b81414mr14798919pfc.66.1610351411076; 
 Sun, 10 Jan 2021 23:50:11 -0800 (PST)
Received: from always-libai.bytedance.net ([61.120.150.71])
 by smtp.gmail.com with ESMTPSA id gk8sm17399888pjb.52.2021.01.10.23.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 23:50:10 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kbusch@kernel.org,
	its@irrelevant.dk,
	kwolf@redhat.com
Subject: [PATCH] hw/block/nvme: add smart_critical_warning property
Date: Mon, 11 Jan 2021 15:50:03 +0800
Message-Id: <20210111075003.151764-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: zhenwei pi <pizhenwei@bytedance.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a very low probability that hitting physical NVMe disk
hardware critical warning case, it's hard to write & test a monitor
agent service.

For debugging purposes, add a new 'smart_critical_warning' property
to emulate this situation.

Test with this patch:
1, append 'smart_critical_warning=16' for nvme parameters.
2, run smartctl in guest
 #smartctl -H -l error /dev/nvme0n1

  === START OF SMART DATA SECTION ===
  SMART overall-health self-assessment test result: FAILED!
  - volatile memory backup device has failed

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 hw/block/nvme.c | 4 ++++
 hw/block/nvme.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 27d2c72716..2f0bcac91c 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1215,6 +1215,8 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
 
     trans_len = MIN(sizeof(smart) - off, buf_len);
 
+    smart.critical_warning = n->params.smart_critical_warning;
+
     smart.data_units_read[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_read,
                                                         1000));
     smart.data_units_written[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_written,
@@ -2824,6 +2826,8 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT32("aer_max_queued", NvmeCtrl, params.aer_max_queued, 64),
     DEFINE_PROP_UINT8("mdts", NvmeCtrl, params.mdts, 7),
     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
+    DEFINE_PROP_UINT8("smart_critical_warning", NvmeCtrl,
+                      params.smart_critical_warning, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index e080a2318a..76684f5ac0 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -16,6 +16,7 @@ typedef struct NvmeParams {
     uint32_t aer_max_queued;
     uint8_t  mdts;
     bool     use_intel_id;
+    uint8_t  smart_critical_warning;
 } NvmeParams;
 
 typedef struct NvmeAsyncEvent {
-- 
2.25.1


