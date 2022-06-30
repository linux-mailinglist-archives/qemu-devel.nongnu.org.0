Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5BC5623C1
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 22:03:49 +0200 (CEST)
Received: from localhost ([::1]:54102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o70OC-0005cM-I2
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 16:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704K-0004Ry-35; Thu, 30 Jun 2022 15:43:22 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:36475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704H-0006E9-Tw; Thu, 30 Jun 2022 15:43:15 -0400
Received: by mail-oi1-x233.google.com with SMTP id y77so661275oia.3;
 Thu, 30 Jun 2022 12:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nvp/0/zdEsS2ahKnsuy1nOeGrT3RyguUOrF4TH6DxEc=;
 b=ABwVnefJ0K7TC17CyFY9cfNyAjMUq2yQMpY95NIpPUXFQ4q7m/SglBaCTFJuM062oq
 ze4Cr4vCMU62oUWW/jT3qC45erMvd5pI+MczAF+rPZLztdQQG5LG2iYa7AL/SHkcJjhU
 z1qQ3heN8u22518Yptn5o4fmmiNNsSedSWH8veU04kjcArPyD/kHLucLlsVSxMLdbaTD
 O8JUr1aVoD7DDQvDbL2NaDFMxu1dRr/NNJjFNO9Pqh1QoLWGKQvDq6aJcLEYYjzNl6u6
 m9OitnAyM5AZCjI6kYkezHItafHLWROKZ/b2zC4aWh9/sfwUobxYw78qGpyaY8fa9b0P
 Sgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nvp/0/zdEsS2ahKnsuy1nOeGrT3RyguUOrF4TH6DxEc=;
 b=HaJd3OUZyDi/w4/QaXEWqRV4qesQ0iV7taNDtzyPrP92nUhUQ7hbjw42TQlckb7gli
 BGBqTKJ3MYERZuXcYLso1ENssjIybrdnPhML/2WurfDcU0fWI5QEDsBsLra0t5YyQBnN
 Q3qiV7DSPy9SnIbJV6F5VGjbqrrkx10OZ7E8+1iZSvrAh9tNEUpMW/573RTIKjtAf02S
 aw4cJDDEEwXhyKMiPHXW3Q4zLl2is0KnRHDbXxmusPslMZZgwVNlBvh29od5QLHYscSC
 IfLlA4gQ/Axh5axFpjMqq0m4ULAR2Ft6D5DfnZ35obn7O8bAQUGFIH+BCAPA2rsBkJEt
 p+0Q==
X-Gm-Message-State: AJIora8sPDHTtsGEnkcayel4n3NlXwaepWHG0s+S2UTQfP1T8+WVg7r5
 nkQLtOOfPdN/XV+V5bIzkmz9XlepMdI=
X-Google-Smtp-Source: AGRyM1shVNVMb9X1rckZWZ1I14h0YqMzblEv75rqersoTX8NZUpGeGI6w8DTiseLMbgU81az4uLVtw==
X-Received: by 2002:a05:6808:3081:b0:335:6440:811d with SMTP id
 bl1-20020a056808308100b003356440811dmr7220756oib.69.1656618187344; 
 Thu, 30 Jun 2022 12:43:07 -0700 (PDT)
Received: from balboa.ibmuc.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a4aa3c5000000b0035ef3da8387sm11250519ool.4.2022.06.30.12.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 12:43:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 0/9] cleanup error handling in kvmppc_read_int_cpu_dt()
Date: Thu, 30 Jun 2022 16:42:40 -0300
Message-Id: <20220630194249.886747-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series is a cleanup that fixes the issues observed by Markus
Armbruster in the review of jianchunfu's patch:

https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg05393.html

I've also included jianchunfu's patch, with the relevant bits, in the
series.


Daniel Henrique Barboza (8):
  target/ppc/kvm.c: do not return -1 on uint64_t return
  target/ppc: add errp to kvmppc_read_int_cpu_dt()
  target/ppc: use g_autofree in kvmppc_read_int_cpu_dt()
  target/ppc: use Error pointer in kvmppc_get_clockfreq()
  ppc440_bamboo.c: handle clock freq read error in load_device_tree
  sam460ex.c: use CPU_FREQ if unable to read DT clock
  e500.c: use PLATFORM_CLK_FREQ_HZ if unable to read clock freq from DT
  spapr.c: handle clock freq read errors in spapr_dt_cpu()

jianchunfu (1):
  target/ppc: Add error reporting when opening file fails

 hw/ppc/e500.c          |  8 +++++++-
 hw/ppc/ppc440_bamboo.c | 17 ++++++++++++++---
 hw/ppc/sam460ex.c      |  8 +++++++-
 hw/ppc/spapr.c         | 12 +++++++++++-
 include/hw/ppc/spapr.h |  1 +
 target/ppc/kvm.c       | 33 +++++++++++++++++----------------
 target/ppc/kvm_ppc.h   |  2 +-
 7 files changed, 58 insertions(+), 23 deletions(-)

-- 
2.36.1


