Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E166921932D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 00:15:13 +0200 (CEST)
Received: from localhost ([::1]:45598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtILQ-0003sS-Pb
	for lists+qemu-devel@lfdr.de; Wed, 08 Jul 2020 18:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jtI00-00058P-Oy
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 17:53:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37802
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jtHzy-0005K2-Od
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 17:53:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594245182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uL46dyyS3F+dLe3yNRsdp2copcuq3axoY4l1EWF7sGs=;
 b=JvDCrHF/TQyzCTRnAqe/aMX2Rq4hKCAy2MxOMjzUnVJEIGnvYP5tQV7/0mHnLuUh49xZKe
 xY2JHSteJtYuBQP9RhX2H6ZjBlZHGKRzjAxx1eF4x4JkewByvIE2IZfuxqTdhcxAYRcWPg
 6zZVWHxdt0b7sJ+oYagOV8y0nc0vL9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-m_ccbSlIO9qOIxNZvNp3ww-1; Wed, 08 Jul 2020 14:51:49 -0400
X-MC-Unique: m_ccbSlIO9qOIxNZvNp3ww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79FFB88C921;
 Wed,  8 Jul 2020 18:51:47 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-117.ams2.redhat.com [10.36.113.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9A5E75556;
 Wed,  8 Jul 2020 18:51:35 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 0/5] s390x: initial support for virtio-mem
Date: Wed,  8 Jul 2020 20:51:30 +0200
Message-Id: <20200708185135.46694-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=david@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This wires up the initial, basic version of virito-mem for s390x. General
information about virtio-mem can be found at [1] and in QEMU commit [2].
Patch #5 contains a short example for s390x.

virtio-mem for x86-64 Linux is part of v5.8-rc1. A branch with a s390x
prototype can be found at:
    git@github.com:davidhildenbrand/linux.git virtio-mem-s390x

Note that the kernel should either be compiled via
 CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE, or "memhp_default_state=online"
 should be passed on the kernel cmdline.

This series can be found at:
    git@github.com:davidhildenbrand/qemu.git virtio-mem-s390x

Related to s390x, we'll have to tackle migration of storage keys and
storage attributes (especially, skipping unplugged parts). Not sure if
I am missing something else (any ideas?). For virtio-mem in general, there
are a couple of TODOs, e.g., documented in [1] and [2], both in QEMU and
Linux. However, the basics are around.

I only tested this with fairly small amount of RAM in a z/VM environemnt
...

[1] https://virtio-mem.gitlab.io/
[2] 910b25766b33 ("virtio-mem: Paravirtualized memory hot(un)plug")

David Hildenbrand (5):
  s390x: move setting of maximum ram size to machine init
  s390x: implement diag260
  s390x: prepare device memory address space
  s390x: implement virtio-mem-ccw
  s390x: initial support for virtio-mem

 hw/s390x/Kconfig                   |   1 +
 hw/s390x/Makefile.objs             |   1 +
 hw/s390x/s390-virtio-ccw.c         | 178 ++++++++++++++++++++++++++++-
 hw/s390x/sclp.c                    |  32 ++----
 hw/s390x/virtio-ccw-mem.c          | 165 ++++++++++++++++++++++++++
 hw/s390x/virtio-ccw.h              |  13 +++
 hw/virtio/virtio-mem.c             |   2 +
 include/hw/s390x/s390-virtio-ccw.h |   3 +
 target/s390x/diag.c                |  57 +++++++++
 target/s390x/internal.h            |   2 +
 target/s390x/kvm.c                 |  11 ++
 target/s390x/misc_helper.c         |   6 +
 target/s390x/translate.c           |   4 +
 13 files changed, 449 insertions(+), 26 deletions(-)
 create mode 100644 hw/s390x/virtio-ccw-mem.c

-- 
2.26.2


