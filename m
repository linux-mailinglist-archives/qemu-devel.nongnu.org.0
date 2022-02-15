Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7E24B660F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:28:36 +0100 (CET)
Received: from localhost ([::1]:33776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJtCN-0002VU-Se
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:28:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJspg-00039g-C8
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:05:08 -0500
Received: from [2607:f8b0:4864:20::42a] (port=39526
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJspe-0002GG-5l
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:05:08 -0500
Received: by mail-pf1-x42a.google.com with SMTP id m22so14382765pfk.6
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q1S0vCkHLHdT7fWwQnyVqc/5+zwKndcxOeaesC4lBoo=;
 b=c+qZi5yDc1qxfY9wR4+Q337JsirwHMvphfmL259epMLG+wiZ9oTlfjil+bOL7Speq4
 +cptV5GlQ6H+NR3EY4qyjK33MhaGtBMjeiUdif7ct0P3dvYbX+A/OgnvBcAOyl3ecHF6
 9Yv6OKIQHRC9sccjYvDy3FLAFyYxdUUE8NClv2suEtQE+ClM+JHORv9Po4qFhM6mVpOj
 mlTyXKCHuqPvnggzpfFr8UedIVCBDU2a+Xgqr1pBygCWSBOsHvbeWiffzFSfMTBGKMRs
 k6QdKcPYBS1afQBOxJajY8vS+xrrY/OkHsBDso/OZ+o/1kBd5qT82XXdJd6tV9LhirA0
 eQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=q1S0vCkHLHdT7fWwQnyVqc/5+zwKndcxOeaesC4lBoo=;
 b=opSzVPmrcNHVekpzJQEByp7MHc/2IzxgBMPWWhNYXO445q7brBcQqNj4uWe2a/SB9L
 PXjxw+Y7LjU1b9LD8hzVR7Oud44t/cIOVcNdr2ozPmEUnxMxW09g1rvj+j/P1PH8QLyk
 99+YREnQV0Gl3gv3iRav3Lc57vhphFFNoqVr/csrZePJfN1MT0myU2hNrln0h6bVlGPb
 82FhTsuKm0HLWWlvg6TUObJiu7TOx+pXEYL/wuD0BMasXYyndh1c0mLCwYgzwqJO/x57
 JYxBrU3oG8KKl6l1VgxIyrLgmwr1wYwHAXuwusvz2HbgPkKqPji+8J63ko9C7kkFr0sf
 Fdag==
X-Gm-Message-State: AOAM533c37q2Q8ECCTccj+2bY3xz93RMDmJUndtla4H2AY0rO3fR3CBE
 D0wTQDJdspdJVgBl9l1KDcas7igJtLQ=
X-Google-Smtp-Source: ABdhPJyySGBipnjYwxbHns/nzfKb96NepOA1uwkAZdZaubNKHUjMg23tKWQkJR7Rv+vZyyRPZ8S/vA==
X-Received: by 2002:a62:a11a:: with SMTP id b26mr2905900pff.19.1644912304296; 
 Tue, 15 Feb 2022 00:05:04 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id y2sm1709365pgf.33.2022.02.15.00.05.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 00:05:04 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 13/15] ui/cocoa: Fix the leak of qemu_console_get_label
Date: Tue, 15 Feb 2022 09:03:05 +0100
Message-Id: <20220215080307.69550-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215080307.69550-1-f4bug@amsat.org>
References: <20220215080307.69550-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220213021329.2066-1-akihiko.odaki@gmail.com>
[PMD: Use g_autofree, suggested by Zoltan BALATON]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/cocoa.m | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 6cadd43309..30702d31a5 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1678,7 +1678,9 @@ static void create_initial_menus(void)
 /* Returns a name for a given console */
 static NSString * getConsoleName(QemuConsole * console)
 {
-    return [NSString stringWithFormat: @"%s", qemu_console_get_label(console)];
+    g_autofree char *label = qemu_console_get_label(console);
+
+    return [NSString stringWithUTF8String:label];
 }
 
 /* Add an entry to the View menu for each console */
-- 
2.34.1


