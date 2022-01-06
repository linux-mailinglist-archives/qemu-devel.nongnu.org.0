Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13194865C9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:07:00 +0100 (CET)
Received: from localhost ([::1]:37048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TPv-0002gz-Vr
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:07:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Si1-00021n-2y
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:21:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Shx-0001k5-JG
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:21:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UtXyrtn+0H59zIz1wAsdY62sOCwJtY4CRpesWdrs1nM=;
 b=O35ivc9piKRw9gchywGYUbToBjI3CYXbEHGNWxhd4g6tCDX2aps842012PlRJti9Ak+eWH
 0vASBY3OFix9AAxx+h/dXwPJoUNNo90i2VudSEg4rboQD3+7mMfkOynW3zQQ9UQ9bmQqWn
 JPzL7Xae9a+o3lStSNol3rr0vNCEaxE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-kFqcSU8mPTyuzVh-hXh8EA-1; Thu, 06 Jan 2022 08:21:31 -0500
X-MC-Unique: kFqcSU8mPTyuzVh-hXh8EA-1
Received: by mail-ed1-f70.google.com with SMTP id
 r8-20020a05640251c800b003f9a52daa3fso1899832edd.22
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:21:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UtXyrtn+0H59zIz1wAsdY62sOCwJtY4CRpesWdrs1nM=;
 b=H1Is0oxY9p4n+2nuc2Q8a9EW6Q3+fg9QHxhODfl6tcwp1VDxAEYFRLJIhlJPRLGkkW
 N6tkJpIxCSSZcD9SNFIAG3xvR/+3vN467HAcfaCOniRtxiL5x2Q0cJby31d5L0pGJAqI
 Wxl4XcOUM43Vv8ShY6T4AW8tAZYOfJN13JknvJtl0UWjqBGqYqxEbUajuJ6CIyHfNlm2
 GbZvDcNuo5Lp1MQ7j5LTgheGv2PQq2xeOPsB+eUWK8lPl/K4QDRN9UCa0LyJQY7kZql4
 lkD48KTtcGSdcnx+BFmD9asy7V0kAPyo4lF/FNRwaXVJ7kxrT/0NmRYqoAF6beRNyQQH
 dbug==
X-Gm-Message-State: AOAM532IfnAkHMNlpbwkE0tN/MRyAhdunSd+nmLTffIQvadt9hWdrCuZ
 Rx94Qwq/bWUrjPiqV5ARtp5zAygE3uOrHL4AoypqL7lA3x8zweyeuB3d/5XLIgSF9x+gk/37NDj
 qdFBTBm0Pp/muG8FLkKFDwnte/Hwdbe9AcjAx8ipcclK5vg5HJJvZo4D+iU5g
X-Received: by 2002:a17:906:824c:: with SMTP id
 f12mr29278169ejx.446.1641475289459; 
 Thu, 06 Jan 2022 05:21:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/ZNX3yAvaKoCqrrRnbr6uzhwlwrcfAle9c46+RQ9p5Igo7wJXfsQmNrfEL65tjqqLOFy2oQ==
X-Received: by 2002:a17:906:824c:: with SMTP id
 f12mr29278153ejx.446.1641475289218; 
 Thu, 06 Jan 2022 05:21:29 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id 1sm495764ejw.175.2022.01.06.05.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:21:28 -0800 (PST)
Date: Thu, 6 Jan 2022 08:21:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 45/52] tests: acpi: add SLIC table test
Message-ID: <20220106131534.423671-46-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

When user uses '-acpitable' to add SLIC table, some ACPI
tables (FADT) will change its 'Oem ID'/'Oem Table ID' fields to
match that of SLIC. Test makes sure thati QEMU handles
those fields correctly when SLIC table is added with
'-acpitable' option.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20211227193120.1084176-4-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 9a468e29eb..e6b72d9026 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1502,6 +1502,20 @@ static void test_acpi_virt_viot(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_slic(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".slic",
+    };
+
+    test_acpi_one("-acpitable sig=SLIC,oem_id='CRASH ',oem_table_id='ME',"
+                  "oem_rev=00002210,asl_compiler_id='qemu',"
+                  "asl_compiler_rev=00000000,data=/dev/null",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_oem_fields(test_data *data)
 {
     int i;
@@ -1677,6 +1691,7 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
         }
         qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
+        qtest_add_func("acpi/q35/slic", test_acpi_q35_slic);
     } else if (strcmp(arch, "aarch64") == 0) {
         if (has_tcg) {
             qtest_add_func("acpi/virt", test_acpi_virt_tcg);
-- 
MST


