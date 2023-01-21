Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BB067671A
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 16:21:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJFf0-00027h-If; Sat, 21 Jan 2023 10:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJFey-00023j-1s; Sat, 21 Jan 2023 10:20:00 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJFew-0005f9-BW; Sat, 21 Jan 2023 10:19:59 -0500
Received: by mail-ej1-x635.google.com with SMTP id tz11so20884239ejc.0;
 Sat, 21 Jan 2023 07:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pGh/aUL79s/xZIS2tYQ8sQVGJv5fWh11C/JSgX6ksuQ=;
 b=BBDzZ9C2X8eEnxXKwm/9CKysyc6IwZ4zyyV9nXQ6O9gFk4a0LAY+Qcvz5WtW3l7rre
 f0ZbB+DA7IL1sv0edZc+xbGGB0R+6FhYkxGxgpcLAp3xYfP/YQETDqt++m0sOEni3uKp
 QVkrA6wgocRDzyBBu287dJ+cc50iBXjAb05KvmN2y3jjNahhAkp5J19CXbfOJTwP0WoY
 EadqnBeP1QPTDmQBsQoPqlw21zPZ52tBgmMqPATKhaUY7e15t70FxLJXhRL8eSKuX7f3
 VaJ5El8zA32F0BZpReI91KhSz+Af6T7Qfq9mbg3ppHifUHfFSFZG4tXZxZZu+BMQ/EGP
 uNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pGh/aUL79s/xZIS2tYQ8sQVGJv5fWh11C/JSgX6ksuQ=;
 b=pcjP9ITpARIqi+W9cCRAdMPtqhFfB7+2GTKTFO3iIpEsOJKLju1xh83PowX+bhXtlZ
 tOkb7YbpQ1/hgCHHpixd68CWjKX8hpZwKeUDwBIJVTVcqEd9W1j/MWcBJXxONVOwv/6c
 GTcIVUali2rJEEwX6F9GKEJeqe+3zoSqoY+6LVwcaQ2AS4WnQEk/WRkKZOHm/N3UVjKf
 Nxb71Ybg3zSvmvGZEgz3yLQkleIbSzR0nJEXFOMJCvh39W1QW51vE8cbMP922E9N/tYp
 so3nvzJfKbctyHcaMLJxmGB/BjpakGyGqgbXJ3BITWxwvVKLpcrouG2b3fbh57VSF7C5
 doGw==
X-Gm-Message-State: AFqh2kpb5TkPDALRAXtvCDRcYjih81Gi6KZXhHs/MXkuvswrrzeFpP+h
 JQGepXBLMRJ95XKblDccflakb0zkyeeRnA==
X-Google-Smtp-Source: AMrXdXtieB/s4Lq1QBsfU94h5EW7qyz4+FV6/CHvhWiysdnGGxfq+7+RysbXWURzlT/1M7h7hTJ4mA==
X-Received: by 2002:a17:907:8c88:b0:86e:d375:1f04 with SMTP id
 td8-20020a1709078c8800b0086ed3751f04mr20734502ejc.30.1674314396452; 
 Sat, 21 Jan 2023 07:19:56 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170906101400b0085ff05d5dbdsm14162567ejm.173.2023.01.21.07.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 07:19:56 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 3/7] hw/acpi/piix4: No need to #include
 "hw/southbridge/piix.h"
Date: Sat, 21 Jan 2023 16:19:37 +0100
Message-Id: <20230121151941.24120-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121151941.24120-1-shentey@gmail.com>
References: <20230121151941.24120-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
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
index 0a81f1ad93..2ab4930f11 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -21,7 +21,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/i386/pc.h"
-#include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/isa/apm.h"
 #include "hw/i2c/pm_smbus.h"
-- 
2.39.1


