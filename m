Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E29770160A
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 12:11:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxmC7-0008KG-1G; Sat, 13 May 2023 06:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pxmBw-0008GM-D2; Sat, 13 May 2023 06:09:32 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pxmBu-0004NB-EF; Sat, 13 May 2023 06:09:32 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-965a68abfd4so2060899566b.2; 
 Sat, 13 May 2023 03:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683972567; x=1686564567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5JoEHRzJl8ppxGRgpapWnu2BXy56o3xTN1pN/oM5GCA=;
 b=dQsjrenu5PhTCwhpVL4cDMvJQkhp9vBmY3axtpESbxfAWTxBHjMOZlb2PDMTlG1dRE
 LUJxa0tBRY6NO80AV/9+7efG7D+CF9STBrpFpfbd3V3rmwla/tBeYfCTfHg47FJ6JOTK
 0yKFGFISK2E/Wyfw0k7+Y6mpBfF7yz2hLVQpRZ9fNY9qBRATEaoBR7cRf+45QxztAns1
 +cToYCNlVSzKVKeKeDUwj9MP0BQEaRy1F4xH+Y87pG2AybhPec7qAOba3q8BdpkppCyb
 E4+FuT4oFhH9Qa/fZZz3tj+tjZBoN3YYAK+R43ZDxRrf02WyHk461Zs4XL5KU3Lm69Q5
 bhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683972567; x=1686564567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5JoEHRzJl8ppxGRgpapWnu2BXy56o3xTN1pN/oM5GCA=;
 b=N0xqCyKSpno3YiQEWSwZU/tcTNiIMDSkga2omxCCJdYWMWqBfYSOgWT9BiqGTeDcKV
 rHPe7lbRRpv2SxkLf3p7vCR1l0RYVsjMWWMnk0gOs9f6980PTa6AXFuspZfPYE9PympV
 Ru04ySTgawvGE0iHTyvzxVCwqzvR0D3CFjuCAMAbCmyOBrDTfoklRgF5/NGhbww2+lSI
 SzorN/XIJ2gGxW/blsx4K/phWAjzlPXzBv/6QjvNt/JVp/4HlQ4IqyyLT/nCgjOY6foL
 lUJLJRzpPvKlV0MV914jwtn6xOa/WOeEArpElkZhnhSygXza7TLYmg3us9dsnmNUouYZ
 jTYQ==
X-Gm-Message-State: AC+VfDzvJCyU0CfM7VqCODQfXC4Yq1NpWFetIygg/z726Q0zCQj71bXS
 k/G9iZLGPRYebNAwuwPH3wiz0xiCRBg=
X-Google-Smtp-Source: ACHHUZ4Z3TXj1grMuaqYvPEnYY7ARKZaaop6OS84mSOH20zEN0eHyVYjZ3f6TzhNbuiXqvrcJJASqg==
X-Received: by 2002:a17:907:7e9e:b0:96a:41ed:e3fa with SMTP id
 qb30-20020a1709077e9e00b0096a41ede3famr10622053ejc.22.1683972567409; 
 Sat, 13 May 2023 03:09:27 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-013-174-037.77.13.pool.telefonica.de. [77.13.174.37])
 by smtp.gmail.com with ESMTPSA id
 jr18-20020a170906515200b00965f5d778e3sm6645285ejc.120.2023.05.13.03.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 May 2023 03:09:26 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 4/4] hw/isa/i82378: Remove unused "io" attribute
Date: Sat, 13 May 2023 12:09:06 +0200
Message-Id: <20230513100906.46672-5-shentey@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230513100906.46672-1-shentey@gmail.com>
References: <20230513100906.46672-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The attribute isn't used since commit 5c9736789b79ea49cd236ac326f0a414f63b1015
"i82378: Cleanup implementation".

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/i82378.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index 5432ab5065..63e0857208 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -34,7 +34,6 @@ struct I82378State {
 
     qemu_irq cpu_intr;
     qemu_irq *isa_irqs_in;
-    MemoryRegion io;
 };
 
 static const VMStateDescription vmstate_i82378 = {
-- 
2.40.1


