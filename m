Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282803AD330
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:54:34 +0200 (CEST)
Received: from localhost ([::1]:34230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKZV-0002Ss-7H
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1luKXr-0008GN-JO
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:52:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1luKXp-0006rl-MA
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624045969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UVhZn7YMojulhlwzrmfCSG2QTemvrh0Gyrll7MNL8vE=;
 b=PrECukDp0ISOe3HSUMRZo4C5OmXje1o3ku457kTvN3j8qbSTWa2xfK5n2a6q2JYOPq5gtv
 62s868Tzu77Q/nrb1X3GFBprq6sWNVI+rhzJS1vi6cCmSWKLPDFBtjtQ7tGMUo5krSxNIK
 yymYtZpA4W1LeISKqSl0Kf4lYgYBJwY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-OPq9CZwvPr2fjUX-JvgBdQ-1; Fri, 18 Jun 2021 15:52:47 -0400
X-MC-Unique: OPq9CZwvPr2fjUX-JvgBdQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB8AA800685;
 Fri, 18 Jun 2021 19:52:45 +0000 (UTC)
Received: from localhost (unknown [10.22.9.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A02AF60C57;
 Fri, 18 Jun 2021 19:52:45 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 5/7] docs/interop/firmware.json: Add SEV-ES support
Date: Fri, 18 Jun 2021 15:52:35 -0400
Message-Id: <20210618195237.442548-6-ehabkost@redhat.com>
In-Reply-To: <20210618195237.442548-1-ehabkost@redhat.com>
References: <20210618195237.442548-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tom Lendacky <thomas.lendacky@amd.com>

Create an enum definition, '@amd-sev-es', for SEV-ES and add documention
for the new enum. Add an example that shows some of the requirements for
SEV-ES, including not having SMM support and the requirement for an
X64-only build.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Message-Id: <b941a7ee105dfeb67607cf2d24dafcb82658b212.1619208498.git.thomas.lendacky@amd.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 docs/interop/firmware.json | 47 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
index 9d94ccafa9e..8d8b0be030e 100644
--- a/docs/interop/firmware.json
+++ b/docs/interop/firmware.json
@@ -115,6 +115,12 @@
 #           this feature are documented in
 #           "docs/amd-memory-encryption.txt".
 #
+# @amd-sev-es: The firmware supports running under AMD Secure Encrypted
+#              Virtualization - Encrypted State, as specified in the AMD64
+#              Architecture Programmer's Manual. QEMU command line options
+#              related to this feature are documented in
+#              "docs/amd-memory-encryption.txt".
+#
 # @enrolled-keys: The variable store (NVRAM) template associated with
 #                 the firmware binary has the UEFI Secure Boot
 #                 operational mode turned on, with certificates
@@ -179,7 +185,7 @@
 # Since: 3.0
 ##
 { 'enum' : 'FirmwareFeature',
-  'data' : [ 'acpi-s3', 'acpi-s4', 'amd-sev', 'enrolled-keys',
+  'data' : [ 'acpi-s3', 'acpi-s4', 'amd-sev', 'amd-sev-es', 'enrolled-keys',
              'requires-smm', 'secure-boot', 'verbose-dynamic',
              'verbose-static' ] }
 
@@ -504,6 +510,45 @@
 # }
 #
 # {
+#     "description": "OVMF with SEV-ES support",
+#     "interface-types": [
+#         "uefi"
+#     ],
+#     "mapping": {
+#         "device": "flash",
+#         "executable": {
+#             "filename": "/usr/share/OVMF/OVMF_CODE.fd",
+#             "format": "raw"
+#         },
+#         "nvram-template": {
+#             "filename": "/usr/share/OVMF/OVMF_VARS.fd",
+#             "format": "raw"
+#         }
+#     },
+#     "targets": [
+#         {
+#             "architecture": "x86_64",
+#             "machines": [
+#                 "pc-q35-*"
+#             ]
+#         }
+#     ],
+#     "features": [
+#         "acpi-s3",
+#         "amd-sev",
+#         "amd-sev-es",
+#         "verbose-dynamic"
+#     ],
+#     "tags": [
+#         "-a X64",
+#         "-p OvmfPkg/OvmfPkgX64.dsc",
+#         "-t GCC48",
+#         "-b DEBUG",
+#         "-D FD_SIZE_4MB"
+#     ]
+# }
+#
+# {
 #     "description": "UEFI firmware for ARM64 virtual machines",
 #     "interface-types": [
 #         "uefi"
-- 
2.31.1


