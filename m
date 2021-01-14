Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547A32F5B3D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 08:25:49 +0100 (CET)
Received: from localhost ([::1]:49710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzx0u-00063c-EJ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 02:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kzwyI-0004f3-96
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 02:23:06 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:37331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kzwyG-0002Mi-D7
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 02:23:05 -0500
Received: by mail-pl1-x630.google.com with SMTP id be12so2470564plb.4
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 23:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7nTDngJf7MlLXQXoXhgSr1XI+hy0r9EzC9Mo/uOrQXw=;
 b=oM8V6mEEHcqFil5EMhqJADofO+yUACI5gPke9pu9X24r5fMILEjbOQWbk6Yl9kVAA8
 AsY7aBBP023Gi7AAVU7udhbRTF4ycGIvRBt+ZHToLK+J5byv58hlbnGJ0hiRA7Ev5QBJ
 4sFlgQHtjRcZuFrCYNxgE3FCrGjcF/e0/sZ434oPVal6XtFsvHWtAqZAIHqKVXLhWyE/
 QcrMW/hSC6My95Klr380PYxWcXfM/uB5TqKEffK9HlQM6wBpOQvx7icp32d4cfq65ax6
 bkodOC7FQBjuz0l6LxCA5+sB2joB9RBQaI7o67j6jiXnV6Cpi/a2wkdbzDAW4jwW5Jrs
 s0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7nTDngJf7MlLXQXoXhgSr1XI+hy0r9EzC9Mo/uOrQXw=;
 b=UcamzQFlIf9YMzuwVqwFLQhyOxxAvFGdln4AUXMdjR+3F5lcV4T0PvPkmb0nkfTPIn
 KV9gT4bsp42S0Lc8bB5itUGHWVE/O8QNFhp5UY9LzEY19IFeEdDhmOZQjooRwwXUnrnu
 ttsuni93aSQDU7XysPndX/AFmWzVBfAswFaWDZnqia5eWV6k/xncTZlvsGztlzMqOLtQ
 CDOCwtL0IexBcbs5Wl/kGekDKew8l0VwNmupcI8f0HyhDhfBtxhQl7tcBXw2p8JEC/yt
 juokSE6+l/Uy33P2SPvq68DRZOrvEinJ8OLKdLFSujA3S51SS2W16luyNvOznkoAdRL8
 9ThQ==
X-Gm-Message-State: AOAM531uBqyJv2mTOTiSWkD8k+Dp1lwlOVgnXlxMwkqJacHpLQ9ozYkW
 l2YEdUWkLjel7SvwgydnUGaSlBhKAFfdyaovf1E=
X-Google-Smtp-Source: ABdhPJxdeeI968i8ciJxfWT86n54mHg8EmPsyDZa+KqorYhiReLQwp6aPt+GlMKXKkc4p5DNZsCQ4Q==
X-Received: by 2002:a62:820d:0:b029:1ad:d810:6805 with SMTP id
 w13-20020a62820d0000b02901add8106805mr6168108pfd.63.1610608982527; 
 Wed, 13 Jan 2021 23:23:02 -0800 (PST)
Received: from always-libai.bytedance.net ([61.120.150.71])
 by smtp.gmail.com with ESMTPSA id i7sm4450323pfc.50.2021.01.13.23.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 23:23:02 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kbusch@kernel.org, its@irrelevant.dk, kwolf@redhat.com, mreitz@redhat.com
Subject: [PATCH v3 1/4] block/nvme: introduce bit 5 for critical warning
Date: Thu, 14 Jan 2021 15:22:48 +0800
Message-Id: <20210114072251.334304-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114072251.334304-1-pizhenwei@bytedance.com>
References: <20210114072251.334304-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x630.google.com
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

According to NVMe spec 1.4 section
<SMART / Health Information (Log Identifier 02h)>, introduce bit 5
for "Persistent Memory Region has become read-only or unreliable".

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 include/block/nvme.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 3e02d9ca98..f68a88c712 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -749,6 +749,7 @@ enum NvmeSmartWarn {
     NVME_SMART_RELIABILITY            = 1 << 2,
     NVME_SMART_MEDIA_READ_ONLY        = 1 << 3,
     NVME_SMART_FAILED_VOLATILE_MEDIA  = 1 << 4,
+    NVME_SMART_PMR_UNRELIABLE         = 1 << 5,
 };
 
 enum NvmeLogIdentifier {
-- 
2.25.1


