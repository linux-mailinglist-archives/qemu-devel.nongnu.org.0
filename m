Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0345274DA
	for <lists+qemu-devel@lfdr.de>; Sun, 15 May 2022 03:41:44 +0200 (CEST)
Received: from localhost ([::1]:33308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nq3GQ-00051n-SM
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 21:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nq3Em-0003Bl-OF
 for qemu-devel@nongnu.org; Sat, 14 May 2022 21:40:00 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:35738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nq3El-0002TF-3s
 for qemu-devel@nongnu.org; Sat, 14 May 2022 21:40:00 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 nk9-20020a17090b194900b001df2fcdc165so887675pjb.0
 for <qemu-devel@nongnu.org>; Sat, 14 May 2022 18:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mvQBk5SiMUkiCo0+hW1crF9AFqWoaojULkuaaUUtHH0=;
 b=PQd2HwSMCMR8MpHL234noYu8t9AkrCk1zHcPTwwDb4USKVSvK4PzmR1hq2O7B9EAqh
 UbokYp9M4/734/EeWq7RVsHAulFoH0iZ1vwGCxqgUojkWWL9H1ATuSg1FLNtqW8+Yefz
 3Zyo0bgkGDjUOU91vYDYDXtAk8a00fDrmpMa7thrq6WrVxdVs/CYsIRiFpMZaaFoSz7N
 njlOviauikGBhnAuGloLyVkS/x8T8n8DQosYAj6EkmL25Rki/kRwchOz+6Fl0sV0c7NW
 MzxuE/QS1uUon0oWezYATya/CTjy8ZwQehvKG6Y3bXCK8u/AdFc0IxmgCiqsPe4JOsHZ
 7+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mvQBk5SiMUkiCo0+hW1crF9AFqWoaojULkuaaUUtHH0=;
 b=x7t9x2vSY5nGC11XxTPGPKgTG6C6PMtHY879+N67vKGn17e7RHtdizKV/alCrdwOs2
 ILOB/PNl9UT+Zo18AbupyJb9vCFeRyOixW+s/BdVDa622pjo2HPCno3AI1M5BBgqTV+k
 3ozQIT9dZMClm2FUFTInXLH0KpvvTTP1IJ8AOVi1fsM8Dga42vv7kyj1xSe5lK3EOyYc
 WVi1G0wY50ZBAyxdXGRsnBby8hfCczk3SyTcXdf1TqNhb6BkEig+bE07+VMhjDVlYHa+
 RmsOHkVVxggk7rZdv7Pf8JNcvSFqPFZny0ZN7XzTXvtr7ELskdmVhbvF1s6DkUMLOvj/
 gVDw==
X-Gm-Message-State: AOAM533r+PA+GztNnKwipkCkY/1R3NA+w3GGZKNC1PX/fk6xgG5NjyQq
 v4R28xHq2LBpykzdB7qPTyNneTyGx5Y=
X-Google-Smtp-Source: ABdhPJzWNOMvYHvXyUEBKW28k78/LichPuyKCoxdUQsuvqvyPh0xE/Q2TH2dKqr4v87eXEYc1gia5g==
X-Received: by 2002:a17:902:ebc8:b0:15f:417c:288b with SMTP id
 p8-20020a170902ebc800b0015f417c288bmr11626261plg.14.1652578796160; 
 Sat, 14 May 2022 18:39:56 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a63f846000000b003c14af5060asm4118104pgj.34.2022.05.14.18.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 18:39:54 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Stafford Horne <shorne@gmail.com>
Subject: [PULL 0/4] OpenRISC fixes for QEMU 2022-05-15
Date: Sun, 15 May 2022 10:39:44 +0900
Message-Id: <20220515013948.2993495-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The following changes since commit 2e3408b3cc7de4e87a9adafc8c19bfce3abec947:

  Merge tag 'misc-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-05-03 09:13:17 -0700)

are available in the Git repository at:

  https://github.com/stffrdhrn/qemu.git tags/or1k-pull-request-20220515

for you to fetch changes up to e8f0ab0cd674241cbab7231ce05ac1bfa0b4f5ed:

  target/openrisc: Do not reset delay slot flag on early tb exit (2022-05-15 10:33:01 +0900)

----------------------------------------------------------------
OpenRISC Fixes for 7.0

 - A few or1ksim fixes and enhancements
 - A fix for OpenRISC tcg backend around delay slot handling

----------------------------------------------------------------
Jason A. Donenfeld (3):
      hw/openrisc: page-align FDT address
      hw/openrisc: support 4 serial ports in or1ksim
      hw/openrisc: use right OMPIC size variable

Stafford Horne (1):
      target/openrisc: Do not reset delay slot flag on early tb exit

 hw/openrisc/openrisc_sim.c | 28 +++++++++++++++++++---------
 target/openrisc/cpu.c      | 11 +++++++++++
 2 files changed, 30 insertions(+), 9 deletions(-)

Jason A. Donenfeld (3):
  hw/openrisc: page-align FDT address
  hw/openrisc: support 4 serial ports in or1ksim
  hw/openrisc: use right OMPIC size variable

Stafford Horne (1):
  target/openrisc: Do not reset delay slot flag on early tb exit

 hw/openrisc/openrisc_sim.c | 28 +++++++++++++++++++---------
 target/openrisc/cpu.c      | 11 +++++++++++
 2 files changed, 30 insertions(+), 9 deletions(-)

-- 
2.31.1


