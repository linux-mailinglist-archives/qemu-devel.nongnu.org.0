Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADCE434985
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:57:19 +0200 (CEST)
Received: from localhost ([::1]:33396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9Ha-0005st-2Y
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8iC-0004oA-Ey
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8i9-0003mb-9u
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qnz3ddsuLkeNXQ5UcNuezViBVj40PhXYoAPj2DQFzuw=;
 b=LpqKESAomhCJ6TZbbPkz8EvUsezXNI8YSLa6bn6lCDc/JHnypDM0EJqesKFy7ZF2V2VGVX
 udWLkm219gkVNZxDFTUi3n/0G/8C7QeWyjaIgjz4kf6JEcnRPK3JdPOeWYIgzJDZCKjw3z
 TzGThK6sx0Imjn8h7iFBgBiwCO9sZTA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-oO9aU9phN9mrahf_wSvVaA-1; Wed, 20 Oct 2021 06:20:39 -0400
X-MC-Unique: oO9aU9phN9mrahf_wSvVaA-1
Received: by mail-ed1-f71.google.com with SMTP id
 l10-20020a056402230a00b003db6977b694so20506448eda.23
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qnz3ddsuLkeNXQ5UcNuezViBVj40PhXYoAPj2DQFzuw=;
 b=cp3MjCqPl4bPr5cML6mNda80s2a72Y0DCx+lHHM3yemIB78pqNzRT9XPpk1IPYEGDN
 WvPjCYy9ZUP/nTwXNBMk3vuZhnFcOo7wGDS0OjFs/tq8xtvBa4F6CkaUNVJyFra46Ah1
 z1rraI22u1h3msQh2pCZtWyvSmsIxYtcGocHl0vZyk1Hm35Vj1X3y54oUHuATVa66Oh4
 gn9KYfnXzzbzin0jCIPhQNqsLZY1+lFRLQ2/di7SFW7Yajeb9T06dzK0sY3B5KYwVPjO
 zJ3n0U406MAFwswtjH+FOLGsB9luDLMdSO3grH78Uuz62h4qI5xpu0yEsSfKZ+v3yIkG
 KNeg==
X-Gm-Message-State: AOAM53292JSqFx0N1S11Z/tqKHRIlOqCuOUdsOcgxGAFvwnDY0NNLQeX
 Rf96aqZi7ijNPdmZ3NGyxNT6GKTZ0u0WfacU0Z4vk/bEOtMwWGOlAh1jUul0y6+x08j16e0onUn
 kdiSeT0NJzvL7CeRFEzJUyq7I2ATH10UkdT6+UwRvy3e6y25ogQso4cKXQHeD
X-Received: by 2002:a17:906:1290:: with SMTP id
 k16mr45500029ejb.566.1634725237978; 
 Wed, 20 Oct 2021 03:20:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYrd8OF9qpnel84m84xay2dwpgbP4B/SRxvdFw2zCQEIk70Hm+hPK0o6IOWFVxnxnMmXa34A==
X-Received: by 2002:a17:906:1290:: with SMTP id
 k16mr45499994ejb.566.1634725237732; 
 Wed, 20 Oct 2021 03:20:37 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id u16sm824396ejy.16.2021.10.20.03.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:37 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 29/44] rebuild-expected-aml.sh: allow partial target list
Message-ID: <20211020101844.988480-30-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
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
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
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


