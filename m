Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F92847CAD2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 02:37:27 +0100 (CET)
Received: from localhost ([::1]:35448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzqZK-0000JJ-Ly
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 20:37:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1mzq5m-0001wA-95
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 20:06:54 -0500
Received: from [2a00:1450:4864:20::530] (port=43521
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1mzq5k-0002cP-Qp
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 20:06:54 -0500
Received: by mail-ed1-x530.google.com with SMTP id o20so1914538eds.10
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 17:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t2to8oywMvux/iK+y7oZ6K+sU0tvRqXLTGcYrBHjTxs=;
 b=jNf+3S40dVmRxbpCcCaoVJfvtMFxu3KC2EaxQTOE2O48pGHjjUPEE2A6x7awa6IUaE
 JXIE5lIBDUdugHsHXPovLdyhcOxN0XWC7+29thNXrFvjHoUkO6fz4r50IiKH8/52neqQ
 ey9l8hBFNI5YlzMqqIw3h9iDpotg245vftKa5ZOMyL5d8jmTwW8Jrit1+pDOdgSRv09o
 0joVxitJ7Eo+J80J8JR7zN0RRAeP7DrytMILuAdXLF5Ge30DXZovv6c6Xj3yi4/RxniF
 861sYRj1tH3vwMya/06E9MGMSMUgovBRYdTefgaCMNWZuEsaJzOsOUWcG/zMJ35MjMfF
 X4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t2to8oywMvux/iK+y7oZ6K+sU0tvRqXLTGcYrBHjTxs=;
 b=gIcEvbeH/4aBqjey5z2yFGchKFNLLok9VxN4SwJw4XMRP+YriPoxzFbbVyvHF/v14G
 iVg5e7PqzeyJY4EUajVKEWYv09ZXjdSkli1wR7L78c34zyE6pHWqa5lahzFL95h+j4rK
 0QT+csSiis+Wr+qD1I1TIR85gJjJuWIpqfF3r3eo06Ay9KOKu99oYepsBAT+XN0rCwxB
 dNp+55J4NNakJsCOQsgyS/jmOPqZk+K630sZ2XeKbY7aulLqROd/H7k1XVDTA1tDvqHz
 RfELMq+eZU62HFA11cFdzGQlUx8SFdOo21ym5MBPShMbiNa6btxojBVPmd8WBPXBinRr
 /bpQ==
X-Gm-Message-State: AOAM533VeQOvFbN+1SC1h2QzievOGvGs+SoIBy0+BQbqm+e+gSJOTkK2
 hhKN3yoeruVeAHiEDxvMPVndcJx/Nhk=
X-Google-Smtp-Source: ABdhPJwG/lckHwXluTTvztiD4ehsKaduUan0FeNZ7ISfSNs8KqVG1iRlLNVPs6iRQVgw6r893hjItQ==
X-Received: by 2002:a17:906:4a55:: with SMTP id
 a21mr685375ejv.268.1640135211206; 
 Tue, 21 Dec 2021 17:06:51 -0800 (PST)
Received: from owl.kpn ([2a02:a467:f77d:1:e6fc:be30:e400:3c3])
 by smtp.gmail.com with ESMTPSA id nb20sm125199ejc.25.2021.12.21.17.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 17:06:50 -0800 (PST)
From: Dmitry Petrov <dpetroff@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] ui/sdl2: pass horizontal scroll information to the
 device code
Date: Wed, 22 Dec 2021 02:06:46 +0100
Message-Id: <20211222010647.1332479-4-dpetroff@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211222010647.1332479-1-dpetroff@gmail.com>
References: <20211222010647.1332479-1-dpetroff@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=dpetroff@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Dec 2021 20:24:47 -0500
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
index 17c0ec30eb..19bbc1fdd4 100644
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


