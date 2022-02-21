Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E82D4BD8C0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:57:00 +0100 (CET)
Received: from localhost ([::1]:58392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5RD-0006hI-Cp
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:56:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zo-0000Dw-Ey
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:43 -0500
Received: from [2a00:1450:4864:20::432] (port=42610
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zZ-00013p-7c
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:36 -0500
Received: by mail-wr1-x432.google.com with SMTP id h6so25879614wrb.9
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hGBHyIm/ItY31LIZrGmDJbF5fU6iafmLA90Y6AKoCU4=;
 b=tmmD1k++Yf9uqY7ElITtBruD7iSNu6r8eLI72rujHqpX0id05bQKxA6tlDD3v3kknI
 Bnu8DU8s3PP9k8BVjvaNQMUTqZAyxybJ/MVUdB9WQIfvhlmUFcxFd1C1Aw60kz7IRxtV
 zgIca79GJG6wiWLRr7LZ74ug0HK7KH+BnWy8PKheSsjF0PImsiDoAn3Fwo52CRfPi1zb
 Uq35HCD98KJDbPappgj/qDrmbrzbU0H8ote/VLee9DVq7srqpXpLKZ73f7bKrrnlqwbZ
 5Heeu9l2TdD3wSdD1r4oI6gTHtSAe5IpL5XACFv7KYB7Wo4KYOnSFSJdOBm8b9C3K9hD
 INNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hGBHyIm/ItY31LIZrGmDJbF5fU6iafmLA90Y6AKoCU4=;
 b=K71tCrCmp3ipR1jH/L4sUr2GGYxDFndxD3fOf+Z3koxkhBhf2ijQ+KSXODiq/xPzK3
 3Gj9h/5B88TN2wJe2mhFYiL8wEAQSddHJmrSptoIv+x4QN4BxVBqxWgl/PHmGLSVACg7
 d4VYYynV+XpJXPCsY1a46zzCZoXpJ/pPZx0urgjWJEfwB+qQc2dLRT8QJHYQKtSKS1dn
 9x8YSn8H1kfFfmx6EuLaC3YGJyuIOmOX33IPnyqKHgz4BVBhvxysCN7/OG4WkvTR/MAv
 tTodPIt+LvEuH3b99lwk85KAvhLXRDzYBHLg6FcL9GoV+ZgDHZKN3BHhd/58yDxhGDke
 X6jg==
X-Gm-Message-State: AOAM530om92rJIB8mPIfEwqp38shkVZALYGEo3m99hrehSfsoLjgH7e/
 CCgx6KlBfHEFgvZ5iefzg5DFvZ8Ntnl30g==
X-Google-Smtp-Source: ABdhPJy/VoxJHYPK79LfYh49d7fFHF0c4F40nD+pOZ9lsQ/czro1MJOuXrBNxoXRrIsJ6+MbqqZrvQ==
X-Received: by 2002:adf:9f45:0:b0:1e3:20e8:489a with SMTP id
 f5-20020adf9f45000000b001e320e8489amr14457565wrg.602.1645435703096; 
 Mon, 21 Feb 2022 01:28:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/26] ui/cocoa: Fix the leak of qemu_console_get_label
Date: Mon, 21 Feb 2022 09:28:00 +0000
Message-Id: <20220221092800.404870-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220215080307.69550-14-f4bug@amsat.org
Message-Id: <20220213021329.2066-1-akihiko.odaki@gmail.com>
[PMD: Use g_autofree, suggested by Zoltan BALATON]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 ui/cocoa.m | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index f585a5c177d..a8f1cdaf926 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1674,7 +1674,9 @@ static void create_initial_menus(void)
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
2.25.1


