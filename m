Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409C6610DCB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 11:53:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooM2p-0002LQ-Dq; Fri, 28 Oct 2022 05:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ooM2n-0002FK-4O
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:52:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ooM2l-0003gC-3d
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:52:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666950767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jsnMo1BTAFLNRSWAGffrx7FiecP2TbAa+CrdQNoN2vM=;
 b=g612MLF4vIJKbpvbdV7TpszMRfBdo+5wJCBVbv5MqMdavRfXk9equo6BlKQHlrtUnwiN4O
 O9z/XihqY8QJBkcVVEjHzfeOAEs67gXCul+GhzrleD1nKKU4yDFu5XHVeZkGM6Yefsdf3S
 b5/xd/uVnDorjh/LR6erJio6Dmnt92w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-jjky6a-9N1e3fa9kIetzsw-1; Fri, 28 Oct 2022 05:52:43 -0400
X-MC-Unique: jjky6a-9N1e3fa9kIetzsw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFC6729AB3EB;
 Fri, 28 Oct 2022 09:52:32 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB06C1415102;
 Fri, 28 Oct 2022 09:52:27 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, David Hildenbrand <david@redhat.com>
Subject: [GIT PULL 0/8] Host Memory Backends and Memory devices patches
Date: Fri, 28 Oct 2022 11:52:17 +0200
Message-Id: <20221028095225.86118-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 0529245488865038344d64fff7ee05864d3d17f6:

  Merge tag 'pull-target-arm-20221020' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-10-20 14:36:12 -0400)

are available in the Git repository at:

  https://github.com/davidhildenbrand/qemu.git tags/mem-2022-10-28

for you to fetch changes up to bd77c30df984faefa85e6a402939b485d6e05f05:

  vl: Allow ThreadContext objects to be created before the sandbox option (2022-10-27 11:01:09 +0200)

----------------------------------------------------------------
Hi,

"Host Memory Backends" and "Memory devices" queue ("mem"):
- Fix NVDIMM error message
- Add ThreadContext user-creatable object and wire it up for NUMA-aware
  hostmem preallocation

----------------------------------------------------------------
David Hildenbrand (7):
      util: Cleanup and rename os_mem_prealloc()
      util: Introduce qemu_thread_set_affinity() and qemu_thread_get_affinity()
      util: Introduce ThreadContext user-creatable object
      util: Add write-only "node-affinity" property for ThreadContext
      util: Make qemu_prealloc_mem() optionally consume a ThreadContext
      hostmem: Allow for specifying a ThreadContext for preallocation
      vl: Allow ThreadContext objects to be created before the sandbox option

Julia Suvorova (1):
      hw/mem/nvdimm: fix error message for 'unarmed' flag

 backends/hostmem.c            |  13 +-
 hw/mem/nvdimm.c               |   2 +-
 hw/virtio/virtio-mem.c        |   2 +-
 include/qemu/osdep.h          |  19 ++-
 include/qemu/thread-context.h |  57 +++++++
 include/qemu/thread.h         |   4 +
 include/sysemu/hostmem.h      |   2 +
 meson.build                   |  16 ++
 qapi/qom.json                 |  28 ++++
 softmmu/cpus.c                |   2 +-
 softmmu/vl.c                  |  36 ++++-
 util/meson.build              |   1 +
 util/oslib-posix.c            |  39 +++--
 util/oslib-win32.c            |   8 +-
 util/qemu-thread-posix.c      |  70 ++++++++
 util/qemu-thread-win32.c      |  12 ++
 util/thread-context.c         | 362 ++++++++++++++++++++++++++++++++++++++++++
 17 files changed, 642 insertions(+), 31 deletions(-)
 create mode 100644 include/qemu/thread-context.h
 create mode 100644 util/thread-context.c

-- 
2.37.3


