Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8854021A4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 02:27:30 +0200 (CEST)
Received: from localhost ([::1]:36444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNOxV-00066Z-0f
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 20:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNOvk-0003qt-Nh; Mon, 06 Sep 2021 20:25:40 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:45653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNOvj-0005f0-7C; Mon, 06 Sep 2021 20:25:40 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id bn14so4817117qvb.12;
 Mon, 06 Sep 2021 17:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YFryoeA2nfaxBDooZqUFX5D7j+mLuO2YKVQ4ULT72LE=;
 b=BZ6pBEcUB4WxQz0CAXcMSEx8ijjsomtBwiw0xgVvbqiYLm3oYcvGiJTHHdP388QZko
 sUOapFf/WJjPlDmTdU4sqZ1O9NaKzOgPsy5UO5BhDvDuxRN3nzwnSoQNLnXM/fzHk1gP
 Z6n2oI1duOnHSg6X5QWRlOpMDm0d32EsUrJPTDQ1WGz0+yZTsOat82G+h4Z8efXZylUQ
 d8JCZKyHy19mO9PXG9lRW44CY0SBly5Bm//xrrfGmfkZDLuUfgjJchzOIaRQbHB7qaG0
 Hm39+cqQSd3FK9PjBHmOMh2kV7hwTEUYuvPHfP5Fzf4/sg8sHuAjdu5tSRy2lN9gjGr0
 nh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YFryoeA2nfaxBDooZqUFX5D7j+mLuO2YKVQ4ULT72LE=;
 b=MRlC2fcEmg+cRUlSTs3H0tv4JV+ccK3XWxPcn0Ff080wTIrgpVKepTYkrE/NCGfhup
 9gIWedJ+swTd2v24BqzsFTFm9vjWYAE4lIYSkrH/uxwhXXoJrKpwD0TX71ju3zG0j9/i
 Q2uMVM0xtFRjGsR14YQqt7lH/oofEFsChc8Yg2Cc0jM1jp0Zi0sqvhH1JyxVJLR4xWdo
 wyFzD5gcUqRhIPp55qwz2oeZIksqiaARiwA1o4GmYY7W7llH0R4nnLbp41lKFXjHljKw
 Dptj6faKVoyFwLYCq420RKoozbqR3rVfxlfI2VuIIVTzfGxbUXbnyZ91JkHsez3M3RKW
 m9oA==
X-Gm-Message-State: AOAM531dRU1hxJ93pz8t74GTkpKFXBzsFQW0WLQssuG4XmO6qR5Q8OaX
 lYLedCKGIHKxK0B9GMJyiYdYqC+P120=
X-Google-Smtp-Source: ABdhPJyXDh8b5YJ1GeWsdBQaR1LsdRTF080Jscdiq+LkAwvBb2ZAs/u7VEbsMm49WoVfntsLQMXXDA==
X-Received: by 2002:ad4:482d:: with SMTP id h13mr14510374qvy.5.1630974337909; 
 Mon, 06 Sep 2021 17:25:37 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id 207sm7892056qkh.45.2021.09.06.17.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 17:25:37 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/4] pSeries FORM2 affinity support
Date: Mon,  6 Sep 2021 21:25:23 -0300
Message-Id: <20210907002527.412013-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2a.google.com
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

In this new version, the biggest change is that now we're initializing
NUMA associativity internal data during machine_reset(), instead of
machine_init(), to allow for the guest to switch between FORM1 and
FORM2 during guest reset. All other changes are consequence of this
design change.

Changes from v4:
- former patch 1:
  * dropped, pseries-6.2 machine type is already available
- new patch 1:
  * move numa associativity init to machine reset
- patch 3:
  * avoid resetting associativity data if FORM1 was chosen
- former patch 4:
  * dropped, folded into patch 1
- patch 4 (former 5):
  * move both FORM1 verifications to post-CAS
- v4 link: https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg04860.html
 

Daniel Henrique Barboza (4):
  spapr: move NUMA associativity init to machine reset
  spapr_numa.c: split FORM1 code into helpers
  spapr_numa.c: base FORM2 NUMA affinity support
  spapr: move FORM1 verifications to do_client_architecture_support()

 hw/ppc/spapr.c              |  63 +++++-----
 hw/ppc/spapr_hcall.c        |  16 +++
 hw/ppc/spapr_numa.c         | 225 +++++++++++++++++++++++++++++++++---
 include/hw/ppc/spapr.h      |   1 +
 include/hw/ppc/spapr_numa.h |  10 +-
 include/hw/ppc/spapr_ovec.h |   1 +
 6 files changed, 253 insertions(+), 63 deletions(-)

-- 
2.31.1


