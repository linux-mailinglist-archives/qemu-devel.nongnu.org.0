Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC762F5B40
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 08:26:05 +0100 (CET)
Received: from localhost ([::1]:49928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzx1A-000698-Uo
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 02:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kzwyM-0004kl-6i
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 02:23:10 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kzwyJ-0002P3-Tn
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 02:23:09 -0500
Received: by mail-pj1-x102b.google.com with SMTP id y12so2612876pji.1
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 23:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TqfsYwJc83IbQ/uVYR/F+cVdxtvlwqGIFPyDbs6k6k8=;
 b=Za4ZeMgOCyhRtgPukB+JpOQxuAQxlzzc4Jm9wnLyh+Jwb6XJs7GXm9TATRjkGq6BNK
 7idv1EAvytKq7htCGgm4wiq5+7bUEGrmuMRxoetK2wL6BtbIrWw388Q4f9XJUvA1ti3y
 5/8ERBkOWhMF3dTU0nxXeshOcjodjo6oycyg3VeKIOZ86eTcKw9FEdH1thfHF6mcfIyd
 rX8m/cVmLAxTkx0TSozB0nK51ZfPMjIR5SSJKOB29T5U47Wdo6Qug5vZDiPNZS9MXkHt
 ZriEvh6rEdyc48p2Jy61behP5gOZkAYlrMwMRxPVxFv0t64PTqfok3pWucAUjvzfvzvq
 APMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TqfsYwJc83IbQ/uVYR/F+cVdxtvlwqGIFPyDbs6k6k8=;
 b=HHGjcCvAEzez3VlBha/VOdnKdnsqL8UPLPsuo+zMAsqk1ohiexdPvubvQRjHCon7DW
 4M7Yvi9TtjtGcON4nrYZhNfvLaPvUKO5dup5hS2c03zd/mGk06SzCAg1ZHXrlaYC6lkT
 tTWKjaecjRH61HX0IGdxjMxHLchQVjFYfEnZy3r5QJ3MUGmjMFi+soLW0bKInLKDZocs
 WfwSjFymWciGUa0xSURsznQCUEEuxEYel5+Tw5l5ETHAiVlce0uFCCNedAK4Km9pEhub
 P/F/Q9GBC7PTDfTbbgrBBtUOqwoyNo2OrTw5E5qF1+zxDET2CDYE8RN5EMYTkvvFFRFZ
 wIEg==
X-Gm-Message-State: AOAM5315BJ/5jqUJAX4mJEUuNvLT6hosEbB5TwbZjTPGJuYd5u6vqDgJ
 xdsmddlrlFoVlLyX+Dv7Yt3qiA==
X-Google-Smtp-Source: ABdhPJw14o9pdCJ6C7MdL/sZbhsJ6MiRGKiy28Axrubi8HeUjCGWDhFvp1NC1MLqhSA4CJyPvHCcuA==
X-Received: by 2002:a17:902:c517:b029:d6:e179:2097 with SMTP id
 o23-20020a170902c517b02900d6e1792097mr6316528plx.70.1610608986386; 
 Wed, 13 Jan 2021 23:23:06 -0800 (PST)
Received: from always-libai.bytedance.net ([61.120.150.71])
 by smtp.gmail.com with ESMTPSA id i7sm4450323pfc.50.2021.01.13.23.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 23:23:05 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kbusch@kernel.org, its@irrelevant.dk, kwolf@redhat.com, mreitz@redhat.com
Subject: [PATCH v3 2/4] hw/block/nvme: fix overwritten bar.cap
Date: Thu, 14 Jan 2021 15:22:49 +0800
Message-Id: <20210114072251.334304-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114072251.334304-1-pizhenwei@bytedance.com>
References: <20210114072251.334304-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: zhenwei pi <pizhenwei@bytedance.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After PMR initialization, bar.cap should not be clear in function
nvme_init_ctrl. Otherwise the PMR cap would be always disabled.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 hw/block/nvme.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 27d2c72716..f361103bb4 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2745,7 +2745,6 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->psd[0].enlat = cpu_to_le32(0x10);
     id->psd[0].exlat = cpu_to_le32(0x4);
 
-    n->bar.cap = 0;
     NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
     NVME_CAP_SET_CQR(n->bar.cap, 1);
     NVME_CAP_SET_TO(n->bar.cap, 0xf);
-- 
2.25.1


