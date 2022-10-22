Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4389260966C
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Oct 2022 23:13:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhEF-0005uH-UO
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5A-0007Cv-DV; Sat, 22 Oct 2022 11:06:40 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG59-0002Cw-39; Sat, 22 Oct 2022 11:06:40 -0400
Received: by mail-ed1-x52e.google.com with SMTP id a5so3028811edb.11;
 Sat, 22 Oct 2022 08:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yeRNXzVfr9gpAq+8v0gKJ81J3Pkz4jG0UR9VroPG7bk=;
 b=Lfse1QdzmEPqxWI3fbhTVUXaeXiYe/KqYZcN8/nnu6z+9+AKScHixih22nBaUasKn/
 yIRY/u/KWil/g92JmXEgFrE23Xt+XJp0GZBjrunuwgzGYJa7lN8p+6XZQ+O7hfX3Rdon
 qG6Q/flxGc63MyEpSm41CCmSQA9lVHWP8BTKm0WRfWAjrN0FLXq/kxMxyLw+8Kt0fK/G
 3GRdPK0TzZfZlGuISpAgXBXaWQaTGwqgZ/hmQVI9fX2ZTNH3HBYp7t1dfGG5YBgPvMgA
 xIqTUnr69fBaVV9KXuHnIeKIE6Qx4oP5o99QeQUUfIqfMsQq89vpbS1B4gSqLBY6S2zJ
 3fEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yeRNXzVfr9gpAq+8v0gKJ81J3Pkz4jG0UR9VroPG7bk=;
 b=dqMGuht7PEjpCHQvQnTcGOwjma47m+6CHD9TzP1cFjLUW+8Zq+iKRUttTsEz7Nxvw8
 tSmiNOJ+McsVxEWNBgP2b0wnIVcyCBv/ZdICAZXkxYoiMEVOzQOnOPWIt33NxZzErhul
 8VBck5n6uXV7Wx95bNr1mKCl74WnnmJ7C0z1j+ONGSiCgciv49xdE3TNu64ZgPfw88rl
 +aFZAFKsGYt1sQ6Fr+EiQ6zS/kFa7jfghpYOXo5acXMlcas2qw0odnz6phDf1B6Or726
 Bm3GffU+hbYX/7FTgOv6+P9XvqlhOd7okmeKbMDbe0nqzI1k8taiEo/018rYUByS1479
 OdKA==
X-Gm-Message-State: ACrzQf2mfOWHJydHJxD+honykkeoFUt3qW0kjRGrA64cd9wuOJPcRZxD
 uFWyQWpgXKR5X7YnjF+WPJOBnU38q1zTAQ==
X-Google-Smtp-Source: AMsMyM51PWFLcTgw/WgauwBwiTH9IlfkuWH7/nU1OPgBqYeys2wPYLQfGssLE7w0WXi5T3LCiwgzKA==
X-Received: by 2002:a17:907:708:b0:77e:ff47:34b1 with SMTP id
 xb8-20020a170907070800b0077eff4734b1mr19316150ejb.493.1666451197840; 
 Sat, 22 Oct 2022 08:06:37 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:06:36 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 18/43] hw/isa/piix3: Remove unused include
Date: Sat, 22 Oct 2022 17:04:43 +0200
Message-Id: <20221022150508.26830-19-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ammends commit 988fb613215993dd0ce642b89ca8182c479d39dd.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix3.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 59599558a1..aa32f43e4a 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -32,7 +32,6 @@
 #include "hw/ide/piix.h"
 #include "hw/isa/isa.h"
 #include "hw/xen/xen.h"
-#include "sysemu/xen.h"
 #include "sysemu/runstate.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
-- 
2.38.1


