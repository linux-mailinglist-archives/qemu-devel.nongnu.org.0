Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A01B94100B9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 23:29:58 +0200 (CEST)
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRLQh-0005px-N8
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 17:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mRLP4-00037N-GF; Fri, 17 Sep 2021 17:28:14 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a]:35623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mRLP3-0007id-0w; Fri, 17 Sep 2021 17:28:14 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 y3-20020a4ab403000000b00290e2a52c71so3656984oon.2; 
 Fri, 17 Sep 2021 14:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nOJLthqDv8T5wGOAZCSaxH/T/GXkkiMVB5naSo+TwyA=;
 b=W4CnnA4gKoysxwe7X9bZb26fnxn7Le/KjaZHP6b0IutVpaz/m3XiwNfKgDkheFm7Qt
 0XJrNmYT9Tq0NayUjmfNn8kle1mZZbU2La7+ivv2nZuOyFSyTDeBBylLAiwpXWBEAo4y
 F8Ex0Nhj/fIlp1Ch22wmEj8CdcNna7rzkngQtsmr5OXpPKpFGEY30ta365aO3rqFSi92
 +SVTMXVODwtoVCGlxg7Vs8WP+tTYLBSY2H9/jVaYbHM8t8tQyrhE8V77qgmCqzcS65/s
 MXOtqMeMcKtJZC2i9lQCxSQ2tXVFGrigFk8PmgxPpPLN7RHpCZJn/ROFamLRntzulXbn
 eezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nOJLthqDv8T5wGOAZCSaxH/T/GXkkiMVB5naSo+TwyA=;
 b=O6mviis70K/e0ALIJs7b+F7gKURZIoKByWZthmDmt6f6gKXZmfRn4ZjQX3lOyUCBKk
 CsUH7Ef4vYmucVHN0SlGevHen9ee/0xUy687c6W7iHwpzXpSI/gMEljR0/4Z6EawykMT
 VbQePqj5RZCnrrr5Qnj2EnICpSRstpNcNBgKIgsk6y/y59OYcNrs7aLMVrYnqss3GlA4
 CGWF05mpX6Nupq/PZTyTwSGy7eZJuwFlDgqvTcIFQkhVA82s5YK2rGg/zyVD/pZ+P6eL
 +MQdkEt72G+XVMLHdGbytfAoLR1wS2Ba+72lIHyn/oDIfIitCDdO1ERyTDig4Gz3uTw+
 Zadg==
X-Gm-Message-State: AOAM533b9a8PffrTAVgiLp3XY5R7X8ZBQhp+q1m8Vz40CJP7LIEVXLSC
 DhJL82Wua+hVON5FH/gc5Q+S0eQ1qTM=
X-Google-Smtp-Source: ABdhPJwtSr8f/WDrlMJ++1/A8E4QghX39R3MVeB4NUk0MPhs9WcUobFzlTuEqAweHIEpJphmGoqQdA==
X-Received: by 2002:a4a:a509:: with SMTP id v9mr10680598ook.73.1631914091390; 
 Fri, 17 Sep 2021 14:28:11 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id s16sm710560otq.78.2021.09.17.14.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 14:28:11 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 0/7] pSeries FORM2 affinity support
Date: Fri, 17 Sep 2021 18:27:55 -0300
Message-Id: <20210917212802.424481-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This new version contains changes made in patch 7 after looking more
carefully in the auto-generated NUMA node issue. I also took the
opportunity to make a change that Greg requested in an earlier
review that didn't make to v7.


Changes from v7:
- patch 3:
  * removed redundant 'no FORM2 available yet' comments
- patch 7:
  * removed the unneeded handling of numa_state->num_nodes
- v7 link: https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg04156.html

Changes from v6:
- patch 1:
  * added Greg's r-b
- patch 2:
  * added the missing NUMA nodes number check
  * added Greg's r-b
- patch 3 (former patch 4):
  * no changes.
- former patch 3 (associativity_reset()): dropped
- patch 4 (new):
  * added get_associativity()
  * do not allocate FORM1_assoc_array in the heap
- patch 5:
  * fixed typo
  * added new check function to be called in CAS
- patch 6:
  * do not allocate FORM2_assoc_array in the heap
- patch 7 (new):
  * FORM2 fixes to handle the implicit added QEMU NUMA node when there's
  no NUMA node added by the user.
- v6 link: https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02892.html

Daniel Henrique Barboza (7):
  spapr_numa.c: split FORM1 code into helpers
  spapr_numa.c: scrap 'legacy_numa' concept
  spapr_numa.c: parametrize FORM1 macros
  spapr_numa.c: rename numa_assoc_array to FORM1_assoc_array
  spapr: move FORM1 verifications to post CAS
  spapr_numa.c: FORM2 NUMA affinity support
  spapr_numa.c: handle auto NUMA node with no distance info

 hw/ppc/spapr.c              |  41 +---
 hw/ppc/spapr_hcall.c        |   7 +
 hw/ppc/spapr_numa.c         | 380 ++++++++++++++++++++++++++++++------
 include/hw/ppc/spapr.h      |  35 ++--
 include/hw/ppc/spapr_numa.h |   1 +
 include/hw/ppc/spapr_ovec.h |   1 +
 6 files changed, 354 insertions(+), 111 deletions(-)

-- 
2.31.1


