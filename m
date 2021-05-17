Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7A0383088
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 16:29:58 +0200 (CEST)
Received: from localhost ([::1]:56246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lieFp-0004Mw-2h
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 10:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieDt-0001hj-FV
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:27:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieDo-0006lx-Lp
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621261671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yXdjInGchDAiwu8phzLTVTdlkRowU+0XoVrNW8YLwqw=;
 b=fyTxeSNsTHXYt0Srzo3d2QB/rjTBT4cDDLu7+xdO/f5tTNO70uW8KL6tbuWtdqjjH2hGCb
 UOYYv5WtWzsobPKdcoGsuAJ6WVnbv3BVAI3sJXUJoiSA5386vLmjc7DDuuhLX6uDJKGlRw
 deVCTyZOEyRnma3JhYQYp7jM1lPjRoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-nZzflIdSOi6UUj6QUFsB3Q-1; Mon, 17 May 2021 10:27:49 -0400
X-MC-Unique: nZzflIdSOi6UUj6QUFsB3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 449089F7CB;
 Mon, 17 May 2021 14:27:48 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-101.ams2.redhat.com [10.36.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DF665DDAD;
 Mon, 17 May 2021 14:27:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/26] s390x/tcg: Implement Vector enhancements facility
 and switch to z14
Date: Mon, 17 May 2021 16:27:13 +0200
Message-Id: <20210517142739.38597-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
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

v1 -> v2:
- Too much changed to spell it out explicitly. Mostly addressed feedback
  from Richard, a couple of bugfixes found while testing, and some
  simplifications/cleanups.
- Rebased on top of Richard's softfloat rework

Based-on: 20210508014802.892561-1-richard.henderson@linaro.org

Cc: qemu-s390x@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>

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
  softfloat: Implement
    float128_(min|minnum|minnummag|max|maxnum|maxnummag)
  s390x/tcg: Implement VECTOR FP (MAXIMUM|MINIMUM)
  s390x/tcg: We support Vector enhancements facility
  s390x/cpumodel: Bump up QEMU model to a stripped-down IBM z14 GA2

 fpu/softfloat.c                 |   17 +
 hw/s390x/s390-virtio-ccw.c      |    3 +
 include/fpu/softfloat.h         |    6 +
 target/s390x/cpu_models.c       |    4 +-
 target/s390x/fpu_helper.c       |   41 +-
 target/s390x/gen-features.c     |   14 +-
 target/s390x/helper.h           |   70 +-
 target/s390x/insn-data.def      |   16 +-
 target/s390x/internal.h         |    9 +
 target/s390x/translate_vx.c.inc |  633 ++++++++++++++----
 target/s390x/vec_fpu_helper.c   | 1114 ++++++++++++++++++++++---------
 target/s390x/vec_helper.c       |   22 +
 12 files changed, 1478 insertions(+), 471 deletions(-)

-- 
2.31.1


