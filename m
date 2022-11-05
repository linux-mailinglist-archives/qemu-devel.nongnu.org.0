Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFC161DC82
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:35:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMn7-0006pG-HO; Sat, 05 Nov 2022 13:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmC-0006PF-KA
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmB-0007Kh-4e
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QV55IR7eujU4B3oXa/XKl/tm8iHeHPiunvIEBSbyaF4=;
 b=YCXKGuq34opr0JBCuCPifVnmiTu1kQe6uevaOqqFghglQUhF/Jlu28L6b1LIa+q2k4yLtl
 o0KnFO1Rkmf1dFs/Wm4KvuiyA5t67um2GQUqqkYmte3CDAjVy4ZewrtZdymhW7fpI5/sqc
 P/mlRKj3t0lnKOrV8KfZjEhJKhvxAcc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-253-UWgrcNIOMUCVcuqBPdl_Ug-1; Sat, 05 Nov 2022 13:16:09 -0400
X-MC-Unique: UWgrcNIOMUCVcuqBPdl_Ug-1
Received: by mail-wm1-f71.google.com with SMTP id
 c5-20020a1c3505000000b003c56da8e894so6015997wma.0
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QV55IR7eujU4B3oXa/XKl/tm8iHeHPiunvIEBSbyaF4=;
 b=bw9U5yFYMEVOZoCCDwuQbcZWRSQtttPQilI7+o3zxUf20A0c5cwU4tt+3T549u2kkE
 axQxeJ4GFwLpF4Wj7T4sB/FPfnF1vpB47fGEZYfGJ7I6ezNWOBB4Pmq1LgPSbU08A1eo
 E9YF0YirSMQ4gPjQOIIpSdeQ5R0vW8G9uxyz7BSxAq3beC/hQR/1AOS6MqsGl4+EyuWb
 ybzuzI4tO4fEJmsIepetZqrIVbZ7BoPTFqSci1zrSyp4vtaUfs51R9U6Ubx2Cf8gH9II
 MxPX33uSHoZNAksfBUqjkNn7jDIdI2SR52J1EjFvpv9Wsp3iN9wo82gMtxcsN8PvcQ95
 bdAg==
X-Gm-Message-State: ACrzQf0R2av4vQd2knBKmQU+xMQVg9NWCkqBnHJGyClYSq8K7TiQPCI+
 zkGmqb+OMRWW42I8qiD0bcFvMpd7Pv/2XdG9TrE+e+yetHHNuenPGlmcosJ95cA605oQag47lnF
 FvkjqP+y/Ow2Y5f/eM69MpNjA2/CJj+VYHfwUGGbz/vrw94vetawr8REZWA5L
X-Received: by 2002:a05:600c:3546:b0:3cf:a18e:12e5 with SMTP id
 i6-20020a05600c354600b003cfa18e12e5mr2146235wmq.112.1667668566871; 
 Sat, 05 Nov 2022 10:16:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Vr2ZLoDcVaYHHSVX1d14sGfNDBErb/fkMfYzM+4oX1YcsUVH+g1a9f/euysaKyfsxEMGTow==
X-Received: by 2002:a05:600c:3546:b0:3cf:a18e:12e5 with SMTP id
 i6-20020a05600c354600b003cfa18e12e5mr2146213wmq.112.1667668566513; 
 Sat, 05 Nov 2022 10:16:06 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 f19-20020adfb613000000b0022dc6e76bbdsm2594867wre.46.2022.11.05.10.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:16:05 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:16:03 -0400
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
Subject: [PULL v3 13/81] acpi/tests/avocado/bits: add biosbits config file
 for running bios tests
Message-ID: <20221105171116.432921-14-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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


