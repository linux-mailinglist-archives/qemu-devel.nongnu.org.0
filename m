Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFEF619B39
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 16:16:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqyPr-0004nq-Mo; Fri, 04 Nov 2022 11:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqyPc-0004lp-O8
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 11:15:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqyPP-0000WT-4Q
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 11:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667574901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yNRgkiw9kqk8+TAZEiM/c0dMRWtp1q/0gNjaX48prUY=;
 b=h5OKLVhT5OkvrhBmepk2sZCFVkpGj/Nq1QLGoWz5Hn7z0mly0Z7NNVsk+chWTC5WeMX+s0
 MWwZRRU12Yw54CDde19zYElzQRd5cD78guOYhGxLxCr/r+UXeoEZjDYOuhlX7Ez7pdaOMT
 q21i39I0QeKxQmG503E0UFx8Y+3i4AE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353--IgcZaIzP8yUtJxH_iEFAQ-1; Fri, 04 Nov 2022 11:14:57 -0400
X-MC-Unique: -IgcZaIzP8yUtJxH_iEFAQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1952C800B30;
 Fri,  4 Nov 2022 15:14:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94018C1908B;
 Fri,  4 Nov 2022 15:14:55 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, kvm@vger.kernel.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [RFC PATCH 0/3] KVM: allow listener to stop all vcpus before
Date: Fri,  4 Nov 2022 11:14:51 -0400
Message-Id: <20221104151454.136551-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QEMU needs to perform memslots operations like merging and splitting,
and each operation requires more than a single ioctl.
Therefore if a vcpu is concurrently reading the same memslots,
it could end up reading something that was temporarly deleted.
For example, merging two memslots into one would imply:
DELETE(m1)
DELETE(m2)
CREATE(m1+m2)

And a vcpu could attempt to read m2 right after it is deleted, but
before the new one is created.

This approach is 100% QEMU-based. No KVM API modification is involved,
but implies that QEMU must make sure no new ioctl is running and all
vcpus are stopped.

The logic and code are basically taken from David Hildenbrand
proposal given a while ago while reviewing a previous attempt where
I suggested to solve the above problem directly in KVM by extending
its API.

This is the original code:
https://github.com/davidhildenbrand/qemu/commit/86b1bf546a8d00908e33f7362b0b61e2be8dbb7a

I just split the patch in three smaller patches, and used a
QemuLockCnt instead of counter + mutex.

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1979276

Emanuele

David Hildenbrand (1):
  kvm: Atomic memslot updates

Emanuele Giuseppe Esposito (2):
  KVM: keep track of running ioctls
  KVM: keep track of running vcpu ioctls

 accel/kvm/kvm-all.c      | 175 ++++++++++++++++++++++++++++++++++++---
 hw/core/cpu-common.c     |   2 +
 include/hw/core/cpu.h    |   3 +
 include/sysemu/kvm_int.h |   8 ++
 4 files changed, 177 insertions(+), 11 deletions(-)

-- 
2.31.1


