Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFD140D13D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 03:33:26 +0200 (CEST)
Received: from localhost ([::1]:60646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQgHF-0001jq-2E
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 21:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mQgEL-0006om-8H; Wed, 15 Sep 2021 21:30:25 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:38417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mQgEH-00049Q-3L; Wed, 15 Sep 2021 21:30:25 -0400
Received: by mail-qt1-x831.google.com with SMTP id g11so4221412qtk.5;
 Wed, 15 Sep 2021 18:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sTT2KRU8uUO+cpZwUyEjvBbGwEB4FkWqJRkkQq5A/Z8=;
 b=Vyk4QVG5rO5QNxHqN4rmGPoKk9nlxUfxUYGx9Sz3jCqvjymqeEVVFjmirxKTiCEdsD
 2iTCaFW6hXxniG39LBwZiIbmpomh5sXhrMka1A3/eJhiH8Xogsh6O24duZ+KtTDbhx3g
 +GCfFcP3IKmRsXxHlC89YmDiu8KFqvqIy22rYcVVfWmKhe3EphvUi6sMfPTDhCKSSSLT
 NPJnGIleu8pSnWBGPHEDF91G1a7YFERFqk5bwhDPrF0ngdNDqFnejkzJfsFgRvbOIu8e
 qVaEbUe+0tF9TgylHRK6cmRQEWTxko8ZnE3NZJdfVfgp1htiu4vQ4fR6XLytdxYrTwN/
 Bjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sTT2KRU8uUO+cpZwUyEjvBbGwEB4FkWqJRkkQq5A/Z8=;
 b=JmG+zyd/92cgeqqIFiFwceRGrVKIkBlYsIcHZTRJFDVSbRzHyhudlo8Hddqx23U/PB
 MDQf0Y5l340bBHR+6T0+q7djmuLi6SMIr1Qbs++yMiZDFvT/ha7D8LCC1w1AEYdXoabM
 QnO/5vpv/tZ/Meh+nkemtZrTDWbCDS82R5fNq/6TcZFbKumck0spESPqsVBAste4q+oE
 mTRXcJnlvfAQ7/dzV8/YsCNI7SZaks8NqNhkYL6dlpsBqr0cSP/Pjm1ymaL5OaJWlF4A
 jC/IFS3VXu+bu4PySRymaoQFQw0a31RVGa5ygGt6QTQoQ2Z+fv0xhUk1+SGOzkuIEbSb
 F0AQ==
X-Gm-Message-State: AOAM530dWIT1baQX1bpqivM+k0OKhxxySsXwdKZIEJ5bm7zKMFG/U8vP
 rnV4aJ68EYVCKsJdXwDQ1cnxqY6VLYQ=
X-Google-Smtp-Source: ABdhPJx2GZ3nxlihWTOnJ24nLbsCjUhL9Fg4LuFTw8in4rZ8jQozhYU5mIFji4aWQ2JHqJ/WrQ8i4Q==
X-Received: by 2002:a05:622a:287:: with SMTP id
 z7mr2904175qtw.255.1631755816964; 
 Wed, 15 Sep 2021 18:30:16 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id 67sm1369417qkl.1.2021.09.15.18.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 18:30:16 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 0/7] pSeries FORM2 affinity support
Date: Wed, 15 Sep 2021 22:29:57 -0300
Message-Id: <20210916013004.272059-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x831.google.com
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

In this version the biggest change is the end of the numa_assoc_array
struct in the machine state. The write_dt() functions are now retrieving
the current NUMA associativity array by checking CAS first.

This change allowed for several simplifications, e.g. we don't need
a reset() function to be called after CAS or in spapr_post_load().
Arrays are now statically allocated.

I also catched a last minute bug during my tests. See patch 7 for more
info.

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


