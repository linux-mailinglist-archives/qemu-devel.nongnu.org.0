Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD756EB9FD
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 17:27:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqF7T-0006LO-Gl; Sat, 22 Apr 2023 11:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqF7L-0006Ki-2z; Sat, 22 Apr 2023 11:25:39 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqF7I-00084D-PR; Sat, 22 Apr 2023 11:25:38 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-94f7a7a3351so480890866b.2; 
 Sat, 22 Apr 2023 08:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682177130; x=1684769130;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v0EDkZ6eEhXy6zPj2CdOQTrxDvR3wJExGoJTz4yH4fw=;
 b=n0sl7XBTeVfF+gFZoAvuKz77LnhEG0FWfH2GA4Cks2YpLf3YXaBq352VGliTG0sjlJ
 psYgtC9fBq6yqKOvfS/U43oSG3JCpLjo17kSkripx8vRLsoMMusMs8EIHYnp8RwuJYiz
 w6LrIjJZ/ao1jhOKdDZHhsB9WfsG4eqXlUCkY7Sd81T+7rX6JQpyDsUj5xkIBvZHeS3Q
 2Q84GmWB6zac/FigWPKtTBKHyFyA28gTIM77kIbwLwizOHcc63V1vwbEdDlHScJ7lak2
 W7jt5HWJ0nmPXhPn4MlrWKcp7702D3wyDe4K7pDY+bd3zPEq0sk4U8UUN7LpRIoHRuwk
 PyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682177130; x=1684769130;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v0EDkZ6eEhXy6zPj2CdOQTrxDvR3wJExGoJTz4yH4fw=;
 b=jchNR6+6sCwfEAxSfKn3eDRL6Yh0Kdo723SzPqgCLNFtxWLaYZxexpnJo9JkKjvV1X
 a2O4aB792dI2k4vuJOL9IOF/YIlaV2mTfM1GkTBP+e3E6NxypgRwrz+1vLzm+J56bL2r
 bFbhN8V1yoMSLglngIuaYmEz1BS3BpfFiv946WPY0pJnhUtEi4X3aK2brnNq8rgNKSEd
 JC0/wp4dl/6I6eF+rzEhhqt0tZ+Nk4ym06NvDXMqUk1YF2w1vNoiw5m1/e+TNvTRSjpE
 tedzZUEl8JVEW6m+2RUjsoBPSumTZ43XJrNp/1iio0xgsjSR3grQmPJBk4eWb8bcYzgP
 XOkA==
X-Gm-Message-State: AAQBX9cYOMKGyQLzLSTH04QSzTcmu2SrlFUx5x0nlB1qj2NZ5OlFxZ6P
 lXo55ZOhUmSlBsbtf8alEtY=
X-Google-Smtp-Source: AKy350ZT2qJ5eWH5RDl/mIXKvH81s2Bhqm1zZO1S40D+XRbCOB/DSKjRw4RGCT70qi6wQBUVoDC5vQ==
X-Received: by 2002:a17:906:f24c:b0:933:1134:be1e with SMTP id
 gy12-20020a170906f24c00b009331134be1emr5106000ejb.53.1682177129896; 
 Sat, 22 Apr 2023 08:25:29 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-191-017-015.77.191.pool.telefonica.de.
 [77.191.17.15]) by smtp.gmail.com with ESMTPSA id
 v26-20020a170906b01a00b009538cee14dasm3386529ejy.93.2023.04.22.08.25.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Apr 2023 08:25:29 -0700 (PDT)
