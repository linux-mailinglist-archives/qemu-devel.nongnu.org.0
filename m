Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B2C57CA50
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 14:10:47 +0200 (CEST)
Received: from localhost ([::1]:60716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEV0v-0006lO-Gp
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 08:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oEUxz-0001Qo-IL
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:07:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oEUxx-0000vf-IK
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:07:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658405260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jugokyDFw++B9gyAJU/plOnxxtX1Y0HSIqmutiwjVyc=;
 b=MdcgmgwlpTxwzGwH1uzKOZ2FhUfx3MTSHvTiAscGes0Qdj79vA3SQa/6YJ25aqBSZPICGC
 wx7cxQUfL14qJojPjbFnLASLnDK3FpXHrAs9Jp9n0AhIGuxKBWh42rDDEics2QLu436S38
 8Ym5qqzZPtaeaoTCNPQlxLSBvKOsbss=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-K6HCMAeQO1i0ZurELQQ9jQ-1; Thu, 21 Jul 2022 08:07:36 -0400
X-MC-Unique: K6HCMAeQO1i0ZurELQQ9jQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5616D2811373;
 Thu, 21 Jul 2022 12:07:36 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 424D12026D64;
 Thu, 21 Jul 2022 12:07:33 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH RFC 0/7] hostmem: NUMA-aware memory preallocation using
 ThreadContext
Date: Thu, 21 Jul 2022 14:07:25 +0200
Message-Id: <20220721120732.118133-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

This is a follow-up on "util: NUMA aware memory preallocation" [1] by
Michal.

Setting the CPU affinity of threads from inside QEMU usually isn't
easily possible, because we don't want QEMU -- once started and running
guest code -- to be able to mess up the system. QEMU disallows relevant
syscalls using seccomp, such that any such invocation will fail.

Especially for memory preallocation in memory backends, the CPU affinity
can significantly increase guest startup time, for example, when running
large VMs backed by huge/gigantic pages, because of NUMA effects. For
NUMA-aware preallocation, we have to set the CPU affinity, however:

(1) Once preallocation threads are created during preallocation, management
    tools cannot intercept anymore to change the affinity. These threads
    are created automatically on demand.
(2) QEMU cannot easily set the CPU affinity itself.
(3) The CPU affinity derived from the NUMA bindings of the memory backend
    might not necessarily be exactly the CPUs we actually want to use
    (e.g., CPU-less NUMA nodes, CPUs that are pinned/used for other VMs).

There is an easy "workaround". If we have a thread with the right CPU
affinity, we can simply create new threads on demand via that prepared
context. So, all we have to do is setup and create such a context ahead
of time, to then configure preallocation to create new threads via that
environment.

So, let's introduce a user-creatable "thread-context" object that
essentially consists of a context thread used to create new threads.
QEMU can either try setting the CPU affinity itself ("cpu-affinity",
"node-affinity" property), or upper layers can extract the thread id
("thread-id" property) to configure it externally.

Make memory-backends consume a thread-context object
(via the "prealloc-context" property) and use it when preallocating to
create new threads with the desired CPU affinity. Further, to make it
easier to use, allow creation of "thread-context" objects, including
setting the CPU affinity directly from QEMU, *before* enabling the
sandbox option.


Quick test on a system with 2 NUMA nodes:

Without CPU affinity:
    time qemu-system-x86_64 \
        -object memory-backend-memfd,id=md1,hugetlb=on,hugetlbsize=2M,size=64G,prealloc-threads=12,prealloc=on,host-nodes=0,policy=bind \
        -nographic -monitor stdio

    real    0m5.383s
    real    0m3.499s
    real    0m5.129s
    real    0m4.232s
    real    0m5.220s
    real    0m4.288s
    real    0m3.582s
    real    0m4.305s
    real    0m5.421s
    real    0m4.502s

    -> It heavily depends on the scheduler CPU selection

With CPU affinity:
    time qemu-system-x86_64 \
        -object thread-context,id=tc1,node-affinity=0 \
        -object memory-backend-memfd,id=md1,hugetlb=on,hugetlbsize=2M,size=64G,prealloc-threads=12,prealloc=on,host-nodes=0,policy=bind,prealloc-context=tc1 \
        -sandbox enable=on,resourcecontrol=deny \
        -nographic -monitor stdio

    real    0m1.959s
    real    0m1.942s
    real    0m1.943s
    real    0m1.941s
    real    0m1.948s
    real    0m1.964s
    real    0m1.949s
    real    0m1.948s
    real    0m1.941s
    real    0m1.937s

On reasonably large VMs, the speedup can be quite significant.

While this concept is currently only used for short-lived preallocation
threads, nothing major speaks against reusing the concept for other
threads that are harder to identify/configure -- except that
we need additional (idle) context threads that are otherwise left unused.

[1] https://lkml.kernel.org/r/ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com

Cc: Michal Privoznik <mprivozn@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Eric Blake <eblake@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Stefan Weil <sw@weilnetz.de>

David Hildenbrand (7):
  util: Cleanup and rename os_mem_prealloc()
  util: Introduce qemu_thread_set_affinity() and
    qemu_thread_get_affinity()
  util: Introduce ThreadContext user-creatable object
  util: Add write-only "node-affinity" property for ThreadContext
  util: Make qemu_prealloc_mem() optionally consume a ThreadContext
  hostmem: Allow for specifying a ThreadContext for preallocation
  vl: Allow ThreadContext objects to be created before the sandbox
    option

 backends/hostmem.c            |  13 +-
 hw/virtio/virtio-mem.c        |   2 +-
 include/qemu/osdep.h          |  19 +-
 include/qemu/thread-context.h |  58 ++++++
 include/qemu/thread.h         |   4 +
 include/sysemu/hostmem.h      |   2 +
 meson.build                   |  16 ++
 qapi/qom.json                 |  25 +++
 softmmu/cpus.c                |   2 +-
 softmmu/vl.c                  |  30 ++-
 util/meson.build              |   1 +
 util/oslib-posix.c            |  39 ++--
 util/oslib-win32.c            |   8 +-
 util/qemu-thread-posix.c      |  70 +++++++
 util/qemu-thread-win32.c      |  12 ++
 util/thread-context.c         | 363 ++++++++++++++++++++++++++++++++++
 16 files changed, 637 insertions(+), 27 deletions(-)
 create mode 100644 include/qemu/thread-context.h
 create mode 100644 util/thread-context.c

-- 
2.35.3


