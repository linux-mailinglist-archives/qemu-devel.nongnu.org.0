Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A5339DA9A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:05:39 +0200 (CEST)
Received: from localhost ([::1]:54292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqD4c-0002gC-Bi
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD2w-0000Vt-9T
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:03:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD2s-0004LV-47
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:03:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623063827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sMCv4uVmtsEk5SDXTsSKA6+od6+M7qOLgHEMNrDjV4E=;
 b=JH8j9eVcRoVDlhvOqam/bXmNDfE7lnkfVcF/TgHFADLadHXap3P4tgf4nb/xXKV6W147bn
 wHvunPXciCTq3aRw7zPjniRUc9HPmIBjd3szys7rGL8Yh2UU3pBc2KLgeHRtYKsb9sceLq
 VvrheQxQXNSj4fOK7AweuZgbgTIqfF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-xGiZKKfANGuk2U5x3mymaQ-1; Mon, 07 Jun 2021 07:03:46 -0400
X-MC-Unique: xGiZKKfANGuk2U5x3mymaQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5437106BAA9;
 Mon,  7 Jun 2021 11:03:44 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1BD560C17;
 Mon,  7 Jun 2021 11:03:39 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/26] s390x/tcg: Implement Vector enhancements facility
 and switch to z14
Date: Mon,  7 Jun 2021 13:03:12 +0200
Message-Id: <20210607110338.31058-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds support for the "Vector enhancements facility" and bumps
the qemu CPU model to a stripped-down z14.

I tested most vector FP instructions by generating random instructions
and vectors, comparing the result with results on actual hardware. I did
not test instructions/instruction variants with (partial) undeterministic
behavior and exception handling.

Linux' also seems to boot/work fine with it. Howeever, while testing this
series I noticed that Linux checks for the wrong facility bit - see [1].
I tested by temporarily faking availability of the "wrong" facility bit.

[1] https://lkml.kernel.org/r/20210503121244.25232-1-david@redhat.com

v2 -> v3:
- "s390x/tcg: Fix FP CONVERT TO (LOGICAL) FIXED NaN handling"
-- Keep proper signal handling in the VECTOR variants
- "s390x/tcg: Simplify vop64_2() handling"
-- uint64_t se -> bool se
- "s390x/tcg: Implement VECTOR FP (MAXIMUM|MINIMUM)"
-- Drop special cases when both values are infinity
-- Simplify cases when both values are zero
-- Simplify dcmask handling
-- uint64_t se -> bool se
- "linux-user: elf: Prepare for Vector enhancements facility"
-- Added to properly indicate the new elf capability

v1 -> v2:
- Too much changed to spell it out explicitly. Mostly addressed feedback
  from Richard, a couple of bugfixes found while testing, and some
  simplifications/cleanups.
- Rebased on top of Richard's softfloat rework

Cc: qemu-s390x@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>

David Hildenbrand (26):
  s390x/tcg: Fix FP CONVERT TO (LOGICAL) FIXED NaN handling
  s390x/tcg: Fix instruction name for VECTOR FP LOAD
    (LENGTHENED|ROUNDED)
  s390x/tcg: Simplify vop64_3() handling
  s390x/tcg: Simplify vop64_2() handling
  s390x/tcg: Simplify vfc64() handling
  s390x/tcg: Simplify vftci64() handling
  s390x/tcg: Simplify vfma64() handling
  s390x/tcg: Simplify vfll32() handling
  s390x/tcg: Simplify vflr64() handling
  s390x/tcg: Simplify wfc64() handling
  s390x/tcg: Implement VECTOR BIT PERMUTE
  s390x/tcg: Implement VECTOR MULTIPLY SUM LOGICAL
  s390x/tcg: Implement 32/128 bit for VECTOR FP
    (ADD|DIVIDE|MULTIPLY|SUBTRACT)
  s390x/tcg: Implement 32/128 bit for VECTOR (LOAD FP INTEGER|FP SQUARE
    ROOT)
  s390x/tcg: Implement 32/128 bit for VECTOR FP COMPARE *
  s390x/tcg: Implement 32/128 bit for VECTOR FP COMPARE (AND SIGNAL)
    SCALAR
  s390x/tcg: Implement 64 bit for VECTOR FP LOAD LENGTHENED
  s390x/tcg: Implement 128 bit for VECTOR FP LOAD ROUNDED
  s390x/tcg: Implement 32/128 bit for VECTOR FP PERFORM SIGN OPERATION
  s390x/tcg: Implement 32/128 bit for VECTOR FP TEST DATA CLASS
    IMMEDIATE
  s390x/tcg: Implement 32/128 bit for VECTOR FP MULTIPLY AND
    (ADD|SUBTRACT)
  s390x/tcg: Implement VECTOR FP NEGATIVE MULTIPLY AND (ADD|SUBTRACT)
  s390x/tcg: Implement VECTOR FP (MAXIMUM|MINIMUM)
  linux-user: elf: s390x: Prepare for Vector enhancements facility
  s390x/tcg: We support Vector enhancements facility
  s390x/cpumodel: Bump up QEMU model to a stripped-down IBM z14 GA2

 hw/s390x/s390-virtio-ccw.c      |    3 +
 include/elf.h                   |    1 +
 linux-user/elfload.c            |    1 +
 target/s390x/cpu_models.c       |    4 +-
 target/s390x/fpu_helper.c       |   41 +-
 target/s390x/gen-features.c     |   14 +-
 target/s390x/helper.h           |   70 +-
 target/s390x/insn-data.def      |   16 +-
 target/s390x/internal.h         |    9 +
 target/s390x/translate_vx.c.inc |  633 ++++++++++++++----
 target/s390x/vec_fpu_helper.c   | 1079 ++++++++++++++++++++++---------
 target/s390x/vec_helper.c       |   22 +
 12 files changed, 1422 insertions(+), 471 deletions(-)

-- 
2.31.1


