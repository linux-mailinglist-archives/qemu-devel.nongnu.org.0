Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7130C2D1A45
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 21:10:03 +0100 (CET)
Received: from localhost ([::1]:59072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmMpe-0004sd-3g
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 15:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmMnU-0003sS-8P
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 15:07:48 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmMnR-0007sQ-EQ
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 15:07:47 -0500
Received: by mail-wm1-x342.google.com with SMTP id x22so347748wmc.5
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 12:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VSzp+oud4a3Yfc08Lo//V8D6a3gZosk09dc6lk/wVMU=;
 b=upv760/4putSuRiEmHwOBhOX8f5YN6DbYdR49ptErxzRRQkHEtWt5odej/58kKxclZ
 kHABxxtoZSN5H4rjYzeZ2TBpp6wBRrCfsb8gccSmGjJnryrCJEdr8Gm5eq9bDVWROXNk
 P/GU3NBHMFVqb/2rlCnBvlAEAf3hpAZn/efndhQFpOhWxwYTO0UgoP98OHufS7KNAdQt
 VeBbYhzQiEnlS0jzeIFfdNgqtaWOanR+gqjDyMMHynno9hXexxTPP4Ph5o9kM+pV+fXn
 9QncZJToJWutgjjyfdoDG4d0c/AnPi1YeZXQEHLmzI5WBBXgV1tsFx0yTzNrWPnzyYxJ
 YoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VSzp+oud4a3Yfc08Lo//V8D6a3gZosk09dc6lk/wVMU=;
 b=P7d50wOLxMDl5rMdeoV3RKMYmVcuvpUlAd4WrQImPx+fcHXjOTJyvu1Do08YpbIC8o
 EHAX+ThtJJnhQVGGz4B0CVdesYQm7iHVV7bD7UCndeNBTQK8aPQ/DIIiPckVw4ah0HpQ
 n1i/T+KwgFC8R8S2aNhZQ5PYJ0AYVnMnCz9oy3hF1JuQOR4xx/m6pjzjNvwXArDkDOnh
 ptPkgRknmNWkQQ+qnydmKFTz6zEyNrbvu6UMSR86bxFcm5pLUh+KmLaVt1DP/XO82Blf
 qaTEVzxLiW9yRZaHLDN+GmJgnPOUOMphFbiM8/aWK4P269SPpDhSCG+Cwl68Fl4YbNaN
 93Dg==
X-Gm-Message-State: AOAM531zTA9SC8PV6OXhWqEmixDRwemSnA8RbNvCQtaXT7SiUf/HEzne
 7Q6XDjXzCX9923Az0ldLgfmL3Q==
X-Google-Smtp-Source: ABdhPJzC6/VuCGOix0dBh9JYmMLxszeYWpPBf9p9wRuBSXRTxMwUi+iAgOGHHDiwXcr7Wlu3cU97Dg==
X-Received: by 2002:a7b:cb58:: with SMTP id v24mr503342wmj.23.1607371663921;
 Mon, 07 Dec 2020 12:07:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c9sm11114752wrn.65.2020.12.07.12.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 12:07:42 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 176A81FF7E;
 Mon,  7 Dec 2020 20:07:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] python: add __repr__ to ConsoleSocket to aid debugging
Date: Mon,  7 Dec 2020 20:07:37 +0000
Message-Id: <20201207200737.5090-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While attempting to debug some console weirdness I thought it would be
worth making it easier to see what it had inside.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 python/qemu/console_socket.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/python/qemu/console_socket.py b/python/qemu/console_socket.py
index f060d79e06..77966d1fe9 100644
--- a/python/qemu/console_socket.py
+++ b/python/qemu/console_socket.py
@@ -45,6 +45,14 @@ class ConsoleSocket(socket.socket):
         if drain:
             self._drain_thread = self._thread_start()
 
+    def __repr__(self):
+        s = super(ConsoleSocket, self).__repr__()
+        s = s.rstrip(">")
+        s += ", logfile=%s" % (self._logfile)
+        s += ", drain_thread=%s" % (self._drain_thread)
+        s += ">"
+        return s
+
     def _drain_fn(self) -> None:
         """Drains the socket and runs while the socket is open."""
         while self._open:
-- 
2.20.1


