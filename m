Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA42941882C
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 12:56:25 +0200 (CEST)
Received: from localhost ([::1]:54552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mURpY-0001Wg-Ox
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 06:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mURjg-000744-8V; Sun, 26 Sep 2021 06:50:23 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:45754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mURje-0004ne-BR; Sun, 26 Sep 2021 06:50:20 -0400
Received: by mail-pf1-x436.google.com with SMTP id w19so13007159pfn.12;
 Sun, 26 Sep 2021 03:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iDAkP17wWv58zsiXwhPI2T2NohJECM8EcqThkHpd2sQ=;
 b=Y75eWhzgTNzWrSm/rJMQK0gejS0qfWkdT9IuHOd9roKLo+s10eqGZI1qfh1XWECFbO
 IE3zNAyBuaf9Kds0dPXxgWGGLVvtCVFjJuR1XaJqUE6bPUwbGAduNAxMgFGrRuGM0k9V
 1a025kFKDY87gGTgaH6MnMbHloujid0S4Da4gM7aMWfWv0KzMsmmgcJL/TCcr0V1xFfH
 2syaoSNRQLX4/KnN1oWhQRIEcurR6s9T/dTiiYmaC5gUsdBLjiQlhR3lM6/0U8MObIHU
 vmMU7dDD7aEbPL7AGrp8sQxCp4gfvT9Bw06YfKhMKXWtnEDoQHDP3os5UWsVprxbHs3M
 V3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iDAkP17wWv58zsiXwhPI2T2NohJECM8EcqThkHpd2sQ=;
 b=zn9hJHOPsVOWQ053EDZH/ZdcrpqHisTEDaZxGoll+YMPwBopKiBPdzL1lGEC9T/EUX
 M1lw8XhfRuHaRdUCw039oDzfFQn+jymPwaDNbDR5FxFxuVIlZop9iexLZLi7hHZ7Ze9p
 2LB9VNS5qDMU1ITy1Bwxj+1FgInFluCV32ShiLBIyPIx2N+v6Dl/tZwpw9nwfpZ8CoUL
 CXoaXEfW2qtGR2I3WAtPRI+/xvQjAzaecoY6tMePRSm++RhA7IXLlYo8B0USgw3LVcX1
 HyxsVABqP+eY7nO2MXqIcM19mFnLMk3dEw/9X+ssXfA6RUfcAbqUIHvDon3mwo33BYaR
 3JPw==
X-Gm-Message-State: AOAM533uLCYAcqWNorxAk6X1hZlrM05HDqNLLn+dRWYwZF0eMpkp98g9
 Qro6yppKz4hOdPQAeXJ1bSs=
X-Google-Smtp-Source: ABdhPJxLqNgOSYTMTib2RNUmA2NbT4GnxwVOl/q0WrfVN7sRMpVetMvjNdWBPrCVkdbkxBvrPK7iJA==
X-Received: by 2002:a62:1956:0:b0:442:35b2:f87a with SMTP id
 83-20020a621956000000b0044235b2f87amr17993215pfz.27.1632653416707; 
 Sun, 26 Sep 2021 03:50:16 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id y13sm16190562pjr.1.2021.09.26.03.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 03:50:16 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 3/3] hw/char: sifive_uart: Register device in 'input' category
Date: Sun, 26 Sep 2021 18:50:03 +0800
Message-Id: <20210926105003.2716-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210926105003.2716-1-bmeng.cn@gmail.com>
References: <20210926105003.2716-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x436.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The category of sifive_uart device is not set. Put it into the
'input' category.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/char/sifive_uart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
index 278e21c434..1c75f792b3 100644
--- a/hw/char/sifive_uart.c
+++ b/hw/char/sifive_uart.c
@@ -248,6 +248,7 @@ static void sifive_uart_class_init(ObjectClass *oc, void *data)
     rc->phases.enter = sifive_uart_reset_enter;
     rc->phases.hold  = sifive_uart_reset_hold;
     device_class_set_props(dc, sifive_uart_properties);
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
 static const TypeInfo sifive_uart_info = {
-- 
2.25.1


