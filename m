Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F80D4B659F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:14:49 +0100 (CET)
Received: from localhost ([::1]:37510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJsz2-0002VJ-EO
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:14:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJspZ-00038X-Ir
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:05:02 -0500
Received: from [2607:f8b0:4864:20::434] (port=40464
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJspX-0002Fb-64
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:05:00 -0500
Received: by mail-pf1-x434.google.com with SMTP id c4so12267386pfl.7
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cRI6UGAn4vjJdciiBP0mAxumIP6lTNDE1aSs08ebrks=;
 b=nePv76A56nC5QANB/2nuk5UhqhXcUkVyHDikNtrfqXEX5OCRi3i1RqiNMplL+/wXeH
 67JMcPtMAEWCowDI51mOiChqxHgXfIrRjpZGol1Jh7wmsqk5qb+oKCXavDhNYyRj4SKK
 sUZcV9ngM3vfm9bf7ooEgJJLKHu/rkAYm/sdvuEMNq6BfAD3TyQX507IrFnb5Q3iwhdf
 nfXkPlERmDQ2Rz4AKUKVirNLqCjX+u23TNf0PqXtBv9PfK9QVcwCkGGRU3QWNfnR85Jt
 5lcVmF+tcKhUyUY7AD3LBdTX5HvepFm/FhdRpn9PsOcEp6FwS2A+6p/RAigd2s/QkFpC
 v3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cRI6UGAn4vjJdciiBP0mAxumIP6lTNDE1aSs08ebrks=;
 b=JEMTc5Qf/HLOrIrkuFaRE/X0E9jMHwv069/uQBzGMhE9oX0clfEsvtnPYabqiWSywD
 BxgZ/yhW1Rhzrtoc9X3FHTxMOkt0rE/2M3ChlZIa2WLb863DOc5y2h+H/9VzNFFnRAQ3
 qz+Z/1v6+1Maay3UD2fMISsy/Z+MN1S8yHBB3nwgCS6KgMDSqJcOvnMkaEQAjaKT2G4F
 5DzNllDAVU28IUHI7hdhf0Uo6Bne3VECguLjTrL0k1xASyYGc6NjvcGQ+GOC7us0Z6Kd
 uygLQRGNsuWqcblQlygNec6fsuiPd9o4ruiVXejcQzC/HmCS0roZLg/uPWQ4KzlvS8+E
 rHyA==
X-Gm-Message-State: AOAM532nhU3SM5z+l7oBoHwfMOzFc7y70OplZGZ/zzqzGNV7kQsLa7w1
 bCTZW6HGYoek+vtrnH+XlIbpYy5xZnM=
X-Google-Smtp-Source: ABdhPJwRVVk123M4wdH9+RhKVXV+aVRODk3++6NGWWjv1Fi7cHF/ElC86Tl5ZC+cYSOlrqDY9boyng==
X-Received: by 2002:a63:505a:: with SMTP id q26mr2490725pgl.485.1644912295857; 
 Tue, 15 Feb 2022 00:04:55 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id w11sm38982375pfu.50.2022.02.15.00.04.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 00:04:55 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 12/15] ui/cocoa: Do not alert even without block devices
Date: Tue, 15 Feb 2022 09:03:04 +0100
Message-Id: <20220215080307.69550-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215080307.69550-1-f4bug@amsat.org>
References: <20220215080307.69550-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220213021418.2155-1-akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/cocoa.m | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index becca58cb7..6cadd43309 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1713,11 +1713,6 @@ static void addRemovableDevicesMenuItems(void)
 
     currentDevice = qmp_query_block(NULL);
     pointerToFree = currentDevice;
-    if(currentDevice == NULL) {
-        NSBeep();
-        QEMU_Alert(@"Failed to query for block devices!");
-        return;
-    }
 
     menu = [[[NSApp mainMenu] itemWithTitle:@"Machine"] submenu];
 
-- 
2.34.1


