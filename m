Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC416464DF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 00:15:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p33ax-0005mo-Kr; Wed, 07 Dec 2022 18:12:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p33av-0005ll-Cm
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 18:12:53 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p33am-0003Un-Uy
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 18:12:52 -0500
Received: by mail-ej1-x631.google.com with SMTP id t17so17590858eju.1
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 15:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L4Rm1Ms5Eu2Aj1XvCHQMuM7jWyjPwpDR68rQc23IXHc=;
 b=fk0dwPb7GOtaEOZS6tRoPd6DqbSklf9yjt6QfrnDQOuedZznmA3wIwtGI+JAcz+kVk
 CChF32NvKsNK+6eKlbkLPwJEm0AHikALR3JXdh4tuje52RKnuYLzYNGgDOHUM1/dNq81
 j/7MJNydYCDq6nx0WeQyhWesoVjJzAy2rC6hu40Ix8gdE/fMb2MwtJoeyT9MxBXg9sF0
 QOxC8+ALggKKj43NoWiNPLYJH3o+BvLhKxImPtGoxenTdstAiRffv2t+IOttUu+0n5Gz
 Fe7YtY/Zy9hnGH6Xx+agaY0LMw3gUWqTK+QqekN29HPzKx0KNFd9QmVbFfDo484xRCf0
 +/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L4Rm1Ms5Eu2Aj1XvCHQMuM7jWyjPwpDR68rQc23IXHc=;
 b=A5+dJ3MWUegVdZY3kl4HdPvtjev2rNlc5g3PNwWoP97lxbpBNS2DDsCTVhFvPNDgOt
 Bk/uYbuliVN24KNIE7E3h+jrLCI12N/c/AL1QySYnODvrELkH1dIMFsaJ3889EBaThVe
 Eb47ivvkUiys2+tiGu3RLYmpxMLihpkhYJmH95P67EKjfxUCwzw5iVGKsykHWRst5ifs
 d8SzvdTPefHk48pqhsL/uksPzhIZqREsi3ZiMnKk0ozs8zgq+zVesB/NpxIxsldUepr3
 Zuyakhiy3L2/Mr20bqB+PbDfLVu9XawaKc2V+jOgN3YP01NVNYIQXwJjY4pRaFLPWfua
 PPMQ==
X-Gm-Message-State: ANoB5pnQ2XP2vx48LASwCOas/hDXTLbGWH9p8N5NFs8biGNiDeTJ+kjq
 nXNyXtyRVHyoc2wrf5QfyUOixSe+yRU=
X-Google-Smtp-Source: AA0mqf5F5y+Pjk+YxRSlbeKBValCFf/wCJxGAzpKSTwbzgHwDzs0DfCZXFdCBV9Ty2OwFfXIaFi7bA==
X-Received: by 2002:a17:907:c315:b0:7c0:c10e:1395 with SMTP id
 tl21-20020a170907c31500b007c0c10e1395mr605859ejc.1.1670454762715; 
 Wed, 07 Dec 2022 15:12:42 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-181-051.77.11.pool.telefonica.de. [77.11.181.51])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b004587f9d3ce8sm2732367edh.56.2022.12.07.15.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 15:12:42 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/5] Clean up dependencies of ACPI controllers
Date: Thu,  8 Dec 2022 00:12:00 +0100
Message-Id: <20221207231205.1106381-1-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
controllers to 1/ depend on ACPI and 2/ to select ACPI_SMBUS and APM since =
the=0D
latter are provided by the device models.=0D
=0D
Due to the PIIX4 cleanup PEGASOS2's dependency can be reduced to just ACPI,=
=0D
eliminating 9 compilation units from the softmmu-ppc build.=0D
=0D
Bernhard Beschow (5):=0D
  hw/acpi/Kconfig: Add missing dependencies to ACPI_PIIX4=0D
  hw/acpi/Kconfig: Rename ACPI_X86_ICH to ACPI_ICH9=0D
  hw/acpi/Kconfig: Add missing dependencies to ACPI_ICH9=0D
  hw/isa/Kconfig: Add missing dependency to VT82C686=0D
  hw/ppc/Kconfig: Remove unused dependencies from PEGASOS2=0D
=0D
 configs/devices/mips-softmmu/common.mak | 2 --=0D
 hw/acpi/Kconfig                         | 6 +++++-=0D
 hw/acpi/meson.build                     | 2 +-=0D
 hw/i2c/meson.build                      | 2 +-=0D
 hw/i386/Kconfig                         | 3 ---=0D
 hw/isa/Kconfig                          | 4 ++--=0D
 hw/ppc/Kconfig                          | 2 +-=0D
 7 files changed, 10 insertions(+), 11 deletions(-)=0D
=0D
-- =0D
2.38.1=0D
=0D

