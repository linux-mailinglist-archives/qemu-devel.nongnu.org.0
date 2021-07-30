Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70903DBFC7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:25:37 +0200 (CEST)
Received: from localhost ([::1]:47134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Z4a-0002Zu-N9
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9Yyo-0005oO-OB
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:39 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9Yyn-00017l-3j
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:38 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so5386831pjb.2
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4KZ0HzG+B9+mKhjGsq5d786iXcrEj0YCq/8pG6bXXhM=;
 b=LSvJoPc3F/6GdhImMoPMULwzxA9ZjJktB6VK/VwTTMa+MMQY1w5PpeLa3u8reoT0F1
 NmH22XETOaYY1A5+b9upKawuR84JMLsI0fvgHxcbARNIA8FFBIK0Z3W/+MiLNzxtA3s+
 v9Id5epyO9+ceWw/gUsHIQZKOe6Nct3YIvOOYJMZRV43FnHdK+4F2Qq1Y7vhID6HhiMN
 EG1sTgwzonBNOKYzBufPggO4vVMdwP55yJChTdnCqGLwzWrcE4AvZ+GfuTvY+hPL4JsF
 PVarvTiYQsrQZrfb0NX1H1NISJS6KXolj4S6IPpKQ9DfeHkaPbjQd5aClvqkVQOpj0+5
 Rc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4KZ0HzG+B9+mKhjGsq5d786iXcrEj0YCq/8pG6bXXhM=;
 b=caS6eSjl8XyCkQBcuhDVnVfwAzQnDgyqudUIE/wk20ZLhZLlkM/WW7705Su6MDXUmt
 ZGsSgPXe+qeT1K+gYbnH7Dye+DLcRX8q7gE+G3V03l2ZUtkwFoeRO7bDZhp3pkPXbPeI
 CVWomg5Av/Doa4G0pwU2jVO5EziT72MNuSAtP6ceQkRQBMQ6JAkL+92pYg/L0Z4lRIXk
 0n7RAHINO7JRey8BTTI8angJDy0ByKNpD3T8anu6LAQRUXNfUxFTxY+GomQt9uhhO0J8
 cLbVbp/wA+b/vZLee8S2Z1scYvfjQSprPMvUWYrTQB30nkgXTYHWEBgdHhp+qeUit0XE
 Na3g==
X-Gm-Message-State: AOAM531Kxx6wtuUncJ2TEwynpC8XqZEsBCmAF1vwwrVNeAnooA3B/cfP
 5rvwJEGMaFfH90B+1KdYojuZgVpNZZIHPw==
X-Google-Smtp-Source: ABdhPJyTfLpfinEvXIJ7cwLyBEEDRCKzuOeafixbUN3CnmGEQ1RIBRdvd5F90ecA8ORfjmc+kvftbg==
X-Received: by 2002:a05:6a00:1756:b029:340:d051:518b with SMTP id
 j22-20020a056a001756b0290340d051518bmr4236316pfc.25.1627676375683; 
 Fri, 30 Jul 2021 13:19:35 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.243])
 by smtp.gmail.com with ESMTPSA id s50sm3256842pfw.212.2021.07.30.13.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 13:19:35 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/13] python/aqmp-tui: Add ability to highlight messages
Date: Sat, 31 Jul 2021 01:48:44 +0530
Message-Id: <20210730201846.5147-12-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210730201846.5147-1-niteesh.gs@gmail.com>
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x102f.google.com
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

Adds ability to highlight messages in the history box. The messages
can be selected using up/down arrow keys.
This can be enhanced in the future to apply specific settings to
a particular message.

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/qemu/aqmp/aqmp_tui.py | 50 ++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
index fb828b1a27..4bae0d4e89 100644
--- a/python/qemu/aqmp/aqmp_tui.py
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -344,6 +344,7 @@ def __init__(self, master: App) -> None:
         self.master = master
         self.history = urwid.SimpleFocusListWalker([])
         super().__init__(self.history)
+        self.highlighting = -1
 
     def add_to_history(self,
                        history: Union[str, List[Tuple[str, str]]]) -> None:
@@ -351,8 +352,57 @@ def add_to_history(self,
         if self.history:
             self.history.set_focus(len(self.history) - 1)
 
+    def _remove_highlighting(self) -> None:
+        assert self.highlighting != -1
+        pos = self.highlighting
+        widget = self.history[pos]
+        widget = widget.original_widget
+        self.history[pos] = widget
+
+    def _update_highlighting(self) -> None:
+        assert self.highlighting != -1
+        pos = self.highlighting
+        widget = self.history[pos]
+        self.history[pos] = urwid.LineBox(widget)
+
+    def keypress(self, size: Tuple[int, int], key: str) -> Optional[str]:
+        if key == 'up':
+            if self.highlighting != -1:
+                pos = self.highlighting
+                self._remove_highlighting()
+                pos = max(pos - 1, 0)
+                self.highlighting = pos
+            else:
+                self.highlighting = len(self.history) - 1
+            self._update_highlighting()
+            self.change_focus(size, self.highlighting)
+            return None
+        if key == 'down':
+            pos = self.highlighting
+            if pos == -1:
+                return None
+
+            self._remove_highlighting()
+            if pos == len(self.history) - 1:
+                self.highlighting = -1
+            else:
+                self.highlighting = pos + 1
+                self._update_highlighting()
+                self.change_focus(size, self.highlighting)
+            return None
+
+        # Remove highlighting if someother key is pressed
+        if self.highlighting != -1:
+            self._remove_highlighting()
+            self.highlighting = -1
+        return super().keypress(size, key)  # type: ignore
+
     def mouse_event(self, size: Tuple[int, int], _event: str, button: float,
                     _x: int, _y: int, focus: bool) -> None:
+        if self.highlighting != -1:
+            self._remove_highlighting()
+            self.highlighting = -1
+
         # Scroll only on focus. Therefore it is required to
         # click on the widget to enable scrolling.
         if not focus:
-- 
2.17.1


