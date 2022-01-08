Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2052448844C
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 16:46:22 +0100 (CET)
Received: from localhost ([::1]:59332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6DvB-0001D6-8O
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 10:46:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n6Dov-0006h8-Gx
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 10:39:53 -0500
Received: from [2a00:1450:4864:20::52c] (port=38596
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n6Dou-0006oc-46
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 10:39:53 -0500
Received: by mail-ed1-x52c.google.com with SMTP id u21so11851920edd.5
 for <qemu-devel@nongnu.org>; Sat, 08 Jan 2022 07:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pyjnlbM1xVRCEuPnUEKS3/v5vZFiQrHwvnK44ISZw2w=;
 b=c61oQodSBo2v9e4fuy7sJm42RbMNjVFgz7NJ9kzScOxzK1FAggIQzQSmWFkJzBIyoZ
 JCYwifvy7wNZzjaYyA1kyrm4KPrMBCUGpHxgf3sqWDIqOkuKVmr1Znl7+ihScZM4FiVh
 QFGBPHJf6IpV5WPnLFT0w82tx0OSHeFdb6Jqa/vHwEKoPFVpHCGrN1YR0m7FTmv0Fy3g
 zYyBfoXFSgGszWrDWR3k6zD/t5VehVT4VRrwzuqv+BrYtKWdMKaltIbosDHAxKIzyxYe
 vVLxwGYX08mGBIcV6ztvAXiG9/v1ai6TOiJvavnBHVyir8lOrus+pHGArp4ML5lYWy5m
 4ClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pyjnlbM1xVRCEuPnUEKS3/v5vZFiQrHwvnK44ISZw2w=;
 b=qKxUEIpNn4i1SPVFwDWM8H9Wy5fRxK8MLLgKnRwEbNtF17dV8DAYRO7bBih5vQhO/u
 KL8uCV9qSDtyAy/dscArl/eCx4cRKrOQmujPqr0B/DBUYoSsgOclV/XMbG0awb5xZuc9
 I1+pYLl3yAv7BmXsVWQ2x+Q0/O3M7ZfiSkhySKPouR4/O3ye8eULrC91k1d3p+yTktuP
 e9DLKuV1q/iv1berstA0ArS85t4DneuDBZZ3QsJ2BGRXAEUXhz+x/voo/J8jTTmDfXgs
 V8gGc2vgvEMKIJBFlwxDzXninM83WYLjDa1+g+Xv3tBiiZEkCGG1R9yY/BRLEBFNIFQ/
 6kVg==
X-Gm-Message-State: AOAM533rzK7oCRL1WO+FT3yjGWXmrVL5BJ2qUAVMak1AHbySlar1CjsT
 N3p+cGzSJSPEWBGvzqBwFuXX17DxpY4=
X-Google-Smtp-Source: ABdhPJzaHf2JO8jOX5X+TMhUhPtpQPQ1pgIilTHwXJ17XfrlxhYkdjhaXtoVWbk2kC30x5CGy+pg0Q==
X-Received: by 2002:a17:906:9742:: with SMTP id
 o2mr12179962ejy.530.1641656390540; 
 Sat, 08 Jan 2022 07:39:50 -0800 (PST)
Received: from localhost.localdomain ([2a02:a467:f77d:1:78f2:78aa:23a7:b824])
 by smtp.gmail.com with ESMTPSA id
 24sm599840ejg.47.2022.01.08.07.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 07:39:50 -0800 (PST)
From: Dmitry Petrov <dpetroff@gmail.com>
To: qemu-devel@nongnu.org,
	dpetroff@gmail.com
Subject: [PATCH v4 4/5] ui/sdl2: pass horizontal scroll information to the
 device code
Date: Sat,  8 Jan 2022 16:39:46 +0100
Message-Id: <20220108153947.171861-5-dpetroff@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220108153947.171861-1-dpetroff@gmail.com>
References: <20220108153947.171861-1-dpetroff@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=dpetroff@gmail.com; helo=mail-ed1-x52c.google.com
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


