Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E52400276
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:39:31 +0200 (CEST)
Received: from localhost ([::1]:38446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBHu-00067b-Jb
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMBGz-0005RD-SX
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:38:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMBGx-0002R7-Fs
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630683509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DpvGPodUqzAwySzW1P1//vFtQok8MYmKbF2y9o9SvwA=;
 b=dHNvoWTZAsseOH4ui+N67m/RVvL7VY28+vka4cmjnBbK3Fbo/zWB36iDHCLK8Hfd4xXOxB
 VG00+jBg8yHc1ry5TqkwU/WliLOgkmdZBiVicRRN4SMVsT/PBr/QGdc14K/q+Mn+sEXyXz
 /F4/qDoLzxeEBDEdAhW/7fOewQgcBnI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-EcsRdRVXODmBX_hsDDB7AQ-1; Fri, 03 Sep 2021 11:38:27 -0400
X-MC-Unique: EcsRdRVXODmBX_hsDDB7AQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 n16-20020a1c7210000000b002ea2ed60dc6so1956895wmc.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 08:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DpvGPodUqzAwySzW1P1//vFtQok8MYmKbF2y9o9SvwA=;
 b=hkqs2/OOEM8ZIVyFpchZiQxdeSqbTnvVxMoyXfvQ0+sQiULeriWmZ4smZwEjDi6GV3
 igc6tnwqImvzESeZjd0PFJENVBBb0v4NAUJtEtwvQ3IZVPxQDenAcRrXp1vz/68MqOwG
 Bcemy+J2nOHE8UntiCQEQO9+GZLh71AvpEpaOhZc9ePJXNrZSOt80r6/M61kNG++NcbA
 7j3xhnWVLQbp0DLtTvlvDvaF1fUsQbbX+WURsDjan/+NT4iFNwkyWnaQiPcR8nrlwEze
 7CVhleiDS7RH+F+sj1A+Peu8Gmj485njX449inWfNdYBljiuMRPgUWrAi1dGECA7yU4u
 Ogfw==
X-Gm-Message-State: AOAM533gtXSMyQliuSYh0OQJ3AQTvFfidgPuzjuOsxAwpNB3Ah+XPX+/
 Ky0zYbuaw0dJ0HF0IKW/Bq7PeAJUYBPiwTSZMAGt9edCgHnO8mhRUSCFcC8+7cO4JV0IVlzrVxp
 7NqQh9jK00kiWOhfhMJOvBRSVUdAoANNrOOTIyBv2djZWGH+eACKbUwUYX1eSkMtb
X-Received: by 2002:a05:600c:295:: with SMTP id
 21mr1029727wmk.37.1630683506139; 
 Fri, 03 Sep 2021 08:38:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGsUpHSYREAxrTLacfKrjl+3DWt9mS5TtTtEeIk298GOGIbYFuX1cQH5cGqSlKYKltKrzyOg==
X-Received: by 2002:a05:600c:295:: with SMTP id
 21mr1029702wmk.37.1630683505897; 
 Fri, 03 Sep 2021 08:38:25 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 x11sm4961374wro.83.2021.09.03.08.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 08:38:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH] physmem: Do not allow unprivileged device map privileged
 memory
Date: Fri,  3 Sep 2021 17:38:20 +0200
Message-Id: <20210903153820.686913-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: David Hildenbrand <david@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commits cc05c43ad94..42874d3a8c6 ("memory: Define API for
MemoryRegionOps to take attrs and return status") the Memory API
returns a zero (MEMTX_OK) response meaning success, anything else
indicating a failure.

In commits c874dc4f5e8..2f7b009c2e7 ("Make address_space_map() take
a MemTxAttrs argument") we updated the AddressSpace and FlatView
APIs but forgot to check the returned value by the FlatView from
the MemoryRegion.

Adjust that now, only returning a non-NULL address if the transaction
succeeded with the requested memory attributes.

Reported-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
RFC because this could become a security issue in a core component,
    however currently all callers pass MEMTXATTRS_UNSPECIFIED.
---
 include/exec/memory.h |  3 ++-
 softmmu/physmem.c     | 16 ++++++++++------
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c3d417d317f..488d2ecdd09 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2706,7 +2706,8 @@ bool address_space_access_valid(AddressSpace *as, hwaddr addr, hwaddr len,
  *
  * May map a subset of the requested range, given by and returned in @plen.
  * May return %NULL and set *@plen to zero(0), if resources needed to perform
- * the mapping are exhausted.
+ * the mapping are exhausted or if the physical memory region is not accessible
+ * for the requested memory attributes.
  * Use only for reads OR writes - not for read-modify-write operations.
  * Use cpu_register_map_client() to know when retrying the map operation is
  * likely to succeed.
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 23e77cb7715..802c339f6d2 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3188,15 +3188,19 @@ void *address_space_map(AddressSpace *as,
         /* Avoid unbounded allocations */
         l = MIN(l, TARGET_PAGE_SIZE);
         bounce.buffer = qemu_memalign(TARGET_PAGE_SIZE, l);
+
+        if (!is_write) {
+            if (flatview_read(fv, addr, attrs, bounce.buffer, l) != MEMTX_OK) {
+                qemu_vfree(bounce.buffer);
+                *plen = 0;
+                return NULL;
+            }
+        }
+
         bounce.addr = addr;
         bounce.len = l;
-
-        memory_region_ref(mr);
         bounce.mr = mr;
-        if (!is_write) {
-            flatview_read(fv, addr, MEMTXATTRS_UNSPECIFIED,
-                               bounce.buffer, l);
-        }
+        memory_region_ref(mr);
 
         *plen = l;
         return bounce.buffer;
-- 
2.31.1


