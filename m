Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4B43AE490
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:10:33 +0200 (CEST)
Received: from localhost ([::1]:52894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvF0q-0000Jv-Fv
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lvEz7-0006rd-5D
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:08:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lvEz5-0000tS-C1
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624262922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TccvdG1THOjDohFbVJ28vF6pSJqtmbMWVjYh9XglaCc=;
 b=b3WMjuKPdWLttK8Q/HgK8n1mUwF8L2Nnp5S+UyEszKIusI8ERKfw4Fren1iCWZfZBboPt4
 N8FLdlD4k27ASvWLGJXo2aWw1XNpw1Opc8WKhKSZgspdkjbtVSS6Ek7uzjExlmub8m2S4U
 mSVjDbmgRMHtSTfrzbgsmRzD39fynCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-ZPDGqnZTOLWMgFC1nZ57Gg-1; Mon, 21 Jun 2021 04:08:41 -0400
X-MC-Unique: ZPDGqnZTOLWMgFC1nZ57Gg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DFEF8042FE;
 Mon, 21 Jun 2021 08:08:40 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-27.ams2.redhat.com [10.36.112.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A84360C9F;
 Mon, 21 Jun 2021 08:08:27 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 philmd@redhat.com, crosa@redhat.com, wainersm@redhat.com, peterx@redhat.com
Subject: [PATCH v3 0/3] avocado-qemu: New SMMUv3 and intel IOMMU tests
Date: Mon, 21 Jun 2021 10:08:21 +0200
Message-Id: <20210621080824.789274-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This series adds ARM SMMU and Intel IOMMU functional
tests using Fedora cloud-init images.

ARM SMMU tests feature guests with and without RIL
(range invalidation support) using respectively fedora 33
and 31.  For each, we test the protection of virtio-net-pci
and virtio-block-pci devices. Also strict=no and passthrough
modes are tested. So there is a total of 6 tests.

Compared to v2, Intel IOMMU tests were added. Different
operating modes are tested such as strict, caching mode, pt.

The series applies on top of Cleber's series:
- [PATCH 0/3] Acceptance Tests: support choosing specific

Best Regards

Eric

The series and its dependencies can be found at:
https://github.com/eauger/qemu/tree/avocado-qemu-v3


Eric Auger (3):
  Acceptance Tests: Add default kernel params and pxeboot url to the
    KNOWN_DISTROS collection
  avocado_qemu: Add SMMUv3 tests
  avocado_qemu: Add Intel iommu tests

 tests/acceptance/avocado_qemu/__init__.py |  52 ++++++++-
 tests/acceptance/intel_iommu.py           | 115 +++++++++++++++++++
 tests/acceptance/smmu.py                  | 133 ++++++++++++++++++++++
 3 files changed, 298 insertions(+), 2 deletions(-)
 create mode 100644 tests/acceptance/intel_iommu.py
 create mode 100644 tests/acceptance/smmu.py

-- 
2.26.3


