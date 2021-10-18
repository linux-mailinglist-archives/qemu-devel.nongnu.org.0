Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED68743290D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 23:30:05 +0200 (CEST)
Received: from localhost ([::1]:42892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcaCp-0006dS-Hz
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 17:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcaAe-0004rN-2R
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 17:27:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcaAY-0002r7-Hh
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 17:27:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634592460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=qnz3ddsuLkeNXQ5UcNuezViBVj40PhXYoAPj2DQFzuw=;
 b=Wuz22JhiOaPQ2g3iPYegitawDFpNlNW0Lf01w8LPgB5aY3d/9Sul00lHJwMxHPaltyMr05
 O8g2d73arLW+5Oe+LzH0PoDMx9V32ylDitBqz6ruGsIggrZQ+VtAhMke6AJ9igSD9GgrMo
 VULyD+HVnBwlDQB++qE/VtSeJvtVs2I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-ptDZ62aHOdWn1Og1-vHL0A-1; Mon, 18 Oct 2021 17:27:38 -0400
X-MC-Unique: ptDZ62aHOdWn1Og1-vHL0A-1
Received: by mail-wm1-f70.google.com with SMTP id
 v18-20020a7bcb52000000b00322fea1d5b7so459526wmj.9
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 14:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=qnz3ddsuLkeNXQ5UcNuezViBVj40PhXYoAPj2DQFzuw=;
 b=E5y7XNSW/cLZOfK0NinGuGVbFR/8/ECZBfpQjLO7h8xjExMb8/+UF7uR7b/4JKS+hB
 WF3LZPXcPE4O+W53MI9lVivRdBJbBurerw87q+zRTMCAW0Tq3hxm1MnY9OFpBcNOC+PN
 vmBJPDJWDcAMAaqEUfUpaXA+yvLhj4OJi6sxHLn5/D1eCWmvniiMgV7fKWC27FWbJo6X
 OcbOrHOvFiphHqlhWdl/iNMyJbfvRpGJ2XuNgnNCzt8S1RC92xdJmhoG3hOUi8czUQJq
 6u3Ia8GEOS95cc3s2bBfEO+W++HZmxDDgHD+1MT/d4BfmCtC13aO9x2TVgmpqNfNQApu
 MVKg==
X-Gm-Message-State: AOAM5303msnSjTnSNvd3gzG0cGdtHgqxnNQ5p4yIlCSeJhLN9lFpOrgG
 c8UWCxVrgEJkta7jpns604/psuqv+l6HncHj3tQ+QQ1RCKKR0KqNU1vhVR7r6+ebHno3o3QEKci
 F4g0WZ13lkKgoLoOY3E8aMRC/y4aPIMDip97oxllNTXT54WYacWL/rV8WupUz
X-Received: by 2002:a05:6000:1446:: with SMTP id
 v6mr39728404wrx.54.1634592457516; 
 Mon, 18 Oct 2021 14:27:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylTkwikQ5EaaLRScQ+ZhcmywAx1rvO2gentdejx+Now5xE4QJvmwYS3gHw6KhBhI8hY4E1kA==
X-Received: by 2002:a05:6000:1446:: with SMTP id
 v6mr39728383wrx.54.1634592457306; 
 Mon, 18 Oct 2021 14:27:37 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id c204sm530212wme.11.2021.10.18.14.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 14:27:36 -0700 (PDT)
Date: Mon, 18 Oct 2021 17:27:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] rebuild-expected-aml.sh: allow partial target list
Message-ID: <20211018212632.299857-1-mst@redhat.com>
MIME-Version: 1.0
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only rebuild AML for configured targets.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/data/acpi/rebuild-expected-aml.sh | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/tests/data/acpi/rebuild-expected-aml.sh b/tests/data/acpi/rebuild-expected-aml.sh
index fc78770544..dcf2e2f221 100755
--- a/tests/data/acpi/rebuild-expected-aml.sh
+++ b/tests/data/acpi/rebuild-expected-aml.sh
@@ -12,7 +12,7 @@
 # This work is licensed under the terms of the GNU GPLv2.
 # See the COPYING.LIB file in the top-level directory.
 
-qemu_bins="./qemu-system-x86_64 ./qemu-system-aarch64"
+qemu_arches="x86_64 aarch64"
 
 if [ ! -e "tests/qtest/bios-tables-test" ]; then
     echo "Test: bios-tables-test is required! Run make check before this script."
@@ -20,6 +20,26 @@ if [ ! -e "tests/qtest/bios-tables-test" ]; then
     exit 1;
 fi
 
+if grep TARGET_DIRS= config-host.mak; then
+    for arch in $qemu_arches; do
+        if  grep TARGET_DIRS= config-host.mak | grep "$arch"-softmmu;
+        then
+            qemu_bins="$qemu_bins ./qemu-system-$arch"
+        fi
+    done
+else
+    echo "config-host.mak missing!"
+    echo "Run this script from the build directory."
+    exit 1;
+fi
+
+if [ -z "$qemu_bins" ]; then
+    echo "Only the following architectures are currently supported: $qemu_arches"
+    echo "None of these configured!"
+    echo "To fix, run configure --target-list=x86_64-softmmu,aarch64-softmmu"
+    exit 1;
+fi
+
 for qemu in $qemu_bins; do
     if [ ! -e $qemu ]; then
         echo "Run 'make' to build the following QEMU executables: $qemu_bins"
-- 
MST


