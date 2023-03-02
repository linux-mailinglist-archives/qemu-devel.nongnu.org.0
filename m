Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2547A6A8B2A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:25:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqNj-0000pT-Fs; Thu, 02 Mar 2023 16:22:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNi-0000pB-4w
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:30 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNg-0002Ri-Il
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:29 -0500
Received: by mail-ed1-x535.google.com with SMTP id g3so2583638eda.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677792147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zixELIAqxL8NFNKifykT+zC7EYsj/RbTSc+eJBRLJJo=;
 b=Aqt32CswHncEToqVPzzk1Uaiu92vY7RfcCHQ+AdQgLyilIOxfRjZ87avDxVnmtutD4
 ubUDceB54zSBLSKczUliQde7zid8PN2WLkSV/hjtFJK3H3P+/G3YXkuOqC0v0CWu3IXE
 BcDRyiDQ4grJUloAWuHTGN+RNNACoCurX9U3ZXfBBKEWfllO0RFVQwmxuHNmO00SaTW2
 TPd4LMW1vTpd+3Yj19fS9D62WS8WLn2/mGccc0gRppY88UkH+zqHhhmKMJYfEav8j4lv
 dvciSmRqe7cKfwloknV9nmGT4KiBtTL1PdvoHdzcAndhv89CxLLU266yabN6BxFNYqs+
 KJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677792147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zixELIAqxL8NFNKifykT+zC7EYsj/RbTSc+eJBRLJJo=;
 b=QfkNRKuSrhMPxrlXcSwH9jEJHX5NYNSfShG7bsOw/zgufn/4KdhMbjrArHhSjO1RFk
 5/MGC5dJ+SMaL/I+whr0LM2nJnseXGdoLWSVY3WO63gJsrE0HSvTnaoRpnefG/oy847j
 cDzzGvUUM6Wm00dj6SPZJWmaVrdO7QjdDB254npFKq0UMnmwdXHF6Rk3jyP3JT7szQQP
 udZQRXhr1R1WAnANWHNbrcGIPYNvllh7Dh6nBJ2JeoAdML15GKuAJRw/eAHfhyNzg67A
 u7eZizvMmv3LW18ATu0hXqDdYYn0fYlC8et+cVQMFEvVFNzTNCz45iPWOPFqO3ZsGolf
 FjkA==
X-Gm-Message-State: AO0yUKUmJs42Y3PuVAIgF5EGiY2qadmdcLZfTZygVNPTPpZYWIqhGswk
 OKldEnV3cYbAlSpM+hewpDMVFUujyJw=
X-Google-Smtp-Source: AK7set98uSljXkwGv4gcJHfzaSs9nGg6CuCzW4AG3T1uyydr5LdYMpwWjScqnIhSs6GIDYdhNnnbsQ==
X-Received: by 2002:a17:906:a93:b0:8aa:c358:fc01 with SMTP id
 y19-20020a1709060a9300b008aac358fc01mr12406571ejf.67.1677792146777; 
 Thu, 02 Mar 2023 13:22:26 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-092-224-150-004.92.224.pool.telefonica.de. [92.224.150.4])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b008f89953b761sm145895eji.3.2023.03.02.13.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:22:26 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v8 16/23] hw/isa/piix4: Create the "intr" property during
 init() already
Date: Thu,  2 Mar 2023 22:21:54 +0100
Message-Id: <20230302212201.224360-17-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302212201.224360-1-shentey@gmail.com>
References: <20230302212201.224360-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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

Only PIIX4 provides this property while PIIX3 doesn't.

Unlike initialize() methods, init() methods allow for device-specific
quirks without having to call the parent method. So move the creation of
the property into PIIX4's init() method as a preparation of the code
merge and the subsequent cleanup of the realize methods.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index b74b7dc5d3..d70c74dcf9 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -176,9 +176,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    qdev_init_gpio_out_named(DEVICE(dev), &s->cpu_intr,
-                             "intr", 1);
-
     memory_region_init_io(&s->rcr_mem, OBJECT(dev), &piix4_rcr_ops, s,
                           "reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
@@ -239,6 +236,8 @@ static void piix4_init(Object *obj)
 {
     PIIXState *s = PIIX_PCI_DEVICE(obj);
 
+    qdev_init_gpio_out_named(DEVICE(obj), &s->cpu_intr, "intr", 1);
+
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
 }
-- 
2.39.2


