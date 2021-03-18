Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE8B34087B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:11:01 +0100 (CET)
Received: from localhost ([::1]:39850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMuIe-0004SJ-CB
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMu9B-0005i9-HQ
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:01:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMu8p-0005e7-Fb
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:01:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616079650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lZ0Mshphv4EN9U2KR32ia0Whk4IPdO/7gAVJBbYQCk8=;
 b=SVU9dTxHVAbkuf48RRsZaUfU11CKPNF03DZdvEJT3f5oqgSHvJmAFH01PhuOPxrogV1zSB
 k0jqTaa9lJyt7BLMJUri9HSUFtv6vbBvNd5Sk52PF1A94towUZ/4bZ2ZDQvf4cUYw6FvxW
 QnAEbCaKHrqfQe2MBKb7ReSoe+CpuZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-WgHWuXqKPeGIoEZ7Heynog-1; Thu, 18 Mar 2021 11:00:47 -0400
X-MC-Unique: WgHWuXqKPeGIoEZ7Heynog-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2ED4E83DD5B
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 15:00:24 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D78DF6787A
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 15:00:23 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/i386: kvm-unit-tests fixes related to page table
 lookup
Date: Thu, 18 Mar 2021 11:00:19 -0400
Message-Id: <20210318150022.1824646-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The first two patches allow access.flat to pass with TCG and "-cpu
max,phys-bits=52", and the last one fixes most NPT tests in svm.flat.

I found these while trying to unify the NPT and regular page table
walk, but those other patches are not appropriate for soft freeze.

Paolo

Paolo Bonzini (3):
  target/i386: allow modifying TCG phys-addr-bits
  target/i386: fail if toggling LA57 in 64-bit mode
  target/i386: svm: do not discard high 32 bits of EXITINFO1

 target/i386/cpu.c             | 23 ++++++++---------------
 target/i386/cpu.h             |  1 -
 target/i386/tcg/excp_helper.c |  7 ++++---
 target/i386/tcg/helper-tcg.h  | 14 +++++---------
 target/i386/tcg/misc_helper.c |  4 ++++
 target/i386/tcg/seg_helper.c  |  4 ++--
 target/i386/tcg/svm_helper.c  | 15 +++++++--------
 7 files changed, 30 insertions(+), 38 deletions(-)

-- 
2.26.2