Date: Sat, 22 Apr 2023 15:25:25 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_00/18=5D_hw/ide=3A_Untangl?=
 =?US-ASCII?Q?e_ISA/PCI_abuses_of_ide=5Finit=5Fioport=28=29?=
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
References: <20230302224058.43315-1-philmd@linaro.org>
Message-ID: <DE353DFF-DE24-444F-A1A9-FBBC82AAA921@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 2=2E M=C3=A4rz 2023 22:40:40 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>Since v2: rebased
>
>I'm posting this series as it to not block Bernhard's PIIX
>cleanup work=2E I don't have code change planned, but eventually
>reword / improve commit descriptions=2E
>
>Tested commit after commit to be sure it is bisectable=2E Sadly
>this was before Zoltan & Thomas report a problem with commit
>bb98e0f59c ("hw/isa/vt82c686: Remove intermediate IRQ forwarder")=2E
>
>Background thread:
>https://lore=2Ekernel=2Eorg/qemu-devel/5095dffc-309b-6c72-d255-8cdaa6fd3d=
52@ilande=2Eco=2Euk/

Hi,

I've just sent yet another proposal which might make some renamings done i=
n this series appear unneccessary=2E

Best regards,
Bernhard

>
>Philippe Mathieu-Daud=C3=A9 (18):
>  hw/ide/piix: Expose output IRQ as properties for late object
>    population
>  hw/ide/piix: Allow using PIIX3-IDE as standalone PCI function
>  hw/i386/pc_piix: Wire PIIX3 IDE ouput IRQs to ISA bus IRQs 14/15
>  hw/isa/piix4: Wire PIIX4 IDE ouput IRQs to ISA bus IRQs 14/15
>  hw/ide: Rename ISA specific ide_init_ioport -> ide_bus_init_ioport_isa
>  hw/ide/piix: Ensure IDE output IRQs are wired at realization
>  hw/isa: Deprecate isa_get_irq() in favor of isa_bus_get_irq()
>  hw/ide: Introduce generic ide_init_ioport()
>  hw/ide/piix: Use generic ide_bus_init_ioport()
>  hw/isa: Ensure isa_register_portio_list() do not get NULL ISA device
>  hw/isa: Simplify isa_address_space[_io]()
>  hw/isa: Reduce 'isabus' singleton scope to isa_bus_new()
>  exec/ioport: Factor portio_list_register_flush_coalesced() out
>  exec/ioport: Factor portio_list_register() out
>  hw/southbridge/piix: Use OBJECT_DECLARE_SIMPLE_TYPE() macro
>  hw/isa/piix: Batch register QOM types using DEFINE_TYPES() macro
>  hw/isa/piix: Unify QOM type name of PIIX ISA function
>  hw/isa/piix: Unify PIIX-ISA QOM type names using qdev aliases
>
> hw/audio/adlib=2Ec              |  4 +--
> hw/display/qxl=2Ec              |  7 ++--
> hw/display/vga=2Ec              |  9 +++--
> hw/dma/i82374=2Ec               |  7 ++--
> hw/i386/pc_piix=2Ec             | 13 +++++---
> hw/ide/ioport=2Ec               | 15 +++++++--
> hw/ide/isa=2Ec                  |  2 +-
> hw/ide/piix=2Ec                 | 54 +++++++++++++++++++++++-------
> hw/isa/isa-bus=2Ec              | 36 ++++++++------------
> hw/isa/piix3=2Ec                | 63 +++++++++++++++--------------------
> hw/isa/piix4=2Ec                | 12 ++++---
> hw/mips/malta=2Ec               |  2 +-
> hw/watchdog/wdt_ib700=2Ec       |  4 +--
> include/exec/ioport=2Eh         | 15 +++++----
> include/hw/ide/internal=2Eh     |  3 +-
> include/hw/ide/isa=2Eh          |  3 ++
> include/hw/ide/piix=2Eh         |  4 +++
> include/hw/isa/isa=2Eh          |  3 +-
> include/hw/southbridge/piix=2Eh | 14 ++++----
> softmmu/ioport=2Ec              | 48 +++++++++++++++++++-------
> softmmu/qdev-monitor=2Ec        |  3 ++
> 21 files changed, 190 insertions(+), 131 deletions(-)
>

