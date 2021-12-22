Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6822947D977
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 23:59:32 +0100 (CET)
Received: from localhost ([::1]:60318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Aa3-0004TG-HR
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 17:59:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n0AWv-0002Hu-N6
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 17:56:19 -0500
Received: from [2a00:1450:4864:20::535] (port=33598
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n0AWr-0002QC-HI
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 17:56:15 -0500
Received: by mail-ed1-x535.google.com with SMTP id m21so15518919edc.0
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 14:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pyjnlbM1xVRCEuPnUEKS3/v5vZFiQrHwvnK44ISZw2w=;
 b=QTXc8+NBCnI6Dqa67MkpcwH/c+2xtxPDqCuKQfbGtg+j3dDYRBWnSqGpRkPoqIWajM
 nUPpXJCR2IvXnsXl7rfpQMeEKhY1Bq2iSi244lHsMlN5UdcAVBuZ04zY6ng1HLEi1b3+
 uOJmztc4GdwR5YDlzrwG6/IL8rCehDSrkmDe9l+L5XdNh0OPGtdDpjHWrn0zDWMdHg1G
 D/S2wmehXRJjenF/FPIeLOsaRF0ELOJ+qIp/9QbSzZnBMhJqfwCuVeZPEtBbrFd62/4X
 x7khens04f6SeYkUlwvjwSe7TcJ29TcIuyU49DSktLZRlrulaBtCplAnuBoFry5sPNn9
 8tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pyjnlbM1xVRCEuPnUEKS3/v5vZFiQrHwvnK44ISZw2w=;
 b=VY5S1clLgLI4Z72PEtf+PMwbb32qjoz2RHxfp0kWkE85DJxjJDo570zdv0JtpG0AlV
 wx+bRXpANfmcWOlorG7WaLUdR6htHsBL2yreAnK0jENsFy5jdPxZfiMJtkJgcPf4c5lU
 QJu16smrg9bq5QFfuGby/fxLX4iX+WlWZ9FeTNqlYBN/2Y/Tj8vUe8faEnJs9Ce6DSPn
 c2lhoLdocWmAeF/TmLT6LcWTV2DeOkgVqQHftJ16Xq5Qr+zHwhz96hFw6aThS6IfPgB6
 dfK3bn69QQM5GnJucHpkfJNDlr9EDv4+9fLmfeXsBAqIm6fhnwwuKe92sioOqZ6CvVWw
 dAyg==
X-Gm-Message-State: AOAM5327rTIAmQtez6CP6iGfKr9XnedI5K1CbSS27EwjqcaKmfwzu8AG
 4QzNHTYgVnjkicazNnxy7OfElb68rAg=
X-Google-Smtp-Source: ABdhPJwlc1rUHITiJ214T2bFx7XF5IwdbDmPN/nmlLxXRgGkPV4oWsTe+zXDDnCx0rtW8VeppOlREg==
X-Received: by 2002:a17:907:86aa:: with SMTP id
 qa42mr4085912ejc.106.1640213770501; 
 Wed, 22 Dec 2021 14:56:10 -0800 (PST)
Received: from owl.kpn ([2a02:a467:f77d:1:deba:f393:276b:fad2])
 by smtp.gmail.com with ESMTPSA id gv11sm1097226ejc.135.2021.12.22.14.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 14:56:10 -0800 (PST)
From: Dmitry Petrov <dpetroff@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] ui/sdl2: pass horizontal scroll information to the
 device code
Date: Wed, 22 Dec 2021 23:56:05 +0100
Message-Id: <20211222225606.1359162-5-dpetroff@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211222225606.1359162-1-dpetroff@gmail.com>
References: <20211222225606.1359162-1-dpetroff@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=dpetroff@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Dmitry Petrov <dpetroff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Dmitry Petrov <dpetroff@gmail.com>
---
 ui/sdl2.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 0bd30504cf..46a252d7d9 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -33,6 +33,7 @@
 #include "sysemu/runstate-action.h"
 #include "sysemu/sysemu.h"
 #include "ui/win32-kbd-hook.h"
+#include "qemu/log.h"
 
 static int sdl2_num_outputs;
 static struct sdl2_console *sdl2_console;
@@ -535,6 +536,10 @@ static void handle_mousewheel(SDL_Event *ev)
         btn = INPUT_BUTTON_WHEEL_UP;
     } else if (wev->y < 0) {
         btn = INPUT_BUTTON_WHEEL_DOWN;
+    } else if (wev->x < 0) {
+        btn = INPUT_BUTTON_WHEEL_RIGHT;
+    } else if (wev->x > 0) {
+        btn = INPUT_BUTTON_WHEEL_LEFT;
     } else {
         return;
     }
-- 
2.32.0


