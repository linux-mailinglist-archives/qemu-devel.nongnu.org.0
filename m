Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0719159BCD8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:30:00 +0200 (CEST)
Received: from localhost ([::1]:57144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3kt-0004b3-8B
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3Q9-00025h-7t
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:08:34 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:38445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3Q7-0007Mx-Qz
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:08:32 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 s31-20020a17090a2f2200b001faaf9d92easo13277240pjd.3
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 02:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Azz5vk6wDfR35ZT3qWrT07xO9midi17bTkTu9HXEiMM=;
 b=PkVCbdvyPylsydlQkvXBIdE6okP3VXU9ljMKcq6TVMSlMXbplqO5zEE5pTgs7Q/Wvj
 nqDhRgDYcIxPOvsgnbrT2n6dLfluJKz/mD+Ums81Zija2hnkvC4fvgZI0KnJPRncnd5q
 zf09jfrgx75yyfRmkWQAK802RSddXzOw+2wKj2Lciy1i6apDCJxqgfPuNyt6A8Lb8dWe
 77yX6BRAqwUUcJwgV6YwQ4/EDlcoMFQVt7eeNrdPcEqTnECNBkpXDe112ycl3dkKP4ep
 ncJkMNjZLzzQYYkGZz98GDkYVTcMkEtSMzfQftDXg8QAbjmPLHWcTlEp99oXSpJBSfJy
 PskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Azz5vk6wDfR35ZT3qWrT07xO9midi17bTkTu9HXEiMM=;
 b=R73FlixQvA5lDIl25gqdR91BaG9ic9qtKGnOeNAA2iUEoFlCzguxlDWXfQYeM12CVS
 ZgEIp5VqVf0neuNyDJV+gRtSlmbqj2NMeHD8wIM7/sCVx+k77c+sjCB0OmB8rOKrRGp3
 c+iupxsYwfS2NqxWASPrz5KE6ww+7bEpxX++0/BTsLbO3wGD08F7aOHQZz4FkF1koH0G
 j1dT1TqUJCWgeEGzRaGin9nDa0SlVObb4Z9eNLg5GkGNwv22cC59CnaBx3UyU+F1KMfu
 dtpqdb24YaAn5efus6w8s1HqX2Og5W4PDIIZTHgE9e4iSZO6p009CBM2adhbvnQVWjRM
 gFjg==
X-Gm-Message-State: ACgBeo2MbOCPl2mDIkh231OkKd+h5WcVruFVo8NgZQBBWN9MrLL2FhJq
 RRiRIZQhceJwqJJtuwK17+BkbfLYDs5v8w==
X-Google-Smtp-Source: AA6agR6mDnfUHh4Te4CB8KWZCFhPvnRFnXCjig/LkBcQM0D5M7qEcq9nTPJMGKGTEX/K0Y5Ildvexg==
X-Received: by 2002:a17:90a:e7c2:b0:1f4:feeb:20ee with SMTP id
 kb2-20020a17090ae7c200b001f4feeb20eemr22165416pjb.114.1661159310440; 
 Mon, 22 Aug 2022 02:08:30 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([116.73.134.198])
 by smtp.googlemail.com with ESMTPSA id
 a20-20020a62d414000000b00535e6dbda16sm7364539pfh.35.2022.08.22.02.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 02:08:30 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Cc: yvugenfi@redhat.com, jusual@redhat.com, kkostiuk@redhat.com,
 ybendito@redhat.com
Subject: [PATCH 3/4] tests/acpi/bios-table-test: add pcie root port device for
 DMAR test
Date: Mon, 22 Aug 2022 14:38:10 +0530
Message-Id: <20220822090811.427029-4-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822090811.427029-1-ani@anisinha.ca>
References: <20220822090811.427029-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the previos commit, we are explicitly adding scopes for pcie root ports in
Root Port ATS capability reporting structure. We add a pcie root port in the
QEMU test command line for DMAR tests so that we can verify that the scope of
the root port has been correctly added and structure looks sane.

After the changes, the above structure will look like this:

+[078h 0120   2]                Subtable Type : 0002 [Root Port ATS Capability]
+[07Ah 0122   2]                       Length : 0010
+
+[07Ch 0124   1]                        Flags : 00
+[07Dh 0125   1]                     Reserved : 00
+[07Eh 0126   2]           PCI Segment Number : 0000
+
+[080h 0128   1]            Device Scope Type : 02 [PCI Bridge Device]
+[081h 0129   1]                 Entry Length : 08
+[082h 0130   2]                     Reserved : 0000
+[084h 0132   1]               Enumeration ID : 00
+[085h 0133   1]               PCI Bus Number : 00
+
+[086h 0134   2]                     PCI Path : 02,00
+
+

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/bios-tables-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 7c5f736b51..dc79eafbb5 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1141,7 +1141,8 @@ static void test_acpi_q35_kvm_dmar(void)
     data.machine = MACHINE_Q35;
     data.variant = ".dmar";
     test_acpi_one("-machine kernel-irqchip=split -accel kvm"
-                  " -device intel-iommu,intremap=on,device-iotlb=on", &data);
+                  " -device intel-iommu,intremap=on,device-iotlb=on"
+                  " -device pcie-root-port,bus=pcie.0", &data);
     free_test_data(&data);
 }
 
-- 
2.25.1


