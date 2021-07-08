Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE343C16A4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:52:06 +0200 (CEST)
Received: from localhost ([::1]:40312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WJp-0001vj-P6
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1VnG-0001Ea-R9
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:27 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:45656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1VnD-0008Lg-K1
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:26 -0400
Received: by mail-ej1-x62f.google.com with SMTP id hc16so10254549ejc.12
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/apfJEOciNs9lDbY3JGqeDB5QmGe2AaavcQcLbUM8y0=;
 b=ZlITIoBVcMPcezEr6l7oiz5yz1gmOrSvovfaKCjhUaIZ8K4xpG3PT+bxd7Awms4rUz
 PIeZ/JqEChL1k32dkEyi93BuNc97XLcj1CnQPiojk8lN4RYYiWd77ysZus+4/B6PwBzD
 Y3aHqj+hb7li97NO1eJcNIGFIVU0ttxAcWpgUgtWtNjgqEENF9LpHh3A0I6YbAv0+ZZB
 Y96SR+m/MHcutoZDRPIeHEfNvg9mIl4nof+z73OKn4qxyOBM9RsLFQX0m4T4TJqIkaBy
 WB3y16Gz6oymH6+B6ZknTamf4z0FKYxlWqiHC83szOMH7rukwl0ObaiqYyiQw7kihSGw
 z+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/apfJEOciNs9lDbY3JGqeDB5QmGe2AaavcQcLbUM8y0=;
 b=iVz36X6tYR5ujsoxl5enJ8O4VSaRklnvJJwqM7F1zQTgcrxqFl+03ODULt4grYNcVb
 xezaJVk0plYWpJSVSN3s6tqtu/Fd+aqMFjFzQOAuTofZsbtdaodSmwNu1TCLgHPmA9Ps
 GlnKr2KyXEgkxVU0qw3DSUFrFvdBQjw3bXLuratZiOqOux7lkXQUrxeozIcomK2+cTLo
 NE/t289pfwWNpRlfaKYWJr4pefM0KgmzYaKvKTZUWvMHkiqUCTc5n7CuM3aSoT8fc5xL
 VbvPkO/uwGiOKuJwn+A+RITjIX37/jvMOvwWPptRe7Me7TwdXLbKqo+z87NilmJOSZTu
 nKJQ==
X-Gm-Message-State: AOAM53101xOd8LcHrounzHlP3RHLe2IhZYdj4caSTfBHgR4vQukPnknk
 SUmDh46Bp38SCG98+xALZ200rOFqKuA=
X-Google-Smtp-Source: ABdhPJyIjrQbI9uPAscI+zW539dSCnthy54r+SASGZ2sv7k7wtfj8r/v+uxP5LlV3fByUtDvEYiApg==
X-Received: by 2002:a17:907:62a7:: with SMTP id
 nd39mr31572281ejc.502.1625757501496; 
 Thu, 08 Jul 2021 08:18:21 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 45/48] hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
Date: Thu,  8 Jul 2021 17:17:45 +0200
Message-Id: <20210708151748.408754-46-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

We need this functionality due to:

    /* XRAM IRQs get ORed into a single line.  */
    object_initialize_child(OBJECT(s), "xram-irq-orgate",
                            &s->lpd.xram.irq_orgate, TYPE_OR_IRQ);

Fixes: a55b441b2ca ("hw/arm: versal: Add support for the XRAMs")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210707131744.26027-3-alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 647b5c8b43..528f71bb9d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -368,6 +368,7 @@ config XLNX_VERSAL
     select UNIMP
     select XLNX_ZDMA
     select XLNX_ZYNQMP
+    select OR_IRQ
 
 config NPCM7XX
     bool
-- 
2.31.1



