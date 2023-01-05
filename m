Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F0E65E78A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:19:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMMx-00043Y-S3; Thu, 05 Jan 2023 04:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMv-0003zP-Hk
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:17:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMu-0007gh-4L
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:17:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ybQ5VPM0RQMC9FhQy/98mXEjzu6B6AxIQ5B3/rDG9cY=;
 b=fq2FnLlhpJtFYaQ3CauZT3iBeO+4vCbmv7CJ/gXSZWwbCSIHErxFwfx+P/Smx9PANvsphD
 Hb0dvFMB6X8V6TeBZRZDJ9GeLgZA/0EUywtBaadfy+lXdytrBthKinZBMn+5hK246EKXBN
 GOVop1qvYX1/+/WP2V2E+4tANV6wfMQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-U0zH7TGVN7OKEM0d-GhcuQ-1; Thu, 05 Jan 2023 04:16:58 -0500
X-MC-Unique: U0zH7TGVN7OKEM0d-GhcuQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 e10-20020adf9bca000000b0026e2396ab34so4695656wrc.18
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ybQ5VPM0RQMC9FhQy/98mXEjzu6B6AxIQ5B3/rDG9cY=;
 b=6pr3qNW2SKbHnnB/z4JEqZiR43aqvbjmudX+NIPRrlYCjYTCcq9UHHwi0oZSBkJ+Gd
 zQEW8ZuCg1xtpi61rfnFcE7L4dSB6zfZCE9PFWy3cp8gc8IvIYpuiLBcVTZldmyO4amv
 QG1YEN2maWvncKeJOKHY2Sl5d5yVbP/DrVE6aUKlYcJVxNdOIuP8EeoEqrokvJYHrk88
 RteQ0bL8HH2WWfufcXrsFLiGR0/ZA/HKyOoh61f206yoPcAqdCn/EMv2r0ZoM6adno9I
 1OXAA4EdEaTzjQTXsyQrU0Qm6HGjXQymh9Z/py1FZNkUHBPVWBzhasQ7g/UGhguDriaq
 RQ8g==
X-Gm-Message-State: AFqh2kpj55GCA7YaIDaMZ3uQ2Kv7Lw4eeF/gBUkUkpgsvgpvYpYUqUqI
 vFW9sZVWRUL2V/uFG3YClL8KaFX/TP8L0tjJz3yy1lIEBECdw1Mc1gegM8EKsghkvIZpHkMrkJL
 HAGjObwNcQUQ2mlt2is3Lh0oFKlUozsIYt2g3XCdIXXOk/1kMpYgUYUNmf9E/
X-Received: by 2002:a05:600c:1d28:b0:3d2:1d51:246e with SMTP id
 l40-20020a05600c1d2800b003d21d51246emr39082518wms.9.1672910216698; 
 Thu, 05 Jan 2023 01:16:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXteDmINfxAz4daWAS3hfnTiE8Yenqon/ZRp97xVM6C21rO7k+6UZMLie8qFotwgdw+LZCZHhg==
X-Received: by 2002:a05:600c:1d28:b0:3d2:1d51:246e with SMTP id
 l40-20020a05600c1d2800b003d21d51246emr39082496wms.9.1672910216373; 
 Thu, 05 Jan 2023 01:16:56 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003d2157627a8sm1725148wmq.47.2023.01.05.01.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:16:55 -0800 (PST)
Date: Thu, 5 Jan 2023 04:16:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 47/51] tests: acpi: Add and whitelist *.topology blobs
Message-ID: <20230105091310.263867-48-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

Add and whitelist *.topology blobs, prepares for the aarch64's ACPI
topology building test.

Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Message-Id: <20221229065513.55652-5-yangyicong@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 tests/data/acpi/virt/APIC.topology          | 0
 tests/data/acpi/virt/DSDT.topology          | 0
 tests/data/acpi/virt/PPTT.topology          | 0
 4 files changed, 3 insertions(+)
 create mode 100644 tests/data/acpi/virt/APIC.topology
 create mode 100644 tests/data/acpi/virt/DSDT.topology
 create mode 100644 tests/data/acpi/virt/PPTT.topology

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..90f53f9c1d 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/APIC.topology",
+"tests/data/acpi/virt/DSDT.topology",
+"tests/data/acpi/virt/PPTT.topology",
diff --git a/tests/data/acpi/virt/APIC.topology b/tests/data/acpi/virt/APIC.topology
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/DSDT.topology b/tests/data/acpi/virt/DSDT.topology
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/PPTT.topology b/tests/data/acpi/virt/PPTT.topology
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


