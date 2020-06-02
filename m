Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDC91EB6AC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 09:43:54 +0200 (CEST)
Received: from localhost ([::1]:55146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jg1aT-0005aB-Sc
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 03:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <morecache@gmail.com>)
 id 1jg1ZH-0003wC-SN
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 03:42:39 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <morecache@gmail.com>)
 id 1jg1ZH-0000Zj-9u
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 03:42:39 -0400
Received: by mail-wm1-x32e.google.com with SMTP id c71so1870280wmd.5
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 00:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+1zDIDD5Ac1G0o+sZnIC0Y87pDen00GlH6TX0f0+z20=;
 b=Bau/dU6Ng5FJRYIR+5Jqsgha7wM9+N+56gTWMOiqwi2oyb9lyH96cFRxdp/Ab7Qxg+
 +HTMPWY0/CZvLooYBvIqFqBOkqV8T6u4StBohNPxdMKokn/ZBN8OSeqkm2mnrrvUUQpz
 Z/P6hgqI/+6fKnJCRtzNuvFRyXmFwG/dVvnn6IVDyQLZkwAu9dsRR5MOFB128Z9UuA1a
 Bu1SX+exf+ivTkoUQtxwp4wSfp5iJKRrhxTay/+QLBsSh07EqQpQisrx++r+qBT1nfxZ
 /tqFHu4as6Y4kJe8csHwlmBuucfVidPKkzsw9Cb59fGBeSw94hcrC7pIu9JmhjITxPvk
 dZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+1zDIDD5Ac1G0o+sZnIC0Y87pDen00GlH6TX0f0+z20=;
 b=j3IRk5S3Rsj8uo7UxVc5SlKYEpXB1nfOYRXWy7nIAQ5cG1CPfem0TW7vEkmQnzNyEe
 tRkS6OPcVPOr7VKxBsUxgD0tKztVB0/vOmfAx9K13ZcDjyc5kQ4tDCViNsF//JkWJBBe
 CZra+6897BsC6XX1D5ruun9FIhtwRxoXJNE3gpyWE4H+G418EQOe3xFvM8WBpB6znTNS
 9jTxnpnATwMmNFeKSrqC4bcgG6au9ipZKkCQaz2Kjw9ntCtLT4wlNlD2zsL0Runwep9R
 mkUtvOBTM0VDmApFcRHBnM86Z9E1zXABqYpslA6CSsFD479CyWwkdMXgwVT1U2IXTx9F
 KPxw==
X-Gm-Message-State: AOAM532oTAQ3nn/7VR/GuHY7gkWkXP6HK91MtHI/4bbx/fH0IJiZUktA
 kZ02ox/paWhL4+sSBB5FZ0TIlq1UJfQ=
X-Google-Smtp-Source: ABdhPJw5aidY05pDdf151pOu8+9XKa13pjvSkry29NKrLblhWBL9CrPERwxVAo254nj/BiGDLvYCTw==
X-Received: by 2002:a1c:62d6:: with SMTP id w205mr2735145wmb.97.1591083757916; 
 Tue, 02 Jun 2020 00:42:37 -0700 (PDT)
Received: from t440p.suse.asia (60-251-47-115.HINET-IP.hinet.net.
 [60.251.47.115])
 by smtp.gmail.com with ESMTPSA id w3sm2294518wmg.44.2020.06.02.00.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 00:42:37 -0700 (PDT)
From: Lin Ma <lma@suse.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] block: Add block accounting code for GET LBA STATUS
Date: Tue,  2 Jun 2020 15:42:00 +0800
Message-Id: <20200602074201.10879-4-lma@suse.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200602074201.10879-1-lma@suse.com>
References: <20200602074201.10879-1-lma@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=morecache@gmail.com; helo=mail-wm1-x32e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, stefanha@redhat.com, Lin Ma <lma@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Lin Ma <lma@suse.com>
---
 include/block/accounting.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/block/accounting.h b/include/block/accounting.h
index 878b4c3581..645014fb0b 100644
--- a/include/block/accounting.h
+++ b/include/block/accounting.h
@@ -38,6 +38,7 @@ enum BlockAcctType {
     BLOCK_ACCT_WRITE,
     BLOCK_ACCT_FLUSH,
     BLOCK_ACCT_UNMAP,
+    BLOCK_ACCT_GET_LBA_STATUS,
     BLOCK_MAX_IOTYPE,
 };
 
-- 
2.24.0


