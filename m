Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182606136F2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:52:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUHG-0002rs-FP; Mon, 31 Oct 2022 08:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUGZ-0001rK-Q7
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:51:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUGJ-0002I0-V8
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QV55IR7eujU4B3oXa/XKl/tm8iHeHPiunvIEBSbyaF4=;
 b=boYb/pGMon2fFa3LIVw8CzPJcwx6ODbieu9WVjeBr3pp/w7xFsXe0GA5b3lIbbScLvquIE
 a4WnJwcWVqdA4etXRkdCsQpVgM3q6iKZsgsz2WfoRF2oZU+e9TiIbAQq6pAQQNPBxTaE2I
 +Mm/2AUv5kUN889sNKRh+4QMu5/9jtQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-448-1HJznIGrNkyoZiWBtnegHA-1; Mon, 31 Oct 2022 08:51:29 -0400
X-MC-Unique: 1HJznIGrNkyoZiWBtnegHA-1
Received: by mail-wm1-f69.google.com with SMTP id
 d13-20020a05600c34cd00b003ce1f62ac5aso8307662wmq.4
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QV55IR7eujU4B3oXa/XKl/tm8iHeHPiunvIEBSbyaF4=;
 b=jwdAX19cTnwS6jPWtLObkYWeAWMNNiHCCZskK4k4/gRZWQ4RirxMpPDXfZregUs3SA
 rN29FfT8UxZS1IrBSjrGOXeqjeUN/9CT8t8PxNA68/moEguHm6dmzEZKP4w3Kb68NlmD
 t80BBJzaC/lChNNZRPai9f8QLiTgekWEN3y9pZ0uA6UTLexe5WzPoPJoR7+vFUS72nOA
 f1VQ65H0nETby9YfOas1dX/uCehJocOjpI8d7Gq3uT7stv3FkQXRA6mAG6OCZ6FKnXi7
 D08y5WiAxKj5aeZX0VnWX8MPpHeHL0AdKuOAVtPYIbHvTofEys/OGng7L69sMbuUo5bt
 tJbA==
X-Gm-Message-State: ACrzQf20Ef4cxpHfcPJTGHJf0+pKjy2y4cWBAHSwxkB3Pzq160eIYnl/
 +WgxQqd+SObHehsBwVkLZQUdEbORl14oY8Z43d0gsFMb/ie4RH8ZV42BeA35z4bFeh93BMzybNj
 7BtkMyXc9YW3CwcXdDFKOBgy5ioqPKqi7t05oHpcBiMAVjA7mbQB/B6JaC6Km
X-Received: by 2002:a5d:4390:0:b0:236:6e79:3948 with SMTP id
 i16-20020a5d4390000000b002366e793948mr7540950wrq.284.1667220686900; 
 Mon, 31 Oct 2022 05:51:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6GVSjE//F4z+SV7DeUHUjKnWKuByU3l6sRuvY5waq4KDymYPyty8RGpIoICIJGD/ZSVL3iiQ==
X-Received: by 2002:a5d:4390:0:b0:236:6e79:3948 with SMTP id
 i16-20020a5d4390000000b002366e793948mr7540922wrq.284.1667220686553; 
 Mon, 31 Oct 2022 05:51:26 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 o17-20020a05600c4fd100b003a5f3f5883dsm7617661wmq.17.2022.10.31.05.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:51:26 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:51:23 -0400
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
Subject: [PULL 14/86] acpi/tests/avocado/bits: add biosbits config file for
 running bios tests
Message-ID: <20221031124928.128475-15-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


