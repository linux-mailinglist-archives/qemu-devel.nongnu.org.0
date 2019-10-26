Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE2BE5FD3
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Oct 2019 00:12:07 +0200 (CEST)
Received: from localhost ([::1]:42980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iOUI2-0004K8-AC
	for lists+qemu-devel@lfdr.de; Sat, 26 Oct 2019 18:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60079)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iOTZk-00006p-9V
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 17:26:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iOTZi-0005Lw-D6
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 17:26:20 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:42512)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iOTZg-0005F6-8q; Sat, 26 Oct 2019 17:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=HiUDYygHbreOJ4VpTqnZuGeG1uwk96nU2SwXCxyXjEw=; 
 b=j0gLV97jy2dtp6fN4ao5MXiUEkJGBSIeXomTXpepfSmviYnsECbbpZOShqcOqdK8yQGYYpnPJZA/zSm8MMxUHOr7JgJFlgf74aoHoXmg9B1bjIMe92w72GuIFlZYj48tK969z1+r19FddpuUaCTLL8/R3XEr3P7onM28s49eRGYJutLGPfJ/d5dfIQiuRpYCjqTpmLmlwLD+wd7nJ067hwCP/dzNkTZqABBJM4Ev4fkbFm90O1xhNgCruvyMXDPx5IcV8Ijh27Ja8GHX5fNaDmu76R2W+jzOyoMvBAIM4Kj1dvmbQyA1PLW2hAl+sEBqUUBaHZwtl99VGAyClFzUiA==;
Received: from 87-100-137-117.bb.dnainternet.fi ([87.100.137.117]
 helo=perseus.local) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iOTZI-00045n-JI; Sat, 26 Oct 2019 23:25:52 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1iOTZ0-0001PA-7O; Sun, 27 Oct 2019 00:25:34 +0300
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 05/26] qcow2: Document the Extended L2 Entries feature
Date: Sun, 27 Oct 2019 00:25:07 +0300
Message-Id: <57cddd5db9c79406fba70a9bf46c436f6fc9ccd3.1572125022.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1572125022.git.berto@igalia.com>
References: <cover.1572125022.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Subcluster allocation in qcow2 is implemented by extending the
existing L2 table entries and adding additional information to
indicate the allocation status of each subcluster.

This patch documents the changes to the qcow2 format and how they
affect the calculation of the L2 cache size.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 docs/interop/qcow2.txt | 68 ++++++++++++++++++++++++++++++++++++++++--
 docs/qcow2-cache.txt   | 19 +++++++++++-
 2 files changed, 83 insertions(+), 4 deletions(-)

diff --git a/docs/interop/qcow2.txt b/docs/interop/qcow2.txt
index af5711e533..d34261f955 100644
--- a/docs/interop/qcow2.txt
+++ b/docs/interop/qcow2.txt
@@ -39,6 +39,9 @@ The first cluster of a qcow2 image contains the file header:
                     as the maximum cluster size and won't be able to open images
                     with larger cluster sizes.
 
+                    Note: if the image has Extended L2 Entries then cluster_bits
+                    must be at least 14 (i.e. 16384 byte clusters).
+
          24 - 31:   size
                     Virtual disk size in bytes.
 
@@ -109,7 +112,12 @@ in the description of a field.
                                 An External Data File Name header extension may
                                 be present if this bit is set.
 
-                    Bits 3-63:  Reserved (set to 0)
+                    Bit 3:      Extended L2 Entries.  If this bit is set then
+                                L2 table entries use an extended format that
+                                allows subcluster-based allocation. See the
+                                Extended L2 Entries section for more details.
+
+                    Bits 4-63:  Reserved (set to 0)
 
          80 -  87:  compatible_features
                     Bitmask of compatible features. An implementation can
@@ -437,7 +445,7 @@ cannot be relaxed without an incompatible layout change).
 Given an offset into the virtual disk, the offset into the image file can be
 obtained as follows:
 
-    l2_entries = (cluster_size / sizeof(uint64_t))
+    l2_entries = (cluster_size / sizeof(uint64_t))        [*]
 
     l2_index = (offset / cluster_size) % l2_entries
     l1_index = (offset / cluster_size) / l2_entries
