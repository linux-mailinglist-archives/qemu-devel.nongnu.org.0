Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD06513099
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:03:17 +0200 (CEST)
Received: from localhost ([::1]:33272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk0zU-0001P6-PT
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nk0k3-00035d-Vr
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:47:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nk0k1-0008B9-4I
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:47:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651139235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=OLkdUlYt8OXViZ3ql0HN9vJKa5uXR0DVcCMwHPnEAFw=;
 b=K8OBS6524ljro/6GOW4LjdGuRyzvH1clXQ4NUtmhksiJfG7tQ0W8Dp9tvzVmikpTEcO2uN
 /qDTcOGnySeL5JfNg6PTCbSshh+fbiEQuLugkhy+EmWo80g6I5yh/qGHWFRzMM/eQnHEzI
 AayOE0OsGXiFLwmZ6Sry83x7dNIHjog=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-7SvPZF_zNfOZ-gyZtvJjpw-1; Thu, 28 Apr 2022 05:47:12 -0400
X-MC-Unique: 7SvPZF_zNfOZ-gyZtvJjpw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B27951C0854E;
 Thu, 28 Apr 2022 09:47:11 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91D5F407E242;
 Thu, 28 Apr 2022 09:47:09 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/13] s390x/tcg: Implement Vector-Enhancements Facility 2
Date: Thu, 28 Apr 2022 11:46:55 +0200
Message-Id: <20220428094708.84835-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, David Miller <dmiller423@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement Vector-Enhancements Facility 2 for s390x

resolves: https://gitlab.com/qemu-project/qemu/-/issues/738

implements:
    VECTOR LOAD ELEMENTS REVERSED               (VLER)
    VECTOR LOAD BYTE REVERSED ELEMENTS          (VLBR)
    VECTOR LOAD BYTE REVERSED ELEMENT           (VLEBRH, VLEBRF, VLEBRG)
    VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO  (VLLEBRZ)
    VECTOR LOAD BYTE REVERSED ELEMENT AND REPLICATE (VLBRREP)
    VECTOR STORE ELEMENTS REVERSED              (VSTER)
    VECTOR STORE BYTE REVERSED ELEMENTS         (VSTBR)
    VECTOR STORE BYTE REVERSED ELEMENTS         (VSTEBRH, VSTEBRF, VSTEBRG)
    VECTOR SHIFT LEFT DOUBLE BY BIT             (VSLD)
    VECTOR SHIFT RIGHT DOUBLE BY BIT            (VSRD)
    VECTOR STRING SEARCH                        (VSTRS)

    modifies:
    VECTOR FP CONVERT FROM FIXED                (VCFPS)
    VECTOR FP CONVERT FROM LOGICAL              (VCFPL)
    VECTOR FP CONVERT TO FIXED                  (VCSFP)
    VECTOR FP CONVERT TO LOGICAL                (VCLFP)
    VECTOR SHIFT LEFT                           (VSL)
    VECTOR SHIFT RIGHT ARITHMETIC               (VSRA)
    VECTOR SHIFT RIGHT LOGICAL                  (VSRL)


v5 -> v6:
* Move fix to #1
* Include max CPU model cleanups
* "target/s390x: add S390_FEAT_VECTOR_ENH2 to qemu CPU model"
 -> Take care of compat machines
* "tests/tcg/s390x: Tests for Vector Enhancements Facility 2"
 -> Add missing newline to end of header file
 -> Resolve simple conflict in Makefile

Cc: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: David Miller <dmiller423@gmail.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Eric Farman <farman@linux.ibm.com>

David Hildenbrand (2):
  s390x/cpu_models: drop "msa5" from the TCG "max" model
  s390x/cpu_models: make "max" match the unmodified "qemu" CPU model
    under TCG

David Miller (9):
  target/s390x: vxeh2: vector convert short/32b
  target/s390x: vxeh2: vector string search
  target/s390x: vxeh2: Update for changes to vector shifts
  target/s390x: vxeh2: vector shift double by bit
  target/s390x: vxeh2: vector {load, store} elements reversed
  target/s390x: vxeh2: vector {load, store} byte reversed elements
  target/s390x: vxeh2: vector {load, store} byte reversed element
  target/s390x: add S390_FEAT_VECTOR_ENH2 to qemu CPU model
  tests/tcg/s390x: Tests for Vector Enhancements Facility 2

Richard Henderson (2):
  target/s390x: Fix writeback to v1 in helper_vstl
  tcg: Implement tcg_gen_{h,w}swap_{i32,i64}

 hw/s390x/s390-virtio-ccw.c           |   3 +
 include/tcg/tcg-op.h                 |   6 +
 target/s390x/cpu_models.c            |  26 +-
 target/s390x/gen-features.c          |  14 +-
 target/s390x/helper.h                |  13 +
 target/s390x/tcg/insn-data.def       |  40 ++-
 target/s390x/tcg/translate.c         |   3 +-
 target/s390x/tcg/translate_vx.c.inc  | 461 ++++++++++++++++++++++++---
 target/s390x/tcg/vec_fpu_helper.c    |  31 ++
 target/s390x/tcg/vec_helper.c        |   2 -
 target/s390x/tcg/vec_int_helper.c    |  55 ++++
 target/s390x/tcg/vec_string_helper.c |  99 ++++++
 tcg/tcg-op.c                         |  30 ++
 tests/tcg/s390x/Makefile.target      |   8 +
 tests/tcg/s390x/vx.h                 |  19 ++
 tests/tcg/s390x/vxeh2_vcvt.c         |  88 +++++
 tests/tcg/s390x/vxeh2_vlstr.c        | 139 ++++++++
 tests/tcg/s390x/vxeh2_vs.c           |  93 ++++++
 18 files changed, 1051 insertions(+), 79 deletions(-)
 create mode 100644 tests/tcg/s390x/vx.h
 create mode 100644 tests/tcg/s390x/vxeh2_vcvt.c
 create mode 100644 tests/tcg/s390x/vxeh2_vlstr.c
 create mode 100644 tests/tcg/s390x/vxeh2_vs.c

-- 
2.35.1


