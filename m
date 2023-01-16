Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312A066C3E6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:31:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHRQk-0001It-Rr; Mon, 16 Jan 2023 10:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHRQj-0001IF-5K; Mon, 16 Jan 2023 10:29:49 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHRQh-00087d-Mc; Mon, 16 Jan 2023 10:29:48 -0500
Received: by mail-ej1-x62b.google.com with SMTP id vm8so68897876ejc.2;
 Mon, 16 Jan 2023 07:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FIPjagYbHti5a3V5WvuYNbsfsB1fpcKo6VchvNPRZ9g=;
 b=oALwzM/rlliqPOy8fY0/GlsOhh9VHFdvI//D/exPl8NZY294gjhWdsAmdD/gjgoygV
 xCpprNnQZLnRqJ0PcvSyrO+fzxgQJpwoqhSQ+qyh8fwO7/OfoT4wCUlCD+u68GDu8i5T
 K/897mogDwSdcQY+KSpSEyKvhE0l0bon6rJ1BnKlkXG1tHRwoYMd0A7ZynP02YHNNY+z
 vFMmLOnt/LdKVlPgLOhvY40D8X2CwX3y66TSpRxFs3Q5AZInJF1Rx65irxmK48JMk7Kw
 IiWrTbXuiZHNTf6yYIrIgwHF7INT5kW0NEXdn3MXpFpY8QxD+VhNhE7dFK/3rQD8VB6Y
 pfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FIPjagYbHti5a3V5WvuYNbsfsB1fpcKo6VchvNPRZ9g=;
 b=RqqRakW22D6VLVZUlARcdUvmTh9CgfLI7VuFmWvn3tGIPfFav48bAy7JSkk1W8RG0d
 kUSwHQadMZR7uZHc9YYy6Jp10kozSVS6YiSz//Ji4LtMgxxp57AJ7vMyQlQhxbHG5oIF
 CBUBz4KjJhgRsXwwdfBtseaX8pPYMToH0UL+5qZfS4v8yzWbQEpjAKY+V0ma0yqeMN8J
 dZlkKIE+Dyq4+IUFXFFBoxMh9AQu4/WUycRWnfSIiacSPVFH5ngCQ6CW4AfBjuu1Ni63
 giZum3DkaY1eITzO77KpnOk16yof0azoaDvgGnGRYJAQVV194DnRGHG+mtdecE3Zhgi5
 SyXg==
X-Gm-Message-State: AFqh2ko5Aux3jBcleJqj5Cu4Mh1xphmaE/SiPlYnyUNC2DrZmV8oQOrM
 gRY0OEk8GTtAi3YFuyG7y7EpqB+92Cg=
X-Google-Smtp-Source: AMrXdXvc67m4Lu7c227a7ijWxNryEu2SFp7scGnRqPSBfSJB5aeIA2GubGfw6gf/Wc8DsZRd5J2uAw==
X-Received: by 2002:a17:907:7844:b0:7c0:eba2:f9dd with SMTP id
 lb4-20020a170907784400b007c0eba2f9ddmr75656304ejc.53.1673882985831; 
 Mon, 16 Jan 2023 07:29:45 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-191-143-217.77.191.pool.telefonica.de. [77.191.143.217])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170906b08300b007c0688a68cbsm12180764ejy.176.2023.01.16.07.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 07:29:45 -0800 (PST)
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
Subject: [PATCH v3 5/7] hw/i386/acpi-build: Remove unused attributes
Date: Mon, 16 Jan 2023 16:29:06 +0100
Message-Id: <20230116152908.147275-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116152908.147275-1-shentey@gmail.com>
References: <20230116152908.147275-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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


