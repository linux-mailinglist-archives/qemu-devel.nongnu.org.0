Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC8648B62F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 19:54:57 +0100 (CET)
Received: from localhost ([::1]:38778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7MIJ-00017B-QE
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 13:54:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7M7Q-00040Z-LG; Tue, 11 Jan 2022 13:43:41 -0500
Received: from [2a00:1450:4864:20::430] (port=39626
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7M7O-0005yT-50; Tue, 11 Jan 2022 13:43:39 -0500
Received: by mail-wr1-x430.google.com with SMTP id s1so34723517wra.6;
 Tue, 11 Jan 2022 10:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I1fo9pTJV9kwudtw7Cm4x1xO6KpX2sCb2pysmnsHMNg=;
 b=YBip+L7kXC67CdgRkRIs8tBwvRYSeKRGy8J11NT+yxJPONKZTqynBQMztsqgedvN4D
 32nOFVl6TZvo29eaNV5Pc3m57q6rgUSjHQ66VduSA4dA80ZsRh+mEDtzlh/FwsSIgKCM
 8lk86MkKY6Un6KJjriA8irSg7SFIEGlN+lpSLFzvcvh4/seAw999TbKV8rl7GY+LpyVb
 16CIinhBpkaHko/Nht65DwlGyRDMML//VToskBSv/fS1Bfs/kSDnhGSW57915/G3UOuK
 szdSAxOQS4vzIUf/cUYk0ywiLdtN+iufwg20xHavPlw/HIsFn9xNyriDagdr+gj6sd/B
 v2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=I1fo9pTJV9kwudtw7Cm4x1xO6KpX2sCb2pysmnsHMNg=;
 b=PQQkQL11rJTuG7BssV5CIbNgC2OnwpoVWK/9fcqLW59KehM6B71P5xbi4+WBQJuFVC
 i3jsmuR1Djb3QUIQDfQhaum4t0kAGVVhAtxjMDvmTvw0Mc6UKu8O/zy2UbLvlfaCkENL
 tnDD56kOwvVwu3Hg72ieVoNVlcSUxqOELA01uic9o/g9KVMR4Oo3K2RRzqKynev1l8Aa
 rMNsAp0N/PGTU/ZjoTktaKWA9x9ybXuT8jXGR83MK07J5oAby+Z2NuxYx3dmQAXMQ2wV
 jIq08dNDTSvMGMgJ4BR2Ui2cNNhe+w99w5I+jRmXFSI59ee43xdJExYa7OHcNG3omeEs
 riUw==
X-Gm-Message-State: AOAM5332+XPX/7xs8UDz4lxyIu1B7Mx9wY6ZG+Cdq3FQYcVnDB1pvPmM
 uUzALphFdL1xhdNs2SzgUcuewaGx8Vo+Cg==
X-Google-Smtp-Source: ABdhPJyMms4DlD416KtIOB+RGNKtbViwU1pPCug71yEGdKbGit5AVFAfoQOZQ3eWqTymwYLhD4/RSw==
X-Received: by 2002:adf:e291:: with SMTP id v17mr4886104wri.479.1641926616320; 
 Tue, 11 Jan 2022 10:43:36 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id o5sm2333871wmc.39.2022.01.11.10.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 10:43:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/10] hw/dma: Remove CONFIG_USER_ONLY check
Date: Tue, 11 Jan 2022 19:43:04 +0100
Message-Id: <20220111184309.28637-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111184309.28637-1-f4bug@amsat.org>
References: <20220111184309.28637-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

DMA API should not be included in user-mode emulation.
If so, build should fail. Remove the CONFIG_USER_ONLY check.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/dma.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index b3faef41b2f..0db2478a506 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -31,8 +31,6 @@ struct QEMUSGList {
     AddressSpace *as;
 };
 
-#ifndef CONFIG_USER_ONLY
-
 /*
  * When an IOMMU is present, bus addresses become distinct from
  * CPU/memory physical addresses and may be a different size.  Because
@@ -288,7 +286,6 @@ void qemu_sglist_init(QEMUSGList *qsg, DeviceState *dev, int alloc_hint,
                       AddressSpace *as);
 void qemu_sglist_add(QEMUSGList *qsg, dma_addr_t base, dma_addr_t len);
 void qemu_sglist_destroy(QEMUSGList *qsg);
-#endif
 
 typedef BlockAIOCB *DMAIOFunc(int64_t offset, QEMUIOVector *iov,
                               BlockCompletionFunc *cb, void *cb_opaque,
-- 
2.34.1


