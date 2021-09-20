Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0CC411757
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:43:50 +0200 (CEST)
Received: from localhost ([::1]:42528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKWL-0005Gp-AE
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9b-0002m0-Vj
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:20 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9D-0000lC-LO
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:18 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t18so30265391wrb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CNuTgPZH4EFdl0ruQsVVTdaAPpqvXTlOyQjvdpApIMw=;
 b=akClpeXAoo00aZcHU/A7EojXjkVVQhHLqkypgYdr68LuIVvgG5XpGix+oiMZqmlkrp
 +i5vXLCI9bJR6zuJ4Rcao37e/G12AoiD+7CP3Bcs7O0596vTQmUAumrKYNW6U5GpR/HA
 obd+V26brttGA9GPY6U3Y7Q7yyZ1lcjF5FcsRr7OohnpbSxMoDwI8JmjNLe3dBq8NY6L
 wBM7C6rlBw5rFo59p6H5OvkVetTpgeBcZKa3/6z37CMMZrPzJkSo/wx5hy0tQOyEWVcY
 52STV5AyOPTEw91/QTcM6HYMpCmYkqBTv3td1JJGtS95zh9C0zaLHzZKrIPqKomeHqj3
 t6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CNuTgPZH4EFdl0ruQsVVTdaAPpqvXTlOyQjvdpApIMw=;
 b=63RZDM0YNAUEvJ7IBSsVMNezbNuu54D+jJ1ccNIoiZq3efh6w/PIY0/W4NAIAMQqLl
 EOsjh8YtUDT1fJ1ogt4ofC1KTBdJUsBW7mNq4E5qv/rvQTvCEAnCGficM15uUAfwRFMd
 Iz1Bbqxsl//zWQAB7YuhWHwxyFzNJzQM5053ToK2hLHrtGAhG20Gnul6LnlPo9rETS1F
 bIUPM13QRCdUPKHuQHuScTF4FAyN6NxddaMYhruN92DUdODm3alAjZCQLzgSQPGW7jdE
 aOw3XU5MWt84D1KXv+fMMzePUX6vr1i7ZpRaM7kjvLZgZaeEIbqRkGRHsJX9P4MMlAQd
 ivYg==
X-Gm-Message-State: AOAM5325qVfsY64KzzWXP8SgSYz9OTzvuDZpNVxgb9IQp5eoH8O2E2xU
 9k1eDq7xl4N0zUuMlofja0KODnEVBkKuYQ==
X-Google-Smtp-Source: ABdhPJzIyY7iXD+9rlheptBPS+GEc+yghMXhkd2Sjf5cLjA5CeGWhdx5oS5eMWFcdq4dreTtgtTPvw==
X-Received: by 2002:a1c:1b10:: with SMTP id b16mr24515050wmb.194.1632147590770; 
 Mon, 20 Sep 2021 07:19:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.19.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:19:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/27] elf2dmp: Fail cleanly if PDB file specifies zero
 block_size
Date: Mon, 20 Sep 2021 15:19:22 +0100
Message-Id: <20210920141947.5537-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity points out that if the PDB file we're trying to read
has a header specifying a block_size of zero then we will
end up trying to divide by zero in pdb_ds_read_file().
Check for this and fail cleanly instead.

Fixes: Coverity CID 1458869
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Message-id: 20210910170656.366592-3-philmd@redhat.com
Message-Id: <20210901143910.17112-3-peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 contrib/elf2dmp/pdb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/contrib/elf2dmp/pdb.c b/contrib/elf2dmp/pdb.c
index b3a65470680..adcfa7e154c 100644
--- a/contrib/elf2dmp/pdb.c
+++ b/contrib/elf2dmp/pdb.c
@@ -215,6 +215,10 @@ out_symbols:
 
 static int pdb_reader_ds_init(struct pdb_reader *r, PDB_DS_HEADER *hdr)
 {
+    if (hdr->block_size == 0) {
+        return 1;
+    }
+
     memset(r->file_used, 0, sizeof(r->file_used));
     r->ds.header = hdr;
     r->ds.toc = pdb_ds_read(hdr, (uint32_t *)((uint8_t *)hdr +
-- 
2.20.1


