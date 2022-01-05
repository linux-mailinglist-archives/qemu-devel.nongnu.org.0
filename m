Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6658484C73
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 03:27:24 +0100 (CET)
Received: from localhost ([::1]:42698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4w1L-00041P-Al
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 21:27:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n4vx1-0001Es-GC
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 21:22:55 -0500
Received: from [2607:f8b0:4864:20::102a] (port=39456
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n4vwz-0005XQ-Ts
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 21:22:55 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso354802pjm.4
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 18:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xQ1pF4pkhR8rxEPKphSN3UAQJlKORYmOv7NGLw06rhc=;
 b=RUChbzeKPTJ0cqfNHwM2/jbiVSYGSRNb9w4XLEden7BQ+GBDWLOoIjGQLgJ+cbVgBr
 ytLxnGcweCHVs3vlK50pBwdqAnr5MzhHodOIDZx1XlvNLJakByP4hYGfSJQsf2T5nL8c
 vM1B4bg8+X8OULmJKSHv6k2huNYDpUXfa1Lib4vLvhHgDBudxJywmBCvYhYQNNQ/dgH/
 5DaxN2U8L/26pDRUvbL9NtOUtS4+MO8KHwjxw4+XOxKw3YOYnTS7iQAgpzbCEU3Rk1d4
 mnOvFdrWft28DkrVEm2ZCpYoYKOweI9nIcJB8KdURFzYM9HP4EHvxZ+uzYo9v3J8daOy
 R1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xQ1pF4pkhR8rxEPKphSN3UAQJlKORYmOv7NGLw06rhc=;
 b=l590j1b811UNyt9SgqmxAgSCxo2JGMHVPVSNVwl80Oa8AeTnLpm+w9a+NBR5eNqn5h
 PbwsLEtDE5C3ykkTyh+mFSs5RoEISl+yIdS7wdB5yHpaDMKGQ7R38bYUl+n74U2nqEVh
 43scBilwEiQpae5vKrEsJYFbMAr+GWHBqQzYttNlvSKEprWYXIWDw78pnHGBB+SBXUo0
 xxythCPZSTrj7155rwFi07hfqQoO0gKW8BModqscmN0sj+3w9lQ/mVjNEucoRdesYnxl
 m25y1+V6lB3QlVFzLIfMwvYDL0Ym6XOmVQ8sDgvCntv7rACKG82wza8xf7cKVAsqX/0e
 YqqA==
X-Gm-Message-State: AOAM533GqpcefIgWz/ICpA9ZJ+XD1doU3dEOa+OlFZlDm6o3pocuL9Jc
 +98w4QW5rxLz2ZyrQNej1ckw+kIM1D8UdQ==
X-Google-Smtp-Source: ABdhPJx8EpPMNi37pd6mkSmC+LaMtRKsd02YAgUMAGLNIE8ihhXf4joFQSMKgd8kj0IXRObNz++zgw==
X-Received: by 2002:a17:90a:b30a:: with SMTP id
 d10mr1575127pjr.92.1641349371711; 
 Tue, 04 Jan 2022 18:22:51 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id x19sm193593pgi.19.2022.01.04.18.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 18:22:51 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] Fix RVV calling incorrect RFV/RVD check functions bug
Date: Wed,  5 Jan 2022 10:22:43 +0800
Message-Id: <20220105022247.21131-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

For vector widening and narrowing floating-point instructions, we should
use require_scale_rvf() instead of require_rvf() to check whether the
correspond RVF/RVD is enabled if either source or destination
floating-point operand is double-width of SEW. Otherwise, illegal
instruction exception should be raised.

e.g. For SEW=16, if the source/destination floating-point operand is
double-width of SEW, RVF needs to be enabled. Otherwise, an illegal
instruction exception will be raised. Similarly, for SEW=32, RVD
needs to be enabled.

Changelog:

v2:
  * Fix patch title typos.
  * Add missing Signed-off-by.

Frank Chang (3):
  target/riscv: rvv-1.0: Call the correct RVF/RVD check function for
    widening fp insns
  target/riscv: rvv-1.0: Call the correct RVF/RVD check function for
    widening fp/int type-convert insns
  target/riscv: rvv-1.0: Call the correct RVF/RVD check function for
    narrowing fp/int type-convert insns

 target/riscv/insn_trans/trans_rvv.c.inc | 78 ++++++++++++++++++-------
 1 file changed, 57 insertions(+), 21 deletions(-)

--
2.31.1


