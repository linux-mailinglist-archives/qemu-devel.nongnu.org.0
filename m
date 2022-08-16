Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3419F5957F5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 12:20:24 +0200 (CEST)
Received: from localhost ([::1]:52968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNtgN-0006JU-BF
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 06:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oNtZF-0005aw-Ew
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 06:13:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oNtZE-0004KC-2H
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 06:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660644779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nzyKu/psvDBVanFqJ0RAMtVFHYX2Lw3qT+w5UEGNlPQ=;
 b=IkNHfoVwJnYGmsH/YELcvpPplHq74xBAAGdxxsQTF/f+LKkbfRbvaUKfr2HwMnhJJJ4u4W
 ZyLuXWZEmBjVSdwwrA9SWt+OheWeQ4eox1RNwKPUn+2vnXQ70UtlKSdSX03b2GfDsUDL7J
 4cFC2kCAV3RwIsxaPjfT9i8UGOrBA80=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-0lGeHv11NaafYUcOMstNWA-1; Tue, 16 Aug 2022 06:12:56 -0400
X-MC-Unique: 0lGeHv11NaafYUcOMstNWA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 161F4101A586;
 Tue, 16 Aug 2022 10:12:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0113400E403;
 Tue, 16 Aug 2022 10:12:55 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [RFC PATCH 0/2] accel/kvm: extend kvm memory listener to support
Date: Tue, 16 Aug 2022 06:12:48 -0400
Message-Id: <20220816101250.1715523-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Emanuele Giuseppe Esposito (2):
  softmmu/memory: add missing begin/commit callback calls
  kvm/kvm-all.c: listener should delay kvm_vm_ioctl to the commit phase

 accel/kvm/kvm-all.c       | 99 ++++++++++++++++++++++++++++-----------
 include/sysemu/kvm_int.h  |  6 +++
 linux-headers/linux/kvm.h |  9 ++++
 softmmu/memory.c          |  2 +
 4 files changed, 89 insertions(+), 27 deletions(-)

-- 
2.31.1


