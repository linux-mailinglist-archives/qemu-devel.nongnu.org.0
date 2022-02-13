Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E06744B38E6
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 03:17:39 +0100 (CET)
Received: from localhost ([::1]:45420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJ4SI-0004Ro-Te
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 21:17:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4PF-00025K-7f
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:14:29 -0500
Received: from [2607:f8b0:4864:20::1034] (port=54902
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4PA-0006al-Lv
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:14:28 -0500
Received: by mail-pj1-x1034.google.com with SMTP id on2so11382054pjb.4
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 18:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q/viGaiOoymucBYk+yXeoaR5L1iZHye3bs6g199blJE=;
 b=NfC+iQKNOsJAH2JXqxWLXZSq9YcfGJUjOgD+vxbDZsHmo1dqw3CWzSwDbdNfXhh0vc
 hMaryoIDHRLKUoctQAHvQBTfdfKlGuQ95T0d1wD/quRLwxdgPJsuXS+A/NrPtDSM/WEV
 sqNhNUUXCIF4VR5MqU0MKgN8TZz77+gAxS4q+wwD9ISNOnHpjPs46Wu7eAkYMFzDw2/h
 eYByokYRXMUhVXiWeOWivKgMQQjcTNli1IQPHaYizjoiiFImrdWW8KwsQ8ItNhWOzXp8
 fPTEv4Q8HlRgsEljbKpavh2djBq9h2AA5TFHOVK89q7d8qa9ST528qisADDoxlCN8b+/
 L0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q/viGaiOoymucBYk+yXeoaR5L1iZHye3bs6g199blJE=;
 b=kACN2OmwdMxhJtlLwi8lM4j91WVvA75DH7h755a1Hl2frN+o5xsO2jujiCVOACbkiz
 TfaDUIz0k2SXWjO0J20jmuZNxFE00zo0Ba4YiizbGfSifuP29LK4p1seErDayLfBeLA9
 ihphp1Ip+UO3REszG7CnjuXdsAyx/nLfA8+Fcz/H6UU35JXl8KsZ6qRlxusROLC4K3W3
 Mspp7DpqS1bPp/2MN618UoUUG4OSwLjGpUe1Gc42ZPai6u0ZBMHX580IxnhVZeE26fNi
 LFlYRN9t6NtFO64xEIPsDlHF2dD3YdtkRoiEDdEmHvy22H1Tp14cLnkfO+GSCRkoqU93
 YYTw==
X-Gm-Message-State: AOAM531lW/7zAWvsfmMsk5CkORhZTNJmYB8J1JJr2GbJOxdqbijgqda3
 ta866kMbsbqpsgUODoAoI80o3lY38h8=
X-Google-Smtp-Source: ABdhPJx5LPfdot7EH6rbtbvX6zcz4T4PHE32S2B4UF7EbsUTBJERVYVbhdwf/0w9tPIAeTLzX/vY2w==
X-Received: by 2002:a17:90a:8904:: with SMTP id
 u4mr7643983pjn.137.1644718463168; 
 Sat, 12 Feb 2022 18:14:23 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d85b:35dd:dae2:b7a9])
 by smtp.gmail.com with ESMTPSA id lk11sm225337pjb.31.2022.02.12.18.14.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 12 Feb 2022 18:14:22 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Do not alert even without block devices
Date: Sun, 13 Feb 2022 11:14:18 +0900
Message-Id: <20220213021418.2155-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index ac18e14ce01..271a2676026 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1715,11 +1715,6 @@ static void addRemovableDevicesMenuItems(void)
 
     currentDevice = qmp_query_block(NULL);
     pointerToFree = currentDevice;
-    if(currentDevice == NULL) {
-        NSBeep();
-        QEMU_Alert(@"Failed to query for block devices!");
-        return;
-    }
 
     menu = [[[NSApp mainMenu] itemWithTitle:@"Machine"] submenu];
 
-- 
2.32.0 (Apple Git-132)


