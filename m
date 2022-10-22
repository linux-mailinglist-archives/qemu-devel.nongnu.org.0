Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C8E609975
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 06:53:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omi8v-0006l1-KF
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 17:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1omGjh-0002T3-9V
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 11:48:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1omGjf-0008Eq-Qg
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 11:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666453710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=OPS/W9EriOxXRzwj2N2ZjlWHOy5hj1Gjuemf2SY5Ke0=;
 b=WN+/pjyCj7yDW8jXnn+u0p436xGfaQ8g+gO4YzW5Oo1mdZeelU2qKF1dAFwMuM2CO/JGsH
 sCffFyVH5sQhAnEWEtwC9BgmiMlPmpfWnhmSUssAvgAUXuKu6OLuWBsR2w+H3lR1Plu34d
 zMOcAhydRYBR4r+bzScSC69luM2KLI4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-HeEXPnPlOyOnOd3OwjkhyQ-1; Sat, 22 Oct 2022 11:48:26 -0400
X-MC-Unique: HeEXPnPlOyOnOd3OwjkhyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FAD4811E7A;
 Sat, 22 Oct 2022 15:48:26 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 392F840C6EC2;
 Sat, 22 Oct 2022 15:48:25 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 0/2] KVM: stop all vcpus before modifying memslots
Date: Sat, 22 Oct 2022 11:48:21 -0400
Message-Id: <20221022154823.1823193-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

To solve this problem, use the newly introduced kvm API:
KVM_KICK_ALL_RUNNING_VCPUS and KVM_RESUME_ALL_KICKED_VCPUS.
This new API allows the userspace to respectively stop and resume all running vcpus. A "running" vcpu is a vcpu that is executing
the KVM_RUN ioctl.

While KVM already handles the case of KVM_RUN being called after
KVM_KICK_ALL_RUNNING_VCPUS is invoked but before KVM_RESUME_ALL_KICKED_VCPUS by simply returning immediately,
QEMU also avoids that using the event API.

This is the simplest solution, pausing all vcpus in the kvm
side, so that:
- QEMU just needs to call the new API before making memslots
changes, keeping modifications to the minimum
- dirty page updates are also performed when vcpus are blocked, so
there is no time window between the dirty page ioctl and memslots
modifications, since vcpus are all stopped.
- no need to modify the existing memslots API

This series requires the KVM serie "KVM: API to block and resume all running vcpus in a vm".

Emanuele Giuseppe Esposito (2):
  linux-headers/linux/kvm.h: introduce kvm_userspace_memory_region_list
    ioctl
  accel/kvm: introduce begin/commit listener callbacks

 accel/kvm/kvm-all.c       | 50 +++++++++++++++++++++++++++++++++++++++
 linux-headers/linux/kvm.h |  3 +++
 2 files changed, 53 insertions(+)

-- 
2.31.1


