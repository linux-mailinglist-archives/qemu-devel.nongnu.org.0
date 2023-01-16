Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E710F66BE7E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 14:01:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHP5W-0005Ns-Re; Mon, 16 Jan 2023 07:59:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHP5H-0005Ji-El; Mon, 16 Jan 2023 07:59:31 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHP5F-000177-QE; Mon, 16 Jan 2023 07:59:31 -0500
Received: by mail-ed1-x536.google.com with SMTP id v30so40612050edb.9;
 Mon, 16 Jan 2023 04:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FIPjagYbHti5a3V5WvuYNbsfsB1fpcKo6VchvNPRZ9g=;
 b=F7ZPnD4XT5mWnoeM2E3NdFooCIT+5e+U5H2dyjTW7th/CyZsTccUkJs7c3u/mn7FmZ
 WFic/GIT8wPVvLnI//8oGq4swpALSAjxtz/lOESnp/KsZK4dAHMpG3I/oAjeXM71nJNk
 xMWvE+T8lB2RtUFauLwJYoGEsmo2RfeiOOhP4B3N8W1yS6xikK7rIJAYAPysQYTZ1eqh
 OLOuHoX7K9blmvh3c59VTHDao37GVubNRFyQE/sQ/vgFBuJnzuCc3Meotza2EJjbb/wV
 vloJ+7TEmR6HAddO1Ze56ybwldcLs40IUx4jyAQnp13Ue+uQbi+A12GgpIZTP6YY0276
 26Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FIPjagYbHti5a3V5WvuYNbsfsB1fpcKo6VchvNPRZ9g=;
 b=jtuaFyop040JrypSpyc+SY1iLrgKWBCy1nmmvEYzCpEAuFE0Yso2Nv4s1+szbaluuC
 jx/49OV/za0mmcIt9k7An2IJ4/zPEnyycvDuSboYR8eSBKugvkvZPq/iE7egVoRhYWSu
 aTKuWz/Hy1Lto3WOig/PPEZL+jGq90JpZ1O4Vm7DE1+8xjlcA2cYFXXJdbNp7RU72duV
 o0MutRNeJpZS/saqcFexUW2HnDBQgekHGvXrI/mHA15E8JGbjjC4X5j3H1Mr86y0co8f
 pVrGvdKfAirWN/GpDwYNfrh6QiTezbX9gkLKWNOugFoJXmXpM4RthlIYKtM3nrzD/kbh
 0TuQ==
X-Gm-Message-State: AFqh2krJdXkL0kS48SOIG4mIXPv3JVZHjqnpFpw2lJgBaCiI6aX7ZPW+
 w5WzC/NO6cUxG4wTyPL0AWDE3OfjTt0=
X-Google-Smtp-Source: AMrXdXv/OpveEDg7glaD//1HABJ+nKEsos6Xd5m2FP1qD2MkND7/EVZSTh6BzCsXGnThAgu6EAt57w==
X-Received: by 2002:a05:6402:381b:b0:497:233d:3ef4 with SMTP id
 es27-20020a056402381b00b00497233d3ef4mr42279349edb.22.1673873967653; 
 Mon, 16 Jan 2023 04:59:27 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-191-143-217.77.191.pool.telefonica.de. [77.191.143.217])
 by smtp.gmail.com with ESMTPSA id
 um41-20020a170907cb2900b0086c4fbb8507sm3201517ejc.225.2023.01.16.04.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 04:59:27 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 5/8] hw/i386/acpi-build: Remove unused attributes
Date: Mon, 16 Jan 2023 13:58:39 +0100
Message-Id: <20230116125842.66817-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116125842.66817-1-shentey@gmail.com>
References: <20230116125842.66817-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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

Ammends commit 3db119da7915 'pc: acpi: switch to AML API composed DSDT'.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/acpi-build.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 0be3960a37..428328dc2d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -117,8 +117,6 @@ typedef struct AcpiMiscInfo {
 #ifdef CONFIG_TPM
     TPMVersion tpm_version;
 #endif
-    const unsigned char *dsdt_code;
-    unsigned dsdt_size;
 } AcpiMiscInfo;
 
 typedef struct FwCfgTPMConfig {
-- 
2.39.0


