Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B1D62038B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:14:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAvO-0006lw-0Z; Mon, 07 Nov 2022 17:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAvA-0006Vr-H5
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:48:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAv8-0001gi-VC
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:48:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QV55IR7eujU4B3oXa/XKl/tm8iHeHPiunvIEBSbyaF4=;
 b=hySaiEn3dn56iel4xRpq/psy3EIyhgkbjUFnOlJERymlq2nyXNf633qsnyBxMeXoybL4GU
 DcT1l/231IxcRfoANyPFUY8eL9WqqfHV1Ztc1n0qzcwVBQLZ+VVllZ4RDxOKbxxVaGAhEc
 H1S/A0wIvIBL1b0ZkOvjRfx9DWwScbs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-207-K1uYFHBaOeuok9g-UdVDNg-1; Mon, 07 Nov 2022 17:48:43 -0500
X-MC-Unique: K1uYFHBaOeuok9g-UdVDNg-1
Received: by mail-qt1-f199.google.com with SMTP id
 f4-20020a05622a114400b003a57f828277so4097447qty.22
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:48:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QV55IR7eujU4B3oXa/XKl/tm8iHeHPiunvIEBSbyaF4=;
 b=Tq9c+6THir9J7Gujzrif4qf9+69ij8FfSoHXwAKLVmHj1OI2T4jnHVTfCWJ0SGs/q1
 Pswr1lyTMibnwphLwtZ8Wv4VPyeeFxpB0VlPcXPapf5vbGsLUVytYFRJsUmI4MZuDlXq
 3Wd5EJeX/zDNQLRKGKd6nK0bRfZR3C2A7rFY0C79mbny13RM0ROT3In8w/XLQm7m0L3K
 1cVHufGOahLG63CdSBFwgciWKXqWcyAl6AFgDTJQtfostPSr1YZy4LwenftnS0lLEkOh
 8DxjRE+GQgE42ZtdeFgCrWwjbLJaDhr2GbxL+9oXka9/mI8iBOmHkNLqB4We7WA/47JP
 52gg==
X-Gm-Message-State: ACrzQf3OmyVzZ7er8g3d2UBNM6o5DbjRAt0fisXwLl/bZCGv9LYHDdqN
 TQH/mKUlZS/pilUaL6Nxw4xCpxJNtKZTdE4o6nUKfG1Be/ulOgNKlCIY8aBsS8tWIY/BCeRqYnE
 UZAnYrPx/ijeM0k+XszTlot18kFAYEdI3jDx1+oTy57JhzekppNT5IQFgwA6B
X-Received: by 2002:a05:622a:5c8d:b0:3a5:1fcb:8326 with SMTP id
 ge13-20020a05622a5c8d00b003a51fcb8326mr36585336qtb.498.1667861321361; 
 Mon, 07 Nov 2022 14:48:41 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6DJAnbQ3J82++Ln7GnYguV8HpHEGeGo0CmITtHaM1dcZrCH9hMZ9NBYBH6K5NNaPIdiI8Oyw==
X-Received: by 2002:a05:622a:5c8d:b0:3a5:1fcb:8326 with SMTP id
 ge13-20020a05622a5c8d00b003a51fcb8326mr36585301qtb.498.1667861321018; 
 Mon, 07 Nov 2022 14:48:41 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 v14-20020a05620a440e00b006fab416015csm6950079qkp.25.2022.11.07.14.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:48:40 -0800 (PST)
Date: Mon, 7 Nov 2022 17:48:34 -0500
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
Subject: [PULL v4 13/83] acpi/tests/avocado/bits: add biosbits config file
 for running bios tests
Message-ID: <20221107224600.934080-14-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
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


