Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8459868AADC
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 16:12:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOKC2-0002Qx-0W; Sat, 04 Feb 2023 10:11:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOKBz-0002PC-8A; Sat, 04 Feb 2023 10:11:03 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOKBx-0006aD-Os; Sat, 04 Feb 2023 10:11:03 -0500
Received: by mail-ej1-x62d.google.com with SMTP id me3so22884680ejb.7;
 Sat, 04 Feb 2023 07:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bgVF//6qdegoQOeHpGSSVSFmoQkzYIklU+oVnDZbsfw=;
 b=DbPCJnl7LGlojoy4S3QAjfoXQNFhrZmYsE0pHK7RadL9aQtlbyQ2jGlLs4ozkNgGWC
 C5v+Ded2SApVICBpewp/LMEZ8VRv43Ash5g7ewekIrrafA+QobAXpI3FNeTBxu5J5Fuq
 ILXVME/R4asfk/Eeg5jppm4UkqovKUrxxHbHbOHGXQGlIH8gtq35jgKT5SK/4MjPoIdj
 zinF9S4e4mxhevkF+ge6msyxOZhQW2vsrBMk6B1pS8UKN80U894ORIXvRdszgp8IZwmZ
 Z4Qg1w2rCAktgVY+yIvm7IKA3s6GnUEUH/w/nbbyhLS/ENvVQ31Y7uqsbe+12RMYFpz7
 9eBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bgVF//6qdegoQOeHpGSSVSFmoQkzYIklU+oVnDZbsfw=;
 b=RlGbRVfrQKn5Dc8+WRs2oFJRUexngVFeL8yO9yqWWtgQJUZAZIj7N7BMnTrCM99srF
 +m+akidphXjnxtvrcbkb2mPwSndqH1HlmmySPhK18fI4Yty25E18ilUr7MYwvzxY16x7
 gnDtNCyBZudexdI5WW+YUpzpf3xIc9JseaH0Jv6vzeAhLM7Xjp8JH9PZlaM7vDnw9KQV
 GhMztEbmzpZcbX98iSRqRcdiIrn4+HRi4M1I0nelssR8t+5rCom10/I0DwpYK/Vp76Fc
 PsEHbERUycc8B6Jp5rQRwIzxxY91IPEUmkfGYxtvhagPgeDXGVukEcCyShhOHn0mNL8M
 /L1A==
X-Gm-Message-State: AO0yUKX63pyxS5AYOCJNTQzy9NYTWJ5Y+M2TzGmzmqXmtk9fLL///ZrN
 gTCqxwTJ9bjt2xBjf4fIa40LSifZbss=
X-Google-Smtp-Source: AK7set+dLnKzz7/8zPKTbIF7noe4dDlPrp15r56rYz0SU1PFG1FM11ZihAJJfGr9lkl5b2aIANhZig==
X-Received: by 2002:a17:906:2b9b:b0:809:c1f4:ea09 with SMTP id
 m27-20020a1709062b9b00b00809c1f4ea09mr14772737ejg.69.1675523460446; 
 Sat, 04 Feb 2023 07:11:00 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-183-077-083.77.183.pool.telefonica.de. [77.183.77.83])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906211100b0088a2aebb146sm2937922ejt.52.2023.02.04.07.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 07:10:59 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 4/9] hw/i386/pc_{q35,
 piix}: Reuse MachineClass::desc as SMB product name
Date: Sat,  4 Feb 2023 16:10:22 +0100
Message-Id: <20230204151027.39007-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204151027.39007-1-shentey@gmail.com>
References: <20230204151027.39007-1-shentey@gmail.com>
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


