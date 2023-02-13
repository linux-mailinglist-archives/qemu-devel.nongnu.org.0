Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DD7694C8A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:23:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbZQ-0004dI-73; Mon, 13 Feb 2023 11:20:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbZN-0004ar-7g; Mon, 13 Feb 2023 11:20:45 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbZL-0007we-Mz; Mon, 13 Feb 2023 11:20:44 -0500
Received: by mail-ej1-x62f.google.com with SMTP id n10so6271648ejc.4;
 Mon, 13 Feb 2023 08:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bgVF//6qdegoQOeHpGSSVSFmoQkzYIklU+oVnDZbsfw=;
 b=ZPzLLYIbHGcpHQbp59ZlflFTF9R7fSVi3g6fSUXRJPIxfRzjCwbmnCGST6U/30/uxQ
 qPRoYhhO4ca8wvBey6mmKfKJHphYEnbDe50GOgMpdzuMW2p0+QdvvkSZAL82rtO5Ol91
 3m6aua+oUvHF+acwzsIjge/21MZa49XLXEO6XYJ/qr2Q0izIhPQ0ye3NRaIC1sXiqRJ0
 HLKob9mlO0hnxQH/AyGc5snyjDrnh4E1NKiwShdH29bu3fdA/NBXJrw0oxL4szbs2Yfe
 sUYxT989Q5dkA+pbvzhNmwgTQQBUAdH2YdErJAmnMyXDwlLiGPmM9hrlEsoxw0lq2OYK
 RRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bgVF//6qdegoQOeHpGSSVSFmoQkzYIklU+oVnDZbsfw=;
 b=zEImjUDC3ociEoxAJzwAYCftI7SttIqsKwV34zlI/m6198WY4R3s6clnhf1qk8+dZu
 qOO3Zf8KV6rXkI6UQ0iE0iiBm71LnIdoCTxi2h2fl6zEbFj4bhwVTTgMJSc29kKowHZa
 kp2qjL8tILKxHKjKS4h+0X+z6FYcPagsauV6pjVjLQhN15/WgP3zVi+L0wmspPIqs4Tc
 l3MAzi6WNp18wOsr8TP+TBCoc3/SJi1iZLHRhaRCRRQA4Z3l80VwmfrNeKvTLGmd5dVD
 V9ksCmj2vNAW+KHi95aaBvt5lBOBGtpXsrfD+u6u9Evr4H170NiZC1xmPB3Xr+R6bqXo
 b3yA==
X-Gm-Message-State: AO0yUKXwz82uG4kiF5fPRP/vte2opDF7P7dFzD+iBQEFao5wEZjR5Jyx
 t5UHsGruqHb5fJoAssoKsM8vTSbel4U=
X-Google-Smtp-Source: AK7set/dnANYWBb0VN3vBdDGqVBoRcpaCGJR28bqcaKs+MzGCToQ2jbW/P7M8mykg60QNxI/uEv42Q==
X-Received: by 2002:a17:907:a506:b0:8af:2a62:30c9 with SMTP id
 vr6-20020a170907a50600b008af2a6230c9mr20503851ejc.34.1676305241404; 
 Mon, 13 Feb 2023 08:20:41 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170906025400b008841aa86484sm6979952ejl.211.2023.02.13.08.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 08:20:40 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 4/9] hw/i386/pc_{q35,
 piix}: Reuse MachineClass::desc as SMB product name
Date: Mon, 13 Feb 2023 17:19:59 +0100
Message-Id: <20230213162004.2797-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213162004.2797-1-shentey@gmail.com>
References: <20230213162004.2797-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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

No need to repeat the descriptions.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/i386/pc_piix.c | 2 +-
 hw/i386/pc_q35.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index df64dd8dcc..ee9d9a4175 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -197,7 +197,7 @@ static void pc_init1(MachineState *machine,
     if (pcmc->smbios_defaults) {
         MachineClass *mc = MACHINE_GET_CLASS(machine);
         /* These values are guest ABI, do not change */
-        smbios_set_defaults("QEMU", "Standard PC (i440FX + PIIX, 1996)",
+        smbios_set_defaults("QEMU", mc->desc,
                             mc->name, pcmc->smbios_legacy_mode,
                             pcmc->smbios_uuid_encoded,
                             pcms->smbios_entry_point_type);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index dee2b38474..71b7a30bb9 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -199,7 +199,7 @@ static void pc_q35_init(MachineState *machine)
 
     if (pcmc->smbios_defaults) {
         /* These values are guest ABI, do not change */
-        smbios_set_defaults("QEMU", "Standard PC (Q35 + ICH9, 2009)",
+        smbios_set_defaults("QEMU", mc->desc,
                             mc->name, pcmc->smbios_legacy_mode,
                             pcmc->smbios_uuid_encoded,
                             pcms->smbios_entry_point_type);
-- 
2.39.1


