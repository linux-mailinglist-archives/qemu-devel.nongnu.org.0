Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60904CEF4E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 03:06:05 +0100 (CET)
Received: from localhost ([::1]:60422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR2lA-0004vC-2j
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 21:06:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nR2ip-0002SG-RN; Sun, 06 Mar 2022 21:03:40 -0500
Received: from [2607:f8b0:4864:20::82c] (port=43720
 helo=mail-qt1-x82c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nR2io-0005wP-6F; Sun, 06 Mar 2022 21:03:39 -0500
Received: by mail-qt1-x82c.google.com with SMTP id s15so12129037qtk.10;
 Sun, 06 Mar 2022 18:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wKIFlTgtBQQMP6baULHp3UmhiTE8TtWCttzHNXunqw4=;
 b=mR284ZfxccMcTzt3fX6rJOYqUFv/7RkvaP3CIdCnbEk1VUwgX3nMBlhkVpERucvUh1
 WUJg8JFCKH4gM/5PrWPxb6N8odfevOAXmlDHPP3nboUOt6zDMbRMBOUaLxQmilDhtL6/
 8in8hQO0hmrnTX5Ki0YfMVOTGadKJ8WQ5C0WRbS/2A6aff/8z+piiiN/d4I8u2+E4lkr
 O0DjgojrLtD6l35KrPTqJL+oqXfErY3TYeD0jvzfTdd+GkdGR0NxsEbYj6qmgGrDHN6X
 x//w7Vf/DHsxPt9oB0j2v2tZSwmCyFYSqIci1sGH+Qk5TJlV9xJl6278Xl4pTBA1ywup
 PqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wKIFlTgtBQQMP6baULHp3UmhiTE8TtWCttzHNXunqw4=;
 b=2ezcTewVdJV9cFcr0b6aHtfrwO/VKdVbSkkc6jZiCOlLgAT6AmbFjY8KoBGz67DzcZ
 Ez0qJbUidIOw++wCWFLk0AkZ/dQpfIopEQ2TEOTRlPaBFioaaElswQygFtJiz1iN3TsT
 WOaT8yUYuHyA0zbhfDSjvj1u/6CW7/u5YP2bSy3BdY5C97aCsdRngFhRtQcv93jJKe6T
 6MbJocg6kCfQi6sa8PVt/TFiC1b3zwqvRjbbbkV6AB04ViJZtDUNEEy575lG2So0N7Xd
 waUGh316Ym9wXWmYUDyTQ1gE74kPsNj5iZ6iWVZwSy6JhXOGI9dI/BzZ08my8FZvh9Vr
 6njg==
X-Gm-Message-State: AOAM530kEbhTLk0885WG5/QsaLtJEMHfx+26D/gJjJang/EZ5FhyQ/Xc
 31VmTDBdD8wP/psV0v73NYqTPSYpHr23iA==
X-Google-Smtp-Source: ABdhPJzVcS2KMD2SCJn7EWS6AYF6ppDkAt+rfk7vZ7XOBnhx03huqAVH5qanUEci0/QUqRb02XO7eg==
X-Received: by 2002:ac8:75d0:0:b0:2db:aad5:ec47 with SMTP id
 z16-20020ac875d0000000b002dbaad5ec47mr7817504qtq.390.1646618616660; 
 Sun, 06 Mar 2022 18:03:36 -0800 (PST)
Received: from localhost.localdomain (mont-dyn-146-145.pwrtc.com.
 [205.174.146.145]) by smtp.gmail.com with ESMTPSA id
 p190-20020a37a6c7000000b00648ea630a45sm5601053qke.121.2022.03.06.18.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 18:03:36 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] s390x/tcg: Implement Vector-Enhancements Facility 2
Date: Sun,  6 Mar 2022 21:03:20 -0500
Message-Id: <20220307020327.3003-1-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=dmiller423@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
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

David Miller (7):
  target/s390x: vxeh2: vector convert short/32b
  target/s390x: vxeh2: vector string search
  target/s390x: vxeh2: vector shift {double by bit, left, right
    {logical,arithmetic}}
  target/s390x: vxeh2: vector {load,store} elements reversed
  target/s390x: vxeh2: vector {load,store} reversed elements [and
    {zero,replicate}]
  target/s390x: add S390_FEAT_VECTOR_ENH2 to cpu max
  tests/tcg/s390x: Tests for Vector Enhancements Facility 2

 include/qemu/bitops.h                |  25 ++
 target/s390x/gen-features.c          |   2 +
 target/s390x/helper.h                |  12 +-
 target/s390x/tcg/insn-data.def       |  28 +-
 target/s390x/tcg/translate.c         |   3 +-
 target/s390x/tcg/translate_vx.c.inc  | 369 ++++++++++++++++++++++++---
 target/s390x/tcg/vec.h               |  24 ++
 target/s390x/tcg/vec_fpu_helper.c    |  31 +++
 target/s390x/tcg/vec_helper.c        |  31 +++
 target/s390x/tcg/vec_int_helper.c    |  58 +++++
 target/s390x/tcg/vec_string_helper.c |  65 +++++
 tests/tcg/s390x/Makefile.target      |   8 +
 tests/tcg/s390x/vxeh2_vcvt.c         |  97 +++++++
 tests/tcg/s390x/vxeh2_vlstr.c        | 146 +++++++++++
 tests/tcg/s390x/vxeh2_vs.c           |  91 +++++++
 15 files changed, 947 insertions(+), 43 deletions(-)
 create mode 100644 tests/tcg/s390x/vxeh2_vcvt.c
 create mode 100644 tests/tcg/s390x/vxeh2_vlstr.c
 create mode 100644 tests/tcg/s390x/vxeh2_vs.c

-- 
2.34.1