@@ -447,6 +455,8 @@ obtained as follows:
 
     return cluster_offset + (offset % cluster_size)
 
+    [*] this changes if Extended L2 Entries are enabled, see next section
+
 L1 table entry:
 
     Bit  0 -  8:    Reserved (set to 0)
@@ -487,7 +497,8 @@ Standard Cluster Descriptor:
                     nor is data read from the backing file if the cluster is
                     unallocated.
 
-                    With version 2, this is always 0.
+                    With version 2 or with extended L2 entries (see the next
+                    section), this is always 0.
 
          1 -  8:    Reserved (set to 0)
 
@@ -524,6 +535,57 @@ file (except if bit 0 in the Standard Cluster Descriptor is set). If there is
 no backing file or the backing file is smaller than the image, they shall read
 zeros for all parts that are not covered by the backing file.
 
+== Extended L2 Entries ==
+
+An image uses Extended L2 Entries if bit 3 is set on the incompatible_features
+field of the header.
+
+In these images standard data clusters are divided into 32 subclusters of the
+same size. They are contiguous and start from the beginning of the cluster.
+Subclusters can be allocated independently and the L2 entry contains information
+indicating the status of each one of them. Compressed data clusters don't have
+subclusters so they are treated like in images without this feature.
+
+The size of an extended L2 entry is 128 bits so the number of entries per table
+is calculated using this formula:
+
+    l2_entries = (cluster_size / (2 * sizeof(uint64_t)))
+
+The first 64 bits have the same format as the standard L2 table entry described
+in the previous section, with the exception of bit 0 of the standard cluster
+descriptor.
+
+The last 64 bits contain a subcluster allocation bitmap with this format:
+
+Subcluster Allocation Bitmap (for standard clusters):
+
+    Bit  0 -  31:   Allocation status (one bit per subcluster)
+
+                    1: the subcluster is allocated. In this case the
+                       host cluster offset field must contain a valid
+                       offset.
+                    0: the subcluster is not allocated. In this case
+                       read requests shall go to the backing file or
+                       return zeros if there is no backing file data.
+
+                    Bits are assigned starting from the most significant one.
+                    (i.e. bit x is used for subcluster 31 - x)
+
+        32 -  63    Subcluster reads as zeros (one bit per subcluster)
+
+                    1: the subcluster reads as zeros. In this case the
+                       allocation status bit must be unset. The host
+                       cluster offset field may or may not be set.
+                    0: no effect.
+
+                    Bits are assigned starting from the most significant one.
+                    (i.e. bit x is used for subcluster 63 - x)
+
+Subcluster Allocation Bitmap (for compressed clusters):
+
+    Bit  0 -  63:   Reserved (set to 0)
+                    Compressed clusters don't have subclusters,
+                    so this field is not used.
 
 == Snapshots ==
 
diff --git a/docs/qcow2-cache.txt b/docs/qcow2-cache.txt
index d57f409861..04eb4ce2f1 100644
--- a/docs/qcow2-cache.txt
+++ b/docs/qcow2-cache.txt
@@ -1,6 +1,6 @@
 qcow2 L2/refcount cache configuration
 =====================================
-Copyright (C) 2015, 2018 Igalia, S.L.
+Copyright (C) 2015, 2018-2019 Igalia, S.L.
 Author: Alberto Garcia <berto@igalia.com>
 
 This work is licensed under the terms of the GNU GPL, version 2 or
@@ -222,3 +222,20 @@ support this functionality, and is 0 (disabled) on other platforms.
 This functionality currently relies on the MADV_DONTNEED argument for
 madvise() to actually free the memory. This is a Linux-specific feature,
 so cache-clean-interval is not supported on other systems.
+
+
+Extended L2 Entries
+-------------------
+All numbers shown in this document are valid for qcow2 images with normal
+64-bit L2 entries.
+
+Images with extended L2 entries need twice as much L2 metadata, so the L2
+cache size must be twice as large for the same disk space.
+
+   disk_size = l2_cache_size * cluster_size / 16
+
+i.e.
+
+   l2_cache_size = disk_size * 16 / cluster_size
+
+Refcount blocks are not affected by this.
-- 
2.20.1


