Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB8F4AAEA3
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 10:44:20 +0100 (CET)
Received: from localhost ([::1]:60948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGe5j-0000Kj-5m
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 04:44:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzs-00009U-K8
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzn-0003f4-78
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ALRDgS1o8czRYC4IeFcfTwDqPAZgH2apoiLtTHvcCYM=;
 b=MufczOmqgyqQ3gNUquGfexLL4PJiN2mpTtkyZuf95noYEJ7SG75aE/SD+Lg9fTOEwu6oVp
 cscFVf+CCK0oSDA0ylDeco1mwr5WuVRtbyDRpnFH5T4Of1OQ+MbI39bLmPmuI+XmBCkVL2
 TDlafkldKBBOLC6K2pqe7pa3bh9zNdI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-9foYImM_NtKHpSS81m5gKQ-1; Sun, 06 Feb 2022 04:38:05 -0500
X-MC-Unique: 9foYImM_NtKHpSS81m5gKQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 h82-20020a1c2155000000b003552c13626cso5868818wmh.3
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ALRDgS1o8czRYC4IeFcfTwDqPAZgH2apoiLtTHvcCYM=;
 b=74L8J14vfzztpUhmTYmql6TKwzG0Z7rbwBYhoS2KFQ42jk2tgyNHQo+zS7fkr4LXDV
 UfszCe3LPl6BxY96BmhssLyERybGYrq02Gy5bElmN5UjoFZQOcvrep5+qu2Qqdosjt8B
 SVCRqpx3RhrRl5pTwIlJf1Xtj5myTGa8zpmiC9kWOPrt//OWlhYqjq2HF2zE+F9xLgVZ
 rLinC5hD/OuIY2ZlKBJcrf99M6l6Mgx1bJlML9O62iSSHmZUpYzedxdkeatnHURuOL/H
 3cot1rp06hoRZrplj4ja2QoKwDMfa+zGhfEpz4EW0vbTPgZ+jlvIcJr8yGRI2fyVqL/x
 X+bg==
X-Gm-Message-State: AOAM533zyCcM0Ui5JzqP0QJG/m5xDjhyspqnSxm1jJ+9ggRG6P/IelAC
 TxienRlqsGaBitKorsDpuaOArNlgI4VE+h/ba9miXpF4YqHBmo3PBhVF//eO3G2C2V1ZZQBja/C
 NfqTCDuzvfm7abrE9VNbq5K6VtYShHDTUnp8rBIlM+okkSGXD72PQWUt/YUrZ
X-Received: by 2002:a5d:588c:: with SMTP id n12mr4978188wrf.529.1644140284202; 
 Sun, 06 Feb 2022 01:38:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyR9YNauYAWY0Cf9sClLDTJpSaoc42AVCmYG65wCyC3RHxIxL5wkyWYQZ2CYv3rhu95VX97bw==
X-Received: by 2002:a5d:588c:: with SMTP id n12mr4978171wrf.529.1644140283910; 
 Sun, 06 Feb 2022 01:38:03 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id l29sm10218404wms.1.2022.02.06.01.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:38:03 -0800 (PST)
Date: Sun, 6 Feb 2022 04:38:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 06/24] tests: acpi: update expected blobs
Message-ID: <20220206093702.1282676-7-mst@redhat.com>
References: <20220206093702.1282676-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220206093702.1282676-1-mst@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Expected changes caused by previous commit:

nvdimm ssdt (q35/pc/virt):
  - *     OEM Table ID     "NVDIMM  "
  + *     OEM Table ID     "NVDIMM"

SLIC test FADT (tests/data/acpi/q35/FACP.slic):
  -[010h 0016   8]                 Oem Table ID : "ME      "
  +[010h 0016   8]                 Oem Table ID : "ME"

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220112130332.1648664-5-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 tests/data/acpi/pc/SSDT.dimmpxm             | Bin 734 -> 734 bytes
 tests/data/acpi/q35/FACP.slic               | Bin 244 -> 244 bytes
 tests/data/acpi/q35/SSDT.dimmpxm            | Bin 734 -> 734 bytes
 tests/data/acpi/virt/SSDT.memhp             | Bin 736 -> 736 bytes
 5 files changed, 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 7faa8f53be..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/SSDT.memhp",
-"tests/data/acpi/pc/SSDT.dimmpxm",
-"tests/data/acpi/q35/SSDT.dimmpxm",
-"tests/data/acpi/q35/FACP.slic",
diff --git a/tests/data/acpi/pc/SSDT.dimmpxm b/tests/data/acpi/pc/SSDT.dimmpxm
index a50a961fa1d9b0dd8ea4096d652c83bcf04db20b..ac55387d57e48adb99eb738a102308688a262fb8 100644
GIT binary patch
delta 33
ocmcb|dXH5iIM^lR9uortW0;e_vq!LkUzm%huP+0`Mu}rg0HzrUKL7v#

delta 33
ocmcb|dXH5iIM^lR9uortqnMMwvq!LkUzm%hudjl_Mu}rg0HV1GKL7v#

diff --git a/tests/data/acpi/q35/FACP.slic b/tests/data/acpi/q35/FACP.slic
index 891fd4b784b7b6b3ea303976db7ecd5b669bc84b..15986e095cf2db7ee92f7ce113c1d46d54018c62 100644
GIT binary patch
delta 32
lcmeyu_=Qoz&CxmF3j+fK^CjmX$6yZyUsoUp2qsG00RW!Z2#x>%

delta 32
kcmeyu_=Qoz&CxmF3j+fKvygL;W3Y#Uud4zWOq93-0G2oijsO4v

diff --git a/tests/data/acpi/q35/SSDT.dimmpxm b/tests/data/acpi/q35/SSDT.dimmpxm
index 617a1c911c7d6753bcedc8ecc52e3027a5259ad6..98e6f0e3f3bb02dd419e36bdd1db9b94c728c406 100644
GIT binary patch
delta 33
ocmcb|dXH5iIM^lR9uortqnnezvq!LkUzm%huP+0`Mu}rg0Ho;&F8}}l

delta 33
ocmcb|dXH5iIM^lR9uortBb$@Ivq!LkUzm%hudjl_Mu}rg0HKKqF8}}l

diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.memhp
index e8b850ae2239d8f496b12de672c2a1268e2f269d..375d7b6fc85a484f492a26ccd355c205f2c34473 100644
GIT binary patch
delta 33
ocmaFB`hZm;IM^lR0TTlQqrH>Avq!LkUzm%huP+0`Mu`(l0HqiSFaQ7m

delta 33
ocmaFB`hZm;IM^lR0TTlQ<9{cAXOCb7zc3e1Uta}<jS?rA0JOLYFaQ7m

-- 
MST


