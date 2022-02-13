Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAE14B38E4
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 03:15:02 +0100 (CET)
Received: from localhost ([::1]:42340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJ4Pl-0002H2-6j
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 21:15:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4OP-00010G-RD
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:13:39 -0500
Received: from [2607:f8b0:4864:20::429] (port=44717
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4OO-0006VZ-1N
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:13:37 -0500
Received: by mail-pf1-x429.google.com with SMTP id f6so2104734pfj.11
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 18:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fi3L4ZCH4mJv1HY5cRlpx5LkGHuldjUhGsSf3YMeVVk=;
 b=MtovVxEjQZRkSZjywjgOfdj5jeYpxYqT0TPx/Kz1ZydD23sZCES60WunU/I1OtIjG7
 Lircqu8o3zkhqNPATIE/R6lkfTQtLI+dqLkbl+rWNifIMOBo08EJY4Ps7vlP0Oz3pjM1
 3PGjA26yvO1om0pE8ZhhqgTMZpRUdFLKRu8s3JTvtHGOp+UyFFq4Yw8cWZBsyI7zUm7e
 1a8pFQ+NB5hmEPgj0U4cHdNLFyjBvxQSnjKlJJz2Cbg36GtPO9dkQnZTgK/HjDFfcZev
 SWweNAkXmAbLh3/KHSYXmvRUNAj9rww4Wedfi/mfOytQCLZ2yVZhK+XLbFtRNcSjMNz1
 rqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fi3L4ZCH4mJv1HY5cRlpx5LkGHuldjUhGsSf3YMeVVk=;
 b=BQIMg6OTiHyuRskV7/71a6cStjsxjeme1IgQr+oDbfi9sAIlOT3Q0U28JHoL2iDgSk
 DXwB24RSVqijI7yOhEQQoGrwP7GiYc8K7QLTZRYpdt3/SMuH0swvXGQu6s1C3MWhZYJv
 xGFlnULPjQP9Om4RGjS7ao4xr6Ljsw8imBSoSLX+mkWD7U6nLMzp7zFsBnWgr3neMATl
 ekrZLTtJ3pBopyzXoBoD9H8xkn66+PONdjcPOlhizZ7OLFNK328xevIpgsqn0+wefKMe
 EYOiJ6o/qmRVxhPWf98pUBM11Y2b27wqjw5R28a7i4z8IhBXfOXqU9xnDf98j3crn78K
 yaKw==
X-Gm-Message-State: AOAM5301H+EtCxjeYC53yqH4FiFb3vf2/6gx6wIkA66XeRbTj501nfqW
 LG/WqEKyiu/yS0e0t+FkyLwdXgTMSVc=
X-Google-Smtp-Source: ABdhPJwPyf4Q80DXVS4RWE7zh7gGa0LDbdxPeo7Af3/XV83VkWhhPBdrkl+2scvKTVwYpTliKaF10w==
X-Received: by 2002:a63:af08:: with SMTP id w8mr6806700pge.1.1644718414539;
 Sat, 12 Feb 2022 18:13:34 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d85b:35dd:dae2:b7a9])
 by smtp.gmail.com with ESMTPSA id h4sm31563571pfv.166.2022.02.12.18.13.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 12 Feb 2022 18:13:34 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Fix the leak of qemu_console_get_label
Date: Sun, 13 Feb 2022 11:13:29 +0900
Message-Id: <20220213021329.2066-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x429.google.com
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
 ui/cocoa.m | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index ac18e14ce01..fdf52a7c2f7 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1680,7 +1680,10 @@ static void create_initial_menus(void)
 /* Returns a name for a given console */
 static NSString * getConsoleName(QemuConsole * console)
 {
-    return [NSString stringWithFormat: @"%s", qemu_console_get_label(console)];
+    char *label = qemu_console_get_label(console);
+    NSString *nslabel = [NSString stringWithUTF8String:label];
+    g_free(label);
+    return nslabel;
 }
 
 /* Add an entry to the View menu for each console */
-- 
2.32.0 (Apple Git-132)


