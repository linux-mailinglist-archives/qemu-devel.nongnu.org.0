Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B4F60E23C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 15:36:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ongVw-00061I-H5; Wed, 26 Oct 2022 09:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ongVr-0005wS-EJ; Wed, 26 Oct 2022 09:32:07 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ongVp-0007kg-QM; Wed, 26 Oct 2022 09:32:07 -0400
Received: by mail-ej1-x629.google.com with SMTP id n12so15883447eja.11;
 Wed, 26 Oct 2022 06:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XESKMVuDJz1jSX+WNV/9oFJ+H18ldQPYmRy83zJGAK8=;
 b=B4Gh2BRkaws7d2XQCmo/Mwfm+WlFiB81c2DX7iLGVa9eUIH4NzI87sVoWEExi/WMDy
 Uh3coFmBGU340I79lldUVx+/wn1IokvJrhA5kMe4gvVG91Z9MYWnqgtaRhwxR/taRI30
 /FedRS4mYnritGTdNeVv+qdugowqA19weVlSS7TvRj2qzh7HIhAjTmJ8xK1RUKjXz38K
 8QGpdUPnGBK5mQNjJaG0JjDTC+1sAe7hM3ezR+9E9x8Xmt9oMr9uZItjKrjw/cCx0tdb
 w6tOK99T4A/yTMd/7AZ16mre52J+yObSEbV2j7vm1O/oVLGKFxDKWM0cBWDItn6v2kYA
 epYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XESKMVuDJz1jSX+WNV/9oFJ+H18ldQPYmRy83zJGAK8=;
 b=X1LH2igdDvCerF6/ZdoGyGqRyKooFwWqQk4LaH6JSWWIG4JF48yrUk/XP2zEilL/or
 TPvTFH2nZdUIa6qATUbp9GUbXGdeng60nz9km+Z2dUKFB3quIL5bGBj1n50nENguEuVt
 RTmPQmlsd6Bcs87nT2pZvyqAAv/UYLn+0fMM459LmxfEQqet80th5fXYYPgqPShp3XgB
 n3luo/IIeWyUrou/BCRDqIX3NK9PCrUK/bQubCMoJ5zX7ccD7pNQD2Qf6rTj29tzAF+k
 dUmZ9Li8950qYm4KZwHF5wmfSizcOZrUyInz50u3gCsYDLmZFTuwXerJe95zftfhXY+P
 lDEA==
X-Gm-Message-State: ACrzQf3eAChwnfLllrldP+ygSPa+nGADaK8ABrf1u931sDRjzSYU0ua3
 s666sF82JYpkGyfTY/P7eo0BG/SDYGo=
X-Google-Smtp-Source: AMsMyM5JjYPZPlVGLT+9YPVxSrIcNhKGGofjgRx9c+69yB/68RAR6BG9MfLF1sXgQZuzeqqVWwkO+w==
X-Received: by 2002:a17:907:75c6:b0:79c:d3f4:4a14 with SMTP id
 jl6-20020a17090775c600b0079cd3f44a14mr24181628ejc.61.1666791117846; 
 Wed, 26 Oct 2022 06:31:57 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170906328d00b00730b3bdd8d7sm3032524ejw.179.2022.10.26.06.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 06:31:57 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 3/4] hw/i386/acpi-build: Resolve PIIX ISA bridge rather than
 ACPI controller
Date: Wed, 26 Oct 2022 15:31:09 +0200
Message-Id: <20221026133110.91828-4-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221026133110.91828-1-shentey@gmail.com>
References: <20221026133110.91828-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Resolving the PIIX ISA bridge rather than the PIIX ACPI controller mirrors
the ICH9 code one line below.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f3131fee60..f0a20c8b21 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1437,7 +1437,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
            AcpiPmInfo *pm, AcpiMiscInfo *misc,
            Range *pci_hole, Range *pci_hole64, MachineState *machine)
 {
-    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
+    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX3_PCI_DEVICE);
     Object *ich9 = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
     CrsRangeEntry *entry;
     Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
-- 
2.38.1


