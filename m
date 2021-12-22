Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE3347D97F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 00:02:17 +0100 (CET)
Received: from localhost ([::1]:37582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Aci-0008Cw-Px
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 18:02:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n0AWv-0002Hv-NQ
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 17:56:22 -0500
Received: from [2a00:1450:4864:20::52b] (port=44829
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n0AWr-0002Q3-GC
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 17:56:14 -0500
Received: by mail-ed1-x52b.google.com with SMTP id w16so14151911edc.11
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 14:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4EPIBLrqcRPkiBCNNhoa74v92YzeCHZQl+O4E+MXoyk=;
 b=WKz0+dlwnMLC/xVOgadwOR8d2DOH2hVqFyxNSDvndhVnSBmSiFETUouFT1lsDwIhsK
 BoNqYdG4+91orX1RmeqZYjXoXI+/FTkkHteGzQvxU55SsBXHPOapGZY6vBIuG4xqqF9q
 xW1jS/le1VBUBfm0Wvh+EQUTrST27/Koj6Gl/kqNZwbE+fGWugh4dDQbN8Zuvy64AhyP
 gQfG6mJ+XYH3OMhUHFHbjnTZ1eVonlAIhmJQAkFu8/fhkKVs9GvHwus6Gkg4V5kp+cSk
 Ju/gXKDRGAluk0WboDCd5M0GgkN/z6XzW47gBqfufu/dscZXP0vnguiUq9g8wEUIbR+m
 Ey/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4EPIBLrqcRPkiBCNNhoa74v92YzeCHZQl+O4E+MXoyk=;
 b=AR3h54DyZrWZV5Rr7NUMHxNmDi0SkaC9Is7H26qasx29RmpAsEgt52CdZ9+n/D7Nd0
 4pRMjBjeNrFJyWYuozPQWnhj45j2dJ4nhQkNNdCp/UfJ19zs5/5jsQfNqqUaDKP/hr8H
 PvvrIt8dM9m/YvCgyTBvW3jDFrIBSFocswWPUBn9lyw2j4YTAsuDz5P6p6B3ufnPBamV
 hwbRsDQ49aAwUjbnqlDH8Ho8EDvz1nqpEETKP3gbInRs1VHPxwr+MjuwdgUgzEBXR843
 X8QtH+jECM1iwbDftvK200CvCb7lPIxXcukc5w5+nJTau1Q0YMjj8ORR1XMq6vCFP0Jr
 cD5Q==
X-Gm-Message-State: AOAM5302qxPCl4hGaSJTvKAlIq3ZSmYsFf7+UoYJXmxoUUxL91qSpy81
 Tg7Zp/HAV9D/qlL0E/nDvpeL5lpmapY=
X-Google-Smtp-Source: ABdhPJwVPWHPqe7jSl45svIGsF4h3vNIiYei+UZTJo+VDAXOygZZiiWdOK7MAwHohrEKb4UwJW49fw==
X-Received: by 2002:a17:906:e0d0:: with SMTP id
 gl16mr4055100ejb.628.1640213769208; 
 Wed, 22 Dec 2021 14:56:09 -0800 (PST)
Received: from owl.kpn ([2a02:a467:f77d:1:deba:f393:276b:fad2])
 by smtp.gmail.com with ESMTPSA id gv11sm1097226ejc.135.2021.12.22.14.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 14:56:08 -0800 (PST)
From: Dmitry Petrov <dpetroff@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] ui/cocoa: pass horizontal scroll information to the
 device code
Date: Wed, 22 Dec 2021 23:56:03 +0100
Message-Id: <20211222225606.1359162-3-dpetroff@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211222225606.1359162-1-dpetroff@gmail.com>
References: <20211222225606.1359162-1-dpetroff@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=dpetroff@gmail.com; helo=mail-ed1-x52b.google.com
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


