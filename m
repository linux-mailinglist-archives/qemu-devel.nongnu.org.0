Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156174BD0EE
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 20:29:33 +0100 (CET)
Received: from localhost ([::1]:53626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLrtj-0001eF-S2
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 14:29:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nLrrD-0008Pv-Rh
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 14:26:55 -0500
Received: from [2a00:1450:4864:20::42b] (port=44704
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nLrrC-0006JR-BK
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 14:26:55 -0500
Received: by mail-wr1-x42b.google.com with SMTP id u1so23485091wrg.11
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 11:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fIKGXI1QYAs37WrfjEGdgX61QpyOn2u1frzSPsDDhlc=;
 b=i3hwE/Nkw3Np9lWXL1dCOcseMfAo/0Gua20Igon8va7x9HvAdPfQBQFlTFGz4kr7YG
 98nS7zB4mbE9MwYnSIbRHUrfPP7dJtPFY0gycIAc5kvD7WfGYBKSWLHMXgr3gdjbiWst
 iWazmDi1KM7x9Dy5VB7liFxXB1l5p1t1Nj4N8RkLVvkP+z5k7V2uM6GuQ9jsWjqMBPMl
 lHsV8aD7QE4kIzdkHOXOsS3KSxPrk3HwWZ8GbOsXVG3IuxjyunBd07/g4PCAn6Ajwc0B
 SI2MCR3KbFygWar8bScCqpM5qURhfmVSspCpRwrZhLSOEByCEeRAxzpFpeeSbFr5JGM0
 9G9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fIKGXI1QYAs37WrfjEGdgX61QpyOn2u1frzSPsDDhlc=;
 b=fgkR/gBaetFKKqS+z/GiTUqBuPRVv7tAmXZ4KcL2qO5cQhel3poPVc9vqvojBXIcfK
 BEm/AIjvNGAU8cS93kKNzP9msueHlJVqIM78Zbgr9yPMJWQMqV8vQLd/YC8kZYVmfwMg
 wYfkylLsvcmLUxE4X6s3R5oBqKrcGebW0ws1CogzBDtwMbIaghcpVNdgjETJaVlDd9oG
 KdwjNQ8LVjsyNnPYsSoEEE/h/SgUS7b+De3QgC6PYE0aXyxVKeM+kqMqbrOP1j5Giyaj
 MSsy9hnfY4nI/85Lsoj/fQtpKit3hkCcOe8ZfjjsAtAsOZnWYyJfnsChLLeu+V+sp1UY
 lnXA==
X-Gm-Message-State: AOAM531gPdldYKx6KFYN6De4R9MqcpY3s25FqmaEzMJElr2rSEzm1eh0
 MoIsKRM49YIs5JagdUYp2wQHWOf1GmxSig==
X-Google-Smtp-Source: ABdhPJxsbDzclPLquDOiFHO4sZIiZimbtOjAMEd8Iuh1yUMozoZP36Em/fGnfrxlQNqQ+vJLqHSt4Q==
X-Received: by 2002:adf:df86:0:b0:1e3:126f:440c with SMTP id
 z6-20020adfdf86000000b001e3126f440cmr13231726wrl.140.1645385212452; 
 Sun, 20 Feb 2022 11:26:52 -0800 (PST)
Received: from liavpc.localdomain ([2a10:800a:bb8:1:6510:42ac:bb55:9590])
 by smtp.gmail.com with ESMTPSA id c14sm9975786wru.37.2022.02.20.11.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 11:26:52 -0800 (PST)
From: Liav Albani <liavalb@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/acpi: add indication for i8042 in IA-PC boot flags of
 the FADT table
Date: Sun, 20 Feb 2022 21:25:47 +0200
Message-Id: <20220220192549.591703-1-liavalb@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x42b.google.com
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

Liav Albani (2):
  hw/isa: add function to check for existence of device by its type
  hw/acpi: add indication for i8042 in IA-PC boot flags of the FADT
    table

 hw/acpi/aml-build.c         |  7 ++++++-
 hw/i386/acpi-build.c        |  5 +++++
 hw/i386/acpi-microvm.c      |  5 +++++
 hw/isa/isa-bus.c            | 17 +++++++++++++++++
 include/hw/acpi/acpi-defs.h |  1 +
 include/hw/isa/isa.h        |  1 +
 6 files changed, 35 insertions(+), 1 deletion(-)

-- 
2.35.1


