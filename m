Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B32265E802
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:39:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMMw-000414-VG; Thu, 05 Jan 2023 04:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMt-0003xb-KS
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:17:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMr-0007gZ-IE
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9eilQ/elC2L4ysihao2tjz+9UKpztPtett7/15n8lDs=;
 b=bvlgSVDv6vaFxOY766hWDPFL84iACrmh9sgXk0hwGayNfSth5TAhUIrbEBnqRRXuXQ4Ce6
 +WTRp8328sRwFaqmDYdFyEV+c6wJoiCygPZ2LMZgeQW7Vsdx7zP6XLfp8At6aziG0bhaEX
 E2HHJurJfyqW5SLBjPsTrz5/dytADUA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-333-VshaYHAYO9aEVx_HqKwptw-1; Thu, 05 Jan 2023 04:16:55 -0500
X-MC-Unique: VshaYHAYO9aEVx_HqKwptw-1
Received: by mail-wr1-f72.google.com with SMTP id
 e10-20020adf9bca000000b0026e2396ab34so4695624wrc.18
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9eilQ/elC2L4ysihao2tjz+9UKpztPtett7/15n8lDs=;
 b=7wfLFXtp54RFxEwOpu4IG1cOmdf++PTgdAiqTE4tB8PtVbA9a8oFSfHf6PX7fwM4f9
 qYtI8ET9PUTKJr4MXRTR/SVlC9HJNO8FO6z1ebB+aNk9GQzjTRLApvP52C84EZiBm4CX
 PL/rYIcELBZjLfRFXkBQ+J/fiIVPTg5M7G/IUQG1M2r8dPhwjctXDem0J9kqzk3x1vrd
 4dyc9EBRqbvNrad2aFJO5XJXYApmGTkMx8Gsl3kKjyGMnzARUXKPJ6AbMJQ+fvfqtl76
 QCk7VKCQUE9nUNmAhL+RuKGfRo+OiE63XOAqK+m4qXWQCuuDH07kww9XU7XV+4yJ12rf
 0lgw==
X-Gm-Message-State: AFqh2kp+n32kUg4zu/5vXpR8GqV1YovikAANOdAe+hfi9fHnQq/kY2IS
 xExC0M5+INgGDvEFOXJtR5HeCGtiXQaPMAUc3iNXZ9XR9FQICKGdS1FgyNJ08jMjaskObXg+Mi3
 pboUBeu6d6N5OETcLhq5xbqaP2XEIwuppMHj2Xgbr3/Lw44mvxN8WP8l8C0Zp
X-Received: by 2002:adf:ce0a:0:b0:246:e6df:86e7 with SMTP id
 p10-20020adfce0a000000b00246e6df86e7mr32039382wrn.5.1672910213570; 
 Thu, 05 Jan 2023 01:16:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtfNki8wBVAOiRI6cMT721rqRnJ8nbvPgdHeEyI+BoOVC46gHmXSH4kPIlY9sjHsgZ302feqQ==
X-Received: by 2002:adf:ce0a:0:b0:246:e6df:86e7 with SMTP id
 p10-20020adfce0a000000b00246e6df86e7mr32039361wrn.5.1672910213161; 
 Thu, 05 Jan 2023 01:16:53 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 g3-20020a5d6983000000b00287da7ee033sm21535477wru.46.2023.01.05.01.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:16:52 -0800 (PST)
Date: Thu, 5 Jan 2023 04:16:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 46/51] tests: virt: Update expected ACPI tables for virt test
Message-ID: <20230105091310.263867-47-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Yicong Yang <yangyicong@hisilicon.com>

Update the ACPI tables according to the acpi aml_build change, also
empty bios-tables-test-allowed-diff.h.

