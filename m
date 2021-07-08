Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EEB3C183B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:36:55 +0200 (CEST)
Received: from localhost ([::1]:58922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XxG-00015R-KY
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1XM5-0000ID-NJ
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:58:29 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:38845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1XM3-0005WG-Um
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:58:29 -0400
Received: by mail-pg1-x52f.google.com with SMTP id h4so6665530pgp.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rgwDy+Alft4vHHEIoxjhS15tkpQb4VH5XPmCtieoM5A=;
 b=WB1sZqpTIMqbRWHCeFIMfUkULM0zOg/1ZGeMhNoM9P7bnQfo4BXRTPQzlH0bSLrDfF
 KEyFdkoQ8fUu1KFee5TB5Mn9fFYBo7gQ/yJ0xYn8Q3BXZYedGve+8YRRxD1x7ezgbbFk
 Vo3H9vWMsSbHNsMZ23r2N3+IRBHbx2BW/ezJm0btwIV3ONi5McGqnG5+Y1JEY6QcZ+UK
 RRWOYezK3qq9H6kgnISjTVesI9hXaEmFdSo85U8mYwMnC9/5ZpriJt0V1dO533H2zC3o
 hHE1a75WBO7IpVsRrTxR1h+UnusyXnTVZuXYuccaCxrMx6sbGv9+BYsmbZyxrR64crjr
 pqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rgwDy+Alft4vHHEIoxjhS15tkpQb4VH5XPmCtieoM5A=;
 b=raaVFuKwqGrC3V9ZJca4dN3yfP2E67Nm5SnxJEtmCspkNLOo1LuTXEEWq1Moc/eqUH
 CG8RTx0eYqGScYNH8LcvigrDMNkGnf6tlNooDZEkyxPb/Ke7RXqrAsG8dKGVasQrFQdh
 qLmcm8xdO3oNUdvmcvTmvr7dTz/CzTVldIMoNyvH+vQm3NkD0osWFmtLcfMoKCo/RVki
 Tsm1hgP1gYin1nAiDvmNzMaycC2n8L2iXH+cMS6881pIoilCBFH9jgFC1iQdgemdH8oD
 KdKrjnEcdP6JKBjlETns5ri51vD0kCMklbqKLLS1dJqtIea+6hv8/TuWEzHExfU8VxOL
 rYvg==
X-Gm-Message-State: AOAM533SYnerQMX5S1mkhnTs9PJKtI40qbd+JJ8QNCN9UAL+0pcN4QUW
 i0po6rwMJddK3RrZ65cX1wC+fi9VGeVkJw==
X-Google-Smtp-Source: ABdhPJw0d6UPbr4I7jq7/nncp2taLB/IDEQmg0xhIWxaxjP3au2yVkOf+AmMpGLjauP5OkDIhQhZaA==
X-Received: by 2002:a63:f901:: with SMTP id h1mr33216691pgi.69.1625763505917; 
 Thu, 08 Jul 2021 09:58:25 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:7947:37f7:fd02:9c0c])
 by smtp.gmail.com with ESMTPSA id y4sm3299889pfa.14.2021.07.08.09.58.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Jul 2021 09:58:25 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] ui/cocoa: Fix the type of main's argv
Date: Fri,  9 Jul 2021 01:56:19 +0900
Message-Id: <20210708165619.29299-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 ui/cocoa.m | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 9f72844b079..68a6302184a 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1888,12 +1888,12 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
     exit(status);
 }
 
-int main (int argc, const char * argv[]) {
+int main (int argc, char **argv) {
     QemuThread thread;
 
     COCOA_DEBUG("Entered main()\n");
     gArgc = argc;
-    gArgv = (char **)argv;
+    gArgv = argv;
 
     qemu_sem_init(&display_init_sem, 0);
     qemu_sem_init(&app_started_sem, 0);
-- 
2.30.1 (Apple Git-130)


