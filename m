Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FDE4FE678
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 19:01:29 +0200 (CEST)
Received: from localhost ([::1]:37180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neJtO-0000rn-T7
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 13:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1neJqs-0006jK-HN
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 12:58:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1neJqp-0002za-5Q
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 12:58:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649782726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3UGkaZc9xE5OrUTSH8xImxxMzxvl71kQLCL8RAAtdXQ=;
 b=DoTnUT1dP/+PuBjWRMnZJ0Ckl0jTLs7E5bBBO09Uj8khGiVSXvwVzfXNJ4AQh87x6bbdlE
 CJBNFg8y/QcevcsZQ21QFVS0lIXPUZy+q+TMVSlAg1zG7+EJFje9J2beytE9aKh+RcFByL
 kQXklLlyyQRU3urW2iNoPuaJujqoVJI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-jICVCJA1NamFuBLq-ez65g-1; Tue, 12 Apr 2022 12:58:42 -0400
X-MC-Unique: jICVCJA1NamFuBLq-ez65g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BCD51014A66;
 Tue, 12 Apr 2022 16:58:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78552403D17F;
 Tue, 12 Apr 2022 16:58:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH 0/3] Remove some of the old libopcode based disassemblers
Date: Tue, 12 Apr 2022 18:58:33 +0200
Message-Id: <20220412165836.355850-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Many of the disassemblers in the disas folder are based on old
versions from the GNU tools (libopcode, GDB, ...) that were still
licensed under the GPL v2. The GNU tools switched to GPL v3 at one
point in time, so QEMU is stuck with the old versions, i.e. these
files did not see much updates for new processors anymore. But
for most architectures, we're preferring the Capstone disassembler
now anyway, so the old libopcode disassemblers are also hardly
used anymore.

I'm not 100% sure (thus this is marked as RFC), but I think we could
simply drop the old disassemblers nowadays, and hardly anybody would
miss them, since we now always embed capstone as a submodule anyway.
Or is there still an advantage in keeping these old files around?

This RFC series tackles with s390, arm (32-bit) and i386 ... I wanted
to get some feedback first, but if we agree that these can be removed,
the sparc, mips and ppc disassemblers likely can be removed, too.
(I think we should keep m68k.c since Capstone does not have support
for Coldfire CPUs yet).

Thomas Huth (3):
  disas: Remove old libopcode s390 disassembler
  disas: Remove old libopcode arm disassembler
  disas: Remove old libopcode i386 disassembler

 include/disas/dis-asm.h |    3 -
 disas.c                 |    3 -
 disas/arm.c             | 4012 -----------------------
 disas/i386.c            | 6771 ---------------------------------------
 disas/s390.c            | 1892 -----------
 target/arm/cpu.c        |    8 -
 target/i386/cpu.c       |    1 -
 target/s390x/cpu.c      |    1 -
 MAINTAINERS             |    6 -
 disas/meson.build       |    3 -
 10 files changed, 12700 deletions(-)
 delete mode 100644 disas/arm.c
 delete mode 100644 disas/i386.c
 delete mode 100644 disas/s390.c

-- 
2.27.0


