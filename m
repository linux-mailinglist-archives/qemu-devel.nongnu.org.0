Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6402C64EBD4
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:06:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6AOm-0004i6-Ve; Fri, 16 Dec 2022 08:05:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6AOD-0004eH-NZ; Fri, 16 Dec 2022 08:04:39 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6AOB-00086C-Dd; Fri, 16 Dec 2022 08:04:36 -0500
Received: by mail-ej1-x62c.google.com with SMTP id t17so6052649eju.1;
 Fri, 16 Dec 2022 05:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/TjaWjjANfQWJidGcfmFZt9UT72nwXpGbW7BTpKuEfU=;
 b=e1Ts2Yg0KmCchmpt2P6bnLuKbnmzKAhEcrVakDFU9QhoFcorGgRXqUEE6a6Apij/lp
 qVe/fbdh/35cXoPqmrDfTvXdByMEcQmfRVM+mdikiKgvL1NtxKcwfjlBt/eSPMs7ksGa
 MResfDMZrURhXqqubZ+9xZvosgLa/j7n1NkPdYLZODty1u7Xpwc5nVpNK6qkZzeJtOfp
 5ldBYRtPyYYors/0FS5wxZQXffM58RulPKPHvpb9yPSAVc6wNH5YUjjDNv+AcCgjEllU
 WAIab6ET2cUGRMW6KpeKOnnqleoqR+xjzuQGvU9/DY2u/WCc4RshGpFvuMp6ByoDvXGr
 65jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/TjaWjjANfQWJidGcfmFZt9UT72nwXpGbW7BTpKuEfU=;
 b=kttf9VxHA0fylzSb4yKaec5Z4rdgm8hn9/6DKYMX7ZAri12XErTP5qxcp/3eTpqtT7
 lLfyniEd43b1TCuFDN16LhauzPLER5OvystfGOwSRny+54ziCxmR2bTceYITKMMspnZw
 rDy4tbMbpD+s7PHUOg+O04NJ4SmXnRY4We/gnRu3ZLuZw7QT1CaJxlERfi4Kp9FSxaiQ
 k6jPQgCW2OsxoAnb2a3aJ97+pbi8JPmKazZp/TvHIsK6RGPDFe09lKsum7xy/RNierQr
 5GgVkQEXJ26sQ/XajUU7KfcVebquSgKAHANOOfZTrepc+96KIe5N0v2LUKAU4JLBCrxv
 4t1w==
X-Gm-Message-State: ANoB5pme2WG1+HZzVkXMa9E+1RUfzffm+EJxvVnVSyTZpFBcvDhGPlwm
 svopRxUxXIXk0fbFRbvdad3V/+mMrIk=
X-Google-Smtp-Source: AA0mqf5okRYARDXUddJh0gpgJeZh0hGW1rgC7YTARvXQ4hef9IiOppgECxsNFBgnMTmrkhPYu00NOQ==
X-Received: by 2002:a17:906:264e:b0:7c1:d50:6dd3 with SMTP id
 i14-20020a170906264e00b007c10d506dd3mr25982211ejc.36.1671195871330; 
 Fri, 16 Dec 2022 05:04:31 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-138-012.78.55.pool.telefonica.de. [78.55.138.12])
 by smtp.gmail.com with ESMTPSA id
 g11-20020aa7c58b000000b0046b1d63cfc1sm828444edq.88.2022.12.16.05.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 05:04:30 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 0/7] Clean up dependencies of ACPI controllers
Date: Fri, 16 Dec 2022 14:03:48 +0100
Message-Id: <20221216130355.41667-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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

This small series establishes consistency between ICH9, PIIX4 and VT82C686 =
ACPI=0D
controllers to select ACPI, ACPI_SMBUS and APM since they are provided by t=
he=0D
device models.=0D
=0D
Due to the PIIX4 PM cleanup PEGASOS2's dependency can be reduced to just AC=
PI,=0D
eliminating 9 dependencies from the softmmu-ppc build.=0D
=0D
v2:=0D
- Turn "depends on ACPI" into "select ACPI" (Phil)=0D
- Remove "select ACPI" from PEGASOS2 (Phil)=0D
- Move already reviewed patches to bottom=0D
- Split some patches into "add missing dependencies" and "remove redundant=
=0D
  dependencies" for ease of review=0D
=0D
Bernhard Beschow (7):=0D
  hw/acpi/Kconfig: Rename ACPI_X86_ICH to ACPI_ICH9=0D
  hw/acpi/Kconfig: Add missing dependencies to ACPI_ICH9=0D
  hw/acpi/Kconfig: Do not needlessly build TYPE_PIIX4_PM in non-PC/Malta=0D
    machines=0D
  hw/acpi/Kconfig: Add missing dependencies to ACPI_PIIX4=0D
  hw/isa/Kconfig: Add missing dependency to VT82C686=0D
  i386, mips: Resolve redundant ACPI and APM dependencies=0D
  hw/ppc/Kconfig: Remove unused dependencies from PEGASOS2=0D
=0D
 configs/devices/mips-softmmu/common.mak | 3 ---=0D
 hw/acpi/Kconfig                         | 9 ++++++---=0D
 hw/acpi/meson.build                     | 2 +-=0D
 hw/i2c/meson.build                      | 2 +-=0D
 hw/i386/Kconfig                         | 3 +--=0D
 hw/isa/Kconfig                          | 4 ++--=0D
 hw/ppc/Kconfig                          | 2 --=0D
 7 files changed, 11 insertions(+), 14 deletions(-)=0D
=0D
-- =0D
2.39.0=0D
=0D

