Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862D12DFD01
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 15:48:06 +0100 (CET)
Received: from localhost ([::1]:44050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMTl-0006k0-G5
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 09:48:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQh-0004iJ-WF
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:44:56 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQg-0007d5-0V
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:44:55 -0500
Received: by mail-wr1-x431.google.com with SMTP id t16so11328280wra.3
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r5CLA88dOWs1evquoz1Iig9Crq4gylWOWQgpaUYxU3E=;
 b=WgobuO1m6lYHkViujQvRZikWUqAbuNHeLBPgwxP/20StcuD+5ObAroh1n46msg4wZH
 JdZvWiSqSeGG4KXc8cagS6iyOL2n3fz9Z2ipGV46JgaI41OOobgShjIOSvCE1VD7zhsQ
 VGiN0gEMEdt+GnmVZq/L0M5C+TrnBIi37qUQA+ETwf0i8SXXc/G3d3N5h1E0anaBADvR
 UkiSzZgz7+OQ9VDuSewDuBMrzj9ltOfThf9jH01QhY0/THS6XqQKwIfpDaBj7jbrqG9J
 CCxSQKTKpRUH8CfTZSepDRvES3CfT1jWUd5QX+AjLCET4gKGhm2U93z+M54bkVcMS97g
 eQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=r5CLA88dOWs1evquoz1Iig9Crq4gylWOWQgpaUYxU3E=;
 b=g6fYDTkPDsYQLe+HDqLW3lt/ShktQayMx+OEo1OR/bcCwI2YD6eGouKsOcBcU7Mz1Y
 rfPm7D2sLYYzw5cgKeP7I3mQ4MhlHQAumFJKW3BvcL7QpxoASLer8/A9g9q7XWnTqv+/
 enhkfTkNasr4zvi3p6KldqAVjAX9y0hYjuEWdR5baro0VQkBgmgn78rFGwvXd4jYQIiH
 ct3YX/cm1wbPypfFOh8p2Hp+Fl2Ya3dlQn887RXWUF3/XyrZ7UeM39r8xGKqpSUUZtlk
 ed3vpppn7PuVa0y3sxp8228pnI3qUsCv0TUN9JCuFB7/rSks2TQVxdbo7xKpasPNiVH9
 PLug==
X-Gm-Message-State: AOAM5307tuNW8gUFMv841DVx26RapDlFuTGW9Rg2lL1AepEHjg/mA5FR
 6Vvu/rjvTwSDXO1Yk1IBUMsny0/MFVA=
X-Google-Smtp-Source: ABdhPJxtetFckBc9l863tG8wro5hCOXfw8mxbwJogjTXhTdELGIl7iB+Hqee3kJCPkUgziT53stqig==
X-Received: by 2002:a5d:6a4f:: with SMTP id t15mr19640933wrw.62.1608561892682; 
 Mon, 21 Dec 2020 06:44:52 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:44:52 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/55] python: add __repr__ to ConsoleSocket to aid debugging
Date: Mon, 21 Dec 2020 15:43:56 +0100
Message-Id: <20201221144447.26161-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

While attempting to debug some console weirdness I thought it would be
worth making it easier to see what it had inside.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20201210190417.31673-6-alex.bennee@linaro.org>
---
 python/qemu/console_socket.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/python/qemu/console_socket.py b/python/qemu/console_socket.py
index f060d79e06..ac21130e44 100644
--- a/python/qemu/console_socket.py
+++ b/python/qemu/console_socket.py
@@ -45,6 +45,13 @@ class ConsoleSocket(socket.socket):
         if drain:
             self._drain_thread = self._thread_start()
 
+    def __repr__(self) -> str:
+        s = super().__repr__()
+        s = s.rstrip(">")
+        s = "%s,  logfile=%s, drain_thread=%s>" % (s, self._logfile,
+                                                   self._drain_thread)
+        return s
+
     def _drain_fn(self) -> None:
         """Drains the socket and runs while the socket is open."""
         while self._open:
-- 
2.29.2



