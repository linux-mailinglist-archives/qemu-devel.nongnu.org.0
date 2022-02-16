Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F154B93FF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 23:48:48 +0100 (CET)
Received: from localhost ([::1]:33398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKT6N-0001sP-Fl
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 17:48:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKT3Y-0007W6-J7
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:45:52 -0500
Received: from [2a00:1450:4864:20::636] (port=34768
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKT3V-0003Qc-SA
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:45:52 -0500
Received: by mail-ej1-x636.google.com with SMTP id gb39so2623971ejc.1
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 14:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hPAmto1QIqxeLgW2F/dijeq91aVDa3U69jfrypz+7Zc=;
 b=gB1eMumbM+6/vDlzIsqMcKgJ9Jtxkfpj0sZrt/Ah+Mqfvo1oX9RkyUBsj2cU1goWXD
 jAZhjNLAWMxzYGq58rP97n8dcjmsSHxuQmk0R86wt/ys7vtRo3XAvnR5lvNJwm+XyvqM
 wq/njnfjQeTc6Z3iOvRDkeJ1x53u+eDb1nia+QJL8iLSm2L+UcbyyNOyEqle6sZtUclX
 z1Yvszq6P48g+7yrlk9KqiBq0M3xpEbfFUkaRirliUetJAmLwZP95a74vfiloqFRwFsr
 1//VcLhkkoQKHWhlxOOIBNHB7MSutugk6b2FpInZWupRUNv8Tjf1lqNbGhigRc3pIlPI
 NihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hPAmto1QIqxeLgW2F/dijeq91aVDa3U69jfrypz+7Zc=;
 b=Cp3E0cs5CTPUwpGBkJNkN+//En29BK33Kp8dVtxvr03A6yK2D5I1g/KLPXV15R5wuP
 g4ZsWtg7SUvCL4ikxf/Md5zqrU6BRtL1RLED5zmt4IDw+6og8FuOEj7jLTnS4sQaGTZl
 Fam0mB9eZlvnPbWac4/mxO9+wRkIQqz5Yx1yftBifPSLxUG5HVTeuQrGRGFHwlFZnHC9
 Yt1bxniHcEf0JX3pylF83G24YYEt94ubdS1m/rzGLXVklktx3E4QpMb8aa+5g2HbRvNR
 sW8x4VspMjJG1sgo4GYyW2k8pomCEeVO1esBLa0OpIHzJe5sQ9D2Mr7RtAwyZWJqDELe
 1eOg==
X-Gm-Message-State: AOAM532EIt01Huua/uz7Cy1LcisvKfKbv0eq1KFB0jos6slhWisVurUl
 OgbYMWLODAeU3GlwSzFjlR/Wb4F5ASY=
X-Google-Smtp-Source: ABdhPJxX5deFa4PdroMbiwtO6kcpslnHRTThQJ1GAaovapb4P4Gc5fkUp4rELfX0gvmdWdvrrPfyMg==
X-Received: by 2002:a17:906:32d0:b0:6ce:e1cf:3f2e with SMTP id
 k16-20020a17090632d000b006cee1cf3f2emr167637ejk.214.1645051547308; 
 Wed, 16 Feb 2022 14:45:47 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-054-075-152.78.54.pool.telefonica.de. [78.54.75.152])
 by smtp.gmail.com with ESMTPSA id t26sm1475820edv.50.2022.02.16.14.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 14:45:46 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] malta: Fix PCI IRQ levels to be preserved during
 migration, cleanup
Date: Wed, 16 Feb 2022 23:45:12 +0100
Message-Id: <20220216224519.157233-1-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested with [1]:

  qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda \
  debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=tty0"

It was possible to log in as root and `poweroff` the machine.

Moreover, I ran:

  :$ make check
  Ok:                 569
  Expected Fail:      0
  Fail:               0
  Unexpected Pass:    0
  Skipped:            178
  Timeout:            0

[1] https://people.debian.org/~aurel32/qemu/mips/


v3:
  The migration bug now gets fixed in gt64xxx_pci before any cleanup. As
    suggested by PMM the patch is based on commit e735b55a8c11.
  The code movement patch now moves the already fixed code. I might be a bit
    too conservative here by removing Philippe's Reviewed-By tag.
  As suggested by BALATON Zoltan, the redundant i8259[] attribute is now
    resolved immediately after the code movement. As a side effect, it also
    removes moved code which doesn't adhere to the coding style (local loop
    variable).
  To address BALATON Zoltan's comment and to reduce the number of required
    Reviewed-By's, only piix4_set_irq() is modified to expect own DeviceState
    paremeter. Up to v2, all remaining set_irq() functions were changed this
    way.
  The patch resolving piix4's singleton variable got split into two patches:
    One which resolves the singleton variable and one which replaces magic
    constants. The split patches should be more comprehensible.
  Suggested by BALATON Zoltan, I took a chance to resolve gt64120_register(),
    a method akin to the legacy init functions we're trying to get rid of.

v2:
  isa/piix4: Fix PCI IRQ levels to be preserved in VMState
  isa/piix4: Resolve redundant i8259[] attribute

Bernhard Beschow (7):
  hw/mips/gt64xxx_pci: Fix PCI IRQ levels to be preserved during
    migration
  malta: Move PCI interrupt handling from gt64xxx_pci to piix4
  hw/isa/piix4: Resolve redundant i8259[] attribute
  hw/isa/piix4: Pass PIIX4State as opaque parameter for piix4_set_irq()
  hw/isa/piix4: Resolve global instance variable
  hw/isa/piix4: Replace some magic IRQ constants
  hw/mips/gt64xxx_pci: Resolve gt64120_register()

 hw/isa/piix4.c                | 54 +++++++++++++++++++++--
 hw/mips/gt64xxx_pci.c         | 80 +++--------------------------------
 hw/mips/malta.c               | 17 ++++----
 include/hw/mips/mips.h        |  3 --
 include/hw/southbridge/piix.h |  2 -
 5 files changed, 65 insertions(+), 91 deletions(-)

-- 
2.35.1


