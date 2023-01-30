Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC18681B6C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:27:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMadf-0004F9-WE; Mon, 30 Jan 2023 15:20:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadU-0003UK-Sv
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadS-00077W-Cl
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AohUTWfRo/Xw5AaCz9fE2dRmICs29JcF+Q2hBq98uEc=;
 b=QfG0cGzK7SUXOiRTXoACXzE3Uxh5oEhgrgsQlx5Q6Nym6BnVYGswF4BXPF7K66qyqok50l
 DtQ0d6gTDpOsVo6eLtBT3RVw/Ae8knImxuc9XrRetK76J9YyD3aSOOeYB+XZ8Cefm2KO4/
 8jAZyMq8O4NRxeV4J4OvkO2DVf/qR18=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-zBVTerWzPJmT-bDvG20TtQ-1; Mon, 30 Jan 2023 15:20:12 -0500
X-MC-Unique: zBVTerWzPJmT-bDvG20TtQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 sa8-20020a170906eda800b0087875c99e6bso7454654ejb.22
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:20:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AohUTWfRo/Xw5AaCz9fE2dRmICs29JcF+Q2hBq98uEc=;
 b=z7+3jqoB2LLaML7JokrLrigTEKPdsrdh4OkZe5Yh6lMVqFtFDos8WostL9lXO2zhOp
 WxAPSUCJ1SiWxmWgDiQTVBGJpXr7kijamWr/aCL+hEr4g9AXWLvPUI2trRYLnS4oacND
 wde0xTcL6ssLa929r32RtcIPZWzkDu8P7mtb8YIwA262iIApuZtmrUOOg1oZSYQT+XID
 b3Dg1vtL4U2GoN4KWmJ/pjKCsPT3A0D7OxDmaDC2NYlCMPGGoZIwkDZM1UJykobYViL0
 kbMW1Wc4EYg/uC+7JhMLlGXjT0usFk1aUVWoQcuTXsGYbyYW2rPvqDRwDZwWIrTVox+T
 Ws7g==
X-Gm-Message-State: AO0yUKWJYSolloHyOPSNlToAwM5UpezG52y+ah9QUhYrHCaZaiXY1oSk
 gkWargBdFtuL/M/Ek87ciOtCnqyUwNWoYYNlQPEGiadGbpkVYL+NJ1+BRTXGeEhYSR9drK2ocD7
 zWAokXi/00q45dTklOoE2kLfsYstmUYrM92HHZpmShToolCkSIwi8LpYujdUd
X-Received: by 2002:a17:906:26d8:b0:878:47d2:6f3d with SMTP id
 u24-20020a17090626d800b0087847d26f3dmr19198620ejc.48.1675110010629; 
 Mon, 30 Jan 2023 12:20:10 -0800 (PST)
X-Google-Smtp-Source: AK7set/wfSQasBsFhGBhONWvg6roQHRm2YVXO9mzUT55T4z8yfQyWShrgWPmOWY2AzoJudkZLVPRXw==
X-Received: by 2002:a17:906:26d8:b0:878:47d2:6f3d with SMTP id
 u24-20020a17090626d800b0087847d26f3dmr19198608ejc.48.1675110010422; 
 Mon, 30 Jan 2023 12:20:10 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 ja3-20020a170907988300b008818d9e0bfesm4634465ejc.117.2023.01.30.12.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:20:09 -0800 (PST)
Date: Mon, 30 Jan 2023 15:20:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 26/56] tests: acpi: add reboot cycle to bridge test
Message-ID: <20230130201810.11518-27-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
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

From: Igor Mammedov <imammedo@redhat.com>

hotplugged bridges should not be described in DSDT,
while it works on cold boot, some ACPPI PCI code
are invoked during reboot.

This patch will let us catch unexpected AML if hotplug
checks are broken.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-17-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index b65e864a9c..a8c17461c8 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -812,7 +812,7 @@ static void test_vm_prepare(const char *params, test_data *data)
     g_free(args);
 }
 
-static void process_acpi_tables(test_data *data)
+static void process_acpi_tables_noexit(test_data *data)
 {
     test_acpi_load_tables(data);
 
@@ -831,7 +831,11 @@ static void process_acpi_tables(test_data *data)
         SmbiosEntryPointType ep_type = test_smbios_entry_point(data);
         test_smbios_structs(data, ep_type);
     }
+}
 
+static void process_acpi_tables(test_data *data)
+{
+    process_acpi_tables_noexit(data);
     qtest_quit(data->qts);
 }
 
@@ -883,6 +887,11 @@ static void test_acpi_piix4_tcg_bridge(void)
     qtest_qmp_send(data.qts, "{'execute':'cont' }");
     qtest_qmp_eventwait(data.qts, "RESUME");
 
+    process_acpi_tables_noexit(&data);
+    free_test_data(&data);
+
+    /* check that reboot/reset doesn't change any ACPI tables  */
+    qtest_qmp_send(data.qts, "{'execute':'system_reset' }");
     process_acpi_tables(&data);
     free_test_data(&data);
 }
@@ -1005,6 +1014,11 @@ static void test_acpi_q35_multif_bridge(void)
     qtest_qmp_send(data.qts, "{'execute':'cont' }");
     qtest_qmp_eventwait(data.qts, "RESUME");
 
+    process_acpi_tables_noexit(&data);
+    free_test_data(&data);
+
+    /* check that reboot/reset doesn't change any ACPI tables  */
+    qtest_qmp_send(data.qts, "{'execute':'system_reset' }");
     process_acpi_tables(&data);
     free_test_data(&data);
 }
-- 
MST


