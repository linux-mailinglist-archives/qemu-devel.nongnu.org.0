Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FF96535AE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:57:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83L7-0005hh-0w; Wed, 21 Dec 2022 12:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p83L4-0005h2-QW; Wed, 21 Dec 2022 12:57:10 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p83L2-0003Uw-AX; Wed, 21 Dec 2022 12:57:10 -0500
Received: by mail-ej1-x636.google.com with SMTP id kw15so38581936ejc.10;
 Wed, 21 Dec 2022 09:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ye3VY8tpP28nCJkID+3wbmwgFphQ/DL5sC+uBPt3Hi0=;
 b=KaxzB5cTQsMmNUY93sw/pJkcdfInpqzNGOMmX+Sm/Ip2LCRJ0E2bKKEKYhMJ/V2+tE
 bS0Wbf6DGZ+xwzzno2sZI86TDPL28DcTFAfYj9WCgc5+MlFAtWDZsEBhfA4zACHBvRI6
 8r4HPHN2p/7EFtywgHxqUpfhFMsQYVLFe9mBzbRzRrEFO3nRCBomQ10z3o6fDfCV/TgU
 VwEnrO9EXx2mlFFg8f7pqJuFAUxql66hsOz4LAD2QsM7Hr4e0jO6NnLdurj18xVDVCNl
 ymlJAUEI5Vt5yoSaWYXti3BPcImqjSIQyPPZWe2Lj8XndcKrSdVCIIqWCMnnbR9KCT3J
 Fa5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ye3VY8tpP28nCJkID+3wbmwgFphQ/DL5sC+uBPt3Hi0=;
 b=tJnp5c8bEhJ1e/cX5CpVjf9jYOGfC94VDtX3Qjal87ECryqB64rQYcdN/EU6ch/Wjp
 wepU+68tG+cV9ctKT1wxb+pboxKyM/gs71oExyT1CEBikdCskePZCKOelG+dyYlEPCCO
 JPlxVhOt9/I6SRwg6W1kI4d9NgU/7tnNOFjJcbx1TB4GCLqTujPptZNMEh5MXVYcZ47I
 OhRbKaaCQ6gHFCZinXgpvSSYW89TV9V/+MAjC7XJAxyvrj3MNNfuTY21TrZqQ+ltwAc5
 WDmW7CAkTlm1B3eSB3ZjPif2lviTPKccHl5rIsmrMD9C3lAWifettW0BZ0bym5208R2+
 g9ow==
X-Gm-Message-State: AFqh2kp7p3lujNGBC6KWQN2Urh5Lz0vJpZS8DaR656B0Zyl1y6Akc3S4
 AToi0E72fu+z+EpTZ6tPuqjglODYSJQ=
X-Google-Smtp-Source: AMrXdXtxE+hYsLTfO/n+2voy420WdvX+603juZt+aa0mSfuDMi/0PIHTyGHgdmDkB06U5u4biqGsNw==
X-Received: by 2002:a17:907:6746:b0:840:758a:9155 with SMTP id
 qm6-20020a170907674600b00840758a9155mr1827002ejc.12.1671645426398; 
 Wed, 21 Dec 2022 09:57:06 -0800 (PST)
Received: from [127.0.0.1] (dynamic-092-224-051-061.92.224.pool.telefonica.de.
 [92.224.51.61]) by smtp.gmail.com with ESMTPSA id
 g4-20020a1709063b0400b007bdc2de90e6sm7283086ejf.42.2022.12.21.09.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 09:57:06 -0800 (PST)
Date: Wed, 21 Dec 2022 17:56:56 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2 0/7] Clean up dependencies of ACPI controllers
In-Reply-To: <20221216130355.41667-1-shentey@gmail.com>
References: <20221216130355.41667-1-shentey@gmail.com>
Message-ID: <1D3E3781-4A9C-41DE-BC98-06C44894A5D0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
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



Am 16=2E Dezember 2022 13:03:48 UTC schrieb Bernhard Beschow <shentey@gmai=
l=2Ecom>:
>This small series establishes consistency between ICH9, PIIX4 and VT82C68=
6 ACPI
>
>controllers to select ACPI, ACPI_SMBUS and APM since they are provided by=
 the
>
>device models=2E
>
>
>
>Due to the PIIX4 PM cleanup PEGASOS2's dependency can be reduced to just =
ACPI,
>
>eliminating 9 dependencies from the softmmu-ppc build=2E
>

Ping

Looks like all patches are reviewed, i=2Ee=2E ready to be queued=2E

Best regards,
Bernhard

>
>
>v2:
>
>- Turn "depends on ACPI" into "select ACPI" (Phil)
>
>- Remove "select ACPI" from PEGASOS2 (Phil)
>
>- Move already reviewed patches to bottom
>
>- Split some patches into "add missing dependencies" and "remove redundan=
t
>
>  dependencies" for ease of review
>
>
>
>Bernhard Beschow (7):
>
>  hw/acpi/Kconfig: Rename ACPI_X86_ICH to ACPI_ICH9
>
>  hw/acpi/Kconfig: Add missing dependencies to ACPI_ICH9
>
>  hw/acpi/Kconfig: Do not needlessly build TYPE_PIIX4_PM in non-PC/Malta
=
>
>    machines
>
>  hw/acpi/Kconfig: Add missing dependencies to ACPI_PIIX4
>
>  hw/isa/Kconfig: Add missing dependency to VT82C686
>
>  i386, mips: Resolve redundant ACPI and APM dependencies
>
>  hw/ppc/Kconfig: Remove unused dependencies from PEGASOS2
>
>
>
> configs/devices/mips-softmmu/common=2Emak | 3 ---
>
> hw/acpi/Kconfig                         | 9 ++++++---
>
> hw/acpi/meson=2Ebuild                     | 2 +-
>
> hw/i2c/meson=2Ebuild                      | 2 +-
>
> hw/i386/Kconfig                         | 3 +--
>
> hw/isa/Kconfig                          | 4 ++--
>
> hw/ppc/Kconfig                          | 2 --
>
> 7 files changed, 11 insertions(+), 14 deletions(-)
>
>
>
>-- >
>2=2E39=2E0
>
>
>

