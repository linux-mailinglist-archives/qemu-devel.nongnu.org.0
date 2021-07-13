Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3B73C7761
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 21:42:30 +0200 (CEST)
Received: from localhost ([::1]:49454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3OIX-00037P-Ln
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 15:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m3OH4-0000nO-6a; Tue, 13 Jul 2021 15:40:58 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:34764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m3OH2-0006Mt-3n; Tue, 13 Jul 2021 15:40:57 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso2364409pjx.1; 
 Tue, 13 Jul 2021 12:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WBi/U9XSRwaGtxweRI3Wv+m+Ov6e8sgVcJ23geQVFog=;
 b=vDP5PT8DN/C7jfnvlveLmLUHB20Vltn1CH1qoN/EewjasZIgWMdvmWmTTGxUW3HQH+
 ALsa5qPJ43exXjQJ9VevSnGsXybOe+XRlm3SoIsiRu+9+EsSKb3CGhgGwrGOVIwOnfYp
 NC4y1Uw7TJANyx2DBXYf2z9teur05vF+Nww8hN1lhX8d0kLZxySH72Hmx3MmoP9mYYO5
 lyU/hN1z8TDB+UiAuAiDKfGDmqBqtWtpLpD+0QpuzovVd78xm6TxBDDv5Eq4QIZcxWUs
 7RPvwniCSJR+ANTbOo/MOcD6q3V0Da274KNZCBGdfzA59lcz8nQt/Y2RDWRTOQuE3B/U
 Zs8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WBi/U9XSRwaGtxweRI3Wv+m+Ov6e8sgVcJ23geQVFog=;
 b=jiLuJ04KgZ5bORu8vruEeWTLJTR9tNIQn5bnfPyw4IGz7ggxdUDKnIQiFDMg6eSzkA
 8GfgcBs3iL4IvUudLST8cLrlEyh7fy7umbXLb2+YZya6it3DHtcktt72hnufsinbuC32
 5OyiLER7m9S6b8Ky21/2tyq3I7b1HMnBOwkArfB/e2BnvqMvIrYYJuLJqMQhxnwFPN3Z
 xd+jEcZDZP36IAbNNNetVuElmuAa+9tW67Wnxn9tW/4XTAodxOajROti4XVqDiiO3CkY
 0l/KFljCUe1CtY3zHt03MxSFqAAzYLMtcgpjKTSZTOpIleY4O0I2agX7XC5vQAw39fDL
 jTjw==
X-Gm-Message-State: AOAM533rC6LBnrWFz24QvM+e/QtXKup/8E+i9On7T1EvVSY+u8IPzhH3
 00+A0K1q22RUEF4qvZXqaA+7wjMvbCSB899tHHs=
X-Google-Smtp-Source: ABdhPJx4M1+bRHI20PR2h4SOU02OtMz0KFjCtir1E8HT7LOp+1qykop6eDujeqauSK6b6VrK73H2Yg==
X-Received: by 2002:a17:90a:d58f:: with SMTP id
 v15mr875668pju.117.1626205253815; 
 Tue, 13 Jul 2021 12:40:53 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.193.148.134])
 by smtp.gmail.com with ESMTPSA id o72sm20077506pfg.44.2021.07.13.12.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 12:40:53 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 0/5] pSeries FORM2 affinity support
Date: Tue, 13 Jul 2021 16:40:40 -0300
Message-Id: <20210713194045.916263-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=danielhb413@gmail.com; helo=mail-pj1-x102b.google.com
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
Cc: aneesh.kumar@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This new version drops all the NVDIMM related changes from the
previous iteraction after the reviews done in the kernel mailing
list [1]. FORM2 will not use ibm,associativity-reference-points to
determine a second NUMA mode for different operation modes of
PAPR-SCM.

[1] https://lore.kernel.org/linuxppc-dev/20210628151117.545935-1-aneesh.kumar@linux.ibm.com/


changes from v2:
- patch 3:
  * reworded commit msg and comments to reflect the current state of
the specification
- patches 5 and 6: removed
- v2 link: https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg04056.html 


changes from v1:
- patches 1 and 2: switched places
- patch 3: folded into patch 2
- patch 2:
    * only make CAS related changes when using the newest
    machine version
- patch 3 (former 4):
    * only advertise FORM2 support for the newest machine version
- patches 5 and 6 (former 6 and 7):
    * detect if 'device-node' was set in the command line, and if not,
    use the 'node' value when writing in the device tree

v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg03617.html


Daniel Henrique Barboza (5):
  spapr_numa.c: split FORM1 code into helpers
  spapr: move NUMA data init to post-CAS
  spapr_numa.c: base FORM2 NUMA affinity support
  spapr: simplify spapr_numa_associativity_init params
  spapr: move memory/cpu less check to spapr_numa_FORM1_affinity_init()

 hw/ppc/spapr.c              |  60 ++++------
 hw/ppc/spapr_hcall.c        |   4 +
 hw/ppc/spapr_numa.c         | 224 +++++++++++++++++++++++++++++++++---
 include/hw/ppc/spapr.h      |   1 +
 include/hw/ppc/spapr_numa.h |   3 +-
 include/hw/ppc/spapr_ovec.h |   1 +
 6 files changed, 236 insertions(+), 57 deletions(-)

-- 
2.31.1


