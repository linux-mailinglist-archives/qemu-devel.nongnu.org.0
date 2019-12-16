Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B5A12097B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 16:20:00 +0100 (CET)
Received: from localhost ([::1]:55440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igsAA-0005oI-VZ
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 10:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54288)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7P-0003Yf-33
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 10:17:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7O-0001bj-1z
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 10:17:06 -0500
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:58507)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7L-0001X4-NW; Mon, 16 Dec 2019 10:17:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1576509424; x=1608045424;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=syWV6RethZ9zkiIkM27Et4g5OSvaauBfpbT1hVu+9aY=;
 b=p2UuQMvElHSlnLKSkedp7iu6zc1Te87fsWnxqjSJq9H+x2KqHJSNVQLp
 1JeFevw+OrcFM9h1uslLZjPRWEgTqws5XlnEXt0i7TRTCzRVLOhH2qwry
 bw0BbR9R0PpbFmn3nDQCEsfh7IaC9sOT38z7RAe2/EvfZdlHIOBKnEq2q E=;
IronPort-SDR: d2aUp2IqMXXURcCZGkgJ6eC2IDAbm4psYZDe8xXWk8OubI7jUG94fqjYgRQRkm4r5ScrAmXpHI
 U33CvYSon9hw==
X-IronPort-AV: E=Sophos;i="5.69,322,1571702400"; d="scan'208";a="13787925"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 16 Dec 2019 15:16:51 +0000
Received: from sveith-desktop.aka.corp.amazon.com
 (iad7-ws-svc-lb50-vlan3.amazon.com [10.0.93.214])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id BBA31A1F8B; Mon, 16 Dec 2019 15:16:48 +0000 (UTC)
Received: from sveith-desktop.aka.corp.amazon.com (localhost [127.0.0.1])
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Debian-3) with ESMTP id
 xBGFGkar013914; Mon, 16 Dec 2019 16:16:46 +0100
Received: (from sveith@localhost)
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Submit) id xBGFGjQT013913;
 Mon, 16 Dec 2019 16:16:45 +0100
From: Simon Veith <sveith@amazon.de>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Simon Veith <sveith@amazon.de>, Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 1/6] hw/arm/smmuv3: Apply address mask to linear strtab
 base address
Date: Mon, 16 Dec 2019 16:15:07 +0100
Message-Id: <1576509312-13083-2-git-send-email-sveith@amazon.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576509312-13083-1-git-send-email-sveith@amazon.de>
References: <1576509312-13083-1-git-send-email-sveith@amazon.de>
Precedence: Bulk
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 207.171.184.29
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

In the SMMU_STRTAB_BASE register, the stream table base address only
occupies bits [51:6]. Other bits, such as RA (bit [62]), must be masked
out to obtain the base address.

The branch for 2-level stream tables correctly applies this mask by way
of SMMU_BASE_ADDR_MASK, but the one for linear stream tables does not.

Apply the missing mask in that case as well so that the correct stream
base address is used by guests which configure a linear stream table.

Linux guests are unaffected by this change because they choose a 2-level
stream table layout for the QEMU SMMUv3, based on the size of its stream
ID space.

ref. ARM IHI 0070C, section 6.3.23.

Signed-off-by: Simon Veith <sveith@amazon.de>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Acked-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index e2fbb83..eef9a18 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -429,7 +429,7 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
         }
         addr = l2ptr + l2_ste_offset * sizeof(*ste);
     } else {
-        addr = s->strtab_base + sid * sizeof(*ste);
+        addr = (s->strtab_base & SMMU_BASE_ADDR_MASK) + sid * sizeof(*ste);
     }
 
     if (smmu_get_ste(s, addr, ste, event)) {
-- 
2.7.4


