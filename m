Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DBA4E353F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 01:08:08 +0100 (CET)
Received: from localhost ([::1]:44136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWS4F-0002It-81
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 20:08:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1L-0007pW-0i; Mon, 21 Mar 2022 20:05:07 -0400
Received: from [2607:f8b0:4864:20::730] (port=45725
 helo=mail-qk1-x730.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1C-0007HS-E7; Mon, 21 Mar 2022 20:05:03 -0400
Received: by mail-qk1-x730.google.com with SMTP id h196so12887185qke.12;
 Mon, 21 Mar 2022 17:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cL3i9Bbw69pWqGNe1Y+Ghn4Ri9Z4untEXU+PI9NOki4=;
 b=SsXEfiIS9KR7DF+51ih0ZGNLVMZZ45AKeuikaOvlKNl6HcjdoLjYWawYgjoAs4ooTw
 OQ9hnZJp658KLBwtYT2e4cfmAq994ReDbrHhmjFofr67wMpDBF8f+HOOEP4IHXHNALbV
 9YOPw/j6jG8LRXYImaIgkPvnKkI8SP0HUh0YxNf/c8OXr+ymLU5EoIDIyta4v8TygDaY
 OpKcN5aTgPvpUU6hkS31FrQWat5sOpRV6UwnD+VwVptrlHxAVuyDSp7e3Tpcejjnamyd
 1JqSY3Ggl4cQNUBvXEqw16ULnrc0LUC9sExa47spZQsydVsyMRJwv8rGJnpL2A+3CyOg
 hNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cL3i9Bbw69pWqGNe1Y+Ghn4Ri9Z4untEXU+PI9NOki4=;
 b=NvB5dQ1fALfb8Sm9IFkMy1b39ZhLqdqbGyZYFnXDbCu11sHFY8MseIHiEvAqGHpHup
 VTZ3AWJouz8vBaULJT1PtUZeYRux4gvjefZKLvrPQPby6bKjqZwjtiiYSvZYp2rjyC2y
 N86ZfEo68a/RH0MNIz7Lws4hdi+IuHu1ZXbPqNDFSGTtPRIeo3A3WocW5ZrON93sNjuN
 0Wu/qBLo37aJUCj3BrkENhnuWSsNrAlGN/zzbGdHpghhxM3RI3zS9+FKKpEtJdRimGS/
 fU2bxS5Ow4CZHYkqIxuqYZzZ8PWEtNd7rPE41oojP5EgznoH7DVwSZJhqd+Fz6VzB0jK
 lZ/Q==
X-Gm-Message-State: AOAM533HdbFC2gnl1lA0/VNy2tz9Y7vLsCsqFPXqg+XoVc3hf3MdmTUK
 m3XSidQEzCQ6mrsoIxr+uGdR3Bg2AsV5xA==
X-Google-Smtp-Source: ABdhPJxK6rpLK9/jFBG9Fc5fATX1ybK0zFfn9r8nFW4AdCNyy1s8Bh+Eho1JSZ/Q3xt4REFxFkiQ7A==
X-Received: by 2002:a05:620a:45a1:b0:67d:af98:10d5 with SMTP id
 bp33-20020a05620a45a100b0067daf9810d5mr14248559qkb.1.1647907494281; 
 Mon, 21 Mar 2022 17:04:54 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 a129-20020a376687000000b0067d186d953bsm8214038qkc.121.2022.03.21.17.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 17:04:53 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 00/11] s390x/tcg: Implement Vector-Enhancements Facility 2
Date: Mon, 21 Mar 2022 20:04:30 -0400
Message-Id: <20220322000441.26495-1-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::730
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=dmiller423@gmail.com; helo=mail-qk1-x730.google.com
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


David Miller (9):
  tcg: Implement tcg_gen_{h,w}swap_{i32,i64}
  target/s390x: vxeh2: vector convert short/32b
  target/s390x: vxeh2: vector string search
  target/s390x: vxeh2: Update for changes to vector shifts
  target/s390x: vxeh2: vector shift double by bit
  target/s390x: vxeh2: vector {load, store} elements reversed
  target/s390x: vxeh2: vector {load, store} byte reversed elements
  target/s390x: vxeh2: vector {load, store} byte reversed element
  target/s390x: add S390_FEAT_VECTOR_ENH2 to qemu CPU model
  tests/tcg/s390x: Tests for Vector Enhancements Facility 2
  target/s390x: Fix writeback to v1 in helper_vstl

Richard Henderson (2):
  tcg: Implement tcg_gen_{h,w}swap_{i32,i64}
  target/s390x: Fix writeback to v1 in helper_vstl

 include/tcg/tcg-op.h                 |   6 +
 target/s390x/gen-features.c          |   2 +
 target/s390x/helper.h                |  13 +
 target/s390x/tcg/insn-data.def       |  40 ++-
 target/s390x/tcg/translate.c         |   3 +-
 target/s390x/tcg/translate_vx.c.inc  | 463 ++++++++++++++++++++++++---
 target/s390x/tcg/vec_fpu_helper.c    |  31 ++
 target/s390x/tcg/vec_helper.c        |   2 -
 target/s390x/tcg/vec_int_helper.c    |  55 ++++
 target/s390x/tcg/vec_string_helper.c |  99 ++++++
 tcg/tcg-op.c                         |  30 ++
 tests/tcg/s390x/Makefile.target      |   8 +
 tests/tcg/s390x/vxeh2_vcvt.c         |  97 ++++++
 tests/tcg/s390x/vxeh2_vlstr.c        | 146 +++++++++
 tests/tcg/s390x/vxeh2_vs.c           |  91 ++++++
 15 files changed, 1031 insertions(+), 55 deletions(-)
 create mode 100644 tests/tcg/s390x/vxeh2_vcvt.c
 create mode 100644 tests/tcg/s390x/vxeh2_vlstr.c
 create mode 100644 tests/tcg/s390x/vxeh2_vs.c

-- 
2.34.1


