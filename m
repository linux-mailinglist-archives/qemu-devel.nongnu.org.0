Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE366A4422
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:18:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeCK-0005Eh-RV; Mon, 27 Feb 2023 09:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeC0-0004em-5W
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:28 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeBy-0000Xv-Kz
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:27 -0500
Received: by mail-wr1-x431.google.com with SMTP id j2so6345925wrh.9
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hssXN3XkoW4KUFtL7+A8SmD/TD5D7zgacO3632skb5U=;
 b=CFmgspM0P6WgAcYn5I/YDn4T7oCUz45UHC0xVgOuX/hQnhdL+aFtLu3WM4i30KoNF8
 zYGmscD28l8u+NDEkgBkDSP0B0CHM1dnY6qu0/xnfngkwmB8n3z/nAZ/l7739kbXpPeZ
 MYN9cGVinzRejehqxwEWFk0Yr7UUYR89LaoXvqwoL0GH8p+WvqG+voE05BcE9D/xU/Pv
 faHps5cNsdrKHptEbvPSTlpKA1Khpjxog8K5zDrHlHUen1g0qwQrNmPeUIQO5dHMV1H+
 t3iLnjqLmDtSsHJ1/jVtce7zJxnUf+5iGGcBR8JGUfJPflJyUz8+gMf3UEZfBoDT5xKn
 COyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hssXN3XkoW4KUFtL7+A8SmD/TD5D7zgacO3632skb5U=;
 b=1wIZHLEnyRcCH+vUavnxUl4LFyWzYnvnC7fqXCGsv5dLA3SJQALYLqHNfodF+4DB0C
 hDUtiYSKsa4uh/1L9hj55auN8HB5wVEv/CDTgSAzAL5Q+SS3EoA1+HYF2d7ifwbWH2Tm
 k2Z0uKAAGGbu5dS3UR06eIAwwmmOCZmB6lpMpBoK7DjhG3NihaeOrFr/6WjVzHuWPTJ8
 j0jK0pQ3MelCub4fP82QmfoRS52HG0+dQKX34M0aXJXkck6/8ogBG6VVxWY5v3eZVHBU
 mwbaEVh4G/xylfFGhSX/zBqxBQziphD0ICtSv4zLJVN983Xd+fEjHnjDl7/GFB91qTWp
 NHEg==
X-Gm-Message-State: AO0yUKUKGXcO5/vV10vDqgSRV6BE820qyV6aAEMV5nmPneKqUF8GmBeH
 wAx4ueoMYzlpjjIWvMDVYWsSqGhmFTVA6F+o
X-Google-Smtp-Source: AK7set8dGmcE4OnTnV5tB3wn0JnuB8aD4Rbth5vJh8o44Wg2jMPRidJit0QvVsqVOm8uAHmKG+E/pg==
X-Received: by 2002:adf:fdc5:0:b0:2c7:dec:77ac with SMTP id
 i5-20020adffdc5000000b002c70dec77acmr14127186wrs.21.1677506963705; 
 Mon, 27 Feb 2023 06:09:23 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a7bca59000000b003db0bb81b6asm9268857wml.1.2023.02.27.06.09.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:09:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 088/126] hw/usb/xhci-nec: Replace container_of() by NEC_XHCI()
 QOM cast macro
Date: Mon, 27 Feb 2023 15:01:35 +0100
Message-Id: <20230227140213.35084-79-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230220150515.32549-8-philmd@linaro.org>
---
 hw/usb/hcd-xhci-nec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-xhci-nec.c b/hw/usb/hcd-xhci-nec.c
index d732be0ef9..328e5bfe7c 100644
--- a/hw/usb/hcd-xhci-nec.c
+++ b/hw/usb/hcd-xhci-nec.c
@@ -53,7 +53,7 @@ static Property nec_xhci_properties[] = {
 static void nec_xhci_instance_init(Object *obj)
 {
     XHCIPciState *pci = XHCI_PCI(obj);
-    XHCINecState *nec = container_of(pci, XHCINecState, parent_obj);
+    XHCINecState *nec = NEC_XHCI(obj);
 
     pci->xhci.flags    = nec->flags;
     pci->xhci.numintrs = nec->intrs;
-- 
2.38.1


