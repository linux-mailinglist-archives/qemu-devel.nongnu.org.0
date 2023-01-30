Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5AC681B57
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:24:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMadC-0002Oy-Si; Mon, 30 Jan 2023 15:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMack-0002K9-Oe
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacj-0006s8-E9
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675109968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JLoKCDlkuDoYykNnQSuCp1f9UhyqQKcBeBFBNwxf4ik=;
 b=C+rHG1HETKYd1h+rK1HOweyhPFT/BVC+ZKqi6HwP4DCTfBW73lcXwggoAMfWBBe2T1STUo
 OFk2xcejHAOJP2nm97pM8xIFEnC9tQZOB5H1RVoyG7OForWWeLxh5guAXRjHnEBmn3OcMU
 XzgKLsQv2qmOeWR2Crfv7eYSj021Ghg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-673-5uHcXql-NWSOjwVvEj5oWw-1; Mon, 30 Jan 2023 15:19:27 -0500
X-MC-Unique: 5uHcXql-NWSOjwVvEj5oWw-1
Received: by mail-ed1-f72.google.com with SMTP id
 w16-20020a056402129000b004a1f1a2e79dso6793093edv.23
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:19:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JLoKCDlkuDoYykNnQSuCp1f9UhyqQKcBeBFBNwxf4ik=;
 b=DczElZU94qUE0gu4G9C+UxBXWsHZc44JznzeqoHBocNrNpJYlk1EsrvDVLUlPN+KQv
 x8Q/9f7yXMxUe46zjvB70s5Uu0W7XyDUmQNi9Kiekn7teeurHkuidYIinz5B8UwxWKsN
 juh9DH4oS8syjgI5E+Z9mp5MpMDR/jIJbNnPjYYuZovayTBFlI72cvvLcQI46hFUXww4
 YVzhi2NXj6OnGr8NJDIgp7JVfC5PfVDAKQUkmv7qG7UrG7IzpR79E9P1yBbuhuNuszMr
 QA00rd3SvH1LGAnM1YRetwTBAaV9qKTsOxkQFH/zdUQBKjmIDaPFIgrlhTFZbrXYd7rg
 W/Ew==
X-Gm-Message-State: AO0yUKXiSFObMDhNEbSD7c0BPjgBUR6jLF8fV61+NSjtkDfx919XlzBR
 mmNTQ6ZiUXA4gg6H7urfX2GKm7tZFSWFukQQ+o3T/5+BQYLWHjAny0RPDcgs7TD6M1z8Mx3meYO
 nsdO0TnUPyyTSa8yh4Q0J0nag5PKyOJMQeHFDJ+lh/s5j455oWFNlWyJCQvXa
X-Received: by 2002:a17:906:c2d3:b0:87b:3d29:2982 with SMTP id
 ch19-20020a170906c2d300b0087b3d292982mr13698445ejb.11.1675109965491; 
 Mon, 30 Jan 2023 12:19:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9t6e86aXUmeo9vELatNmVIZHZil98varbuaLwM/jVY880lft9DP8G6hxOUUjBCDkFuPQKwJA==
X-Received: by 2002:a17:906:c2d3:b0:87b:3d29:2982 with SMTP id
 ch19-20020a170906c2d300b0087b3d292982mr13698429ejb.11.1675109965187; 
 Mon, 30 Jan 2023 12:19:25 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 11-20020a170906318b00b0088a161c232esm710690ejy.172.2023.01.30.12.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:19:24 -0800 (PST)
Date: Mon, 30 Jan 2023 15:19:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 12/56] tests: acpi: cleanup arguments to make them more readable
Message-ID: <20230130201810.11518-13-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
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

From: Igor Mammedov <imammedo@redhat.com>

 no functional change

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-3-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 8608408213..08b8aee76b 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -951,8 +951,7 @@ static void test_acpi_q35_tcg_bridge(void)
     data.variant = ".bridge";
     data.required_struct_types = base_required_struct_types;
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
-    test_acpi_one("-device pci-bridge,chassis_nr=1",
-                  &data);
+    test_acpi_one("-device pci-bridge,chassis_nr=1", &data);
     free_test_data(&data);
 }
 
@@ -962,14 +961,12 @@ static void test_acpi_q35_multif_bridge(void)
         .machine = MACHINE_Q35,
         .variant = ".multi-bridge",
     };
-    test_acpi_one("-device pcie-root-port,id=pcie-root-port-0,"
-                  "multifunction=on,"
-                  "port=0x0,chassis=1,addr=0x2,bus=pcie.0 "
-                  "-device pcie-root-port,id=pcie-root-port-1,"
-                  "port=0x1,chassis=2,addr=0x3.0x1,bus=pcie.0 "
-                  "-device virtio-balloon,id=balloon0,"
-                  "bus=pcie.0,addr=0x4.0x2",
-                  &data);
+    test_acpi_one(
+        " -device virtio-balloon,id=balloon0,addr=0x4.0x2"
+        " -device pcie-root-port,id=rp0,multifunction=on,"
+                  "port=0x0,chassis=1,addr=0x2"
+        " -device pcie-root-port,id=rp1,port=0x1,chassis=2,addr=0x3.0x1",
+        &data);
     free_test_data(&data);
 }
 
-- 
MST


