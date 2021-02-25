Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8F3324CA8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 10:22:37 +0100 (CET)
Received: from localhost ([::1]:40456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFCqy-0002bP-O4
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 04:22:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFCjm-0003Sz-6x
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:15:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFCjk-00069Z-Is
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:15:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614244507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14p+j/CpjB0GM1QQbxolieRgFGzs9w3/Zsqc0TRnMgI=;
 b=ihPjVvQTB2df1xGhYomaQ9DJPusZHHvMwmI3kbSgwqnou4jJcFaKkizt5jyZnORda0CSG3
 m0AGR8lkpeiGJmN+q5QJX6F5DVaTyuILdcJ+REl1qP5Ewlvkjv+LXtsfqMVJzOqZavbZOM
 idfSteFjsfwaN2dBNJ3ovVhihgBb86Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-00eL2p83MAiKr4Bl8JnJvQ-1; Thu, 25 Feb 2021 04:15:04 -0500
X-MC-Unique: 00eL2p83MAiKr4Bl8JnJvQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7222CAFA80;
 Thu, 25 Feb 2021 09:15:02 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-34.ams2.redhat.com [10.36.114.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F188517C2E;
 Thu, 25 Feb 2021 09:14:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 peterx@redhat.com, jasowang@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 4/7] hw/arm/smmu-common: Fix smmu_iotlb_inv_iova when asid
 is not set
Date: Thu, 25 Feb 2021 10:14:32 +0100
Message-Id: <20210225091435.644762-5-eric.auger@redhat.com>
In-Reply-To: <20210225091435.644762-1-eric.auger@redhat.com>
References: <20210225091435.644762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the asid is not set, do not attempt to locate the key directly
as all inserted keys have a valid asid.

Use g_hash_table_foreach_remove instead.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmu-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 405d5c5325..e9ca3aebb2 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -151,7 +151,7 @@ inline void
 smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
                     uint8_t tg, uint64_t num_pages, uint8_t ttl)
 {
-    if (ttl && (num_pages == 1)) {
+    if (ttl && (num_pages == 1) && (asid >= 0)) {
         SMMUIOTLBKey key = smmu_get_iotlb_key(asid, iova, tg, ttl);
 
         g_hash_table_remove(s->iotlb, &key);
-- 
2.26.2


