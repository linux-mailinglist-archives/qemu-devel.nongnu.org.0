Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0964C79E7
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 21:19:59 +0100 (CET)
Received: from localhost ([::1]:45828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOmUw-0007Jy-LS
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 15:19:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nOmT3-0005DQ-Qe
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 15:18:01 -0500
Received: from [2a00:1450:4864:20::430] (port=42760
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nOmT2-0000g8-Eg
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 15:18:01 -0500
Received: by mail-wr1-x430.google.com with SMTP id d17so17192813wrc.9
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 12:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wy7vAjQz+aehx8JFxbNKXDV4lbR0Lw2ZyRkBNNQ/rm8=;
 b=dY6aM3P+K+4mHM6n24RYRieRqOy7+YaK/82WRBeR1DlQI4sb/PNgHoZMguYRShXIID
 8bvE/lth+axHmveteoWJpPNZnOPC/1hUeuJp3oMr7Q2AsH5UVjFBEQCJusj1noF1H61O
 HDlmbl035YvBFQ/5jn6+QUfaq7s01heYXVGbQp/C6Bke6Srzf/XXdBDRu8MMO4+9zqY3
 BVu8GGQUficAgEPVXsd8Lz18yr89OvhCROEXwtlxK1YBGapxo/aO6jNqk1GA3v35EBxE
 CjAv1/7KPklQFiP7sTDxNhxv308rqqazWj6yaYCeyGNoS9ZYTEpLG889udYfE2D/LtAR
 b6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wy7vAjQz+aehx8JFxbNKXDV4lbR0Lw2ZyRkBNNQ/rm8=;
 b=JaDV9ioygai0wSg/fGoiYgZ1C3jsFqiyE+xMtRSjzhNNbVr7i0RBjsqo7uyEviUNjy
 UplBRWAT5oMaVmjRBaeEyysF0gA4bajxmPWKNTzYiW5SMS9is0NtygENQwTT+O+E7NwT
 8yyG33ty0bp2Vp8x1SykunnlItnANqrBftP6L39Bu5yJln7tkeOewJl7hOXn3lGVIWOb
 u/YQX6yes2Sm1hA7st6KtjoHM04HwGbdtHYHjxMfljX5aU93w3NhVL0U408sGi33kVMC
 rucbWVVaC6htsD0LubG7IvyWAGDxb50pIZUFudc/+64CtjgaqcHFUGdgBKgfzO/vfTFU
 5Bmg==
X-Gm-Message-State: AOAM531X1U5qY/+TGT0h9KNQZQBNV3kZydVSMs7EEvn+MDoCe1d+wqzt
 2bZ8DIaWUsKbaqfVEsdGdWJIEKArcT3sWA==
X-Google-Smtp-Source: ABdhPJxWcLUvaF2fAPCrICDZs6NWDmCBFaiaMOAQ278afqc88KBY19Wn14Yp+a4foVMYzu9zypE0dg==
X-Received: by 2002:a5d:550d:0:b0:1ed:c155:6c2a with SMTP id
 b13-20020a5d550d000000b001edc1556c2amr16941193wrv.470.1646079478030; 
 Mon, 28 Feb 2022 12:17:58 -0800 (PST)
Received: from liavpc.localdomain ([2a10:800b:ea29:1:266:a58e:9f87:7014])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a05600c418200b00380e4fa28b8sm355259wmh.23.2022.02.28.12.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 12:17:57 -0800 (PST)
From: Liav Albani <liavalb@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] hw/acpi: add indication for i8042 in IA-PC boot flags
 of the FADT table
Date: Mon, 28 Feb 2022 22:17:30 +0200
Message-Id: <20220228201733.714580-1-liavalb@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: ani@anisinha.ca, imammedo@redhat.com, shentey@gmail.com,
 Liav Albani <liavalb@gmail.com>, mst@redhat.com
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

Liav Albani (3):
  tests/acpi: i386: allow FACP acpi table changes
  hw/acpi: add indication for i8042 in IA-PC boot flags of the FADT
    table
  tests/acpi: i386: update FACP table differences

 hw/acpi/aml-build.c            |  11 ++++++++++-
 hw/i386/acpi-build.c           |   9 +++++++++
 hw/i386/acpi-microvm.c         |   9 +++++++++
 include/hw/acpi/acpi-defs.h    |   1 +
 tests/data/acpi/q35/FACP       | Bin 244 -> 244 bytes
 tests/data/acpi/q35/FACP.nosmm | Bin 244 -> 244 bytes
 tests/data/acpi/q35/FACP.slic  | Bin 244 -> 244 bytes
 tests/data/acpi/q35/FACP.xapic | Bin 244 -> 244 bytes
 8 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.35.1


