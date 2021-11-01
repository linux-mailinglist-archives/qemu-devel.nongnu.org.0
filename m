Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B7D442362
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:27:01 +0100 (CET)
Received: from localhost ([::1]:48074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhfld-00044t-0W
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUv-0007QB-9P
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUt-0000es-Mk
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635804582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2DiI4EfnW7YWT1ASaakXUWvRZyN7+/5k2450FBy0sI4=;
 b=de7Q1lob8fEuDpGz4btqF8OXeMLKOZqegQhSq7PmRPUpfzweKZ9aneIzihTtvQzjY3IbBh
 ljVjH/fDBJ8ujskN+m/rgo85/+fRyWCuyyf5jjtE27vaMnF9DFLpg2dXLKCTt1UgIIfjl8
 Vy4VYVoYxNdE0Qmziouu8/SeX7RYnqU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-kGHplSG1MI6JYejpGrUtww-1; Mon, 01 Nov 2021 18:09:41 -0400
X-MC-Unique: kGHplSG1MI6JYejpGrUtww-1
Received: by mail-wr1-f70.google.com with SMTP id
 c4-20020adfed84000000b00185ca4eba36so1640217wro.21
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2DiI4EfnW7YWT1ASaakXUWvRZyN7+/5k2450FBy0sI4=;
 b=iCVAI84Y6WS99vBr2wiJqDY4c2Cs1PjCFznPVC+5/hAsnUx6jXnPXzca8GWRxAykRF
 tHVmNS+af9JQiPpzxLbs3Q0KbaDTqmUkfKJOnijdK6iDUKSz8QiVMBKgGPc80cDhRR5c
 sjxIlOJz+yaO2ej9hEml0VCvLdGT4SjRsO0YXUClL63QmY2aWo1N3YeetzOrrHx3Nqyl
 qOPVJBbLTBz1lqkuSRfim19wk3rf8tbjBqQYU72hM5It1/w+XhEBINqFVmb2RwxzmKlL
 1cnt71nsW6KBtb4m+3Ta4Q8c1YnJAeltD8QGmrO3iqvPPolamciZz8wkBiZqi6tSyszK
 r3Zw==
X-Gm-Message-State: AOAM530wYqvzopFY+Cr5Tmc6iNm7RPgQqhSSxQTD7DKetWBeyMXfDqKp
 pDNA0lU0VhXWLV5l4w8UNkYbUxLwFWXyNcdcaLpaIU8MKo5s8QMKs8PwYRcdG99jUKwYIIPVWZO
 mSuiPeNKW54euoz+Ai3IGWIY+PSCseep4Zp7+CsFSy3DKMq4XhZLhpVv0P6K3xfZTFcA=
X-Received: by 2002:adf:e292:: with SMTP id v18mr39964933wri.369.1635804580016; 
 Mon, 01 Nov 2021 15:09:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysID67lQG9xljT2Fw7myH50fBYiqoMMqtw2ZP9fgHwBDYxBz5RqDHeu2EAgEpnNBhOmOcEEQ==
X-Received: by 2002:adf:e292:: with SMTP id v18mr39964906wri.369.1635804579845; 
 Mon, 01 Nov 2021 15:09:39 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id d24sm610262wmb.35.2021.11.01.15.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:39 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/20] memory: introduce total_dirty_pages to stat dirty pages
Date: Mon,  1 Nov 2021 23:09:11 +0100
Message-Id: <20211101220912.10039-20-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?=
 <huangy81@chinatelecom.cn>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

introduce global var total_dirty_pages to stat dirty pages
along with memory_global_dirty_log_sync.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/exec/ram_addr.h | 9 +++++++++
 migration/dirtyrate.c   | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 45c913264a..64fb936c7c 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -26,6 +26,8 @@
 #include "exec/ramlist.h"
 #include "exec/ramblock.h"
 
+extern uint64_t total_dirty_pages;
+
 /**
  * clear_bmap_size: calculate clear bitmap size
  *
@@ -373,6 +375,10 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
                         qatomic_or(
                                 &blocks[DIRTY_MEMORY_MIGRATION][idx][offset],
                                 temp);
+                        if (unlikely(
+                            global_dirty_tracking & GLOBAL_DIRTY_DIRTY_RATE)) {
+                            total_dirty_pages += ctpopl(temp);
+                        }
                     }
 
                     if (tcg_enabled()) {
@@ -403,6 +409,9 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
         for (i = 0; i < len; i++) {
             if (bitmap[i] != 0) {
                 c = leul_to_cpu(bitmap[i]);
+                if (unlikely(global_dirty_tracking & GLOBAL_DIRTY_DIRTY_RATE)) {
+                    total_dirty_pages += ctpopl(c);
+                }
                 do {
                     j = ctzl(c);
                     c &= ~(1ul << j);
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index f92c4b498e..17b3d2cbb5 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -28,6 +28,13 @@
 #include "sysemu/runstate.h"
 #include "exec/memory.h"
 
+/*
+ * total_dirty_pages is procted by BQL and is used
+ * to stat dirty pages during the period of two
+ * memory_global_dirty_log_sync
+ */
+uint64_t total_dirty_pages;
+
 typedef struct DirtyPageRecord {
     uint64_t start_pages;
     uint64_t end_pages;
-- 
2.33.1


