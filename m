Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29B035DF8B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:57:30 +0200 (CEST)
Received: from localhost ([::1]:59796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWIbi-000855-2w
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWIZU-0006XJ-23; Tue, 13 Apr 2021 08:55:12 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:39869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWIZQ-0005OZ-OC; Tue, 13 Apr 2021 08:55:11 -0400
Received: by mail-pl1-x630.google.com with SMTP id u7so6351974plr.6;
 Tue, 13 Apr 2021 05:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LHW53rf2+oqyhXlEHeseRdK6e0I5YuBp7nhEacC0l/E=;
 b=QWMRGDRrSwLMRMp6hEVQiptYvaZ/WTpTh7+bPN/CbsEszzF/2oErtgWzxpW1gBFz4y
 ko42ABtGtgiEUBh1ih/cJHbg80N87HZbZvXueE33in/PV4jDAEYGWD3hLtJTUqq3B9GN
 60PDEnA+LINkdXVUKuhg873jbSsSdTq3/nDzblDMpkuL91BZn1pCJOmGnf6S5RU7+ZCZ
 4NndxFYttLwSAj20h7qE+zyM1QwtftySElbw5agB/gT4JOOoHAQ17oBY43VdYKYmeUjw
 Zsfej0IK2Vkwlta8uixvwg/ZDS1PhCzvOafXe0oYPNJp02DIor9T3ZbYRiynnt6q7bd4
 O+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LHW53rf2+oqyhXlEHeseRdK6e0I5YuBp7nhEacC0l/E=;
 b=Ov0MtdRgEap0LdviQuRqwlXSGlMOsbmw4YryIhm6GTVYSCUtAFhEYyMnm27C2oRSyD
 A7uh9cm6uU0KOpyQuGGopYn8iqnCMfkil3hBZ1xDjyj9iS1wPUCuH1nCFkMb7bv/WdKH
 MjIW+kqxnHcTAKHHSKqVy7yfMRMPFeHTcpQS+sTUJZ36445dl5+P98oPyQZCbGGxUwCa
 di6iZfNk30362S1wD0DWrPygfpcwf8BrhFSR4GLQ5n6cKGsmBoIO0RJUTqEBgHnHPZQt
 aNquUd0IFIh04hq7aoHw9Inyo78Njg/MTGAVrhNnc/POFGExrq2pWSd1LJyw6L7YEHty
 qufg==
X-Gm-Message-State: AOAM531VQvwFG6Nn0FRBJP+gfxFGWoruzadNVysSuIkiOaai/0nq4akp
 ccqxsHZBz/VhgmE3qo6wsHTyQdqYCA8=
X-Google-Smtp-Source: ABdhPJzGUAVqfBkzUcv6JvDxDaHLunlxtaSreVM01B0c2KnllxbKI9mMROKxxnY0O+M39kpqYlaVxA==
X-Received: by 2002:a17:902:a589:b029:e9:21cc:4aac with SMTP id
 az9-20020a170902a589b02900e921cc4aacmr31892623plb.21.1618318503344; 
 Tue, 13 Apr 2021 05:55:03 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-90-211.tpgi.com.au.
 [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id s40sm9627352pfw.133.2021.04.13.05.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 05:55:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v1 0/3] POWER9/POWER10 exception model fixes
Date: Tue, 13 Apr 2021 22:54:45 +1000
Message-Id: <20210413125448.1689545-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>,
 qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes a powernv9 bug, and several POWER10 bits (which affect
powernv10 and pseries power10).

I think I got the logic right but I didn't individually test and
verify every case, so any glances over it would be appreciated.

Thanks,
Nick

Nicholas Piggin (3):
  target/ppc: Fix POWER9 radix guest HV interrupt AIL behaviour
  target/ppc: POWER10 supports scv
  target/ppc: Add POWER10 exception model

 hw/ppc/spapr_hcall.c            |   5 ++
 target/ppc/cpu-qom.h            |   2 +
 target/ppc/cpu.h                |   5 +-
 target/ppc/excp_helper.c        | 111 ++++++++++++++++++++++++++++----
 target/ppc/translate.c          |   3 +-
 target/ppc/translate_init.c.inc |   4 +-
 6 files changed, 111 insertions(+), 19 deletions(-)

-- 
2.23.0


