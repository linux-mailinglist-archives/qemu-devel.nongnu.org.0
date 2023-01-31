Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B37682C00
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:56:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpDA-0006aK-Vf; Tue, 31 Jan 2023 06:54:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpD6-0006HV-SN; Tue, 31 Jan 2023 06:54:00 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpD5-0002Ld-AR; Tue, 31 Jan 2023 06:54:00 -0500
Received: by mail-ed1-x533.google.com with SMTP id m8so4910819edd.10;
 Tue, 31 Jan 2023 03:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HjssvFKx3IZ7l0mShz5AWOIUaxXusJrli4FZYIRJEUs=;
 b=EkjItNl5IOzfYAIOPVp8tpE7kjkQ33LSTO/HG1D3aL0q0x701NnMDo0dbISRAbbPCX
 5kKM/4pMy3Jte0Tu5zaFq1QAiwnsXjkd0PQOS6BQOFan3VJYXSbMUiwO+QYbGccXtfvZ
 3uIfVUw4wVzrUgQMqioRDrdZf66IUjfmnIU34Jjp23Iw0Bjx6J/JlsM3bJYGh3CFULpe
 pGg0goHBUppva9TcKglePfzeIsid1d01+jdB1zCXa0k0ZC1YMKR76zyrp0yEG/2TnKcs
 Lf73nJ8c36lvcWbPbRf1GtOLEuqpSs+SiaRzoNjGE1/2RaJ4n4muiU0nIkPOMcOYQEWc
 DAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HjssvFKx3IZ7l0mShz5AWOIUaxXusJrli4FZYIRJEUs=;
 b=KYFjdavw+4G7qGho0lAWBXHmNfHSt7Owpvbuft7exAP0yPDJrnQgcfGJzI78HPOu3/
 58NFVrnrMt6E9iohGJ6JVB29k8VVhRxABru23sfSZHptWu+B0XvWYEbwk+bFO+A/t9lL
 eAa+1UFObgoNAT06gHKX0dxBfp/WXkK+kw47KtnYe32iff6azGSDkp5kFgOv0CxtM1cm
 NX1Lhomskl4MzWHMCNPdjvOKRLQjlhzxnp1R+4LlCkj814TgWKRDxGd68dECKbZXHVsT
 J3rN/e0mNwSHZBXahMB298v4iuR9kOfwx7Jkk+ZVYZmPHXUa9bnWktrIUVZ2jRXwPz1P
 8E5A==
X-Gm-Message-State: AO0yUKVQZ0yra7+M1QUoxkTSjQl3v7JJRAYPuBywaT4TQEDM1dtS8F8i
 hFmKik9lEPPewhNBVi0feXoKlS2PVh0=
X-Google-Smtp-Source: AK7set+9G9dVpeOnLUU+a6PsXNYG6tcGXRow4RP5Am2bgNN1Hg2bSnAZN2xge0ESrSdC8HY0boLsaA==
X-Received: by 2002:aa7:de1a:0:b0:474:a583:2e1a with SMTP id
 h26-20020aa7de1a000000b00474a5832e1amr3137843edv.12.1675166038038; 
 Tue, 31 Jan 2023 03:53:58 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-082-236.77.13.pool.telefonica.de. [77.13.82.236])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056402100a00b00483dd234ac6sm8178318edu.96.2023.01.31.03.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:53:57 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 08/20] hw/i386/ich9: Rename Q35_MASK to ICH9_MASK
Date: Tue, 31 Jan 2023 12:53:14 +0100
Message-Id: <20230131115326.12454-9-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131115326.12454-1-shentey@gmail.com>
References: <20230131115326.12454-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
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

The Q35_MASK macro is already defined by TYPE_Q35_HOST_DEVICE, so let
TYPE_ICH9_LPC_DEVICE have its own one to prevent potential name clash.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/i386/ich9.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 222781e8b9..36e0ccd16a 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -75,7 +75,7 @@ struct ICH9LPCState {
     qemu_irq gsi[GSI_NUM_PINS];
 };
 
-#define Q35_MASK(bit, ms_bit, ls_bit) \
+#define ICH9_MASK(bit, ms_bit, ls_bit) \
 ((uint##bit##_t)(((1ULL << ((ms_bit) + 1)) - 1) & ~((1ULL << ls_bit) - 1)))
 
 /* ICH9: Chipset Configuration Registers */
@@ -137,13 +137,13 @@ struct ICH9LPCState {
 #define ICH9_LPC_NB_PIRQS                       8       /* PCI A-H */
 
 #define ICH9_LPC_PMBASE                         0x40
-#define ICH9_LPC_PMBASE_BASE_ADDRESS_MASK       Q35_MASK(32, 15, 7)
+#define ICH9_LPC_PMBASE_BASE_ADDRESS_MASK       ICH9_MASK(32, 15, 7)
 #define ICH9_LPC_PMBASE_RTE                     0x1
 #define ICH9_LPC_PMBASE_DEFAULT                 0x1
 
 #define ICH9_LPC_ACPI_CTRL                      0x44
 #define ICH9_LPC_ACPI_CTRL_ACPI_EN              0x80
-#define ICH9_LPC_ACPI_CTRL_SCI_IRQ_SEL_MASK     Q35_MASK(8, 2, 0)
+#define ICH9_LPC_ACPI_CTRL_SCI_IRQ_SEL_MASK     ICH9_MASK(8, 2, 0)
 #define ICH9_LPC_ACPI_CTRL_9                    0x0
 #define ICH9_LPC_ACPI_CTRL_10                   0x1
 #define ICH9_LPC_ACPI_CTRL_11                   0x2
@@ -162,7 +162,7 @@ struct ICH9LPCState {
 #define ICH9_LPC_PIRQH_ROUT                     0x6b
 
 #define ICH9_LPC_PIRQ_ROUT_IRQEN                0x80
-#define ICH9_LPC_PIRQ_ROUT_MASK                 Q35_MASK(8, 3, 0)
+#define ICH9_LPC_PIRQ_ROUT_MASK                 ICH9_MASK(8, 3, 0)
 #define ICH9_LPC_PIRQ_ROUT_DEFAULT              0x80
 
 #define ICH9_LPC_GEN_PMCON_1                    0xa0
@@ -172,7 +172,7 @@ struct ICH9LPCState {
 #define ICH9_LPC_GEN_PMCON_LOCK                 0xa6
 
 #define ICH9_LPC_RCBA                           0xf0
-#define ICH9_LPC_RCBA_BA_MASK                   Q35_MASK(32, 31, 14)
+#define ICH9_LPC_RCBA_BA_MASK                   ICH9_MASK(32, 31, 14)
 #define ICH9_LPC_RCBA_EN                        0x1
 #define ICH9_LPC_RCBA_DEFAULT                   0x0
 
-- 
2.39.1


