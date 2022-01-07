Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438DA4877A1
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 13:33:31 +0100 (CET)
Received: from localhost ([::1]:46326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5oQz-0001bJ-Q9
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 07:33:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n4N-0002Ic-RE
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:06:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n4I-0002cY-BL
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:06:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IyIX4Y52IesbNq4lnMucnk8E/SfIhuYQ0BGXFbD8E9s=;
 b=U+DVlHPvFqWPnQeqz9DB1CP1pDfCu2ISQyuhO2ZRvX1OBtQLNMbzs4AHv2TJreHgUODIXS
 fqrUjsl5tcxJCi6zXXKnAQ8H/rNz7aBWRPliAyGkorRI9fkaSp6EXx6VKh/rEWtPHECSHf
 m4r5OjxBG90uXG5DDsN/fgLKL+a2sBw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-GATO9yNONkuP39yBDieWJg-1; Fri, 07 Jan 2022 06:05:53 -0500
X-MC-Unique: GATO9yNONkuP39yBDieWJg-1
Received: by mail-wr1-f70.google.com with SMTP id
 o28-20020adfa11c000000b001a60fd79c21so428282wro.19
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:05:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IyIX4Y52IesbNq4lnMucnk8E/SfIhuYQ0BGXFbD8E9s=;
 b=jJ85x9FDGhtuutAMbCrIuabtmognW/yMTTRR9Y0TaytOPR+LicpexuRkgRV0Lyf95M
 XeJM8qMcgwC2Jwk0ssw4xMQlv9jXmr/FQsrjrdWcHFizTCSWYgwr169Hll9v/dcWBVB2
 XZ4AKp06X1XHuyGKSUkTbAraIX35Zrj2+ynRfLcc/fI38Slp6S3H83aoAkisMYCUduE3
 xux3KLQSeJCHeU8+Ow+b951G2hro8OZ3z6wRo5nbMWH+oeFv2j+QkuV8yEwMB7Whh+CD
 YuHbN12PgwFChZdWMx7N4JyTsE5hIyi1529IJY1r0bFMLYwzDbwi/jqwzuS/6x3s3N+v
 frIA==
X-Gm-Message-State: AOAM532fldD0x5+peqqFC/huGag0iWU/ehuSd6IIbQyHeYCSceNpysjv
 nZtY2gpZEAOfLBSHM/omnabhb9DeorZSenfEL/+pwzhcIQVuqFQZJAT0HgQnHieyyyxIPVXkXad
 KXV1GIxI8dkcJfO5zvcNI7H5MFiWunHhFPTIBBZ4jrLyI11x5T/rsRUsdftWP
X-Received: by 2002:a5d:64e2:: with SMTP id g2mr23944143wri.690.1641553551838; 
 Fri, 07 Jan 2022 03:05:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjQQjaCY2XpEPUdHpwZkTWkbX7rXsoRa87IP5Mla8GX3U+T9XCaIcSLL6quRTO6+hhtxmz2w==
X-Received: by 2002:a5d:64e2:: with SMTP id g2mr23944127wri.690.1641553551618; 
 Fri, 07 Jan 2022 03:05:51 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id o13sm1323386wrc.111.2022.01.07.03.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:05:51 -0800 (PST)
Date: Fri, 7 Jan 2022 06:05:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 55/55] tests: acpi: Add updated TPM related tables
Message-ID: <20220107102526.39238-56-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
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
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Berger <stefanb@linux.ibm.com>

The updated TPM related tables have the following additions:

   Device (TPM)
   {
       Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
+      Name (_STR, "TPM 2.0 Device")  // _STR: Description String
+      Name (_UID, One)  // _UID: Unique ID
       Name (_STA, 0x0F)  // _STA: Status
       Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
Message-id: 20211223022310.575496-4-stefanb@linux.ibm.com
Message-Id: <20220104175806.872996-4-stefanb@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 8894 -> 8900 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 8894 -> 8921 bytes
 3 files changed, 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 5d80e408d4..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.tis.tpm12",
-"tests/data/acpi/q35/DSDT.tis.tpm2",
diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index 0ebdf6fbd77967f1ab5d5337b7b1fed314cfaca8..fb9dd1f0599afd6b555ea570ecd00a3bb227aa84 100644
GIT binary patch
delta 50
zcmdnzdc>8>CD<k8h!O(><KvB7q6(a@S~2m#PVoZ1lQk6FnOs#T7b=LdgnGI#Zf;Sq
GVgdkr91X<)

delta 45
zcmX@&y3du%CD<iopArKDqxwcJQ3Xza&6xOLr+5MP$r=joO#Uj93l&5+_b6B}0RSYz
B3@!iw

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index dcbb7f0af377425db53130e8ba1c62c09c22e006..00d732e46f5d9d056e557bd026fa30f9db3b8c30 100644
GIT binary patch
delta 70
zcmdnzdefE5CD<k8rV;}KBgaNAQ3Wn9?U?vrr+5J;?a7)7ZcJWklM5BZ#e;Z50(=#W
a^b8bSQp+-vQyDnoLp@y>H@7HQF#!OXcoHoD

delta 46
zcmccVy3du%CD<iopArKD<D-pSq6%F8nlbUgPVoZnnv*pZ+?f1TCKoD*Z(gim#smOL
C=M6sq

-- 
MST


