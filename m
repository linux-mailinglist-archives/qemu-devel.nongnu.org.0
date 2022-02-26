Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8ED4C543A
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 07:33:16 +0100 (CET)
Received: from localhost ([::1]:55546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNqdn-0003zN-FZ
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 01:33:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nNqbi-000228-9z
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 01:31:06 -0500
Received: from [2a00:1450:4864:20::333] (port=53015
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nNqbg-0006SQ-B6
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 01:31:05 -0500
Received: by mail-wm1-x333.google.com with SMTP id r10so2816164wma.2
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 22:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sRklAQ1Ju7cYZbErAtZyBSr7+sotL/2wBJeZZyoftys=;
 b=lYJiTLhyLeXtNXDs+VWCTGO5T+DLtAPBzQ15//jJYEeVpGXTXi1wFAPJWNHzQ2cCLt
 YfWOHdUUry8svz+lOTCBQSMB8J9QwtgV3fZhDvG/PwA5wnimH/uIJrmfmHJIp+uZ1Ouq
 o88RTqL6ZH5lznx856j+xpKpwqaJU3QEK85q0CN8hEWxebt1NQ8cq8sjYre2jMeM7IOR
 OTUxi97XAciG1D1IitRWhSqL/OH2VItGcVwPVHVJWdi9chtx1IP+11eaBHEJuGRSc7Kx
 eFW1ZZYgexBSDBBmdT31CiX1vF3xBbBrCQLAIWIZ89TMpofZvu5FVmtwV/AyNe6FaG11
 MXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sRklAQ1Ju7cYZbErAtZyBSr7+sotL/2wBJeZZyoftys=;
 b=RmGRAR6sJ/MLrUX0NhpRTDlrdWTtX6W1HNscQgfdYlLvGtOfU/r7UzDfnNntqxC701
 gogjxIgNnOumgSa8nqYgfl7cMgTe3hw6VbsKqhaGYaGyi7x8sLbZVEUQFq21ZEKABNl0
 jDnu1z1JIPV1UlVmjfLOmfMN/jnIDcW0pdxNxXgkRIfyzoiUWwwSj+c4Nn3lUAXev50G
 ICIrQ/H4IcWQ1nw+dukLkCglz+g2Kr0a2zwjAXxxFpX7eRbNBpisl5SyqEwDNw7rW8D0
 xvbHzg62ZAGwBMBjnPwqFmxR1NZim5aTn+E5db1HVYQUcLaa3GwNUT1Tuw3G5YO85MVF
 cL0g==
X-Gm-Message-State: AOAM533YaRjYaXHSB37cCQTpFPTedLlOBPf1tyYpOMp6GygMR70x8fU5
 xfb1QjBIhzXygxDU8MjqICAL4IQ9MLQ=
X-Google-Smtp-Source: ABdhPJwTsxE3ffEvdeHEme7sKTjJVOTZqKNu7FCblePwm3AYEMzG0k7cOu+WiKEhZbpA8GJmWPZDbA==
X-Received: by 2002:a1c:2bc3:0:b0:381:3dd5:5707 with SMTP id
 r186-20020a1c2bc3000000b003813dd55707mr3877517wmr.31.1645857061349; 
 Fri, 25 Feb 2022 22:31:01 -0800 (PST)
Received: from liavpc.localdomain ([2a10:800b:ea29:1:266:a58e:9f87:7014])
 by smtp.gmail.com with ESMTPSA id
 q7-20020adfcd87000000b001e8a4f58a8csm3933407wrj.66.2022.02.25.22.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 22:31:00 -0800 (PST)
From: Liav Albani <liavalb@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] hw/acpi: add indication for i8042 in IA-PC boot flags
 of the FADT table
Date: Sat, 26 Feb 2022 08:30:15 +0200
Message-Id: <20220226063019.1112654-1-liavalb@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=liavalb@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: ani@anisinha.ca, imammedo@redhat.com, Liav Albani <liavalb@gmail.com>,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This can allow the guest OS to determine more easily if i8042 controller
is present in the system or not, so it doesn't need to do probing of the
controller, but just initialize it immediately, before enumerating the
ACPI AML namespace.

To allow "flexible" indication, I don't hardcode the bit at location 1
as on in the IA-PC boot flags, but try to search for i8042 on the ISA
bus to verify it exists in the system.

Why this is useful you might ask - this patch allows the guest OS to
probe and use the i8042 controller without decoding the ACPI AML blob
at all. For example, as a developer of the SerenityOS kernel, I might
want to allow people to not try to decode the ACPI AML namespace (for
now, we still don't support ACPI AML as it's a work in progress), but
still to not probe for the i8042 but just use it after looking in the
IA-PC boot flags in the ACPI FADT table.

A note about this version of the patch series: I changed the assertion
checking if the ISA bus exists to a if statement, because I can see how
in the future someone might want to run a x86 machine without an ISA bus
so we should not assert if someone calls the ISA check device existence
function but return FALSE gracefully.
If someone thinks this is wrong, I'm more than happy to discuss and fix
the code :)

Liav Albani (4):
  hw/isa: add function to check for existence of device by its type
  tests/acpi: i386: allow FACP acpi table changes
  hw/acpi: add indication for i8042 in IA-PC boot flags of the FADT
    table
  tests/acpi: i386: update FACP table differences

 hw/acpi/aml-build.c            |   7 ++++++-
 hw/i386/acpi-build.c           |   8 ++++++++
 hw/i386/acpi-microvm.c         |   9 +++++++++
 hw/isa/isa-bus.c               |  23 +++++++++++++++++++++++
 include/hw/acpi/acpi-defs.h    |   1 +
 include/hw/isa/isa.h           |   1 +
 tests/data/acpi/q35/FACP       | Bin 244 -> 244 bytes
 tests/data/acpi/q35/FACP.nosmm | Bin 244 -> 244 bytes
 tests/data/acpi/q35/FACP.slic  | Bin 244 -> 244 bytes
 tests/data/acpi/q35/FACP.xapic | Bin 244 -> 244 bytes
 10 files changed, 48 insertions(+), 1 deletion(-)

-- 
2.35.1


