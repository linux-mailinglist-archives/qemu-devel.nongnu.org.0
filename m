Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559A665F6D9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:33:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYg2-0002J3-7n; Thu, 05 Jan 2023 17:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pDYfz-0002IS-OK
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:25:31 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pDYfx-0000G4-U1
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:25:31 -0500
Received: by mail-ej1-x632.google.com with SMTP id kw15so93136522ejc.10
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 14:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hLigSBACaacPTvABu+4eu6F4UKBZHjFI/Ykf6ZXYGe4=;
 b=lfFq+0Dc/aBwVThiUtcIu/XleJ8C9AeYbj9aEKZsc+pX3Wj4exoXOWvIGP7cQOqIdl
 FBrJraBBoD8akzlNBIu2yuzOIDsgDJu6J9isjiLhS7vDfKteKvk39MV5aHFi/iJAvFw8
 BW3hRwF2wgdvPbDQxqxHOtqm3cb91+bf3utVtiIFtN0aguf8wNwVjYfhfoY14HzibD5N
 uGVbJZTvn6ATAN9vDczI9uIT7JsfSQsVjNZoVKaUhFwA7harcStp/iUAF5M27li4yeu8
 aOL8nxdUExhohGG+woTxiJ48u2hbDkojI3ECra9kA1KnXmuKeIxZdeVXGdOm9kjHIwJt
 D+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hLigSBACaacPTvABu+4eu6F4UKBZHjFI/Ykf6ZXYGe4=;
 b=UF02IJW5GJ2AucqW64EWREhDwTgfT6pfEMxANuXXftLu9ZBbeIHRObsvpGQmTL0yBH
 Z47f57n9yzFvndxdPNBAJLH3O17oG/bJZv30ls9XjUWf0nChBEhA59AzdJ9xIwjKmzzG
 CG4v3TcqbnsG9Ny6HLNw9qNAezDbKkaj835zYw10c9Di6BWYJ9UsPMTJd1ItCqtkqzxV
 5X7tE0WbO1XdRU6rjfzTuFB8oYCrCGOPtBzXHjWjQ7IWgsc/LW6F24x3fJmgPYPkDilN
 4aa3paNAl2a2vwDYJmQ39j75Qoin3NnOvjclOeTqovr/Dzu7h0qpR9ez3US5xcarWZTa
 xDLQ==
X-Gm-Message-State: AFqh2koMctpe2/sSY9JkA+TULWs+HRbj3dLz7/PUjlRx78Hv06Rn4gRg
 Oivb+5UCW2lkBHDleuWOQPw=
X-Google-Smtp-Source: AMrXdXv/VmyzauGbJ3xfOfEDOrBBhH+QxskXrhv6qwhkoF515wLdJZzteu7kuudZlkWTdSZmz7GVGA==
X-Received: by 2002:a17:907:b026:b0:7c0:e7a8:bc41 with SMTP id
 fu38-20020a170907b02600b007c0e7a8bc41mr41132683ejc.74.1672957528334; 
 Thu, 05 Jan 2023 14:25:28 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb20075742c50f98f829f.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:7574:2c50:f98f:829f])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170906341300b007a8de84ce36sm16825285ejb.206.2023.01.05.14.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 14:25:27 -0800 (PST)
Date: Thu, 05 Jan 2023 22:25:22 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_hw/dma/rc4030=3A_Move_RC4030_d?=
 =?US-ASCII?Q?eclarations_to_its_own_=27rc4030=2Eh=27_header?=
In-Reply-To: <20230105131038.49549-1-philmd@linaro.org>
References: <20230105131038.49549-1-philmd@linaro.org>
Message-ID: <44D48137-128F-45C5-85F2-DFBE6CF65A1B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
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



