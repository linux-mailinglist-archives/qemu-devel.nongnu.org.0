Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911A35B31B0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 10:29:00 +0200 (CEST)
Received: from localhost ([::1]:44658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWZNj-0004Ea-55
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 04:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oWZ7M-00087z-U6
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 04:12:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oWZ7I-0003Pc-98
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 04:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662711119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=COWWLahwGCQZa3I1la+bchyz+uJtHt4CBEA8bUq8Yiw=;
 b=I6/PcWwxxAoRJy2EVXflGh+f1LkmM93C9uXHaK/O+BzDzBEYMv+YgdWUsrOhooGobcL12A
 Ipd18pSt+TZe1J6OnZhfUKBsNSmVTlJ62SVQA81vE8sZAjokUZlXOMDTt84fK5ZkFxchlu
 x/JmqwUsgyBcz9xNGRqMrLNlp/MMoaM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-1TmXxAe7NwCAOJ8FWP0olQ-1; Fri, 09 Sep 2022 04:11:56 -0400
X-MC-Unique: 1TmXxAe7NwCAOJ8FWP0olQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBB07811E76;
 Fri,  9 Sep 2022 08:11:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF5DA4011A3E;
 Fri,  9 Sep 2022 08:11:51 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [RFC PATCH v2 0/3] accel/kvm: extend kvm memory listener to support
Date: Fri,  9 Sep 2022 04:11:47 -0400
Message-Id: <20220909081150.709060-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The aim of this serie is to prepare kvm memory listener to support atomic
memslots update. In order to do that, QEMU should take care of sending all
memslot updates in a single ioctl, so that they can all be processed
atomically.

In order to do that, implement kml->begin() and kml->commit() callbacks, and
change the logic by replacing every ioctl invocation in ->region_* and ->log_*
so that the struct kvm_userspace_memory_region are queued in a linked list that
is then traversed and processed in ->commit.

Patch 1 ensures that ->region_* and ->log_* are always wrapped by ->begin and
->commit.

---
v2:
- remove patch 1, as it is useless
- patch 2: instead of a linked list, use kvm_userspace_memory_region_list
- kvm_userspace_memory_region_list: add padding

Emanuele Giuseppe Esposito (3):
  linux-headers/linux/kvm.h: introduce kvm_userspace_memory_region_list
    ioctl
  accel/kvm/kvm-all.c: pass kvm_userspace_memory_region_entry instead
  kvm/kvm-all.c: listener should delay kvm_vm_ioctl to the commit phase

 accel/kvm/kvm-all.c       | 116 +++++++++++++++++++++++++++++---------
 include/sysemu/kvm_int.h  |   8 +++
 linux-headers/linux/kvm.h |  20 +++++++
 3 files changed, 117 insertions(+), 27 deletions(-)

-- 
2.31.1


