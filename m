Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E27662033E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:05:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAzg-0005BK-BH; Mon, 07 Nov 2022 17:53:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAzM-000547-T7
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:53:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAzL-0000SS-A4
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:53:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KQnLVqea2wFTICHVFiJPOa9KHgVlieN3khJktynKO5U=;
 b=RP6eBtT3zw2KH+6Qj4KZJLngV620VhaxSLOitsKVHK2JwrrVlhs2G1uFXUJqKeUlChjfC+
 Nft3YuR/HbYRNxGYwVdZ1r20TN2ZfyHmw/bN6mNnF1Ei92VhC6JddDuQga474glv8Bx8Bn
 gJ3/BRQwyL5wws1Buwo6kFMcoB+/eWQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-QrQBtAEbMxu6IAytun9NAw-1; Mon, 07 Nov 2022 17:53:05 -0500
X-MC-Unique: QrQBtAEbMxu6IAytun9NAw-1
Received: by mail-qt1-f197.google.com with SMTP id
 y19-20020a05622a121300b003a526e0ff9bso9122710qtx.15
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:53:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KQnLVqea2wFTICHVFiJPOa9KHgVlieN3khJktynKO5U=;
 b=0af+Ck3vZvfp2Cmmik0wTwuyvFcOP5HqFYMY5+7BO0Sgq9LzhxyargeYmu4WjqdGHx
 H0EsDF/tNnwXwwVczaVEQz0yn59Vv9oarpl6MjwGJ3hBnmEJSNnlv84II2C51tz3Hgz4
 QUvaq20MK6fhrA2nyEeSnfO4WXWCP8EVX4+qTQIUlPIh6i2aBdhgNfEP+QsBMEkn423V
 bRR7a8kOV2He2a7EROWI3tf76KztsstcMsyM+gXiejzBfFYoVUBIjVizgpruz3u7pwhj
 pxlbovEpqq3fs3gFubVGG60bBiF3vP3fWs7riD8PolXi6nXgxSEBFZE7J8aQ2z3MAf+z
 F5zQ==
X-Gm-Message-State: ACrzQf3bH/0TzSLW+dqlnNfoWA46albSYTo866z68WfP+l155IQm5esP
 NGRulYIIFWSOFGYi59NCANjCFfuHT+6XaPSznxL5tbfjqDeevobIgmIN52ZTLdRMmPxTiRM4grl
 dCChmX9taFFwXM85f99sD0S2YP/AM6lq822ytv48+d9bOm6d8bIppGZh5ZOk9
X-Received: by 2002:ac8:7c49:0:b0:3a5:7591:f379 with SMTP id
 o9-20020ac87c49000000b003a57591f379mr11693405qtv.557.1667861584800; 
 Mon, 07 Nov 2022 14:53:04 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6Bjjx1Nlkkl03Pe9I6k89LTCy05V+77Z8OYLEEJmxOrDHgSRE1rxg6YALLaBktU5gZZD9kAQ==
X-Received: by 2002:ac8:7c49:0:b0:3a5:7591:f379 with SMTP id
 o9-20020ac87c49000000b003a57591f379mr11693389qtv.557.1667861584494; 
 Mon, 07 Nov 2022 14:53:04 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 fv19-20020a05622a4a1300b0039c37a7914csm6908280qtb.23.2022.11.07.14.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:53:04 -0800 (PST)
Date: Mon, 7 Nov 2022 17:53:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v4 66/83] tests: Add HMAT AArch64/virt empty table files
Message-ID: <20221107224600.934080-67-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
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

From: Hesham Almatary <hesham.almatary@huawei.com>

Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
Message-Id: <20221027100037.251-6-hesham.almatary@huawei.com>
Tested-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
 tests/data/acpi/virt/APIC.acpihmatvirt      | 0
 tests/data/acpi/virt/DSDT.acpihmatvirt      | 0
 tests/data/acpi/virt/HMAT.acpihmatvirt      | 0
 tests/data/acpi/virt/PPTT.acpihmatvirt      | 0
 tests/data/acpi/virt/SRAT.acpihmatvirt      | 0
 6 files changed, 5 insertions(+)
 create mode 100644 tests/data/acpi/virt/APIC.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/DSDT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/HMAT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/PPTT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/SRAT.acpihmatvirt

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..4f849715bd 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,6 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/APIC.acpihmatvirt",
+"tests/data/acpi/virt/DSDT.acpihmatvirt",
+"tests/data/acpi/virt/HMAT.acpihmatvirt",
+"tests/data/acpi/virt/PPTT.acpihmatvirt",
+"tests/data/acpi/virt/SRAT.acpihmatvirt",
diff --git a/tests/data/acpi/virt/APIC.acpihmatvirt b/tests/data/acpi/virt/APIC.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/DSDT.acpihmatvirt b/tests/data/acpi/virt/DSDT.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/HMAT.acpihmatvirt b/tests/data/acpi/virt/HMAT.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/PPTT.acpihmatvirt b/tests/data/acpi/virt/PPTT.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/SRAT.acpihmatvirt b/tests/data/acpi/virt/SRAT.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


