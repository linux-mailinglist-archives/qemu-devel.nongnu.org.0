Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71424E53C1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 14:59:49 +0100 (CET)
Received: from localhost ([::1]:49580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1We-0001h2-PF
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 09:59:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Uc-0007Fd-JV; Wed, 23 Mar 2022 09:57:42 -0400
Received: from [2607:f8b0:4864:20::733] (port=40959
 helo=mail-qk1-x733.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Ua-0000uj-OW; Wed, 23 Mar 2022 09:57:42 -0400
Received: by mail-qk1-x733.google.com with SMTP id i65so1056349qkd.7;
 Wed, 23 Mar 2022 06:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uIGBsGtLSPpyCjv0ibIyWfovpD5vIyzKLnmhlUbCU/8=;
 b=VoA/JtWh1I7Nm3TBDsj+Z6g6ZHG7piiXDJOq2y2hGAzerLRaBBGOAemfiSvbP2TyfL
 MmAK/7uvDUWBzpCU/99DIkFcVZJsY3FLIGLvuIM9KaOl3yKHAWJgsMLy1aEQNrgc0slq
 zHMeA/7CSp0ub7v172OJF3xAB3k2beQa28ZGh1Tyv6XLBGwUsCnuWMPqWtGPrpD+xs8h
 QBJeEUdgn0jKBhKyX9ubv2Dg+KFTJI1H63eG51PNgiRgBsxFimSjwn7X33vETK2g5Hgs
 i7h/DkKU2bmLWdqKf3kWprvx18n5Y0a4DfV3mdRV9YFfLOBqRDICAprb30BWMyYG0Gkt
 gCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uIGBsGtLSPpyCjv0ibIyWfovpD5vIyzKLnmhlUbCU/8=;
 b=BlljCzDVE2umyFArJaQX+khMzPb/wfgXD6IqPmcI8e9lM6qK9oUsBrpfnO9SY1LwZA
 UYNaSBtrvHJ8vXcjNlPn+3pCK1Ttpkbz7IC9zYINispG5nCMI6ZOGooSKu3R3jlDc/Va
 /VHP8z/AQHCvnInBeg/EljajEAtocam59sGresdfWWFi31Ka3oKDpRpjAvPwPWEbPTls
 pHliCokc3dPvB+uSpIF4O1ByCExD5WzgKHHsH8SSc1AzceBF+QZsTIf0eSOe81eohrVn
 D/ozlR7dlMtnVmSTVjg2hfV/QjnawODyxfkdwdtyeiUbggSthXpwSlbsiqWa8SG+Aebr
 vPfg==
X-Gm-Message-State: AOAM531+xaHortk9dojmjrfFZ0J8F0n81XbAUjkyIeez2eCuwBofBi3A
 nkD0C21RfRSyABDJoacLcMrKmdfnCBJCiw==
X-Google-Smtp-Source: ABdhPJwLBudjW7LbwkmcAu/k0nJkwZ2CZjokt7TiC9E813CufX3QccxK764McwxTUTk9lgFKSJKrGw==
X-Received: by 2002:a05:620a:371d:b0:67d:4f5c:119b with SMTP id
 de29-20020a05620a371d00b0067d4f5c119bmr17855726qkb.75.1648043859014; 
 Wed, 23 Mar 2022 06:57:39 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 t128-20020a37aa86000000b0060ddf2dc3ecsm20907qke.104.2022.03.23.06.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 06:57:38 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 00/11] s390x/tcg: Implement Vector-Enhancements Facility 2
Date: Wed, 23 Mar 2022 09:57:11 -0400
Message-Id: <20220323135722.1623-1-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::733
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=dmiller423@gmail.com; helo=mail-qk1-x733.google.com
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
 16 files changed, 1034 insertions(+), 55 deletions(-)
 create mode 100644 tests/tcg/s390x/vx.h
 create mode 100644 tests/tcg/s390x/vxeh2_vcvt.c
 create mode 100644 tests/tcg/s390x/vxeh2_vlstr.c
 create mode 100644 tests/tcg/s390x/vxeh2_vs.c

-- 
2.34.1


