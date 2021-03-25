Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CB4348FDF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 12:32:17 +0100 (CET)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPODn-000554-BA
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 07:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPOBP-0003VP-1n
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:29:47 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPOBN-0006gA-7u
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:29:46 -0400
Received: by mail-wr1-x42c.google.com with SMTP id z2so1911285wrl.5
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 04:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LZBPq6Bnm1jLOGOoBjLvgoRlwGIANuyQGvrFCczpsn0=;
 b=Ldl4cnAQ356hdAw3LcDx8JcZ24r6IEqj/zpruZsLFxfBnen0T2y+y/+m6m1we1Um+T
 69n4ObDgzyTWyQwIKBZuuqNRJSTdD0yaYyVvsSkburvDAZHhHdebnP8PHkHkmjNgepek
 HBoVBdLb9frCk3Ti9bujqPP98w2HY8DtcAX7+a3eUYM0X4BkqPKpdV93SrxO8nlnTSmx
 y4oEGdRsnZXdS+IjUh4DXnab5Nei+3Df5rMBioIxJj6KvgeJltNGhbyfjEPV+OLnEM0W
 jdmbFSnV6s/3w0HgJebc2cleZa0Er3BoAe5R7rBiqGNkj0G1ZXRGjEiTuybxtOnG/vD3
 5Ijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=LZBPq6Bnm1jLOGOoBjLvgoRlwGIANuyQGvrFCczpsn0=;
 b=CCi8hQEur8EnRI5Tx/KXK3UwZb+Kj0A69ePPq4oYqzmWzLZpR2r1OI+Ef+p4A1rwSj
 tx1N5cJWoALp6NYdxhuQqLO3Zmp0l7YPn8LaGEs/yx3byg8+evDB92eHlJiLDphLCsHX
 59aHz5qv8ToZ3sRTX87vgbrIMnKB0W4KhCBirIySibFcaWstQx5+0IqUcOg2+kdOuZ62
 H4vLidaoczvq2bULCz4xxjDLBVJf3FEGu2xk969ortn8L3gJyn+CjFuV6OzkHlbKXMCh
 LMD4pyvYvD4Rz975U9CojjU78OP2yLtZUB0zmEu1R9DL35UMMCYUnEJbHd0EpBYYVtYv
 ghWg==
X-Gm-Message-State: AOAM530+oUVuN1kSHpcpNZDeNdNxg2UQi6IYyOLaXz1CiCEUXYZNq17W
 doX5FI3mkT1fOVuv/zzvzr+w66M2Ddg=
X-Google-Smtp-Source: ABdhPJzlqhKYUsOIKQL8kPZS2ZXupuy6pQGEgxrYuPvJHMO8UluZ2nKRd/TPQmbGrmvg9Dt7pgEWcQ==
X-Received: by 2002:a5d:6b50:: with SMTP id x16mr8224392wrw.379.1616671783003; 
 Thu, 25 Mar 2021 04:29:43 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id g11sm7220118wrw.89.2021.03.25.04.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 04:29:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/6] coroutine rwlock downgrade fix, minor VDI changes 
Date: Thu, 25 Mar 2021 12:29:35 +0100
Message-Id: <20210325112941.365238-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: david.edmondson@oracle.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a resubmit of David Edmondson's series at
https://patchew.org/QEMU/20210309144015.557477-1-david.edmondson@oracle.com/.
After closer analysis on IRC, the CoRwlock's attempt to ensure
fairness turned out to be flawed.  Therefore, this series
reimplements CoRwlock without using a CoQueue.  Tracking whether
each queued coroutine is a reader/writer makes it possible to
never wake a writer when only readers should be allowed and
vice versa.

v2->v3: new CoRwlock implementation

v3->v4: fix upgrade and add a test for that, too

v4->v5: typo

v5->v6: improve documentation, do not read lock->owners where
        neither wrlock nor lock->mutex exclude concurrent writes

David Edmondson (4):
  block/vdi: When writing new bmap entry fails, don't leak the buffer
  block/vdi: Don't assume that blocks are larger than VdiHeader
  coroutine-lock: Store the coroutine in the CoWaitRecord only once
  test-coroutine: Add rwlock downgrade test

Paolo Bonzini (2):
  coroutine-lock: Reimplement CoRwlock to fix downgrade bug
  test-coroutine: Add rwlock upgrade test

 block/vdi.c                 |  11 ++-
 include/qemu/coroutine.h    |  17 ++--
 tests/unit/test-coroutine.c | 161 ++++++++++++++++++++++++++++++++++++
 util/qemu-coroutine-lock.c  | 149 +++++++++++++++++++++------------
 4 files changed, 274 insertions(+), 64 deletions(-)

-- 
2.29.2


