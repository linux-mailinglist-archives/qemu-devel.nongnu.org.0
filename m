Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E892483E8E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:58:02 +0100 (CET)
Received: from localhost ([::1]:38876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fdp-0002wX-JA
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:58:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4faq-0008A5-Tg; Tue, 04 Jan 2022 03:54:57 -0500
Received: from [2a00:1450:4864:20::32a] (port=41820
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4fao-0007qh-So; Tue, 04 Jan 2022 03:54:56 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 b186-20020a1c1bc3000000b00345734afe78so1062659wmb.0; 
 Tue, 04 Jan 2022 00:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yvZa8b0WHcG2jEyELY6TUmGBIF4NV8nnHE4fxcg5oio=;
 b=g6nj9j8JrL95fVT5zjGsSHYoNN7XUU6cCK6X/6IbBZ5x+EvuMvGuI5OKmpYIBVlHNm
 Z5/58QuQh/vMM+08mfzF2jxxYfueGNRXXUM7WkDolWETpc6s129GIR2JOEZt0Uk5Kwfl
 dyvMDk2FtP8It9pUXICcPQuCO8vVl/VjWr+lMa84T96u+VVjzwtDaWWy5mFZuUku/ARX
 vD9onWbDEBu567kwjPYZm4WqHrXjf71Hu1A3/87E9/2JX/3CXoiQzEeQDrPpLFNT7M/+
 kDJYNrLM4UT2IhHP43khmqWmbnQBBx7Z/jnzqJb9YSI2ErH38vXiqNElLn/+u5WTJY3L
 NJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yvZa8b0WHcG2jEyELY6TUmGBIF4NV8nnHE4fxcg5oio=;
 b=uoKQI2OPRW5TPzSObPxjLEZtLVlnRzVsdmeQDy+A7RpcXmRw1E8p1CPwSaaDZ4TsTq
 Ik5wwsj63xyLXnYZ2KKR51dUxH6tLsICF1z90RupVtAH3eEZbRu3W+oUctry8mDKvhss
 n+86Wzvf9XlxSCXkhIe5+cYO4O1WDhPf4bYbIFVKY0pv4yMso4m2atJc3WUlBbl8WGsm
 bQiM8qNQmw8Sfy2uebVxgMyq1Poi6XRQ2ChK+NXebRU1v1WOqi6UlKh/H1+TCt4CzE+e
 tWpjc+jdA0fYqn5RcdzLptP0x6XMy//aKxDQWeeQAlkuDBKZwetrRlNSkHv1qkkH7D3m
 x2jA==
X-Gm-Message-State: AOAM532VQMQqtNBHqI67tshYpxEa7N7e7YxBicc3BbZfBnW9HcaqIGSe
 qFaubGwfgVlXxLdQv/uTUF6u/kwSPJvlmA==
X-Google-Smtp-Source: ABdhPJwgiFY2RpJKFcyhpprvhgR/vzhQBUWzykDcC8yWRIdLtUldVwkgYFfoFXFcsFS4KCsWIPqp3g==
X-Received: by 2002:a05:600c:3514:: with SMTP id
 h20mr41249559wmq.62.1641286493150; 
 Tue, 04 Jan 2022 00:54:53 -0800 (PST)
Received: from x1w.. (26.red-83-50-86.dynamicip.rima-tde.net. [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id s207sm36214809wme.2.2022.01.04.00.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 00:54:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/9] hw/dma: Remove CONFIG_USER_ONLY check
Date: Tue,  4 Jan 2022 09:54:26 +0100
Message-Id: <20220104085431.2122999-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104085431.2122999-1-f4bug@amsat.org>
References: <20220104085431.2122999-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

DMA API should not be included in user-mode emulation.
If so, build should fail. Remove the CONFIG_USER_ONLY check.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
2.33.1