Am 5=2E Januar 2023 13:10:38 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <ph=
ilmd@linaro=2Eorg>:
>RC4030 declarations are not MIPS specific, no need to
>have them in all MIPS boards=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
>Based-on: <20230105130710=2E49264-1-philmd@linaro=2Eorg>
>          "hw/pci-host/bonito: Housekeeping"
>---
> hw/dma/rc4030=2Ec         |  2 +-
> hw/mips/jazz=2Ec          |  1 +
> include/hw/dma/rc4030=2Eh | 21 +++++++++++++++++++++
> include/hw/mips/mips=2Eh  |  9 ---------
> 4 files changed, 23 insertions(+), 10 deletions(-)
> create mode 100644 include/hw/dma/rc4030=2Eh
>
>diff --git a/hw/dma/rc4030=2Ec b/hw/dma/rc4030=2Ec
>index aa1d323a36=2E=2E6dbf6652ab 100644
>--- a/hw/dma/rc4030=2Ec
>+++ b/hw/dma/rc4030=2Ec
>@@ -25,7 +25,7 @@
> #include "qemu/osdep=2Eh"
> #include "qemu/units=2Eh"
> #include "hw/irq=2Eh"
>-#include "hw/mips/mips=2Eh"
>+#include "hw/dma/rc4030=2Eh"
> #include "hw/sysbus=2Eh"
> #include "migration/vmstate=2Eh"
> #include "qapi/error=2Eh"
>diff --git a/hw/mips/jazz=2Ec b/hw/mips/jazz=2Ec
>index 6aefe9a61b=2E=2E03882b5275 100644
>--- a/hw/mips/jazz=2Ec
>+++ b/hw/mips/jazz=2Ec
>@@ -29,6 +29,7 @@
> #include "hw/mips/cpudevs=2Eh"
> #include "hw/intc/i8259=2Eh"
> #include "hw/dma/i8257=2Eh"
>+#include "hw/dma/rc4030=2Eh"
> #include "hw/char/serial=2Eh"
> #include "hw/char/parallel=2Eh"
> #include "hw/isa/isa=2Eh"
>diff --git a/include/hw/dma/rc4030=2Eh b/include/hw/dma/rc4030=2Eh
>new file mode 100644
>index 0000000000=2E=2Ee58f94576e
>--- /dev/null
>+++ b/include/hw/dma/rc4030=2Eh
>@@ -0,0 +1,21 @@
>+/*
>+ * QEMU JAZZ RC4030 chipset
>+ *
>+ * Copyright (c) 2007-2013 Herv=C3=A9 Poussineau
>+ *
>+ * SPDX-License-Identifier: MIT
>+ */
>+
>+#ifndef HW_DMA_RC4030_H
>+#define HW_DMA_RC4030_H
>+
>+#include "exec/memory=2Eh"
>+
>+/* rc4030=2Ec */
>+typedef struct rc4030DMAState *rc4030_dma;
>+void rc4030_dma_read(void *dma, uint8_t *buf, int len);
>+void rc4030_dma_write(void *dma, uint8_t *buf, int len);
>+
>+DeviceState *rc4030_init(rc4030_dma **dmas, IOMMUMemoryRegion **dma_mr);
>+
>+#endif
>diff --git a/include/hw/mips/mips=2Eh b/include/hw/mips/mips=2Eh
>index 4d2db99952=2E=2E34dd583500 100644
>--- a/include/hw/mips/mips=2Eh
>+++ b/include/hw/mips/mips=2Eh
>@@ -7,13 +7,4 @@
> /* Kernels can be configured with 64KB pages */
> #define INITRD_PAGE_SIZE (64 * KiB)
>=20
>-#include "exec/memory=2Eh"
>-
>-/* rc4030=2Ec */
>-typedef struct rc4030DMAState *rc4030_dma;
>-void rc4030_dma_read(void *dma, uint8_t *buf, int len);
>-void rc4030_dma_write(void *dma, uint8_t *buf, int len);
>-
>-DeviceState *rc4030_init(rc4030_dma **dmas, IOMMUMemoryRegion **dma_mr);
>-
> #endif

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

