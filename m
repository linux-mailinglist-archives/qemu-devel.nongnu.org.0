Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5F15BE5C8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 14:29:23 +0200 (CEST)
Received: from localhost ([::1]:47548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oacNO-0001H7-EW
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 08:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZK-0001Ij-Dv; Tue, 20 Sep 2022 06:33:34 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:53812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZG-0004zb-5a; Tue, 20 Sep 2022 06:33:32 -0400
Received: by mail-pj1-x102d.google.com with SMTP id q3so2551558pjg.3;
 Tue, 20 Sep 2022 03:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qGPOmRjHbysKyb7HVYrvLwoOgzN+2O9KcPhD9XmRvHs=;
 b=ZLZSHLQDLV+j6k7eLKXqDsWNRvtkZqa+QtewK6V2COplApxkZDHojNZ6frhCoMLcv/
 pVqtLdpOthwJ9gzBG6N9UIh9PAasFEsPMJ+3qrPNS836mT2VY94HRWX4s/lqWXS+J/i6
 drhx1vyBHLQQeC/oSpeS8jqAqJUtAQDV0Y9OjKEU3I7irZPSYsP3Zoc5ye58SrtOK+RV
 e9AqV7x6LGcksg2CTHn5E1+CbddSOZRAiExm3+dQ4JRBpHU5NEoWIAzsIozgL1v0qbNO
 IfB224xGNceNI+vMCYRDP94azz5Al0TGhqhuUEI1HIZasGWu0jZTfyU3o1Yx9117XEdB
 JPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qGPOmRjHbysKyb7HVYrvLwoOgzN+2O9KcPhD9XmRvHs=;
 b=vbOA/MQTOJ4CzVc6liSWAuUHaZE4Vw7SNs5Lg6Ww64xkuO+x1r6Ln6T+o0GrpeH7r4
 VFmbZFRpH45XghsU2QHcrQip/Ds4hhrpe+k9HFGFzA5zKVA7uCNyMaeeDmh+0EK++XG9
 FRyfRI6zGT7tPIZ9v5RHn66bB6KIvNwI2YxphS/+liIw4Wx9ZXQzVMysY8dRvbBgRUIB
 g8O7MAYNWYxPPreieLiotWKG6I/tSoxG2C5vHUP6f98Cm/yAzz2Ma72hLUm3Mwr7icGa
 ZvAjghyD7m7NAOROXIUhhzDNzG0RzypNawcrYJx3TwTlncsek5IKHK+OtvPLrN88QhP5
 zmjg==
X-Gm-Message-State: ACrzQf1p93MwKOxQ+47i0MXAKIlLR/t/y1/tEwPVoeksDGoM9SPhSqBL
 b+NBNub78DFaNDXEzxkW6pXw5tiZA+U=
X-Google-Smtp-Source: AMsMyM5ERaS4WjHPrFxwZnf6Cgh1ktv2Eo3pu9bZYs9yyr8TrrfO/exGbSv0jyBLg516WnwVrVIPsQ==
X-Received: by 2002:a17:902:ea0e:b0:178:3d49:45ad with SMTP id
 s14-20020a170902ea0e00b001783d4945admr4156024plg.103.1663670007450; 
 Tue, 20 Sep 2022 03:33:27 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:27 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 27/39] hw/ppc: spapr: Use qemu_vfree() to free spapr->htab
Date: Tue, 20 Sep 2022 18:31:47 +0800
Message-Id: <20220920103159.1865256-28-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

 hw/ppc/spapr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index fb790b61e4..cc1adc23fa 100644
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


