Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4153B7484
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:40:48 +0200 (CEST)
Received: from localhost ([::1]:50568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEus-00029v-Q7
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyEr0-0005MH-BZ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:36:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyEqv-0005gU-RO
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:36:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624977400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SFLDqlP34jqFSWbujTXBtZMCQfO+/c8LMkLjCzSHgFw=;
 b=I48+GPQtIvDr25R9OFLHbB4kbCGy5ILIJMJ0BZj7pXsb8UH8kcygzwXgdfGE8jL601ftD3
 eTWioFE5/v1cfzEajaSXeU1bMRGZ4/mq2tEBkFyenogLT1hE5g8MO2NrahsEcYrj2uRDj+
 pK/9dLtNV+//lmU4s3qQsBt+Nl1Xh4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-fl0vNNFqNfCMi065pVKWcg-1; Tue, 29 Jun 2021 10:36:37 -0400
X-MC-Unique: fl0vNNFqNfCMi065pVKWcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34583A40C5;
 Tue, 29 Jun 2021 14:36:36 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-168.ams2.redhat.com [10.36.113.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7BF5104E0;
 Tue, 29 Jun 2021 14:36:23 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 philmd@redhat.com, crosa@redhat.com, wainersm@redhat.com
Subject: [PATCH v4 0/4] avocado-qemu: New SMMUv3 and intel IOMMU tests
Date: Tue, 29 Jun 2021 16:36:17 +0200
Message-Id: <20210629143621.907831-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: wrampazz@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds ARM SMMU and Intel IOMMU functional
tests using Fedora cloud-init images.

ARM SMMU tests feature guests with and without RIL
(range invalidation support) using respectively fedora 33
and 31.  For each, we test the protection of virtio-net-pci
and virtio-block-pci devices. Also strict=no and passthrough
modes are tested. So there is a total of 6 tests.

The series applies on top of Cleber's series:
- [PATCH 0/3] Acceptance Tests: support choosing specific

Note:
- SMMU tests 2, 3, 5, 6 (resp. test_smmu_noril_passthrough and
test_smmu_noril_nostrict) pass but the log reports:
"WARN: Test passed but there were warnings during execution."
This seems due to the lack of hash when fetching the kernel and
initrd through fetch_asset():
WARNI| No hash provided. Cannot check the asset file integrity.

History:
v3 -> v4:
- I added Wainer's refactoring of KNOWN_DISTROS
into a class (last patch) and took into account his comments.

v2 -> v3:
- Added Intel IOMMU tests were added. Different
operating modes are tested such as strict, caching mode, pt.

Best Regards

Eric

The series and its dependencies can be found at:
https://github.com/eauger/qemu/tree/avocado-qemu-v4

Eric Auger (3):
  Acceptance Tests: Add default kernel params and pxeboot url to the
    KNOWN_DISTROS collection
  avocado_qemu: Add SMMUv3 tests
  avocado_qemu: Add Intel iommu tests

Wainer dos Santos Moschetta (1):
  avocado_qemu: Fix KNOWN_DISTROS map into the LinuxDistro class

 tests/acceptance/avocado_qemu/__init__.py | 118 +++++++++++++------
 tests/acceptance/intel_iommu.py           | 115 +++++++++++++++++++
 tests/acceptance/smmu.py                  | 132 ++++++++++++++++++++++
 3 files changed, 332 insertions(+), 33 deletions(-)
 create mode 100644 tests/acceptance/intel_iommu.py
 create mode 100644 tests/acceptance/smmu.py

-- 
2.26.3


