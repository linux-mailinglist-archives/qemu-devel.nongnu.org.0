Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E48501939
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 18:56:05 +0200 (CEST)
Received: from localhost ([::1]:34318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf2lI-0005QQ-Cn
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 12:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nf2iR-0002hE-Vl
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 12:53:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nf2iO-00047k-8v
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 12:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649955182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E63BRQT1K+dPUpioVYGjgw7NNpHe4pG4LBz1mT99fY8=;
 b=IRa8eP+oLvNVmVaIg1c12CcFKRqDrHqz2q7JFQbeq4Rjz3osAsjSQJ1q5vp77TfREnzxnq
 CwFehUFg0GFddOxGCx3BKwc40yZFBgao4v4vq4p22VCmp+PBTYKv+sodGc9trQH1l+jfKy
 qQhTXenN2/IFaZr9tmKG6QgcVRIvYu0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-XQJjw0wXOFKnvIy-K_kczQ-1; Thu, 14 Apr 2022 12:53:01 -0400
X-MC-Unique: XQJjw0wXOFKnvIy-K_kczQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91E0C85A5BE
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 16:53:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F1C3145830C
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 16:53:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 0/5] Move memory and boot to -machine
Date: Thu, 14 Apr 2022 12:52:55 -0400
Message-Id: <20220414165300.555321-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

As the next step in turning command line options into shortcuts, this series
does -boot and -m.  It also makes -M memory-backend a link instead of special
casing it in vl.c, and makes the MachineState validate memory configuration
without needing help from vl.c.

Paolo Bonzini (5):
  machine: use QAPI struct for boot configuration
  machine: add boot compound property
  machine: add mem compound property
  machine: make memory-backend a link property
  machine: move more memory validation to Machine object

 hw/arm/nseries.c        |   2 +-
 hw/core/machine.c       | 242 +++++++++++++++++++++++++++++++++++-----
 hw/core/numa.c          |   2 +-
 hw/hppa/machine.c       |   6 +-
 hw/i386/pc.c            |   2 +-
 hw/nvram/fw_cfg.c       |  27 ++---
 hw/ppc/mac_newworld.c   |   2 +-
 hw/ppc/mac_oldworld.c   |   2 +-
 hw/ppc/prep.c           |   2 +-
 hw/ppc/spapr.c          |   4 +-
 hw/s390x/ipl.c          |  20 +---
 hw/sparc/sun4m.c        |   9 +-
 hw/sparc64/sun4u.c      |   4 +-
 include/hw/boards.h     |   7 +-
 include/sysemu/sysemu.h |   2 -
 qapi/machine.json       |  48 ++++++++
 softmmu/bootdevice.c    |   3 +-
 softmmu/globals.c       |   2 -
 softmmu/vl.c            | 229 +++++++++++--------------------------
 19 files changed, 363 insertions(+), 252 deletions(-)

-- 
2.31.1


