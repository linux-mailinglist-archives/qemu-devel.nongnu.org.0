Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C19308DAC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 20:50:02 +0100 (CET)
Received: from localhost ([::1]:36802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ZmK-0001wI-Um
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 14:50:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5ZhD-0006GG-FF; Fri, 29 Jan 2021 14:44:45 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5ZhC-0005b2-3r; Fri, 29 Jan 2021 14:44:43 -0500
Received: by mail-wm1-x32e.google.com with SMTP id z16so5387895wml.2;
 Fri, 29 Jan 2021 11:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BM2y2J4KyWJi5sMWebJJS4WoG9B526AOKXXQVUHBZlw=;
 b=TaUDDLqD7Z3Ndo3PPEk8aaFyX8c6QcgnXzsURV4mFR+jOf6oUCbYVs5w9y+rjgcJYc
 e/0CVH+wlQn0VoPPB2fOJ/Pq9aK42DYqrdEah3eTySPnvY27AqUXb6U5bQEDPmAZS5W/
 Xx3YRn/FvO8vaNT6cBr/G3ddUU3NrgBwKmOuYOyKNukX0t1Yx94EdWQVuox4ZXbngoQa
 3MXZnbIk5QlqOXCHm4rfqn/1qxJoaAhZMT/k+iP4fqqnhzJ8fP6Yi+nMnvuEw1Uv+EPl
 +W0xeioTLhLzdBEQPY/GgXRe7z3NRFrHXedWgzDAECZIVoFPkU2bLRAr8gQi5wEDFmNJ
 LRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BM2y2J4KyWJi5sMWebJJS4WoG9B526AOKXXQVUHBZlw=;
 b=YEbdoAyPgNCnVlHcpq068y9R6guiURlXdfJAi/FX60sGzNJkO1V2DfaQc/kTaN0Sk8
 +M+OGcvVkuXx4w1Emy5ClGVUaHhCiDtiIqgRGO7yvMxZjefxO9gDg7xCFMeDiMpQu3Tk
 9KkjwsYkeL6GxBtaSedrkNdIYuVSysezvKsm0AbuQY+inJJ3r+iM+hZvIgP4dAuCo52e
 38nhCK+OWpaS9ZLrAAw++AXBdAOKde42TNbV9FCyN67tT0hWJGDeY8Kea7Cu/AbjqQW/
 SihAwc0UyKFN+TUij35nScIRXSAdDmbruVVqnQwJHt3kyzqjJCT5xPp1qF1xRsGHZ+pr
 1d1Q==
X-Gm-Message-State: AOAM532dLZAlFoudosKuiuycAGVXZlPb/DzezDSJ8qeA6TCsd5krFpfp
 2+a/fUnfwU5pGtpq9O701DqEkhpB92E=
X-Google-Smtp-Source: ABdhPJwqnigiA/nIJHI0fcSWc5nmwSpoWMxpACaoJ9FpYDh6CnShvhAIypR354j5EUS/kAyOr0cNrg==
X-Received: by 2002:a1c:7e15:: with SMTP id z21mr512555wmc.27.1611949480239;
 Fri, 29 Jan 2021 11:44:40 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id d2sm15407260wre.39.2021.01.29.11.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:44:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 4/4] hw/xen: Have the xenpv machine select 9pfs
Date: Fri, 29 Jan 2021 20:44:15 +0100
Message-Id: <20210129194415.3925153-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210129194415.3925153-1-f4bug@amsat.org>
References: <20210129194415.3925153-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

9pfs is not an accelerator feature but a machine one.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/Kconfig  | 1 -
 hw/xen/Kconfig | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/Kconfig b/accel/Kconfig
index 461104c7715..b9e9a2d35b0 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -15,4 +15,3 @@ config KVM
 
 config XEN
     bool
-    select FSDEV_9P if VIRTFS
diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
index 15944144a17..14009cd6a05 100644
--- a/hw/xen/Kconfig
+++ b/hw/xen/Kconfig
@@ -4,3 +4,4 @@ config XEN_PV
     select PCI
     select USB
     select IDE_PIIX
+    select FSDEV_9P if VIRTFS
-- 
2.26.2


