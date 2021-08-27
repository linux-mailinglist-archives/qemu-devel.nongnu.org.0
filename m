Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 371133F96D6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 11:26:53 +0200 (CEST)
Received: from localhost ([::1]:49408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJY8S-00074S-9y
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 05:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mJY6n-0004Jf-KN; Fri, 27 Aug 2021 05:25:13 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b]:38664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mJY6l-000233-Uk; Fri, 27 Aug 2021 05:25:09 -0400
Received: by mail-ua1-x92b.google.com with SMTP id 90so3079742uax.5;
 Fri, 27 Aug 2021 02:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+uBRXpaahCmt7wQwbzuf5+gOK9IMFWUSmiBEZAGNm8c=;
 b=uOcbPMMKFXgORlB6KRsQ6ueLfKcLqlBd/zmom5zLEml3YF9ikH2HoSe44gFBLFmrqy
 Rf6UOq4/eXQ54B05ZfqKcnwINhGbDIeRH66Af2CmATS9GKfuPHayyMq/KaIuZxolWxJE
 7KZYPr5x0sDc3rt2RMuFMFHDvY06VQLEbZ50Rn+pRvXtRr4aN6wiOR8jK2E90XKAo6xg
 46Q/qnoe2HLb0IHGtBFFKygTma4s3Dzayf93td9VeqdOjrMlYt8rn6LdOyC825Nd2TR8
 FDzP7TmgZLBAhZF6jRWMDP89JjSGP5sL88NjvlEal2MyjFbN4wJkgZhqECPos9sF4MZT
 sfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+uBRXpaahCmt7wQwbzuf5+gOK9IMFWUSmiBEZAGNm8c=;
 b=qdoowSjShdvmEX18a7BcMBNk8sK/ipw3FYKDZ4NO5+D9IwwTDHRzXVNDP0+2fejVk4
 r/0EyUgVJzuQjQ8ZPbdmCLc8hOlbNm+swaFCji55KTpdKy61949hG+3ij2DE26twzlm4
 OQXVCoMHQPNkmEPY4tnu5haxGqvtAT9CS+xxjOYnSR7NsWq2rYZ2Z6SMvplWtNlxJcCD
 MnOW2tOSaGehr2q91ox1hCAQE7uBsJtArQgrOzWUK9SRBI79m5zzp+/CBMsPfZFcgsca
 W3YchSeZMxijv0hL2XYMtAbbqQo9ozQIdSKKSPc4Knpv9tH+GnqTeIAGZojJqjdGySxS
 Ccuw==
X-Gm-Message-State: AOAM5338Bc06+wKljYstIw2BZkTym7WLTvuh/te241mZ17OAOlfGUYSg
 x3I8Kr8oJ39SI3wURr5hcWcM01Nm1aQ=
X-Google-Smtp-Source: ABdhPJxjU1COeSKK1mjFcwJX0AbYy88eE0MztJXfoiL7fSeiZQsXXzBaRy35elKKhAGJWDkmMEZy9A==
X-Received: by 2002:ab0:1e45:: with SMTP id n5mr5802998uak.133.1630056306014; 
 Fri, 27 Aug 2021 02:25:06 -0700 (PDT)
Received: from rekt.COMFAST ([177.197.96.186])
 by smtp.gmail.com with ESMTPSA id d17sm629180vsj.9.2021.08.27.02.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 02:25:05 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/5]  pSeries FORM2 affinity support
Date: Fri, 27 Aug 2021 06:24:50 -0300
Message-Id: <20210827092455.125411-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92b.google.com
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

This new version contains changes suggested by Greg from his v3 review.


Changes from v3:

- patch 1: added due to a need of having a MachineClass attribute for tne
yet to be added 6.2 machine type. Can be dropped if someone already did this
in an yet to be merged tree. Can also be enhanced to add the 6.2 machine types
to all guests if no one else already did it.

- patch 2 (former 1):
  * added Greg's R-b

- former patch 2 (post-cas DT changes): dropped

- v3 link: https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg04394.html

Daniel Henrique Barboza (5):
  hw, spapr: add 6.2 compat pseries machine
  spapr_numa.c: split FORM1 code into helpers
  spapr_numa.c: base FORM2 NUMA affinity support
  spapr: simplify spapr_numa_associativity_init params
  spapr: move memory/cpu less check to spapr_numa_FORM1_affinity_init()

 hw/core/machine.c           |   3 +
 hw/ppc/spapr.c              |  75 +++++++------
 hw/ppc/spapr_hcall.c        |   4 +
 hw/ppc/spapr_numa.c         | 213 ++++++++++++++++++++++++++++++++----
 include/hw/boards.h         |   3 +
 include/hw/ppc/spapr.h      |   1 +
 include/hw/ppc/spapr_numa.h |   3 +-
 include/hw/ppc/spapr_ovec.h |   1 +
 8 files changed, 244 insertions(+), 59 deletions(-)

-- 
2.31.1


