Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96F959F893
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 13:24:40 +0200 (CEST)
Received: from localhost ([::1]:33064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQoUx-0000hM-3s
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 07:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmv1-0004ST-5U; Wed, 24 Aug 2022 05:43:28 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuy-0001oH-9J; Wed, 24 Aug 2022 05:43:26 -0400
Received: by mail-pg1-x536.google.com with SMTP id f4so12712765pgc.12;
 Wed, 24 Aug 2022 02:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ohy+ZaRm+mExMl6IasKlBa1D9a82pE4z4g4jo6700W8=;
 b=EFa36jtNPvYtjxpE+KhgJMJiHEArv3lvGNBpYs8rNtYVOJ2h5L5tnNXhwshALvkBSv
 t+4ACo4IWpzDvvgwlRhuVaaaw7SCVrw62iGL51Ttjv3/GLIGZYSeCyrCWs/0+p52Ho6V
 eZWyJudGq9qkprfJZ6GfJM1VlhoBq/41m6s2rslW6njYVLH14q/WAPKbT3/SSYtdFL73
 OG8Vo3ofAqIR149E7xi3SHvJtZcNmfg66S2co4p0G7FqV5LaoA26twA6Tj0VF9GN6VpE
 RbDwUhVkf1Tk/C8OHtD159sljtsQ4/suF1p4xMxDnCpER9+qhdikM3hpxsQeBTQ56/Ts
 S3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ohy+ZaRm+mExMl6IasKlBa1D9a82pE4z4g4jo6700W8=;
 b=j4XidXyxmX+i/X7HLkr+jpiGXW410qpCp36Su+SaEmLr9kFpKJcaRBQ+cIZoJDKTyA
 M36AonbfR0MNV4xNeHq+HbXH2yyEiL9OOvez43vICKNZIqcbtG7xOgJKwgFIrRXCRQCW
 twH8IDNMG1E8oxu29jUzMsm7bMpBJ+G24IUKKa7PlgSvd6smXNkur8yP9OmqXfmE7YHf
 LhjSsKNdaI5lXjF+9FEyFv7EMThSpTjE0H0uxCqMlt4euDeL+MSeD9xUtVud/HCvAQVJ
 +fGk1v6japuffUmPQ8bmITaZspeN6A9D1IxlcfHV+NAHwR7l+wJNxYsTekwISqlOcddB
 /t7A==
X-Gm-Message-State: ACgBeo1UcRVWZMp/GS2LRriKGMtgGR4h07oizSvbB2lOJbcpRuZQ6GO/
 bcQWYQgQzxK2Sld5erNoaLaRqT3tsxY=
X-Google-Smtp-Source: AA6agR6bx+H5hvlsCfy0SQNQpJsv5cGpqgtTzuWACh35mc98Z24eSOFRsWe+SJAr8exISxezTqElDQ==
X-Received: by 2002:a05:6a00:2918:b0:536:3967:5d08 with SMTP id
 cg24-20020a056a00291800b0053639675d08mr21463197pfb.68.1661334202610; 
 Wed, 24 Aug 2022 02:43:22 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:43:22 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
Subject: [PATCH 42/51] hw/ppc: spapr: Use qemu_vfree() to free spapr->htab
Date: Wed, 24 Aug 2022 17:40:20 +0800
Message-Id: <20220824094029.1634519-43-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x536.google.com
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

spapr->htab is allocated by qemu_memalign(), hence we should use
qemu_vfree() to free it.

Fixes: c5f54f3e31bf ("pseries: Move hash page table allocation to reset time")
Fixes: b4db54132ffe ("target/ppc: Implement H_REGISTER_PROCESS_TABLE H_CALL"")
Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/ppc/spapr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index bc9ba6e6dc..4034f4d130 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1522,7 +1522,7 @@ int spapr_hpt_shift_for_ramsize(uint64_t ramsize)
 
 void spapr_free_hpt(SpaprMachineState *spapr)
 {
-    g_free(spapr->htab);
+    qemu_vfree(spapr->htab);
     spapr->htab = NULL;
     spapr->htab_shift = 0;
     close_htab_fd(spapr);
-- 
2.34.1


