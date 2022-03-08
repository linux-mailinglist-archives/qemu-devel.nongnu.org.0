Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A394D0DC6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 03:00:58 +0100 (CET)
Received: from localhost ([::1]:53046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRP9m-0008Ly-19
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 21:00:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP36-0005tB-EJ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:04 -0500
Received: from [2607:f8b0:4864:20::632] (port=34533
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP34-0007rc-Or
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:03 -0500
Received: by mail-pl1-x632.google.com with SMTP id s18so2474822plp.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 17:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JF6AHBmnOPxoh7trrOzygx3lbWSFueWYHjXHWxplJPQ=;
 b=XY4s6SQdD32ImkJbTStsB6o7jeqE+Dhpq6uhLRtmkYFq0QtiLYfwdAT7PqMwGJmeN5
 kf4Bkgvaegt57os//CRliuRUfP9qTx/Q8oLRsAauIeG0/ExcXihm0voLjQ2eAIUG9Lcj
 7t+j4OuZWd9WuGsNQU5LUuvjKK3NKwwsQLN5k6MOt2NOeKBsBN4/XE5UISCH9BeHYxRo
 kAK2XImv7VFHjZxNpI24P+mIw7b/hGVfRQ6zeH0vynJzJcpYU1WnCaaJmJaU65yvMiya
 gMDhOpIvfiLhdKLneHgi7UGWNjDLKeBS9ILvXIXZ6Spn+xe0mPq7YUj+VhVV3zPuNKXs
 ybFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JF6AHBmnOPxoh7trrOzygx3lbWSFueWYHjXHWxplJPQ=;
 b=bTgTP/jPESeapon3gllF/vzCqrb9Os1e3EjyYmDa2RpbGoIAdV8MSgYp0Rb1ZmKQrt
 +ksj1hP+gjliYB66Y2X2Be67dorEqHDWUCrfowzjSJKuaORgu/DVfLr0DPbhMuiftdbU
 iXLIdlLicEje8zJmi4ThmOqr9Ga/dRgkRSicvNXRqlRvIYdp58/Lkx1wvK9le8+N+TRH
 qXh1T5zuTZXzJLEhPJAUdsXOuLIQcHqvJFG9/t0YLWXr75o/aXk1b6E17zqzzFtuz2zV
 Ss8bqjb5y4jvzYfM+GDhWZvObMBupfMXSsHbwMLwskDnsEwVzkzkzkapWaek5CADNHh4
 7HMA==
X-Gm-Message-State: AOAM533hPynT1m0Wo8xsiOs1X24Q5xEpfe4eUdS8yK7APqcjblRdtKPB
 6hLfpkvQVNCpcc4fbArYK3tb+tYc+4s1zg==
X-Google-Smtp-Source: ABdhPJzXypJ2+mwpVKMxVarkAddZrxv+RKqFXR0m8bDtRXpPpnZscbiVpc0i/DZ0fLsx+/qeY7P16Q==
X-Received: by 2002:a17:902:6903:b0:151:6781:9397 with SMTP id
 j3-20020a170902690300b0015167819397mr15307557plk.137.1646704441211; 
 Mon, 07 Mar 2022 17:54:01 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 bh3-20020a056a02020300b00378b62df320sm12775221pgb.73.2022.03.07.17.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 17:54:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/11] s390x/tcg: Implement Vector-Enhancements Facility 2
Date: Mon,  7 Mar 2022 15:53:47 -1000
Message-Id: <20220308015358.188499-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

I've split up the patches a bit, made some improvements to
the shifts and reversals, and fixed a few bugs.

Please especially review vector string search, as that is
has had major changes.


r~


David Miller (9):
  target/s390x: vxeh2: vector convert short/32b
  target/s390x: vxeh2: vector string search
  target/s390x: vxeh2: Update for changes to vector shifts
  target/s390x: vxeh2: vector shift double by bit
  target/s390x: vxeh2: vector {load, store} elements reversed
  target/s390x: vxeh2: vector {load, store} byte reversed elements
  target/s390x: vxeh2: vector {load, store} byte reversed element
  target/s390x: add S390_FEAT_VECTOR_ENH2 to cpu max
  tests/tcg/s390x: Tests for Vector Enhancements Facility 2

Richard Henderson (2):
  tcg: Implement tcg_gen_{h,w}swap_{i32,i64}
  target/s390x: Fix writeback to v1 in helper_vstl

 include/tcg/tcg-op.h                 |   6 +
 target/s390x/helper.h                |  13 +
 target/s390x/gen-features.c          |   2 +
 target/s390x/tcg/translate.c         |   3 +-
 target/s390x/tcg/vec_fpu_helper.c    |  31 ++
 target/s390x/tcg/vec_helper.c        |   2 -
 target/s390x/tcg/vec_int_helper.c    |  58 ++++
 target/s390x/tcg/vec_string_helper.c | 101 ++++++
 tcg/tcg-op.c                         |  30 ++
 tests/tcg/s390x/vxeh2_vcvt.c         |  97 ++++++
 tests/tcg/s390x/vxeh2_vlstr.c        | 146 +++++++++
 tests/tcg/s390x/vxeh2_vs.c           |  91 ++++++
 target/s390x/tcg/translate_vx.c.inc  | 442 ++++++++++++++++++++++++---
 target/s390x/tcg/insn-data.def       |  40 ++-
 tests/tcg/s390x/Makefile.target      |   8 +
 15 files changed, 1018 insertions(+), 52 deletions(-)
 create mode 100644 tests/tcg/s390x/vxeh2_vcvt.c
 create mode 100644 tests/tcg/s390x/vxeh2_vlstr.c
 create mode 100644 tests/tcg/s390x/vxeh2_vs.c

-- 
2.25.1


