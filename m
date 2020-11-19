Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E85A2B900B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:25:05 +0100 (CET)
Received: from localhost ([::1]:45868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfh7f-0002Ss-Pv
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:25:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kfh6H-0001El-A2
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:23:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kfh6E-0004F6-F2
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605781413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AAgSSt+Ni3X2BVa+yS3oSBbAOdxWxLAO7upZKmS1UZ4=;
 b=I1hjsXLIspM5K01FIgR9R1SKCSKwJZegQ/tinICTjPXJ4ljS1w+uQK1Z6DhXzzD0m+E6zT
 t/+qAmML46JH9foLmkYAdZcuBzrVUQs1SHjwb1FJeaLmV8aXN7WJRHaatMzBKu//vOylKH
 RqKTkf0PFcR0Aj59mXF5PAY1H6ZVrcA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-aFkJ_v5TPHiLIP2eDXY0Xw-1; Thu, 19 Nov 2020 05:23:30 -0500
X-MC-Unique: aFkJ_v5TPHiLIP2eDXY0Xw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 489C5911E8;
 Thu, 19 Nov 2020 10:23:29 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-214.ams2.redhat.com
 [10.36.113.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E1955D9C0;
 Thu, 19 Nov 2020 10:23:27 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL for-5.2 0/3] s390x fixes
Date: Thu, 19 Nov 2020 11:23:22 +0100
Message-Id: <20201119102325.1314765-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit b696f2c6ba8c92ffb5eca49b88a5c7276d0a3e1e:

  Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pull-request' into staging (2020-11-18 13:42:42 +0000)

are available in the Git repository at:

  https://github.com/cohuck/qemu tags/s390x-20201119

for you to fetch changes up to a4e2fff1b104f2b235ea2673968d0b0383f541dc:

  s390x/pci: fix endianness issues (2020-11-18 16:59:29 +0100)

----------------------------------------------------------------
s390x fixes:
- fix propagation and reset for the new diag318 call
- fix hot-unplug for vfio-pci devices
- fix endianness issues in zPCI (regression fix)

----------------------------------------------------------------

Collin L. Walling (1):
  s390/kvm: fix diag318 propagation and reset functionality

Cornelia Huck (1):
  s390x/pci: fix endianness issues

Matthew Rosato (1):
  s390x/pci: Unregister listeners before destroying IOMMU address space

 hw/s390x/s390-pci-bus.c         | 17 ++++++++++++-----
 hw/s390x/s390-pci-inst.c        | 16 ++++++++++++++--
 hw/s390x/s390-pci-vfio.c        | 12 ++++++------
 hw/s390x/s390-virtio-ccw.c      |  4 ++++
 include/hw/s390x/s390-pci-clp.h |  8 ++++----
 target/s390x/cpu.c              |  7 +++++++
 target/s390x/cpu.h              |  1 +
 target/s390x/kvm-stub.c         |  4 ++++
 target/s390x/kvm.c              | 22 +++++++++++++++++-----
 target/s390x/kvm_s390x.h        |  1 +
 10 files changed, 70 insertions(+), 22 deletions(-)

-- 
2.26.2


