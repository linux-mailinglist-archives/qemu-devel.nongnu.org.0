Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 056B652832A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:25:39 +0200 (CEST)
Received: from localhost ([::1]:54556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYr4-0000Y9-3O
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6q-0007Pl-KE
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6n-0005PM-FP
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UmKaO9ErPymS/NDPUvKxYPd4cFxGnR8YHhKpxoKlU3Q=;
 b=WPpvZCKtSItovX99BXF8PvghBTFtU31r2srCi5KEDuQehWwcUg9UOfdAV+KTxEqZKkmE4r
 bT4kVlt9J5reHJTcSeTCrM239X9MI1kV1t88CN1aOozNiu4OyxBQn+dTLMinCx3nFAmOml
 jtP1KRoaCftzSae/bPGWSar5fKcD7EM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-6gAAXp-MNmer00UcE3xiZQ-1; Mon, 16 May 2022 06:37:47 -0400
X-MC-Unique: 6gAAXp-MNmer00UcE3xiZQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so5466633wmj.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UmKaO9ErPymS/NDPUvKxYPd4cFxGnR8YHhKpxoKlU3Q=;
 b=V1hV6rHcDfImfmS7q69AV8dWyG1/EzCLo6DeELYBYVtx0pH0zVtyY9qA5Us1EI+YhC
 IfOX99wxYnPkwGaLURgjAB8apZEjCt+K3qgq20xtUyuXa7WRYnJGenC4JxdKHDG9ld9i
 9S9cEQ8F2ib4cg1eAtp192OzMUtLM/E5KtLQWBCtIRnoAtVcWfHgZ0DZKWbYmvPuWZkn
 +45cd34crZ4FsVKP72ut0HR8CGH9iN750n9BE1Hwptvygt5pP9nXRbcbxm99pl5s/qOb
 5OZfhrbGaN7zjcBLVm7wKLtiNbFNlh3nScVCfPOJ4NqYJasd+vVNukVsYWez6LaxL6gR
 lNtA==
X-Gm-Message-State: AOAM531kDfTl6YIQ5H/oiUeOC/kIbKPggeWnfEC3/drD8luBTjvNhqbA
 lNJLcpmKjOpzUPmEslDgVVooL5DxzCfu+Dyu2fYe+iKgiiRxkbimoDq5HM5qGiMecCkz3vCScBE
 mjxipwDNk4pcLlDCxrZ6krHjAh70BcBw0rtue/nKOCZngxjwWQBrVSlGWe0VR
X-Received: by 2002:adf:ee8c:0:b0:20d:118c:3864 with SMTP id
 b12-20020adfee8c000000b0020d118c3864mr454513wro.227.1652697465963; 
 Mon, 16 May 2022 03:37:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzutqCgJQ0kUJ115GO2AlRA/kdsjYqF4dJeSNul/Jq2xn+yr9V0Tgia0Alc6UpTZj88FAyklg==
X-Received: by 2002:adf:ee8c:0:b0:20d:118c:3864 with SMTP id
 b12-20020adfee8c000000b0020d118c3864mr454495wro.227.1652697465724; 
 Mon, 16 May 2022 03:37:45 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 k25-20020a7bc419000000b003970b2fa72dsm1692745wmi.22.2022.05.16.03.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:37:45 -0700 (PDT)
Date: Mon, 16 May 2022 06:37:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PULL 36/91] hw/cxl/component Add a dumb HDM decoder handler
Message-ID: <20220516095448.507876-37-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Ben Widawsky <ben.widawsky@intel.com>

Add a trivial handler for now to cover the root bridge
where we could do some error checking in future.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220429144110.25167-35-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/cxl/cxl-component-utils.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
index 69cb07171c..7985c9bfca 100644
--- a/hw/cxl/cxl-component-utils.c
+++ b/hw/cxl/cxl-component-utils.c
@@ -32,6 +32,31 @@ static uint64_t cxl_cache_mem_read_reg(void *opaque, hwaddr offset,
     }
 }
 
+static void dumb_hdm_handler(CXLComponentState *cxl_cstate, hwaddr offset,
+                             uint32_t value)
+{
+    ComponentRegisters *cregs = &cxl_cstate->crb;
+    uint32_t *cache_mem = cregs->cache_mem_registers;
+    bool should_commit = false;
+
+    switch (offset) {
+    case A_CXL_HDM_DECODER0_CTRL:
+        should_commit = FIELD_EX32(value, CXL_HDM_DECODER0_CTRL, COMMIT);
+        break;
+    default:
+        break;
+    }
+
+    memory_region_transaction_begin();
+    stl_le_p((uint8_t *)cache_mem + offset, value);
+    if (should_commit) {
+        ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
+        ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, ERR, 0);
+        ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
+    }
+    memory_region_transaction_commit();
+}
+
 static void cxl_cache_mem_write_reg(void *opaque, hwaddr offset, uint64_t value,
                                     unsigned size)
 {
@@ -50,6 +75,12 @@ static void cxl_cache_mem_write_reg(void *opaque, hwaddr offset, uint64_t value,
     value |= ~mask & cregs->cache_mem_registers[offset / sizeof(*cregs->cache_mem_registers)];
     if (cregs->special_ops && cregs->special_ops->write) {
         cregs->special_ops->write(cxl_cstate, offset, value, size);
+        return;
+    }
+
+    if (offset >= A_CXL_HDM_DECODER_CAPABILITY &&
+        offset <= A_CXL_HDM_DECODER0_TARGET_LIST_HI) {
+        dumb_hdm_handler(cxl_cstate, offset, value);
     } else {
         cregs->cache_mem_registers[offset / sizeof(*cregs->cache_mem_registers)] = value;
     }
-- 
MST


