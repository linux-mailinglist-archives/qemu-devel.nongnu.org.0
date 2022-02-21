Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29A04BEA54
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 20:18:17 +0100 (CET)
Received: from localhost ([::1]:50602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMECO-0004lG-5z
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 14:18:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nME9R-0003PZ-6k
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:15:13 -0500
Received: from [2a00:1450:4864:20::429] (port=36793
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nME9P-0001dJ-8n
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:15:12 -0500
Received: by mail-wr1-x429.google.com with SMTP id o24so28782037wro.3
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 11:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aFA+DD9JBORdYQTM7b3W1qHgreUuZjFrswzkOT+VncE=;
 b=ouXfh/ma6TiKM7z/Zq8bnq1UBsMDp3hi0Uf9iR+y7gT9os1QNDb9DkzFYNtTcE6pn5
 U1kPb31qIhhWxspV/+1/oHisFlHbdqAIsycvloVIwS0uTSphHrLBhTox0VBfN3PchKKG
 DxJ6sq0EZTrDZCyfiGRK/eEZqMsncIL8Kc9vkm5csICXCdnHU4er07V5AKmhUZE2+rVe
 O6DE3NBIQIamPyNvJnMLtaHIlak6JJc+xGKbkvJ/MSDceSAVqqjucomhecVhLEaXb1M0
 1nY/qxKw8J8r4MDJzA18IX1wEincTTPaldr8CDMkKRHrkN54y0FEM3EBW5MxdHZlvC1z
 koDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aFA+DD9JBORdYQTM7b3W1qHgreUuZjFrswzkOT+VncE=;
 b=5B+0gPxvY16/JYKF8sxm96WXer5JFGevtpot1l8V0kyvmNAL9el0oFbB0DJsktMZZO
 HJ/wE/amOEUPF4rvy6Vjb8mDfUPgFPn0GwtlbhecFV+uSxWHC1ryCWlcIPnSQo3esB6w
 Vpy7pF8JW1K7CpCLiA29rBXZJ5ZT97kdT/fKHciQBpoTEb6YCLdtl55RYsD+oj5wMWyU
 poG6xVfJFQCnpcU/dxkXFF/qX1ValcCLlzRxFA8Hap4EhCDSK1H7zR+MvEgxTlnrJlE4
 SEk64dBFiqs2asoujJOZi1DkD5GKJwHCAn1KCADYtySorQhi23hQtYpHdd9RiXVQ9l0L
 HYvQ==
X-Gm-Message-State: AOAM531LLz/Vho8ztuIbK+ikqL5yOE3g7h+sV6BE8Fnjl0y1uw6BFwTn
 rdvXePHSC1KTLxt5CKS6WIKEmXwmdX0n8A==
X-Google-Smtp-Source: ABdhPJwSvq9mSJv3Z9SJt6Q5yNj9U/pFHGOEbJD3PVR+jZvIKhEZZLmBaSCtgMN1ifFpyQICgdgPCA==
X-Received: by 2002:adf:9f05:0:b0:1e6:405c:31d6 with SMTP id
 l5-20020adf9f05000000b001e6405c31d6mr16815505wrf.457.1645470909530; 
 Mon, 21 Feb 2022 11:15:09 -0800 (PST)
Received: from liavpc.localdomain ([2a10:800a:bb8:1:6510:42ac:bb55:9590])
 by smtp.gmail.com with ESMTPSA id b7sm40563258wrp.23.2022.02.21.11.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 11:15:09 -0800 (PST)
From: Liav Albani <liavalb@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] hw/acpi: add indication for i8042 in IA-PC boot flags
 of the FADT table
Date: Mon, 21 Feb 2022 21:13:21 +0200
Message-Id: <20220221191323.617323-1-liavalb@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x429.google.com
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

Liav Albani (2):
  hw/isa: add function to check for existence of device by its type
  hw/acpi: add indication for i8042 in IA-PC boot flags of the FADT
    table

 hw/acpi/aml-build.c         |  7 ++++++-
 hw/i386/acpi-build.c        |  5 +++++
 hw/i386/acpi-microvm.c      |  5 +++++
 hw/isa/isa-bus.c            | 23 +++++++++++++++++++++++
 include/hw/acpi/acpi-defs.h |  1 +
 include/hw/isa/isa.h        |  1 +
 6 files changed, 41 insertions(+), 1 deletion(-)

-- 
2.35.1


