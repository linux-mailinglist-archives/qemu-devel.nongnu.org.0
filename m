Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFA1336EF2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:33:27 +0100 (CET)
Received: from localhost ([::1]:53532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHh8-00082K-R8
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:33:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBnx-0001QU-2i
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:16:08 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBnr-0000in-6F
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:16:04 -0500
Received: by mail-wm1-x336.google.com with SMTP id g8so406361wmd.4
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 19:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zX70OthGxIYe1y3qnfX85F6yKaVEwpmYazrdXdQQtp0=;
 b=ubFgcdZQLGlwqX9RQiPp7Ws5+h6kj5hGZK0+hOXZCo87O8F/09LG9g8v8RRZYMC/88
 5WLK0hG2JH7vszrcU8yuH5DJckqP70JJlXPZjgYUv46Ko4Pvsu+PJRH1klmmXeDHn/KG
 wSlcsPgjaCLIoFx4ToQND8+cEnsXQaizCY6s5UefD6pwrDLgfNmwPqywjy2UNdjcBfyi
 30PcHHFScPmPHPlt/Q+8tKDCU+TdOLFZoyEoXoxnX+L+0/apRvq/XkHU3FsRgUrWVB2U
 l4iHzVE9UmYuRk4prUuoAeuunZXw3sWsBnVDIsQnX5Rwb3vpeNDF9dYL6noVp1ugKzBE
 dTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zX70OthGxIYe1y3qnfX85F6yKaVEwpmYazrdXdQQtp0=;
 b=gi3CGKVy5bqBZ0Wr53nQCGEHmaASWCd7NzpS68dCd2pPwOKwsHj8lZA7NXyzlzjJjO
 M50jvcNy/3HZaafBzj69NYA1rai5yqVxnsL8rR6fwU/fwQcPtYRyTuHnwQ3MmN6Agcsq
 U5vhjy1MLtWWOxKKYtjtehh/ULXH/kTVc7n6ml7s4F7qcyROSbIGt4GUVNmfLCQNkUXO
 FAAW5MInHoT1tND77dalMhoyQXO7GlwF9yqHnUmZt1HHEPHZWTridD/H1tMxan1n01Vv
 ZWQMY5TwYHuQu/pD5S9WJ3uL7Q/jfevL1xDZyPYs7wb7M8xlZdN2EZOFsmp+J0I+vcii
 gRAw==
X-Gm-Message-State: AOAM530vbzuXJHph326D3mvb8pXA/SHUIloIk0SUd7rLjXVuZmdVfgl+
 RD5gfVCpIv5MbYSfuJGvfJ+Lp6aph0batKTzsR0=
X-Google-Smtp-Source: ABdhPJws40Y9qCORX9Wz0U3b9jyW66y8t6Rhr7/2JxnyS1eP+VG8OJ1AFGnZuvMdNDdTnsbJNh4RXA==
X-Received: by 2002:a1c:a791:: with SMTP id q139mr5968056wme.20.1615432557640; 
 Wed, 10 Mar 2021 19:15:57 -0800 (PST)
Received: from localhost.localdomain ([197.61.47.225])
 by smtp.googlemail.com with ESMTPSA id o188sm1450416wme.7.2021.03.10.19.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 19:15:57 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] virtio-iommu: Replaced qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
Date: Thu, 11 Mar 2021 05:15:36 +0200
Message-Id: <20210311031538.5325-8-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311031538.5325-1-ma.mandourr@gmail.com>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Mar 2021 04:24:56 -0500
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
Cc: Eric Auger <eric.auger@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In various places, qemu_mutex_lock calls and their respective
calls to qemu_mutex_unlock are replaced with QEMU_LOCK_GUARD macros.
This simplifies the code by removing the calls to
qemu_mutex_unlock and eliminates goto paths.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 hw/virtio/virtio-iommu.c | 78 +++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 42 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index c2883a2f6c..46a4cc0801 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -604,37 +604,36 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
             tail.status = VIRTIO_IOMMU_S_DEVERR;
             goto out;
         }
