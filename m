Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53158613787
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:11:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUHI-0003Fa-4M; Mon, 31 Oct 2022 08:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUGb-0001zW-Au
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:51:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUGZ-0002SH-MB
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:51:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=owrr89MfJhRkFKdG0BWvvHnNNotD1TbvhM1y5znIgb4=;
 b=SwvT0q2peAyDVsG1K2t37nfRiY5yMLhffwx74KppOPzFJ87sOamQCUsQTjd0hmc03X4Gg2
 QZkkY08SMrv/4Hrh0wb3jCJ5ogn7mCQW1bBnXosyCbftLwMMb9NnwCUngaFNnAFl2mQMkc
 XKsmdT9+IqTFJWV6zrC+RNkr/XHB8sw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-152-b9Ynet0nO_Sv693Fkjfnww-1; Mon, 31 Oct 2022 08:51:45 -0400
X-MC-Unique: b9Ynet0nO_Sv693Fkjfnww-1
Received: by mail-wm1-f72.google.com with SMTP id
 r6-20020a1c4406000000b003cf4d3b6644so1084856wma.6
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=owrr89MfJhRkFKdG0BWvvHnNNotD1TbvhM1y5znIgb4=;
 b=F0ZI30gL1G5cvk72rsBGkCDOuIPtgMe8dXBfdVIO1exZpNSMzFCZ1EJfkqL3WA+4Xt
 iuEN+e/qG0nHWk0emyJJyBwy8Rq9JbWqJJcz1H7pmFgaMuU6PzRqvbAKmloZz9jdcmNk
 0NWo8j7AmORDPMutEH2nWzMJUKqsL7eOPpkI96YeYOUNdDQIXSDWciK1XBlyjE9ZgqVK
 XM1Y2+YLi5y1ysY5CZjEUNnZ4l1UJed0G2+yvGgCBViGV+l7z/SFG5b3wjs4nYljDSJo
 FZACCjIjE8SsuYj00qt3ZsLA3nWieOF6LGwSFQhvqfIXTJrXc/NCsl/+4vMGB2S/YXU4
 e6EQ==
X-Gm-Message-State: ACrzQf25dM5D9g3PYYI0n5fjR829Qesco4ZOX+6Av0C1XfzXBxCP5MF3
 KBUeDojPPpiGvi3ukQ0jPW8+SkkwoZjHgov9k+2ZvWRVMOvGBsDSrKHOedx+zhbghYFb7vGanFC
 PPrwGdoab+SxO/S7SfEiiCvPwyhiypA3yDchKyTu0KJZIQF4FjFJqUW6BIK5I
X-Received: by 2002:a5d:5c04:0:b0:234:88dc:3d19 with SMTP id
 cc4-20020a5d5c04000000b0023488dc3d19mr7555900wrb.681.1667220704328; 
 Mon, 31 Oct 2022 05:51:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM74ca/kEZbh4L2DCx2rvj4HEMBxoue6JIdVDMDscgDUHx9Ywat3ZFKHggpIxyzvuGXCXvAEcA==
X-Received: by 2002:a5d:5c04:0:b0:234:88dc:3d19 with SMTP id
 cc4-20020a5d5c04000000b0023488dc3d19mr7555877wrb.681.1667220704036; 
 Mon, 31 Oct 2022 05:51:44 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 m8-20020a7bcb88000000b003c6d21a19a0sm7014394wmi.29.2022.10.31.05.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:51:43 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:51:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 20/86] tests/acpi: allow changes for core_count2 test
Message-ID: <20221031124928.128475-21-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Julia Suvorova <jusual@redhat.com>

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Message-Id: <20220731162141.178443-4-jusual@redhat.com>
Message-Id: <20221011111731.101412-4-jusual@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 tests/data/acpi/q35/APIC.core-count2        | 0
 tests/data/acpi/q35/DSDT.core-count2        | 0
 tests/data/acpi/q35/FACP.core-count2        | 0
 4 files changed, 3 insertions(+)
 create mode 100644 tests/data/acpi/q35/APIC.core-count2
 create mode 100644 tests/data/acpi/q35/DSDT.core-count2
 create mode 100644 tests/data/acpi/q35/FACP.core-count2

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..e81dc67a2e 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/APIC.core-count2",
+"tests/data/acpi/q35/DSDT.core-count2",
+"tests/data/acpi/q35/FACP.core-count2",
diff --git a/tests/data/acpi/q35/APIC.core-count2 b/tests/data/acpi/q35/APIC.core-count2
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/DSDT.core-count2 b/tests/data/acpi/q35/DSDT.core-count2
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/FACP.core-count2 b/tests/data/acpi/q35/FACP.core-count2
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


