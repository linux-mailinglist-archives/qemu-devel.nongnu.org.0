Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3133DBFBA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:23:26 +0200 (CEST)
Received: from localhost ([::1]:38670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Z2T-00057T-4F
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9Yyl-0005ao-4w
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:35 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:55819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9Yyj-00015p-GB
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:34 -0400
Received: by mail-pj1-x1031.google.com with SMTP id ca5so16808836pjb.5
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NKoC2j7+7O40T4y64pzeDDCdbYzeyUyxg5Gk/jXeOWA=;
 b=oyj3tzRDZYPHep0dcQVTWdgREFg89D922Q1g4yvPPtMjhBU9SMIRHvOoabHpopfoC/
 +qZEceoSCISN8tMxER6+tCPFNCSNsUK2F2tBdhD9MsLn8MtU83cc2G2yNG2+eYYbAHq6
 Ha8uEKD0xvRTVg9ZMnaLKuWfzeSru0gzg+dIFJO0leh1CELan7/Jp72SisMdkkNjLoae
 iiEZq2aqTEmjVEDUd/37doa7XP5veuqxfk5D2V2f/Z51ZI0zEHYh0CNy6Oafk2UIrC+/
 aAirwFCditJpjsmjfhzSLvIskOAMOq3GTL++f1JPP2T8s86d0bAThM85S3wfHPKuAni/
 ewlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NKoC2j7+7O40T4y64pzeDDCdbYzeyUyxg5Gk/jXeOWA=;
 b=qp8/GJnnqXO7ucjJKpUD+60jZoVIWwlOCH1QN5pQA5YHbi8c7/CMzZyqj/JLyZyljD
 xFIFySpGFnuST63RL5flc0Hlph69yQrA67OX/+kBfHTdzuGfNzS8RmnWjqEFs5dI9u7w
 BhoYMbM6lM7abAlY6+YI1R6+gehDlsqIt81DQoQu3cUxYJlwzu1GdUAu15LH//sludqc
 zfMeBmOR03dlqyb+95hm/jVf+U+EMS5XblwOm6EiWg91DBW5EZs35kG5X4q+yvF/50WJ
 Y/ujq21VSHyw3D0UN6wIQHdP0hj2szQ0lD51l7kqJYS8RqvB1ZHSIogRQc8EYuSDwWAH
 LQLA==
X-Gm-Message-State: AOAM530dTKCS5pcqSgbU2Ss7PVj48oY6eB1JZeiJGh//5Fw3i3htACME
 j1u7+cKB06wzAJbqA5YiG0HzSovnKSLPhA==
X-Google-Smtp-Source: ABdhPJzyFVmiPew3gXJqkYYENgJ1EAfSh2mn3NVHgJNGcR61rx6FP76qLyNW8ZljJEZkJWktZiW+Rw==
X-Received: by 2002:a05:6a00:2303:b029:329:308f:9ef6 with SMTP id
 h3-20020a056a002303b0290329308f9ef6mr4172178pfh.24.1627676372116; 
 Fri, 30 Jul 2021 13:19:32 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.243])
 by smtp.gmail.com with ESMTPSA id s50sm3256842pfw.212.2021.07.30.13.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 13:19:31 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/13] python/aqmp-tui: Add scrolling to history box
Date: Sat, 31 Jul 2021 01:48:43 +0530
Message-Id: <20210730201846.5147-11-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210730201846.5147-1-niteesh.gs@gmail.com>
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x1031.google.com
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
Cc: ehabkost@redhat.com, kchamart@redhat.com, jsnow@redhat.com,
 armbru@redhat.com, wainersm@redhat.com,
 G S Niteesh Babu <niteesh.gs@gmail.com>, stefanha@redhat.com, crosa@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adds scroll support to history box. The list can now be scrolled
using arrow keys, page up/down and the mouse.

The current implementation requires the widget to be in focus
to enable scrolling. Therefore the user has to click on the widget
before scrolling.

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/qemu/aqmp/aqmp_tui.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
index ef91883fa5..fb828b1a27 100644
--- a/python/qemu/aqmp/aqmp_tui.py
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -351,6 +351,19 @@ def add_to_history(self,
         if self.history:
             self.history.set_focus(len(self.history) - 1)
 
+    def mouse_event(self, size: Tuple[int, int], _event: str, button: float,
+                    _x: int, _y: int, focus: bool) -> None:
+        # Scroll only on focus. Therefore it is required to
+        # click on the widget to enable scrolling.
+        if not focus:
+            return
+        # button == 4 represents scroll up event
+        if button == 4.0:
+            super().keypress(size, 'up')
+        # button == 5 represents scroll down event
+        elif button == 5.0:
+            super().keypress(size, 'down')
+
 
 class HistoryWindow(urwid.Frame):
     """
-- 
2.17.1


