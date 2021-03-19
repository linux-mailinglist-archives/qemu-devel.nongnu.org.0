Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C465341FDE
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:42:47 +0100 (CET)
Received: from localhost ([::1]:39162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNGKs-0006pO-61
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNGHj-0005JX-0Z
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:39:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNGHg-0004o2-JO
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:39:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616164767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LBtWfbOE4nYjZdV9n1rxGRxqZJeQS6pS7eNpYFzu0QA=;
 b=eLCm1OpmNExdLE0NRV5lBFyJh2QqO25jCqyz2b7WQjNdBx8ZDxmQGBgrf+/dYTxKzosEuR
 nIXxf3p4EtGgw+vgO2Bgx/mU0N46f+zuVSDz7/xrbuJyq6fkCyRJBRpq0Hnz7TjBMfpFzB
 R0oplAxNucS//sR0PStSzwtR3c5XZFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-YrSMH4l3Ow-9E1AFntHw_A-1; Fri, 19 Mar 2021 10:39:25 -0400
X-MC-Unique: YrSMH4l3Ow-9E1AFntHw_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C183818C8C00
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 14:39:24 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E3E160C04
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 14:39:24 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/8] Misc bugfixes for QEMU soft freeze
Date: Fri, 19 Mar 2021 10:39:16 -0400
Message-Id: <20210319143924.2173798-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit cf6b56d4f2107259f52413f979a1d474dad0c1e1:

  Merge remote-tracking branch 'remotes/philmd/tags/pflash-20210318' into staging (2021-03-18 23:04:41 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to af05ffffd7fa28010d4df9f5744514b16e71055d:

  tests/qtest: cleanup the testcase for bug 1878642 (2021-03-19 10:37:46 -0400)

----------------------------------------------------------------
* fixes for i386 TCG paging
* fixes for Hyper-V enlightenments
* avoid uninitialized variable warning

----------------------------------------------------------------
Paolo Bonzini (5):
      qom: use qemu_printf to print help for user-creatable objects
      target/i386: allow modifying TCG phys-addr-bits
      target/i386: fail if toggling LA57 in 64-bit mode
      target/i386: svm: do not discard high 32 bits of EXITINFO1
      tests/qtest: cleanup the testcase for bug 1878642

Philippe Mathieu-Daudé (1):
      hw/intc/i8259: Refactor pic_read_irq() to avoid uninitialized variable

Vitaly Kuznetsov (2):
      i386: Fix 'hypercall_hypercall' typo
      i386: Make migration fail when Hyper-V reenlightenment was enabled but 'user_tsc_khz' is unset

 docs/hyperv.txt                              |  5 +++++
 hw/intc/i8259.c                              | 12 ++++++------
 qom/object_interfaces.c                      |  1 +
 target/i386/cpu.c                            | 23 ++++++++---------------
 target/i386/cpu.h                            |  1 -
 target/i386/kvm/hyperv-proto.h               |  1 +
 target/i386/machine.c                        | 24 ++++++++++++++++++++++--
 target/i386/tcg/excp_helper.c                |  7 ++++---
 target/i386/tcg/helper-tcg.h                 | 14 +++++---------
 target/i386/tcg/misc_helper.c                |  4 ++++
 target/i386/tcg/seg_helper.c                 |  4 ++--
 target/i386/tcg/svm_helper.c                 | 15 +++++++--------
 tests/qtest/{fuzz-test.c => lpc-ich9-test.c} | 12 +++++++-----
 tests/qtest/meson.build                      |  2 +-
 14 files changed, 73 insertions(+), 52 deletions(-)
 rename tests/qtest/{fuzz-test.c => lpc-ich9-test.c} (71%)
-- 
2.26.2


