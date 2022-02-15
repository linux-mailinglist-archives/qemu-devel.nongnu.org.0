Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39834B65FD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:26:03 +0100 (CET)
Received: from localhost ([::1]:57694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJt9u-0007ug-S5
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:26:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJspP-00031g-Et
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:04:51 -0500
Received: from [2607:f8b0:4864:20::62b] (port=33564
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJspM-0002Ee-Qa
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:04:50 -0500
Received: by mail-pl1-x62b.google.com with SMTP id l9so10913166plg.0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jfgedMbiWFKJInWYax42U3NQTRfZ8JrSl2dGV6VDciM=;
 b=WtQvJs4Y9gRPECZX2mY0/vVrc2mqAWgaaAMuIvO2hn00T1OpMWW6KBWRAxHdyRsPeG
 4nk5N5n+WkXXvN5KmI4ehG2FYqIrm8dT+glBpaDmwOkh9Fd7or0UspC6xTyJHcuLAFfF
 mHOW7ztQ1aAfeRYfKWErpWn3+HkAo1fA6PiOyWJfUMnRa8hx2c/OoweFvaW8oM8sDHeY
 kdq1SiyPwsHM1vClYEf2749qVfpRMiDhV3Xb0HADQV7jPRR00d4M38mQXiFrw4SsA7LS
 Jyj6KdHQJxjoNEezO3KN/cyAIaCc301LBorTjtqVDAVFVX1zHfrHD1EIlN2wyYS9hDze
 id6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jfgedMbiWFKJInWYax42U3NQTRfZ8JrSl2dGV6VDciM=;
 b=3OPFf0hf6OnI4/8/z8TdXHo1W4f1laL4wN0aTVg+QnXHKPVSrY7yn9yDelsTm/nilr
 dhgxwyQ8zANEMer++sKHO6EvX5bFm+ba7NwYIOtq7QBH5oj+z8MqUhc7fkoxwHDuE0Q0
 9JD/rbM0MWXIeJwrJF17o1CWTLQVVnJ1G59erj6R8A5WXSoKjb/dkE06FrLanWEF0iyx
 uJ3U5P+ufXxfxVGQm+doPLtIfJhrza7GgdP+v6Ry5TCIKgHO2AHvHrx7D0bMHHJ7oYj3
 WDfXHGXr4OqibTGNuNyp2KLRaA23rFQhMjIdP1TtKP/8yewr3INSM936AGohNivWJC8D
 CNyQ==
X-Gm-Message-State: AOAM5325Oz5ZyGlKsn/CoNwvM1RHhStqLeqL5Xke+7tZa5okBrbvsHfm
 s7ERcH9fcYYxwdV7IfC31KzjTaR1eio=
X-Google-Smtp-Source: ABdhPJxiDj9mLZKPv58/Fu9d2CxhXdSbrfbtKzUNRspNfMVOI0PD/qZj8K7WfsEorcf/2XHY6M59CQ==
X-Received: by 2002:a17:903:228b:: with SMTP id
 b11mr2811664plh.104.1644912287567; 
 Tue, 15 Feb 2022 00:04:47 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id pc18sm5678038pjb.9.2022.02.15.00.04.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 00:04:47 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 11/15] ui/cocoa: Add Services menu
Date: Tue, 15 Feb 2022 09:03:03 +0100
Message-Id: <20220215080307.69550-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215080307.69550-1-f4bug@amsat.org>
References: <20220215080307.69550-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62b.google.com
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

Services menu functionality of Cocoa is described at:
https://developer.apple.com/design/human-interface-guidelines/macos/extensions/services/

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220214091320.51750-1-akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/cocoa.m | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 7a1ddd4075..becca58cb7 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1591,11 +1591,15 @@ static void create_initial_menus(void)
     NSMenuItem  *menuItem;
 
     [NSApp setMainMenu:[[NSMenu alloc] init]];
+    [NSApp setServicesMenu:[[NSMenu alloc] initWithTitle:@"Services"]];
 
     // Application menu
     menu = [[NSMenu alloc] initWithTitle:@""];
     [menu addItemWithTitle:@"About QEMU" action:@selector(do_about_menu_item:) keyEquivalent:@""]; // About QEMU
     [menu addItem:[NSMenuItem separatorItem]]; //Separator
+    menuItem = [menu addItemWithTitle:@"Services" action:nil keyEquivalent:@""];
+    [menuItem setSubmenu:[NSApp servicesMenu]];
+    [menu addItem:[NSMenuItem separatorItem]];
     [menu addItemWithTitle:@"Hide QEMU" action:@selector(hide:) keyEquivalent:@"h"]; //Hide QEMU
     menuItem = (NSMenuItem *)[menu addItemWithTitle:@"Hide Others" action:@selector(hideOtherApplications:) keyEquivalent:@"h"]; // Hide Others
     [menuItem setKeyEquivalentModifierMask:(NSEventModifierFlagOption|NSEventModifierFlagCommand)];
-- 
2.34.1


