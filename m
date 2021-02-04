Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9FC30F8B9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:58:32 +0100 (CET)
Received: from localhost ([::1]:53746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hxf-0004H0-Nu
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hg4-0000oF-1J
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:40:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hfx-0004eA-IY
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:40:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612456812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HqI8wcuIzgCOY6SV8v1+SOlkUHDqTVOPvRGtc8JjW1M=;
 b=OCTzPhw8ls6+Nw0OEdrWnnRurSdKENiwRjx9IMIn26dLDHFcu4T0LDnBeKKwMFUfPLCn+r
 2Oayg14KIOaf2MJej6WkDodi/y/DlflpMFq3ld8CxY4HfbP2euWxrJQ07Y+1XYdckeTwpQ
 v+IB6T9KtLHjyKLjuDm1DDBVr96VRBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-2S-9JDjgPuenPbxs5DCagQ-1; Thu, 04 Feb 2021 11:40:10 -0500
X-MC-Unique: 2S-9JDjgPuenPbxs5DCagQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E680D18A08BB;
 Thu,  4 Feb 2021 16:40:08 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-21.ams2.redhat.com
 [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B86D1A38C;
 Thu,  4 Feb 2021 16:40:04 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com
Subject: [PULL 01/27] spapr_pci: Fix memory leak of vmstate_spapr_pci
Date: Thu,  4 Feb 2021 16:39:33 +0000
Message-Id: <20210204163959.377618-2-dgilbert@redhat.com>
In-Reply-To: <20210204163959.377618-1-dgilbert@redhat.com>
References: <20210204163959.377618-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jinhao Gao <gaojinhao@huawei.com>

When VM migrate VMState of spapr_pci, the field(msi_devs) of spapr_pci
having a flag of VMS_ALLOC need to allocate memory. If the src doesn't free
memory of msi_devs in SaveStateEntry of spapr_pci after QEMUFile save
VMState of spapr_pci, it may result in memory leak of msi_devs. We add the
post_save func to free memory, which prevents memory leak.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Jinhao Gao <gaojinhao@huawei.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20201231061020.828-2-gaojinhao@huawei.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/ppc/spapr_pci.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 76d7c91e9c..1b2b940606 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2173,6 +2173,16 @@ static int spapr_pci_pre_save(void *opaque)
     return 0;
 }
 
+static int spapr_pci_post_save(void *opaque)
+{
+    SpaprPhbState *sphb = opaque;
+
+    g_free(sphb->msi_devs);
+    sphb->msi_devs = NULL;
+    sphb->msi_devs_num = 0;
+    return 0;
+}
+
 static int spapr_pci_post_load(void *opaque, int version_id)
 {
     SpaprPhbState *sphb = opaque;
@@ -2205,6 +2215,7 @@ static const VMStateDescription vmstate_spapr_pci = {
     .version_id = 2,
     .minimum_version_id = 2,
     .pre_save = spapr_pci_pre_save,
+    .post_save = spapr_pci_post_save,
     .post_load = spapr_pci_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT64_EQUAL(buid, SpaprPhbState, NULL),
-- 
2.29.2


