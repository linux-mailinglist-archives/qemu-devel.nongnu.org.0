Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4504A4966
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:33:50 +0100 (CET)
Received: from localhost ([::1]:43512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEXkb-0008Vf-JX
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:33:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEWDr-0002Gv-TP
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 07:55:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEWDp-0005DT-A8
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 07:55:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643633752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DhvL74TPk5QRnhocvrsyDbCviNLrhlJC+DaukOM4lhQ=;
 b=Rcv64mQDOs0304Kc4jiwu8TvFR7q03A08/8nGy1AqusxmfFd84lQsllPyqtXI59NA7/E2c
 E5EFkhuHq4x6hBcWIc8BTuwfbkc2emuM4xLqGqSHjrt12dDI8p7CyiXeifuBNaRM6M1fRW
 PLF/6bp0W3impGAHcSUcMUDMwc5U6nc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-MxLUfBSLOY-EJ7h4yHb3hg-1; Mon, 31 Jan 2022 07:55:45 -0500
X-MC-Unique: MxLUfBSLOY-EJ7h4yHb3hg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E85E61006AC6;
 Mon, 31 Jan 2022 12:55:40 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 688117DE2C;
 Mon, 31 Jan 2022 12:55:11 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] docs: expand firmware descriptor to allow flash without
 NVRAM
Date: Mon, 31 Jan 2022 12:55:09 +0000
Message-Id: <20220131125509.170307-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current firmware descriptor schema for flash requires that both the
executable to NVRAM template paths be provided. This is fine for the
most common usage of EDK2 builds in virtualization where the separate
_CODE and _VARS files are provided.

With confidential computing technology like AMD SEV, persistent storage
of variables may be completely disabled because the firmware requires a
known clean state on every cold boot. There is no way to express this
in the firmware descriptor today.

Even with regular EDK2 builds it is possible to create a firmware that
has both executable code and variable persistence in a single file. This
hasn't been commonly used, since it would mean every guest bootup would
need to clone the full firmware file, leading to redundant duplicate
storage of the code portion. In some scenarios this may not matter and
might even be beneficial. For example if a public cloud allows users to
bring their own firmware, such that the user can pre-enroll their own
secure boot keys, you're going to have this copied on disk for each
tenant already. At this point the it can be simpler to just deal with
a single file rather than split builds. The firmware descriptor ought
to be able to express this combined firmware model too.

This all points towards expanding the schema for flash with a 'mode'
concept:

 - "split" - the current implicit behaviour with separate files
   for code and variables.

 - "combined" - the alternate behaviour where a single file contains
   both code and variables.

 - "stateless" - the confidential computing use case where storage
   of variables is completely disable, leaving only the code.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/interop/firmware.json | 54 ++++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 8 deletions(-)

In v2:

 - Mark 'mode' as optional field
 - Misc typos in docs

diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
index 8d8b0be030..f5d1d0b6e7 100644
--- a/docs/interop/firmware.json
+++ b/docs/interop/firmware.json
@@ -210,24 +210,61 @@
   'data'   : { 'filename' : 'str',
                'format'   : 'BlockdevDriver' } }
 
+
+##
+# @FirmwareFlashType:
+#
+# Describes how the firmware build handles code versus variable
+# persistence.
+#
+# @split: the executable file contains code while the NVRAM
+#         template provides variable storage. The executable
+#         must be configured read-only and can be shared between
+#         multiple guests. The NVRAM template must be cloned
+#         for each new guest and configured read-write.
+#
+# @combined: the executable file contains both code and
+#            variable storage. The executable must be cloned
+#            for each new guest and configured read-write.
+#            No NVRAM template will be specified.
+#
+# @stateless: the executable file contains code and variable
+#             storage is not persisted. The executed must
+#             be configured read-only and can be shared
+#             between multiple guests. No NVRAM template
+#             will be specified.
+#
+# Since: 7.0.0
+##
+{ 'enum': 'FirmwareFlashMode',
+  'data': [ 'split', 'combined', 'stateless' ] }
+
 ##
 # @FirmwareMappingFlash:
 #
 # Describes loading and mapping properties for the firmware executable
 # and its accompanying NVRAM file, when @FirmwareDevice is @flash.
 #
-# @executable: Identifies the firmware executable. The firmware
-#              executable may be shared by multiple virtual machine
-#              definitions. The preferred corresponding QEMU command
-#              line options are
+# @mode: describes how the firmware build handles code versus variable
+#        storage. If not present, it must be treated as if it was
+#        configured with value ``split``. Since: 7.0.0
+#
+# @executable: Identifies the firmware executable. The @mode
+#              indicates whether there will be an associated
+#              NVRAM template present. The preferred
+#              corresponding QEMU command line options are
 #                  -drive if=none,id=pflash0,readonly=on,file=@executable.@filename,format=@executable.@format
 #                  -machine pflash0=pflash0
-#              or equivalent -blockdev instead of -drive.
+#              or equivalent -blockdev instead of -drive. When
+#              @mode is ``combined`` the executable must be
+#              cloned before use and configured with readonly=off.
 #              With QEMU versions older than 4.0, you have to use
 #                  -drive if=pflash,unit=0,readonly=on,file=@executable.@filename,format=@executable.@format
 #
 # @nvram-template: Identifies the NVRAM template compatible with
-#                  @executable. Management software instantiates an
+#                  @executable, when @mode is set to ``split``,
+#                  otherwise it should not be present.
+#                  Management software instantiates an
 #                  individual copy -- a specific NVRAM file -- from
 #                  @nvram-template.@filename for each new virtual
 #                  machine definition created. @nvram-template.@filename
@@ -246,8 +283,9 @@
 # Since: 3.0
 ##
 { 'struct' : 'FirmwareMappingFlash',
-  'data'   : { 'executable'     : 'FirmwareFlashFile',
-               'nvram-template' : 'FirmwareFlashFile' } }
+  'data'   : { '*mode': 'FirmwareFlashMode',
+               'executable'     : 'FirmwareFlashFile',
+               '*nvram-template' : 'FirmwareFlashFile' } }
 
 ##
 # @FirmwareMappingKernel:
-- 
2.34.1


