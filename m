Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA6125ABF1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 15:19:36 +0200 (CEST)
Received: from localhost ([::1]:55004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDSfn-0002g4-G1
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 09:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kDSYh-00065w-JD
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 09:12:15 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60572
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kDSYc-0000Sc-Po
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 09:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599052329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kywQEtG8ENqqSd9UL77nsW/csfGiREDQKScrBS6peJs=;
 b=RTK3NUi5/yiDa1tmkzWJj1TGtMCTepxNfddEG+OU2lXT3AafXfEGyxWa5qXr57JneQt+wT
 a77JcP5unmsKFSFKkQLomIs4BM04ABlgD3lr9EXCZ/fSSHdpDHEyxpk7zMhbqcQGtXIbxB
 DtCSimTgVoQ5waul7JFYXRCzNwmhUHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-_dyrZsGwPoSTwLQO17Gb_g-1; Wed, 02 Sep 2020 09:12:07 -0400
X-MC-Unique: _dyrZsGwPoSTwLQO17Gb_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82E19801FC6;
 Wed,  2 Sep 2020 13:12:06 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-51.ams2.redhat.com [10.36.112.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECC485D9CC;
 Wed,  2 Sep 2020 13:11:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 cohuck@redhat.com, mst@redhat.com, qemu-stable@nongnu.org
Subject: [PATCH 0/2] virtio-iommu-pci: Advertise the device as modern-only
Date: Wed,  2 Sep 2020 15:11:50 +0200
Message-Id: <20200902131152.1219-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 03:24:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jean-philippe@linaro.org, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 9b3a35ec82 ("virtio: verify that legacy support is not
accidentally on"), we are forced to use disable-legacy=on when
instantiating the virtio-iommu-pci device. This also revealed that
the unrealize() function is likely to call g_tree_destroy() on
NULL gtrees, which triggers assertions.

Best Regards

Eric

Eric Auger (2):
  virtio-iommu: Check gtrees are non null before destroying them
  virtio-iommu-pci: force virtio version 1

 hw/virtio/virtio-iommu-pci.c | 2 +-
 hw/virtio/virtio-iommu.c     | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

-- 
2.21.3


