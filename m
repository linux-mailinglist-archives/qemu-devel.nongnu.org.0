Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F9760DD9C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 10:58:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oncD4-0007mx-2l; Wed, 26 Oct 2022 04:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oncCY-0007Gk-Ct
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 04:55:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oncCS-0000Iy-PZ
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 04:55:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666774547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7AU6JFx5PPuHVKGKmGTv3Eb8rXXaz7nh0bhMar1mjPU=;
 b=X5sdzc/+MESEjkJrTE/D2s8Zd0hW4PHH1u2ik9/YmwwsIG5NVtbeXLpe4ux+fxBo4+srpC
 4+QNKZnIgF9V5kDJ2vMGQWkyh4EBbU/APxYpINxOTSUomhNgfsIeqqLNWy8XybELsW/USJ
 wKrQf8yDtYpnRaiuB+NgZeRx6ZTd9A0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-j17CIgNYNlueutqWOow02Q-1; Wed, 26 Oct 2022 04:55:44 -0400
X-MC-Unique: j17CIgNYNlueutqWOow02Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A2B91C07825;
 Wed, 26 Oct 2022 08:55:44 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 101A649BB60;
 Wed, 26 Oct 2022 08:55:42 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL v3 00/11] Dump patches
Date: Wed, 26 Oct 2022 12:55:28 +0400
Message-Id: <20221026085540.254253-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit e750a7ace492f0b450653d4ad368a77d6f660fb8:

  Merge tag 'pull-9p-20221024' of https://github.com/cschoenebeck/qemu into staging (2022-10-24 14:27:12 -0400)

are available in the Git repository at:

  https://gitlab.com/marcandre.lureau/qemu.git tags/dump-pull-request

for you to fetch changes up to e38c24cb580735883769558801d9e2f2ba9f04c1:

  dump/win_dump: limit number of processed PRCBs (2022-10-26 12:55:00 +0400)

----------------------------------------------------------------
dump queue

Hi

The "dump" queue, with:
- [PATCH v3/v4 0/9] dump: Cleanup and consolidation
- [PATCH v4 0/4] dump: add 32-bit guest Windows support

----------------------------------------------------------------

Janosch Frank (10):
  dump: Use a buffer for ELF section data and headers
  dump: Write ELF section headers right after ELF header
  dump: Reorder struct DumpState
  dump: Reintroduce memory_offset and section_offset
  dump: Add architecture section and section string table support
  s390x: Add protected dump cap
  s390x: Introduce PV query interface
  include/elf.h: add s390x note types
  s390x: Add KVM PV dump interface
  s390x: pv: Add dump support

Viktor Prutyanov (1):
  dump/win_dump: limit number of processed PRCBs

 include/elf.h                |   2 +
 include/hw/s390x/pv.h        |  19 +++
 include/sysemu/dump-arch.h   |   3 +
 include/sysemu/dump.h        |  26 +++-
 target/s390x/kvm/kvm_s390x.h |   1 +
 dump/dump.c                  | 288 +++++++++++++++++++++++++++--------
 dump/win_dump.c              |   7 +
 hw/s390x/pv.c                | 112 ++++++++++++++
 hw/s390x/s390-virtio-ccw.c   |   6 +
 target/s390x/arch_dump.c     | 262 +++++++++++++++++++++++++++----
 target/s390x/kvm/kvm.c       |   7 +
 target/s390x/kvm/stubs.c     |  12 ++
 target/s390x/kvm/meson.build |   2 +
 13 files changed, 649 insertions(+), 98 deletions(-)
 create mode 100644 target/s390x/kvm/stubs.c

-- 
2.37.3


