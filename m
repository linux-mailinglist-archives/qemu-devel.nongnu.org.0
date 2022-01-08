Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BC5488446
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 16:43:55 +0100 (CET)
Received: from localhost ([::1]:54968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Dso-0005CW-9z
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 10:43:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n6Dov-0006gz-8z
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 10:39:53 -0500
Received: from [2a00:1450:4864:20::52c] (port=40790
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n6Dos-0006oN-Gv
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 10:39:53 -0500
Received: by mail-ed1-x52c.google.com with SMTP id a18so33405826edj.7
 for <qemu-devel@nongnu.org>; Sat, 08 Jan 2022 07:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4EPIBLrqcRPkiBCNNhoa74v92YzeCHZQl+O4E+MXoyk=;
 b=VXM1xowV2piSnsvd/n27zA5fBwd0y273k6IfLmli1wYmWzSYp5C1RB5uQZPSFkfpxa
 TxX3lSxbLiG2R7nkvOnGGzINqsnQwSkBiwAa36qJTxTd2uereLDDlAl/GRZUfMMrxZAc
 fUnQeMc9iEUc6MSCOsGwGmAymPrxiiuqFquFJc3ImDJ6lJSdsfVE/PVJ+AQTJjWAsykg
 2iKpUFaXglGtD19mtRNpXYXWLoC93zcH7+SW8KY/MfTWtCYd9FCtsOboOFnz2/Pvo+Zu
 mG7+YkAIz+ObvuOJ1IgW10EIrC2/Og3tuXk/odlLt8JxM/phiNlaU0lnFbzDk8HBcaOP
 9fkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4EPIBLrqcRPkiBCNNhoa74v92YzeCHZQl+O4E+MXoyk=;
 b=J4tixb79hHkXEbub/1YWBtUGf28Giwad3XrcmmsdDDVuM70xpA2mnDEK3fjBRYXSgB
 GgZL5wn/bFsaTxxt+ZrZ4vS6NOfbATqSQ+Dmg9VHRyeCotdIlNIRw8/78x36oTQi3Z35
 EK23p14W4fQDwkrjl6pballhdP87UePIjymSux531qt/dOoRsi8Fa6WoUIDsfN0vF1zf
 vXUwBOV1UTCg8EVm49rHiFIUPG7NZ6tuGb+Xa7fjiJ9ejRajvYPFAenWg5oJ+grOWKc7
 MBa/M5XEG0X1Rt/4JtfobvwIzL+MfuozFxTnRa1YwjDZADh6Ypu0zMeHgvZ+rK1WCGVh
 1lEg==
X-Gm-Message-State: AOAM530sJt58BfbaFIm+Y9e9SujCVgdGAqPOvsPHzBMe/co4ZGoKi/Zl
 scQZZTIVNeEHpggwW3Mm6uLAtnY7yvU=
X-Google-Smtp-Source: ABdhPJwegRGwg12jkyzhd4j23qJ/dB6iVf2E9cFj1E3Y3h1TX9tA4UxH/fo3XSqzr1hb8YYV2c3huw==
X-Received: by 2002:a05:6402:1351:: with SMTP id
 y17mr2641794edw.401.1641656389136; 
 Sat, 08 Jan 2022 07:39:49 -0800 (PST)
Received: from localhost.localdomain ([2a02:a467:f77d:1:78f2:78aa:23a7:b824])
 by smtp.gmail.com with ESMTPSA id
 24sm599840ejg.47.2022.01.08.07.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 07:39:48 -0800 (PST)
From: Dmitry Petrov <dpetroff@gmail.com>
To: qemu-devel@nongnu.org,
	dpetroff@gmail.com
Subject: [PATCH v4 2/5] ui/cocoa: pass horizontal scroll information to the
 device code
Date: Sat,  8 Jan 2022 16:39:44 +0100
Message-Id: <20220108153947.171861-3-dpetroff@gmail.com>
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
 ui/cocoa.m | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 69745c483b..ac18e14ce0 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -970,21 +970,27 @@ QemuCocoaView *cocoaView;
              */
 
             /*
-             * When deltaY is zero, it means that this scrolling event was
-             * either horizontal, or so fine that it only appears in
-             * scrollingDeltaY. So we drop the event.
+             * We shouldn't have got a scroll event when deltaY and delta Y
+             * are zero, hence no harm in dropping the event
              */
-            if ([event deltaY] != 0) {
+            if ([event deltaY] != 0 || [event deltaX] != 0) {
             /* Determine if this is a scroll up or scroll down event */
-                buttons = ([event deltaY] > 0) ?
+                if ([event deltaY] != 0) {
+                  buttons = ([event deltaY] > 0) ?
                     INPUT_BUTTON_WHEEL_UP : INPUT_BUTTON_WHEEL_DOWN;
+                } else if ([event deltaX] != 0) {
+                  buttons = ([event deltaX] > 0) ?
+                    INPUT_BUTTON_WHEEL_LEFT : INPUT_BUTTON_WHEEL_RIGHT;
+                }
+
                 qemu_input_queue_btn(dcl.con, buttons, true);
                 qemu_input_event_sync();
                 qemu_input_queue_btn(dcl.con, buttons, false);
                 qemu_input_event_sync();
             }
+
             /*
-             * Since deltaY also reports scroll wheel events we prevent mouse
+             * Since deltaX/deltaY also report scroll wheel events we prevent mouse
              * movement code from executing.
              */
             mouse_event = false;
-- 
2.32.0


