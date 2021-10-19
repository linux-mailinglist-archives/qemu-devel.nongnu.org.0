Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5239C43354D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 14:02:13 +0200 (CEST)
Received: from localhost ([::1]:35442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnoq-0004ki-Bg
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 08:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnD8-0004e1-3u
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:23:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnD6-00043z-FW
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:23:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JGBYmvhDt6E8gZOldDQh567mQwOZUysQwDU9UgiIntM=;
 b=JjnjiL/IGr/e3Yb5s+rq/Sk099tu3XD7JdGiPxj0nkJ2SNwacWVJtCwAL/NSatu2gZpiKZ
 Bs7ECxlqwWa3dqQjAN67oOcSNDB6zLm/1DHsPm8rHj8adkrvBhU7QyNrYEC2dS9XBv3GrN
 7aZrVt4n9kA/tlFQHOGDGJEJ3sNORIU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-9kDyBlCeMhuuKw1uJL1x7w-1; Tue, 19 Oct 2021 07:20:11 -0400
X-MC-Unique: 9kDyBlCeMhuuKw1uJL1x7w-1
Received: by mail-ed1-f69.google.com with SMTP id
 t28-20020a508d5c000000b003dad7fc5caeso93248edt.11
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JGBYmvhDt6E8gZOldDQh567mQwOZUysQwDU9UgiIntM=;
 b=kmr89jmFPl3qx7zht93n2qSLHh3jMaChFUH802aKlFhX4HxkEXwTPZ5PKW/ArKb33e
 J73DmU1nICz8e9pkXe5DINn6rb79sy1R71Y3g51YQ/oKAwe+eEdVmUxzWiA1cnvduLZX
 s+p5aGbreXDJGHFaCRaIcQ3lR7X9kolLbvs9X2kCFd6kzwwjRqKnGvrGNHB2iqRP/VBR
 G5SJ6D3u8CAp3La5XERxFsqTna1vz4sbHaUTKSmoM6wK4f8Mr9Qc7qyKCeyECDUDO1E3
 y4t3x9aI+DD888YVaYwncpSTvu8AE+PFHGuJZ6XEUHIj3KN6xNFBpfG8V7+v1fQaUhvQ
 y5nQ==
X-Gm-Message-State: AOAM530RIpLfr7Mt91K2WOugsUlFbrUiUWjMXGJncHiCM9WklFPbOosO
 EcZtPOGw7nixPIOD1m3i4S31oeBIKoReECuQk+H4dZVYd/4dqEhFHYAUcTgFjd8QKtQaZ2eDqvP
 a2jP8nYIQF/AFeW0pwb7xs/jzkuMze1evAKwRRWFHG5pN/SkFTUkFF778Vzc2
X-Received: by 2002:a17:906:6bce:: with SMTP id
 t14mr37045958ejs.546.1634642409848; 
 Tue, 19 Oct 2021 04:20:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVz72C7RQQZDWZN7M8rUt0Kuh1n09eSxJK9Ub41D2qVCqtpyZGRsXvMgP8sMj9N8m7g1ObPQ==
X-Received: by 2002:a17:906:6bce:: with SMTP id
 t14mr37045934ejs.546.1634642409625; 
 Tue, 19 Oct 2021 04:20:09 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id q21sm10608517edi.58.2021.10.19.04.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:20:09 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:20:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/29] tests: acpi: add testcase for amd-iommu (IVRS table)
Message-ID: <20211019111923.679826-11-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-11-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0361c84c5e..ef28bb41f3 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1102,6 +1102,18 @@ static void test_acpi_q35_kvm_dmar(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_tcg_ivrs(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".ivrs";
+    data.tcg_only = true,
+    test_acpi_one(" -device amd-iommu", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_piix4_tcg_numamem(void)
 {
     test_data data;
@@ -1581,6 +1593,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/smm-compat-nosmm",
                        test_acpi_q35_tcg_smm_compat_nosmm);
         qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
+        qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
         qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
-- 
MST


