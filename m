Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3825266C3E8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:31:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHRQi-0001I5-Rw; Mon, 16 Jan 2023 10:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHRQg-0001HT-Qj; Mon, 16 Jan 2023 10:29:46 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHRQf-00086L-D8; Mon, 16 Jan 2023 10:29:46 -0500
Received: by mail-ej1-x62d.google.com with SMTP id v6so25908714ejg.6;
 Mon, 16 Jan 2023 07:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9a8gxi5rLrFM0u1gWl0+pJ4V2EIK6saTEJaB/8a6FCo=;
 b=RE+YI4Mi3MexspdW8815dwK0NOKHjLaIoKYjDRwUFu0DuIgaX9SAJ9n6IDKddt3YuO
 FdgDYp3ge6W3R2nlKOfptO7HTYMme2oW30vKMFlIjvngWjMlDm88myaGfveQG1pFpxq0
 CBXWEMlNCWLQLrkj7ipbmEg/APF+ggCSOa9Zx9F76Udh9xiaOXvxrqnG3IUJU9zQXX8Z
 XqpkVtdtFO4KzNdHFpRpwoa8Uv7ghkiwXsB4VKLdk1gtXJu7FXMfo0hgp2M3I/74i9J1
 sutT45zZWP4YvGIh4xJuND4OkUozObOGa6PqSQKuXwuCH2NyBgbSJvoGPbXl0Cw+jd5k
 Ui9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9a8gxi5rLrFM0u1gWl0+pJ4V2EIK6saTEJaB/8a6FCo=;
 b=YZbakwo0LxZOv8IPdqQGfV1OhXJyHWopVasCkIkiZV4ICE3IwPIsLxE1JNiGCvJdE8
 Y0yAe92dUVwOw0lUqGZvgnZGEzdgdyHglRGwJXsAsCYjvybL+Vedrah19KyWmhBVUTc5
 PgV3ggtj+ngV1cjhp5hFbs6KfFhKMIKwGZJ9j0CCd6utofIskdxFNgv5BZVoptqHf9B2
 YO8Af3Vak7ajoVaY9Zo15RlIsZC/bduKSY7mibCox0cmBu3LNbwvvv+H1kShiGR2+gBu
 m9P3pIdk59vdfwNjpTI7eWl43EU9AAn8NCPzWMF6uhclnXoWTGhsFfnaIcWAhVvTNNCs
 dtAg==
X-Gm-Message-State: AFqh2koDx0wpWhylYbSnFLn7QdA59c54v4H1C1fOrO07JjPNkmHnNvWG
 YD4xR55h0tLpuz+LmqpiOGQhnLwjcXI=
X-Google-Smtp-Source: AMrXdXtAmU+znPoOZnTwE72mT27l1jVbGNWeUJGDyMC/hzdMePr6L2gvYFIiewnYOB9gj6bd6ldP1A==
X-Received: by 2002:a17:907:8d17:b0:7c1:1ada:5e1e with SMTP id
 tc23-20020a1709078d1700b007c11ada5e1emr78502287ejc.26.1673882984198; 
 Mon, 16 Jan 2023 07:29:44 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-191-143-217.77.191.pool.telefonica.de. [77.191.143.217])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170906b08300b007c0688a68cbsm12180764ejy.176.2023.01.16.07.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 07:29:43 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 4/7] hw/acpi/piix4: No need to #include
 "hw/southbridge/piix.h"
Date: Mon, 16 Jan 2023 16:29:05 +0100
Message-Id: <20230116152908.147275-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116152908.147275-1-shentey@gmail.com>
References: <20230116152908.147275-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

hw/acpi/piix4 has its own header with its structure definition etc.

Ammends commit 2bfd0845f0 'hw/acpi/piix4: move PIIX4PMState into
separate piix4.h header'.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/acpi/piix4.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 4d0d4fdeeb..2e19a55526 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -20,7 +20,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/isa/apm.h"
 #include "hw/i2c/pm_smbus.h"
-- 
2.39.0


