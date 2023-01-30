Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A04681B84
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:30:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMagv-0008Jq-8B; Mon, 30 Jan 2023 15:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMae3-0005Vv-QS
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMae2-0007Mt-4K
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PUTmNaNPrIBmL0zdKLv2LO9Pfe0+/5WWqxxFuqpAjXQ=;
 b=Ab8K2vlzcYivZxXNlJ6wSq+jzk/9Tvi8z2lEyqMKjLedxCp5r0Ndh1fLlYOnSN8i0MBPb3
 EMnM7ba2jBPs1j4YKfrA931YaM2RWWXC+mvp9MWSXmQxukUg1zJLFBSKoPhhZ+UGBzsexp
 CnQawzX71oqEh/z9UtGi2qxCb55RrW4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-D8f_ph28OEyGrxelD3f2hA-1; Mon, 30 Jan 2023 15:20:48 -0500
X-MC-Unique: D8f_ph28OEyGrxelD3f2hA-1
Received: by mail-ej1-f70.google.com with SMTP id
 gz8-20020a170907a04800b0087bd94a505fso5691446ejc.16
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PUTmNaNPrIBmL0zdKLv2LO9Pfe0+/5WWqxxFuqpAjXQ=;
 b=NcjSBidFPV2Sm+ZkQDBf8EGtAxk7sTqCn0fFNBm0ssiFI7yoheieFWjdRbF33TIOOT
 qh3TqOkNFOtEdtsNXDcG/2UPDtEORU+RwnBwWya7bboNpCXuHDAnGWzv7sgl+zjb83zj
 cady20TGoXOFsu87hgeYpzCCQoZ6A6V0s1QZaLw7u6alrLmOdATEuzF5BmmsfwOVwJWN
 kZ/aORLVplZbMV5M33LZpPkXfmTJzu/yRCVlBktde2s30Ol2qzbuWdBFBWzm+qz0kI/H
 1wkee93slUtrhtqc5hPfHl+HoB5Y+rD1eHrIMEqwznp0xxRT1GE+il+BGxnuvVvJZLuV
 gtGw==
X-Gm-Message-State: AFqh2kom7WDxvVy2yiSgXVZs95zfbxoqnPNKoq6KHkWGGGOGCnsafiAd
 J/jYVfZ2REYQ1BigHDTeLD3gSZt5t8xNEZHlxPB95E5XFJ4Mc4T9U+p+qpL/B30NOKjKoKlSiFx
 VyrtIy3DSzXNr27Krqc5thwy/N0Muf3/Zg14SOs1PQvOAbyYczkIDDIwm+6ua
X-Received: by 2002:a05:6402:3709:b0:49e:baf:f6e9 with SMTP id
 ek9-20020a056402370900b0049e0baff6e9mr60608099edb.9.1675110046354; 
 Mon, 30 Jan 2023 12:20:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvJjsNKC5cCBBzlGGZ5PZmaorwEBV5HOQbOQGDeU4dTrvyP1qB2NSa3DYv87TJS4fedmZAy5A==
X-Received: by 2002:a05:6402:3709:b0:49e:baf:f6e9 with SMTP id
 ek9-20020a056402370900b0049e0baff6e9mr60608079edb.9.1675110046131; 
 Mon, 30 Jan 2023 12:20:46 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 a6-20020a509b46000000b0049e65e4ff20sm7306963edj.14.2023.01.30.12.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:20:45 -0800 (PST)
Date: Mon, 30 Jan 2023 15:20:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 36/56] tests: acpi: update expected blobs
Message-ID: <20230130201810.11518-37-mst@redhat.com>
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

previous commit added endpoint devices to bridge testcases,
which exposes extra non-hotpluggable slot in DSDT on bus where
hotplug is not available.
It should look like this (numbers may vary):

+            Device (S28)
+            {
+                Name (_ADR, 0x00050000)  // _ADR: Address
+            }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-27-imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3064 -> 3081 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 9758 -> 9775 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 11458 -> 11475 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 12358 -> 12375 bytes
 5 files changed, 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 571f14fd59..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT.roothp",
-"tests/data/acpi/pc/DSDT.hpbrroot",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.multi-bridge",
diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index 578468f4f00a9373366c92926b512c192dd6675b..a71ed4fbaa14be655c28a5e03e50157b4476e480 100644
GIT binary patch
delta 53
zcmew%-YLQ566_Mf$-}_Fcyc4xJx(r1rI`3&r+5KR#m%2M*_Z^QoA`r`4B|QB9bJNe
Hs#q8RhyD!~

delta 35
qcmeB__#w{a66_N4gPVbYQFkNPJx(qM#hCbDr+5Jmh0UKh*_Z&l3JL`P

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index fe502ed97751950cc245d728c873065f062c76b2..d58f4d2f0adbb86f8f6403a1cf9b13e1cabed035 100644
GIT binary patch
delta 58
zcmbQ|v)+fxCD<iIUyXr*apFd<a&GR<`HV5~!A|i44f8kmaNm^_jBer&HZq9kh<9`e
O;$dK5VVIn$x)lHc9T3U@

delta 40
wcmZ4QGtY<1CD<iIPK|+q@##jca&GR9d5kgf!A|i4{c|_>aNm`jT&21d00Qm}$^ZZW

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index c38b121ad90ecb896a906a50340ad5bd7d5453f9..3a01bb196b047b875be07be28d07f3139716e82f 100644
GIT binary patch
delta 56
zcmX>Uc{!5HCD<k8vJL|SqxMFwMma8*J2COWPVoXhw>M9f^W)*?4>q)j=ZJT73F2X3
MU}o6-Q0pNh002i2`~Uy|

delta 40
wcmcZ{c_@<0CD<k8kPZU_<CKkDjdEPhw`1aio#F+&Z*86`=f|`8i`IQc042K)+W-In

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index 52c1d3102b59fe3c1d10fdcfca761722d54d2c40..e6b64345e822fa632126cbc63dcdec3bf3835580 100644
GIT binary patch
delta 57
zcmX?>a6N&`CD<h-+<<|B@$E*gMmg?ACdQcfV5fM24#v&X<W}+V^9LJQ#B;<ux&-ks
NFt9Rgw$tTc1_1Q74-NnT

delta 41
xcmcbfa4dn#CD<jz&47V{F>)hUqa1ewBV$Z_uv5H1JHzH_a;x|@2kNph0{{nL3+(^^

-- 
MST