-        qemu_mutex_lock(&s->mutex);
-        switch (head.type) {
-        case VIRTIO_IOMMU_T_ATTACH:
-            tail.status = virtio_iommu_handle_attach(s, iov, iov_cnt);
-            break;
-        case VIRTIO_IOMMU_T_DETACH:
-            tail.status = virtio_iommu_handle_detach(s, iov, iov_cnt);
-            break;
-        case VIRTIO_IOMMU_T_MAP:
-            tail.status = virtio_iommu_handle_map(s, iov, iov_cnt);
-            break;
-        case VIRTIO_IOMMU_T_UNMAP:
-            tail.status = virtio_iommu_handle_unmap(s, iov, iov_cnt);
-            break;
-        case VIRTIO_IOMMU_T_PROBE:
-        {
-            struct virtio_iommu_req_tail *ptail;
+        WITH_QEMU_LOCK_GUARD(&s->mutex) {
+            switch (head.type) {
+            case VIRTIO_IOMMU_T_ATTACH:
+                tail.status = virtio_iommu_handle_attach(s, iov, iov_cnt);
+                break;
+            case VIRTIO_IOMMU_T_DETACH:
+                tail.status = virtio_iommu_handle_detach(s, iov, iov_cnt);
+                break;
+            case VIRTIO_IOMMU_T_MAP:
+                tail.status = virtio_iommu_handle_map(s, iov, iov_cnt);
+                break;
+            case VIRTIO_IOMMU_T_UNMAP:
+                tail.status = virtio_iommu_handle_unmap(s, iov, iov_cnt);
+                break;
+            case VIRTIO_IOMMU_T_PROBE:
+            {
+                struct virtio_iommu_req_tail *ptail;
 
-            output_size = s->config.probe_size + sizeof(tail);
-            buf = g_malloc0(output_size);
+                output_size = s->config.probe_size + sizeof(tail);
+                buf = g_malloc0(output_size);
 
-            ptail = (struct virtio_iommu_req_tail *)
-                        (buf + s->config.probe_size);
-            ptail->status = virtio_iommu_handle_probe(s, iov, iov_cnt, buf);
-            break;
-        }
-        default:
-            tail.status = VIRTIO_IOMMU_S_UNSUPP;
+                ptail = (struct virtio_iommu_req_tail *)
+                            (buf + s->config.probe_size);
+                ptail->status = virtio_iommu_handle_probe(s, iov, iov_cnt, buf);
+                break;
+            }
+            default:
+                tail.status = VIRTIO_IOMMU_S_UNSUPP;
+            }
         }
-        qemu_mutex_unlock(&s->mutex);
-
 out:
         sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
                           buf ? buf : &tail, output_size);
@@ -721,7 +720,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     sid = virtio_iommu_get_bdf(sdev);
 
     trace_virtio_iommu_translate(mr->parent_obj.name, sid, addr, flag);
-    qemu_mutex_lock(&s->mutex);
+    QEMU_LOCK_GUARD(&s->mutex);
 
     ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
     if (!ep) {
@@ -733,7 +732,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         } else {
             entry.perm = flag;
         }
-        goto unlock;
+        return entry;
     }
 
     for (i = 0; i < s->nb_reserved_regions; i++) {
@@ -751,7 +750,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
                                           sid, addr);
                 break;
             }
-            goto unlock;
+            return entry;
         }
     }
 
@@ -766,7 +765,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         } else {
             entry.perm = flag;
         }
-        goto unlock;
+        return entry;
     }
 
     found = g_tree_lookup_extended(ep->domain->mappings, (gpointer)(&interval),
@@ -778,7 +777,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
                                   VIRTIO_IOMMU_FAULT_F_ADDRESS,
                                   sid, addr);
-        goto unlock;
+        return entry;
     }
 
     read_fault = (flag & IOMMU_RO) &&
@@ -795,14 +794,12 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
                                   flags | VIRTIO_IOMMU_FAULT_F_ADDRESS,
                                   sid, addr);
-        goto unlock;
+        return entry;
     }
     entry.translated_addr = addr - mapping_key->low + mapping_value->phys_addr;
     entry.perm = flag;
     trace_virtio_iommu_translate_out(addr, entry.translated_addr, sid);
 
-unlock:
-    qemu_mutex_unlock(&s->mutex);
     return entry;
 }
 
@@ -871,21 +868,18 @@ static void virtio_iommu_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
 
     sid = virtio_iommu_get_bdf(sdev);
 
-    qemu_mutex_lock(&s->mutex);
+    QEMU_LOCK_GUARD(&s->mutex);
 
     if (!s->endpoints) {
-        goto unlock;
+        return;
     }
 
     ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
     if (!ep || !ep->domain) {
-        goto unlock;
+        return;
     }
 
     g_tree_foreach(ep->domain->mappings, virtio_iommu_remap, mr);
-
-unlock:
-    qemu_mutex_unlock(&s->mutex);
 }
 
 static int virtio_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu_mr,
-- 
2.25.1


