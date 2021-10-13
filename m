Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE5242B1D8
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 03:11:45 +0200 (CEST)
Received: from localhost ([::1]:55170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maSo5-00027r-1o
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 21:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1maSeL-00085U-Ru
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:01:41 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:39742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1maSeI-0005Cn-Sf
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:01:41 -0400
Received: by mail-oi1-x22a.google.com with SMTP id m67so1623226oif.6
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 18:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sonr4+QlvB0BD70L0wqOWK7lNp2oGE8bokzvEATHsxw=;
 b=IULdiWfylgMEqb7ZX7WxrlbC7ZWz/4stAzDL1QEClcHsFz+WdykP7QLgtXvI8HgOye
 SYu0BQg9TGXBj7wtbD3MoGJW3VwTfVbNRGOn7t3n1cWcSTLxnzXp0ZG4FRh+qdVAYMwh
 I8FgqsL2YGzVANtJRb6BDmbZy8k5BZizDHZvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sonr4+QlvB0BD70L0wqOWK7lNp2oGE8bokzvEATHsxw=;
 b=jiB1YHd/kxqbZVIodB1II4oSJ1NTciyh93TEDsnz3zVTLpWP0MvbnR6DILXJln1GSs
 Bw+SoPHw3U/QLT7nTZveJgyj6qDEoWxb5VZEYWJJlLbasQ9ioWl+5KR5tWYZPAekm/dB
 f59S3ik+fzn/9CXoqQZDlfEvS083j+qsxBUGy4D5MvfkRaHabwUP4Sh+ZgCYyL2Yola5
 Mn6uQLv+sSY7aFe699WfrGfM6UWAv1xt/ENgpfezDI2aTB8TI6wYSiReQDxVFNTZbLNk
 X6o0IHlOZujUa/tz1ZWY1rbADBD/oecRns461B0TdudNnhF2sPtzO704CiQ09z7EoQal
 p8vg==
X-Gm-Message-State: AOAM530OM4BXH3M9RBklmjziHN30z1g4AL1vYoNHFtzM5bf/VruOrHkt
 rEgEhcm110PbjGnHRORw89R1mw==
X-Google-Smtp-Source: ABdhPJyzRRGmUw1PYMsQ8E4RUbqs0C3BPnGoY5PGZNZApFMbc67lS6kXNSXS+KXIitcpd38sLWiBwg==
X-Received: by 2002:aca:c046:: with SMTP id q67mr5996611oif.33.1634086891402; 
 Tue, 12 Oct 2021 18:01:31 -0700 (PDT)
Received: from kiwi.bld.corp.google.com (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id a10sm238107otb.7.2021.10.12.18.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 18:01:30 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Subject: [PATCH 02/16] arm: qemu: Explain how to extract the generate
 devicetree
Date: Tue, 12 Oct 2021 19:01:06 -0600
Message-Id: <20211013010120.96851-3-sjg@chromium.org>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
In-Reply-To: <20211013010120.96851-1-sjg@chromium.org>
References: <20211013010120.96851-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=sjg@chromium.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, qemu-devel@nongnu.org,
 Albert Aribaud <albert.u.boot@aribaud.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU currently generates a devicetree for use with U-Boot. Explain how to
obtain it.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 doc/board/emulation/qemu-arm.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/doc/board/emulation/qemu-arm.rst b/doc/board/emulation/qemu-arm.rst
index 97b6ec64905..b458a398c69 100644
--- a/doc/board/emulation/qemu-arm.rst
+++ b/doc/board/emulation/qemu-arm.rst
@@ -91,3 +91,15 @@ The debug UART on the ARM virt board uses these settings::
     CONFIG_DEBUG_UART_PL010=y
     CONFIG_DEBUG_UART_BASE=0x9000000
     CONFIG_DEBUG_UART_CLOCK=0
+
+Obtaining the QEMU devicetree
+-----------------------------
+
+QEMU generates its own devicetree to pass to U-Boot and does this by default.
+You can use `-dtb u-boot.dtb` to force QEMU to use U-Boot's in-tree version.
+
+To obtain the devicetree that qemu generates, add `-machine dumpdtb=dtb.dtb`,
+e.g.::
+
+    qemu-system-aarch64 -machine virt -nographic -cpu cortex-a57 \
+	    -bios u-boot.bin -machine dumpdtb=dtb.dtb
-- 
2.33.0.882.g93a45727a2-goog


