Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8913A412044
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:52:25 +0200 (CEST)
Received: from localhost ([::1]:50116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSNSq-0004U2-3H
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mSNQX-0001i3-2y; Mon, 20 Sep 2021 13:50:01 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:38803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mSNQV-0008NP-DJ; Mon, 20 Sep 2021 13:50:00 -0400
Received: by mail-qt1-x82d.google.com with SMTP id d8so4047090qtd.5;
 Mon, 20 Sep 2021 10:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V9WZqOJ8+5IOaYvY+SBzA8GbP9DfxTS+eF+UznUb4u8=;
 b=nfVI1E8meCQpJcpA4TVlvfPZmgf+w3SN1Ga+H8t9SQC0O+POrmFzQ/SouDqVjyiEjZ
 ljTdya0QtyDDgCD+9gpcVIpz+nWeMnYkKAwm65gfA5MECit39zGncHhnXvCTLlDTSpDn
 bEIujSOPaxoBl6H008f4B6oXooFND8nrGcFOntsW6vAvHTRMAU0wvutcpUb1SUmXRNtv
 Fd5qQU6JWlAtHu0PKGB7lXKnI9TJMtY3AmNzJwrS7W60ISbhX1BZANlFA+W0wdLB+0U7
 cmggnDdrmfbbUVzLgrN5aBMuDSTHb/kYlMsrlOuR+e/+vbvUDfU/f/6jIAtc29dDAoHC
 QC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V9WZqOJ8+5IOaYvY+SBzA8GbP9DfxTS+eF+UznUb4u8=;
 b=iv2bRgSxhvU+Lyq7GJrjCFIAfbeYLWuZMdnDRKdIohvRYQzg4qYw2NAxb0Ws7FCn5K
 0TlYIEpBe/ls1bkwkPjrEHP7v5d0VyIhjxHf8zCz2tWoMLRFILM1GPjOphI+3QgGTQ8l
 DA3QhIHq5xKUj1aT2K4lg2cl1f0U+qB9KwmjJi7g2MFZlyU2ZAw7gNVkN4ovQysoKlWl
 lGrfU8uYOtZ6/9akabAGk9QKN5TR8uTYb6utWtUuUgFMtfozeOvjnECux98woUnfWfrW
 FBmiiaZPtiLNxGmxCC1veeswetZC5Hm3B+eptb1VGnMX8C+mqhMaYhsA2oOO4iYRZEPj
 oCUA==
X-Gm-Message-State: AOAM532L3k2Q6wuZ69S7//kusBB5TfBuqxrYoqgyntRFrm4fx1V18/Po
 0i8S6BA/Z5f+/34hZicy7T/D5t6hPHc=
X-Google-Smtp-Source: ABdhPJwYTsGGz+LhWjZvpCcxVU9tY0BfX5AL4XivmlFaemq+beBEdno3IC6DFU5FDXKKes6Q9JxpvA==
X-Received: by 2002:aed:20cd:: with SMTP id 71mr1951565qtb.303.1632160197898; 
 Mon, 20 Sep 2021 10:49:57 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id l28sm6073614qkl.127.2021.09.20.10.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 10:49:57 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 0/7] pSeries FORM2 affinity support
Date: Mon, 20 Sep 2021 14:49:40 -0300
Message-Id: <20210920174947.556324-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82d.google.com
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

This version has a changed asked by Greg in patch 4, along with
Greg's R-bs.

Changes from v8:
- added Greg's reviewed-by in patches 3, 5, 6 and 7
- patch 4:
  * changed get_associativity() to return a const pointer
- v8 link: https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg04747.html

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


