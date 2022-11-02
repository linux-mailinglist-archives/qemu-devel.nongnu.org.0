Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD3B61672F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:09:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGIb-0002zb-1C; Wed, 02 Nov 2022 12:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIY-0002vW-3Y
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIW-0002Mx-MK
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QV55IR7eujU4B3oXa/XKl/tm8iHeHPiunvIEBSbyaF4=;
 b=Qlq3kp+P3+7jERRbKCyvdE1w1IViLa0yFCCJoX8abC42UZW+zD/zrgGV5FUv4vRMRUXt8q
 DtVxGkWRVBr5liP6x4PYoAJHSTjdwrvDVfWxhC/1NL17QQPfvu6RiN1YYF2SUXLIHD1TLQ
 /RSzIg/MnJHMzvJIsN7P+bjHoFmd+zE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-XdJzULmKM8-21QNIGgpLWQ-1; Wed, 02 Nov 2022 12:08:58 -0400
X-MC-Unique: XdJzULmKM8-21QNIGgpLWQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 h204-20020a1c21d5000000b003cf4e055442so8093211wmh.1
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QV55IR7eujU4B3oXa/XKl/tm8iHeHPiunvIEBSbyaF4=;
 b=O68H57QhJonIhQ1LQFrwPM2CYPD9Od1UfPfDlFOlSnfbCZiEi0eRScu0g67iOfZqzP
 IUMLKX2BsGDjNKkk2QZBVIhs8Cbn0A0/9ZWW0FNICNxn47kHMTfaldUlxLJPTxCeQHIE
 LXCy0OuDtOVoMhvqORrG5yFKGuKN2FosvZixAsTzth+FU6BDbhUOr2vzEljKaP2fWKCr
 SdldGjKSL4AF+Ia2zjRc4fBM6R9m/snFqGVx7LkH1yr6Ph4yOenfAzSds7m3oxy0aa0h
 IQpcPxUnDR/KvQRIvPDBmG89tjnuFIlKGWEoUxyLD1TisIQoF8UUIoCkrPZRgbSrD5tp
 Mb8A==
X-Gm-Message-State: ACrzQf1yJPh40tVa43+0zQ5+vz5/MuFWamfQV0vi2pfFG4eXfx5LBWeG
 2RSK9DhvurjEs6mkwFW76Ki5UqCuEI8NzZ+m1HaA3eh5aZTBwg81kz9hpkBXE3NeA0oQ33s/fv1
 JVe6pcV1fF1khH1gfvG3PP0XKD0eIZcy6x1eKsnwULqp3xdAjp9uuBZNh/z1g
X-Received: by 2002:a5d:5a14:0:b0:236:c206:f1f9 with SMTP id
 bq20-20020a5d5a14000000b00236c206f1f9mr12652685wrb.694.1667405336266; 
 Wed, 02 Nov 2022 09:08:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6EZsVRNCRVEHOEnsqM5m/w23qdUVzC4o4Igk006Nb8UAl3Kwv3DqYOPuTcGA5b+DrHYAzQrg==
X-Received: by 2002:a5d:5a14:0:b0:236:c206:f1f9 with SMTP id
 bq20-20020a5d5a14000000b00236c206f1f9mr12652639wrb.694.1667405335972; 
 Wed, 02 Nov 2022 09:08:55 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 r2-20020adfe682000000b002365b759b65sm13347452wrm.86.2022.11.02.09.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:08:55 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:08:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Michael Tsirkin <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL v2 13/82] acpi/tests/avocado/bits: add biosbits config file
 for running bios tests
Message-ID: <20221102160336.616599-14-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ani Sinha <ani@anisinha.ca>

This change adds initial biosbits config file that instructs biosbits to run
bios test suits in batch mode. Additionally acpi and smbios structures are also
dumped.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221021095108.104843-5-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 .../avocado/acpi-bits/bits-config/bits-cfg.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 tests/avocado/acpi-bits/bits-config/bits-cfg.txt

diff --git a/tests/avocado/acpi-bits/bits-config/bits-cfg.txt b/tests/avocado/acpi-bits/bits-config/bits-cfg.txt
new file mode 100644
index 0000000000..8010804453
--- /dev/null
+++ b/tests/avocado/acpi-bits/bits-config/bits-cfg.txt
@@ -0,0 +1,18 @@
+# BITS configuration file
+[bits]
+
+# To run BITS in batch mode, set batch to a list of one or more of the
+# following keywords; BITS will then run all of the requested operations, then
+# save the log file to disk.
+#
+# test: Run the full BITS testsuite.
+# acpi: Dump all ACPI structures.
+# smbios: Dump all SMBIOS structures.
+#
+# Leave batch set to an empty string to disable batch mode.
+# batch =
+
+# Uncomment the following to run all available batch operations
+# please take a look at boot/python/init.py in bits zip file
+# to see how these options are parsed and used.
+batch = test acpi smbios
-- 
MST


