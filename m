Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9184D370F08
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 22:34:17 +0200 (CEST)
Received: from localhost ([::1]:46952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldInA-0003QG-IJ
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 16:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldIki-0001NE-GY; Sun, 02 May 2021 16:31:44 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:47038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldIkg-0007rS-Rm; Sun, 02 May 2021 16:31:44 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so2341112wmi.5; 
 Sun, 02 May 2021 13:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1wLp4aTj+pbMibqvZAxrBIac9OxculfaSC45JDiLwlk=;
 b=EqfkNzKeaYNINFqhpz8ytQ7/WyNimPujlp9uzSdRtzVvW+jIPHvbyY1Tp9n4Y/rByc
 H3MaWNP+y4wKsQFSOdmjdbt5ouv+D9yOrzyiDhUEenboOnEZ1Tuzm6mQAEQ74xacWiss
 0pszIBRxiEnP1ySedB11/IZDzKyrQJapci63HacFAONvjL/cAtuYhrd4efP0od5xTDiT
 WPNfX6q9OkdNwGwaXb2h1UDonh3Ojf6kPcepFu1EnaI+NiLFCaM0yuccM3Ecy+xEs4Dt
 9DNjOKj2ZNZf1F3V8GoEBHsal9tnZZtnxL+s2tJhlOX9mQyKxhniSPUdR2MxMorYwU8F
 Tyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1wLp4aTj+pbMibqvZAxrBIac9OxculfaSC45JDiLwlk=;
 b=D4SsSEVASj3pR6Q/4zrLNE1Py1N+5VEMJF80A7JBgCwTH8uUwyl4nldbLFwACr/97P
 EA9a70GM39UTcMWzXIyDgL1SW4BVllwxREo7MsmxnvWLDx5tyrnIaDCmMj606Peyjh3N
 f/aDCwmhnUKKF1QqYpbFatoGIcfwmn4/kbqEwAZa26QkGub6MyZvt+dq0GcU+UimiGlj
 Qna0c2E/5AfTBO2yOEIiwg23Po2YxKyfyJJ2YUFJP45c6msmFYd2CCn2lixiKMCbsW1a
 tnCP3DIbGYQuaAiQT3reAs6iriyzvoecfB42KWT1N+P/hB80S+1DeWEmMCxAEHWy/7Gz
 AtBQ==
X-Gm-Message-State: AOAM533QbhNimmEd87mpTvdIeVVPdmawB3A1HztP8MZd3DX6pvYPiGe8
 0Ju/+3DVOuY9g9en7arU/MHHmUaVi9fNZPpq
X-Google-Smtp-Source: ABdhPJwVHDh7IRBsLm4nN0H+MLNeFpnsQ60AEqd5JDsxjBUgUwnwNh9wid254oLwEREWfo4lHuJp9g==
X-Received: by 2002:a05:600c:3798:: with SMTP id
 o24mr29222522wmr.12.1619987499074; 
 Sun, 02 May 2021 13:31:39 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id f24sm20279883wmb.32.2021.05.02.13.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 13:31:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] hw/arm/armsse: Manually reset the OR_IRQ devices
Date: Sun,  2 May 2021 22:31:21 +0200
Message-Id: <20210502203121.630944-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502203121.630944-1-f4bug@amsat.org>
References: <20210502203121.630944-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The OR_IRQ device is bus-less, thus isn't reset automatically.
Manually reset the OR IRQs in the armsse_reset() handler.

Fixes: bb75e16d5e6 ("hw/arm/iotkit: Wire up MPC interrupt lines")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/armsse.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 2e5d0679e7b..a5f8e89950e 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -1668,6 +1668,10 @@ static void armsse_reset(DeviceState *dev)
     ARMSSE *s = ARM_SSE(dev);
 
     s->nsccfg = 0;
+
+    device_cold_reset(DEVICE(&s->mpc_irq_orgate));
+    device_cold_reset(DEVICE(&s->ppc_irq_orgate));
+    device_cold_reset(DEVICE(&s->sec_resp_splitter));
 }
 
 static void armsse_class_init(ObjectClass *klass, void *data)
-- 
2.26.3


