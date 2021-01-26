Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2838A30312F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 02:29:04 +0100 (CET)
Received: from localhost ([::1]:41656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4DAD-0007TY-CZ
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 20:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6X-0005f7-7v
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 20:25:22 -0500
Received: from mail-pg1-f174.google.com ([209.85.215.174]:36158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6T-0006Ag-7n
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 20:25:12 -0500
Received: by mail-pg1-f174.google.com with SMTP id c132so10189417pga.3
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 17:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ojsbSRb9TUYaNkY9UYZiHJyegurKeDmFzBKNM7XQRCs=;
 b=WyhHwrpwfh6Ea/M/BiBN/rSgZwF5rQbmBY9HGma/n+nFdhfHwScZTrz8BYqBUSwKMj
 X+LAWS0wkskz7YE42gMzmXMXhNHq91XfO1EFhoIylUJ3vFshuGWK5t1IoPhd554UU+JE
 THe1/Dii0JQggtjUd6sSurGYhXYdORbrqF/WctffC1eX43UESTfqLEgLrh5gLsuQuIZd
 3pcgzO4Nme4aEf6G5WEq1gkQxKlirwQSgs84QrdXNufyT77FRdDrxrtEYxoHH4w4kwc4
 JkJfx+1vjFzf0dxZKRvIkNk6mvI0ljARmJ/S01ogybZ3PPH0c5E4y0OaqA9QosKplcbQ
 dztA==
X-Gm-Message-State: AOAM532sx+/P5bDkojP2TJaxAAbeGHhLcWvYK27oxUWEIIwWve2JDs3E
 c5AhIdpMXk2qLe4NIDx5YeFo9m26E1o=
X-Google-Smtp-Source: ABdhPJwcH9dqrbmC3xFLAJf5NRINWrh5UGZ25N53PL71dcnFpK6xfc86OUoOJa9gaKCYC2pQk8Y24A==
X-Received: by 2002:a62:7b8a:0:b029:1bb:4a06:bb57 with SMTP id
 w132-20020a627b8a0000b02901bb4a06bb57mr2845829pfc.47.1611624307657; 
 Mon, 25 Jan 2021 17:25:07 -0800 (PST)
Received: from Yifans-Mac-Mini.hsd1.ca.comcast.net. ([98.35.5.7])
 by smtp.gmail.com with ESMTPSA id o14sm536921pjf.12.2021.01.25.17.25.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 17:25:07 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 08/11] configure: cross compile should use x86_64 cpu_family
Date: Mon, 25 Jan 2021 17:24:54 -0800
Message-Id: <20210126012457.39046-9-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210126012457.39046-1-j@getutm.app>
References: <20210126012457.39046-1-j@getutm.app>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.174;
 envelope-from=osy86github@gmail.com; helo=mail-pg1-f174.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 96738a19bc..fddd11fed9 100755
--- a/configure
+++ b/configure
@@ -6425,9 +6425,12 @@ if test "$cross_compile" = "yes"; then
         echo "system = 'darwin'" >> $cross
     fi
     case "$ARCH" in
-        i386|x86_64)
+        i386)
             echo "cpu_family = 'x86'" >> $cross
             ;;
+        x86_64)
+            echo "cpu_family = 'x86_64'" >> $cross
+            ;;
         ppc64le)
             echo "cpu_family = 'ppc64'" >> $cross
             ;;
-- 
2.28.0


