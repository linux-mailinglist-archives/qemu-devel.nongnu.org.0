Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB2766CDE2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:47:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTZ2-0001Fu-CP; Mon, 16 Jan 2023 12:46:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=IbPF=5N=kaod.org=clg@ozlabs.org>)
 id 1pHTYz-0001FA-12; Mon, 16 Jan 2023 12:46:29 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=IbPF=5N=kaod.org=clg@ozlabs.org>)
 id 1pHTYw-0006of-6I; Mon, 16 Jan 2023 12:46:28 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NwfZw4b5xz4xyF;
 Tue, 17 Jan 2023 04:46:16 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NwfZr4m2nz4x1N;
 Tue, 17 Jan 2023 04:46:12 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, frankja@linux.ibm.com,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Sebastian Mitterle <smitterl@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 0/3]s390x/pv: Improve error reporting of protected VMs
Date: Mon, 16 Jan 2023 18:46:04 +0100
Message-Id: <20230116174607.2459498-1-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=IbPF=5N=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello,

Here is a little series improving error reporting of protected VMs.

Thanks,

C.

Changes in v3:

 - dropped 's390x/pv: Check for support on the host'. This is already
   covered by the KVM capability.   
 - in s390_pv_check() (patch 2) drop the call to s390_pv_guest_check()
   since init time has already checked the same conditions. However,
   to report an error when the machine is not protected and the kernel
   secure, we still need s390_pv_check().

Changes in v2:

 - dropped ConfidentialGuestSupportClass handler. The check is now
   done from s390_pv_init() which is called after memory and CPU
   initialization. This gives us a better chance to tune the limits
   correctly.
 - pv_max_cpus now computed from the available size of the response
   buffer of the Read SCP Info Service Call (Thomas)
 
Cédric Le Goater (3):
  s390x/pv: Implement a CGS check helper
  s390x/pv: Introduce a s390_pv_check() helper for runtime
  s390x/pv: Move check on hugepage under s390_pv_guest_check()

 include/hw/s390x/pv.h |  2 ++
 hw/s390x/pv.c         | 64 +++++++++++++++++++++++++++++++++++++++++++
 target/s390x/diag.c   |  6 ++--
 3 files changed, 69 insertions(+), 3 deletions(-)

-- 
2.39.0


