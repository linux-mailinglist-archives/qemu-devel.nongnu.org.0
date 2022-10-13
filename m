Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB655FD59D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 09:40:09 +0200 (CEST)
Received: from localhost ([::1]:58032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oisp6-0007bX-LJ
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 03:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois6A-0005Wl-T1
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois69-0006u4-Ch
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665644020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vPzUD7JjyVy8PFTQACn2r3YXj5SoY9IZjSsTzOKOOs=;
 b=IJO+BCX181pZypKRruk9wbSObeqgDH5nXaYOLm7p36TX7GS/vT559yhgRvsS8APf0n1Zw/
 tkdLE0iRYIsONXp494wDlhpgMADU7ZWpzTrPYbGB9BIhb0IiteE18XHCaPSD0G09hbpQHE
 4tox9JwB+W+fUCgdrUallF+1aNqhUY8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-ujabm6BdOCGcu-COkbT2VQ-1; Thu, 13 Oct 2022 02:53:35 -0400
X-MC-Unique: ujabm6BdOCGcu-COkbT2VQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37946857F8F;
 Thu, 13 Oct 2022 06:53:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9E4B492B0F;
 Thu, 13 Oct 2022 06:53:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 413D418009E5; Thu, 13 Oct 2022 08:52:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PULL 16/26] docs: add firmware feature flags
Date: Thu, 13 Oct 2022 08:52:14 +0200
Message-Id: <20221013065224.1864145-17-kraxel@redhat.com>
In-Reply-To: <20221013065224.1864145-1-kraxel@redhat.com>
References: <20221013065224.1864145-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add new firmware feature flags for the recently added confidential
computing operating modes by amd and intel.

While being at it also fix the path to the amd sev documentation.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>
Message-Id: <20220930133220.1771336-1-kraxel@redhat.com>
---
 docs/interop/firmware.json | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
index 4e049b1c7ca0..56814f02b3c0 100644
--- a/docs/interop/firmware.json
+++ b/docs/interop/firmware.json
@@ -113,13 +113,22 @@
 #           Virtualization, as specified in the AMD64 Architecture
 #           Programmer's Manual. QEMU command line options related to
 #           this feature are documented in
-#           "docs/amd-memory-encryption.txt".
+#           "docs/system/i386/amd-memory-encryption.rst".
 #
 # @amd-sev-es: The firmware supports running under AMD Secure Encrypted
 #              Virtualization - Encrypted State, as specified in the AMD64
 #              Architecture Programmer's Manual. QEMU command line options
 #              related to this feature are documented in
-#              "docs/amd-memory-encryption.txt".
+#              "docs/system/i386/amd-memory-encryption.rst".
+#
+# @amd-sev-snp: The firmware supports running under AMD Secure Encrypted
+#               Virtualization - Secure Nested Paging, as specified in the
+#               AMD64 Architecture Programmer's Manual. QEMU command line
+#               options related to this feature are documented in
+#               "docs/system/i386/amd-memory-encryption.rst".
+#
+# @intel-tdx: The firmware supports running under Intel Trust Domain
+#             Extensions (TDX).
 #
 # @enrolled-keys: The variable store (NVRAM) template associated with
 #                 the firmware binary has the UEFI Secure Boot
@@ -185,9 +194,11 @@
 # Since: 3.0
 ##
 { 'enum' : 'FirmwareFeature',
-  'data' : [ 'acpi-s3', 'acpi-s4', 'amd-sev', 'amd-sev-es', 'enrolled-keys',
-             'requires-smm', 'secure-boot', 'verbose-dynamic',
-             'verbose-static' ] }
+  'data' : [ 'acpi-s3', 'acpi-s4',
+             'amd-sev', 'amd-sev-es', 'amd-sev-snp',
+             'intel-tdx',
+             'enrolled-keys', 'requires-smm', 'secure-boot',
+             'verbose-dynamic', 'verbose-static' ] }
 
 ##
 # @FirmwareFlashFile:
-- 
2.37.3