The disassembled differences between actual and expected PPTT:

  /*
   * Intel ACPI Component Architecture
   * AML/ASL+ Disassembler version 20180105 (64-bit version)
   * Copyright (c) 2000 - 2018 Intel Corporation
   *
 - * Disassembly of tests/data/acpi/virt/PPTT, Tue Nov  1 09:29:12 2022
 + * Disassembly of /tmp/aml-DIIGV1, Tue Nov  1 09:29:12 2022
   *
   * ACPI Data Table [PPTT]
   *
   * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
   */

  [000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
 -[004h 0004   4]                 Table Length : 00000060
 +[004h 0004   4]                 Table Length : 0000004C
  [008h 0008   1]                     Revision : 02
 -[009h 0009   1]                     Checksum : 48
 +[009h 0009   1]                     Checksum : A8
  [00Ah 0010   6]                       Oem ID : "BOCHS "
  [010h 0016   8]                 Oem Table ID : "BXPC    "
  [018h 0024   4]                 Oem Revision : 00000001
  [01Ch 0028   4]              Asl Compiler ID : "BXPC"
  [020h 0032   4]        Asl Compiler Revision : 00000001

  [024h 0036   1]                Subtable Type : 00 [Processor Hierarchy Node]
  [025h 0037   1]                       Length : 14
  [026h 0038   2]                     Reserved : 0000
  [028h 0040   4]        Flags (decoded below) : 00000001
                              Physical package : 1
                       ACPI Processor ID valid : 0
  [02Ch 0044   4]                       Parent : 00000000
  [030h 0048   4]            ACPI Processor ID : 00000000
  [034h 0052   4]      Private Resource Number : 00000000

  [038h 0056   1]                Subtable Type : 00 [Processor Hierarchy Node]
  [039h 0057   1]                       Length : 14
  [03Ah 0058   2]                     Reserved : 0000
 -[03Ch 0060   4]        Flags (decoded below) : 00000000
 +[03Ch 0060   4]        Flags (decoded below) : 0000000A
                              Physical package : 0
 -                     ACPI Processor ID valid : 0
 +                     ACPI Processor ID valid : 1
  [040h 0064   4]                       Parent : 00000024
  [044h 0068   4]            ACPI Processor ID : 00000000
  [048h 0072   4]      Private Resource Number : 00000000

 -[04Ch 0076   1]                Subtable Type : 00 [Processor Hierarchy Node]
 -[04Dh 0077   1]                       Length : 14
 -[04Eh 0078   2]                     Reserved : 0000
 -[050h 0080   4]        Flags (decoded below) : 0000000A
 -                            Physical package : 0
 -                     ACPI Processor ID valid : 1
 -[054h 0084   4]                       Parent : 00000038
 -[058h 0088   4]            ACPI Processor ID : 00000000
 -[05Ch 0092   4]      Private Resource Number : 00000000
 -
 -Raw Table Data: Length 96 (0x60)
 +Raw Table Data: Length 76 (0x4C)

 -  0000: 50 50 54 54 60 00 00 00 02 48 42 4F 43 48 53 20  // PPTT`....HBOCHS
 +  0000: 50 50 54 54 4C 00 00 00 02 A8 42 4F 43 48 53 20  // PPTTL.....BOCHS
    0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
    0020: 01 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  // ................
 -  0030: 00 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00  // ................
 -  0040: 24 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  // $...............
 -  0050: 0A 00 00 00 38 00 00 00 00 00 00 00 00 00 00 00  // ....8...........
 +  0030: 00 00 00 00 00 00 00 00 00 14 00 00 0A 00 00 00  // ................
 +  0040: 24 00 00 00 00 00 00 00 00 00 00 00              // $...........

PPTT.acpihmatvirt is also updated:
  /*
   * Intel ACPI Component Architecture
   * AML/ASL+ Disassembler version 20180105 (64-bit version)
   * Copyright (c) 2000 - 2018 Intel Corporation
   *
 - * Disassembly of tests/data/acpi/virt/PPTT.acpihmatvirt, Wed Dec 28 15:36:06 2022
 + * Disassembly of /tmp/aml-IPKJX1, Wed Dec 28 15:36:06 2022
   *
   * ACPI Data Table [PPTT]
   *
   * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
   */

  [000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
 -[004h 0004   4]                 Table Length : 000000C4
 +[004h 0004   4]                 Table Length : 0000009C
  [008h 0008   1]                     Revision : 02
 -[009h 0009   1]                     Checksum : 9E
 +[009h 0009   1]                     Checksum : FE
  [00Ah 0010   6]                       Oem ID : "BOCHS "
  [010h 0016   8]                 Oem Table ID : "BXPC    "
  [018h 0024   4]                 Oem Revision : 00000001
  [01Ch 0028   4]              Asl Compiler ID : "BXPC"
  [020h 0032   4]        Asl Compiler Revision : 00000001

  [024h 0036   1]                Subtable Type : 00 [Processor Hierarchy Node]
  [025h 0037   1]                       Length : 14
  [026h 0038   2]                     Reserved : 0000
  [028h 0040   4]        Flags (decoded below) : 00000001
                              Physical package : 1
                       ACPI Processor ID valid : 0
  [02Ch 0044   4]                       Parent : 00000000
  [030h 0048   4]            ACPI Processor ID : 00000000
  [034h 0052   4]      Private Resource Number : 00000000

  [038h 0056   1]                Subtable Type : 00 [Processor Hierarchy Node]
  [039h 0057   1]                       Length : 14
  [03Ah 0058   2]                     Reserved : 0000
 -[03Ch 0060   4]        Flags (decoded below) : 00000000
 +[03Ch 0060   4]        Flags (decoded below) : 0000000A
                              Physical package : 0
 -                     ACPI Processor ID valid : 0
 +                     ACPI Processor ID valid : 1
  [040h 0064   4]                       Parent : 00000024
  [044h 0068   4]            ACPI Processor ID : 00000000
  [048h 0072   4]      Private Resource Number : 00000000

  [04Ch 0076   1]                Subtable Type : 00 [Processor Hierarchy Node]
  [04Dh 0077   1]                       Length : 14
  [04Eh 0078   2]                     Reserved : 0000
  [050h 0080   4]        Flags (decoded below) : 0000000A
                              Physical package : 0
                       ACPI Processor ID valid : 1
 -[054h 0084   4]                       Parent : 00000038
 -[058h 0088   4]            ACPI Processor ID : 00000000
 +[054h 0084   4]                       Parent : 00000024
 +[058h 0088   4]            ACPI Processor ID : 00000001
  [05Ch 0092   4]      Private Resource Number : 00000000

  [060h 0096   1]                Subtable Type : 00 [Processor Hierarchy Node]
  [061h 0097   1]                       Length : 14
  [062h 0098   2]                     Reserved : 0000
 -[064h 0100   4]        Flags (decoded below) : 0000000A
 -                            Physical package : 0
 -                     ACPI Processor ID valid : 1
 -[068h 0104   4]                       Parent : 00000038
 +[064h 0100   4]        Flags (decoded below) : 00000001
 +                            Physical package : 1
 +                     ACPI Processor ID valid : 0
 +[068h 0104   4]                       Parent : 00000000
  [06Ch 0108   4]            ACPI Processor ID : 00000001
  [070h 0112   4]      Private Resource Number : 00000000

  [074h 0116   1]                Subtable Type : 00 [Processor Hierarchy Node]
  [075h 0117   1]                       Length : 14
  [076h 0118   2]                     Reserved : 0000
 -[078h 0120   4]        Flags (decoded below) : 00000001
 -                            Physical package : 1
 -                     ACPI Processor ID valid : 0
 -[07Ch 0124   4]                       Parent : 00000000
 -[080h 0128   4]            ACPI Processor ID : 00000001
 +[078h 0120   4]        Flags (decoded below) : 0000000A
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 1
 +[07Ch 0124   4]                       Parent : 00000060
 +[080h 0128   4]            ACPI Processor ID : 00000002
  [084h 0132   4]      Private Resource Number : 00000000

  [088h 0136   1]                Subtable Type : 00 [Processor Hierarchy Node]
  [089h 0137   1]                       Length : 14
  [08Ah 0138   2]                     Reserved : 0000
 -[08Ch 0140   4]        Flags (decoded below) : 00000000
 -                            Physical package : 0
 -                     ACPI Processor ID valid : 0
 -[090h 0144   4]                       Parent : 00000074
 -[094h 0148   4]            ACPI Processor ID : 00000000
 -[098h 0152   4]      Private Resource Number : 00000000
 -
 -[09Ch 0156   1]                Subtable Type : 00 [Processor Hierarchy Node]
 -[09Dh 0157   1]                       Length : 14
 -[09Eh 0158   2]                     Reserved : 0000
 -[0A0h 0160   4]        Flags (decoded below) : 0000000A
 -                            Physical package : 0
 -                     ACPI Processor ID valid : 1
 -[0A4h 0164   4]                       Parent : 00000088
 -[0A8h 0168   4]            ACPI Processor ID : 00000002
 -[0ACh 0172   4]      Private Resource Number : 00000000
 -
 -[0B0h 0176   1]                Subtable Type : 00 [Processor Hierarchy Node]
 -[0B1h 0177   1]                       Length : 14
 -[0B2h 0178   2]                     Reserved : 0000
 -[0B4h 0180   4]        Flags (decoded below) : 0000000A
 +[08Ch 0140   4]        Flags (decoded below) : 0000000A
                              Physical package : 0
                       ACPI Processor ID valid : 1
 -[0B8h 0184   4]                       Parent : 00000088
 -[0BCh 0188   4]            ACPI Processor ID : 00000003
 -[0C0h 0192   4]      Private Resource Number : 00000000
 +[090h 0144   4]                       Parent : 00000060
 +[094h 0148   4]            ACPI Processor ID : 00000003
 +[098h 0152   4]      Private Resource Number : 00000000

 -Raw Table Data: Length 196 (0xC4)
 +Raw Table Data: Length 156 (0x9C)

 -  0000: 50 50 54 54 C4 00 00 00 02 9E 42 4F 43 48 53 20  // PPTT......BOCHS
 +  0000: 50 50 54 54 9C 00 00 00 02 FE 42 4F 43 48 53 20  // PPTT......BOCHS
    0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
    0020: 01 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  // ................
 -  0030: 00 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00  // ................
 +  0030: 00 00 00 00 00 00 00 00 00 14 00 00 0A 00 00 00  // ................
    0040: 24 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  // $...............
 -  0050: 0A 00 00 00 38 00 00 00 00 00 00 00 00 00 00 00  // ....8...........
 -  0060: 00 14 00 00 0A 00 00 00 38 00 00 00 01 00 00 00  // ........8.......
 -  0070: 00 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  // ................
 -  0080: 01 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00  // ................
 -  0090: 74 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  // t...............
 -  00A0: 0A 00 00 00 88 00 00 00 02 00 00 00 00 00 00 00  // ................
 -  00B0: 00 14 00 00 0A 00 00 00 88 00 00 00 03 00 00 00  // ................
 -  00C0: 00 00 00 00                                      // ....
 +  0050: 0A 00 00 00 24 00 00 00 01 00 00 00 00 00 00 00  // ....$...........
 +  0060: 00 14 00 00 01 00 00 00 00 00 00 00 01 00 00 00  // ................
 +  0070: 00 00 00 00 00 14 00 00 0A 00 00 00 60 00 00 00  // ............`...
 +  0080: 02 00 00 00 00 00 00 00 00 14 00 00 0A 00 00 00  // ................
 +  0090: 60 00 00 00 03 00 00 00 00 00 00 00              // `...........

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Message-Id: <20221229065513.55652-4-yangyicong@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/virt/PPTT                   | Bin 96 -> 76 bytes
 tests/data/acpi/virt/PPTT.acpihmatvirt      | Bin 196 -> 156 bytes
 3 files changed, 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index fc12cd8c5c..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/PPTT",
-"tests/data/acpi/virt/PPTT.acpihmatvirt",
diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
index f56ea63b369a604877374ad696c396e796ab1c83..7a1258ecf123555b24462c98ccbb76b4ac1d0c2b 100644
GIT binary patch
delta 32
fcmYfB;R*-{3GrcIU|?D?k;`ae01J-_kOKn%ZFdCM

delta 53
pcmeZC;0g!`2}xjJU|{l?$YrDgWH5jU5Ca567#O&Klm(arApowi1QY-O

diff --git a/tests/data/acpi/virt/PPTT.acpihmatvirt b/tests/data/acpi/virt/PPTT.acpihmatvirt
index 710dba5e793cf36df94087666db58af5f8d03684..4eef303a5b6168c6bc3795c2e2c53f65b4c4cfd4 100644
GIT binary patch
delta 66
zcmX@YIERrdARr`U4g&)N)4z#aMiT>ACOU{Ps!YsOR^b8)CV(V>7z{)h7+_+|P$2-t
C;0Zeb

delta 75
zcmbQkc!ZHFARr{<2m=EH)4YjXMvM#-ZN(WaCOQfOiBM%$pg2Pbkf+cAQUT(DfCvKv
N7mxypF@yL(0023a3f%wz

-- 
MST


