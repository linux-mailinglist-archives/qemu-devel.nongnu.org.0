Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAFA33110E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:40:08 +0100 (CET)
Received: from localhost ([::1]:51002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJH3C-0001PZ-QX
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJGXg-0003Jg-Jl
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:07:28 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:41875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJGXe-00007L-FE
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:07:28 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so3183684pjb.0
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 06:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kTNskZH1aOJNJ1AE2bkS4myoUN8f6RMcimPSrzDsHo4=;
 b=nUC6VKqRR3WTZYM8MyGKPj45kSt4OjPyxGmH3vLLWDrHPeL4eGyllpvjN6dNu26z6b
 5+6BahbybL3l+Vo1BUeSD2PvqoaxnTuOsu1v/QZhl+gAv3NNQQB9LmCF5BtJkNi0ktJc
 TaylxiubWlOnIoiPPkRaptEEDo9VNEYbeJs/aegvjM+Jc7rHCAK9jTLZGn2dR53d6dul
 nF/0EkDPeh6RHMqJCOVF8E9ePqidMHiR97HGmUA2CKdTGoJsIHk+E4V2Ro88vEKN4zwA
 HuTRwI88yG7iltY5xBaEPs8Cj9BkL3xduGGhfh52REttYUb+2F5EfZsBUIBM/2BzXu1f
 ELHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kTNskZH1aOJNJ1AE2bkS4myoUN8f6RMcimPSrzDsHo4=;
 b=NV7XXSUa9fLbJhhIMvJtfOcQXKDDdm10LWtsFPB/9A6NiQmkWejqflnbttAKv4zpXY
 oTF2jYFPTRx6BNEVXKEcnQSUr8Neiyh96G7zo6AadkbqU3sB1zh88E0dPfVUClEROTZi
 bfcLW7GdHcgJ4cGOcu63n1xBoYABuf/9ed4ZIQTAbh9Lq/cqL44kG/NcKkI3wyaTYRrz
 d5kyQ1rdkYn6B3ch2OZMiRzw7DE2y39+D9a7MOSCqZHihSwuorlow2syGCxwQkwk7xug
 YHedJP/2KAP0B9MrfaRC0sBigPZV6uiSgiImAMmtMD1QzT7ali55Bp4cQm52R4GiZfAP
 wnlw==
X-Gm-Message-State: AOAM530ZEahwY3nRUJxW2FBWjJ5AEY1vIna3JGHTnrDnA+ZsEJeLoB0s
 oDvqk3zhtSZ2q4EgooIDlsLMRz5N4me94Q==
X-Google-Smtp-Source: ABdhPJzZSfy8wh3xl15zwJdgy9Ic/kR79B78bNXFSJQOdsXC72P7DmdoI8/wwYKvCZEnjRqPvT0YmQ==
X-Received: by 2002:a17:90a:5215:: with SMTP id
 v21mr24852453pjh.28.1615212444541; 
 Mon, 08 Mar 2021 06:07:24 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:c0c2:2512:25a1:f7e0])
 by smtp.gmail.com with ESMTPSA id c24sm7313537pfi.193.2021.03.08.06.07.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Mar 2021 06:07:24 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/gtk: Remove NULL checks in gd_switch
Date: Mon,  8 Mar 2021 23:07:13 +0900
Message-Id: <20210308140713.17901-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1029.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

c821a58ee7 ("ui/console: Pass placeholder surface to display")
eliminated the possibility that NULL is passed as surface to
dpy_gfx_switch and removed some NULL checks from gd_switch, but the
removal was not thoroughly. Remaining NULL checks were confusing for
Coverity and probably also for humans. This change removes those NULL
checks.

Reported-by: Coverity (CID 1448421)
Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/gtk.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 3edaf041def..eb1c9658e24 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -547,9 +547,7 @@ static void gd_switch(DisplayChangeListener *dcl,
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
     bool resized = true;
 
-    trace_gd_switch(vc->label,
-                    surface ? surface_width(surface)  : 0,
-                    surface ? surface_height(surface) : 0);
+    trace_gd_switch(vc->label, surface_width(surface), surface_height(surface));
 
     if (vc->gfx.surface) {
         cairo_surface_destroy(vc->gfx.surface);
@@ -560,7 +558,7 @@ static void gd_switch(DisplayChangeListener *dcl,
         vc->gfx.convert = NULL;
     }
 
-    if (vc->gfx.ds && surface &&
+    if (vc->gfx.ds &&
         surface_width(vc->gfx.ds) == surface_width(surface) &&
         surface_height(vc->gfx.ds) == surface_height(surface)) {
         resized = false;
-- 
2.24.3 (Apple Git-128)


