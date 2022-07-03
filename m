Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD554564A0B
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 23:34:41 +0200 (CEST)
Received: from localhost ([::1]:52492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o87Em-0003Qk-O9
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 17:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o879M-0003to-Bn
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 17:29:04 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:33582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o879J-0006NG-SI
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 17:29:03 -0400
Received: by mail-pf1-x434.google.com with SMTP id n12so7385995pfq.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 14:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NYRJ6dFmaqbGhA+/u64I15FtwTO+theWct4FGuCTZQI=;
 b=Yn3sSs6JsQ/S16E1FcrvWmzviW6WYFWuoarDxN5g+fpHYKq1M3wJO2P1SR+OK1W0pp
 /AxoGWS+r6T8DRtjacjaPO79+D7h9h+vawnLE7PRBZcGPUC3/wdBJyCK4TQ05YAG4/tA
 THk7qfXuK6YZA/BdMMA7xOUVQBfzewytkc/BOKrCxrLBIHUjaaSTkvOcsRcxKTeH1T1U
 4Ho0jF7VLOjF/n24pLJzZ2YM5hWnJ0YQgt68fszmAKhPM/ayXBFV4dmaecP9G29hqn5j
 wIqnxrm8Id5UXUgvL8wv24nr07pFMlH51k9gsoe3O+yPArZJtj99NxjcV3O1r7mksb69
 n1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NYRJ6dFmaqbGhA+/u64I15FtwTO+theWct4FGuCTZQI=;
 b=RWymQ2Mg1ZaCsCyBVeo/F6JD8pUJQCJ/aAK0Mc28aol97bjEYjFf6/iRATnqRMVI+e
 vFKkfTq53PVfxwPcOtt6uW4IBQJ1tawblHxxpgtdKLEudKoE+Pbvez6JIV83Thf9KnhD
 8TKsXpmziWu5d9wG8ueLfY2O65TTRHNkw7CMCdXFUoUKsXmazFI237GK/VLSYG8StCTP
 TAMaDQD3r/gzNpB6grXZ+ouCHCCdyXzTogNjFzcUphdNwMYjgJM4fEGY22MXVhMnMgug
 Wmy9k4oV/p+Y+mjIjcTbumacpt5rGc9XD8PRsGW7odnwUKlHlg2pCe1JihFgWz9DkoEu
 pn5w==
X-Gm-Message-State: AJIora9B78esdHmcvwU8+5IUmZo+MrWpjdzoQXYq5y22Mc1vUWGKAlcT
 bhb9kJf6zjuKnWrt5INIObUvD+sfDqI=
X-Google-Smtp-Source: AGRyM1vJceqSQgnXEWN0syEFDuChFifPV1ZOKz12qLoEt0ZeE1QAQkcnSjW3RxLY5ePFhd8WIgRCrg==
X-Received: by 2002:a63:1259:0:b0:411:f92b:8e6c with SMTP id
 25-20020a631259000000b00411f92b8e6cmr10172919pgs.108.1656883740350; 
 Sun, 03 Jul 2022 14:29:00 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a631106000000b004114aad90ebsm12309214pgl.49.2022.07.03.14.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 14:29:00 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>, Stafford Horne <shorne@gmail.com>
Subject: [PATCH v2 06/11] hw/openrisc: Initialize timer time at startup
Date: Mon,  4 Jul 2022 06:28:18 +0900
Message-Id: <20220703212823.10067-7-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703212823.10067-1-shorne@gmail.com>
References: <20220703212823.10067-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x434.google.com
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

The last_clk time was initialized at zero, this means when we calculate
the first delta we will calculate 0 vs current time which could cause
unnecessary hops.

Initialize last_clk to the qemu clock on initialization.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 hw/openrisc/cputimer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/openrisc/cputimer.c b/hw/openrisc/cputimer.c
index 93268815d8..4dbba3a3d4 100644
--- a/hw/openrisc/cputimer.c
+++ b/hw/openrisc/cputimer.c
@@ -140,6 +140,7 @@ void cpu_openrisc_clock_init(OpenRISCCPU *cpu)
 
     if (or1k_timer == NULL) {
         or1k_timer = g_new0(OR1KTimerState, 1);
+        or1k_timer->last_clk = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         vmstate_register(NULL, 0, &vmstate_or1k_timer, or1k_timer);
     }
 }
-- 
2.36.1


