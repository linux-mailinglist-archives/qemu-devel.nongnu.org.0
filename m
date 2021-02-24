Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A86323DC1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:21:34 +0100 (CET)
Received: from localhost ([::1]:60956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEu6f-0007Jm-2z
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEu0A-0003kW-1t
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:14:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEu05-0005ZV-FK
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:14:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614172484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NiVKZO6sJm4o6Qk3gWvGlk2+4nRy+cCa6wUAps1jcwQ=;
 b=adLlG2kKwfdAlluTJa5D9AoX0Kt14vUEnbF7HTI2C9g/xGl+jHx+sEk8s/BN+RUOoRMUtj
 yQgSPsARCEdcvvjofwv0fR61ec7NTBKIVUjNnf3VjGLRR2dHmRN6RNQRNmUoGRU2O5GPcN
 48EE7+2unpTlegLu77wiaJFMu7txkW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-vdJMtOccOUm5JN5AZ6fEIg-1; Wed, 24 Feb 2021 08:14:43 -0500
X-MC-Unique: vdJMtOccOUm5JN5AZ6fEIg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9778A107ACF4;
 Wed, 24 Feb 2021 13:14:41 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-119.ams2.redhat.com
 [10.36.115.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 893B61001281;
 Wed, 24 Feb 2021 13:14:20 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/14] machine: remove 'arch' field from 'query-cpus-fast' QMP
 command
Date: Wed, 24 Feb 2021 13:11:35 +0000
Message-Id: <20210224131142.1952027-8-berrange@redhat.com>
In-Reply-To: <20210224131142.1952027-1-berrange@redhat.com>
References: <20210224131142.1952027-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/deprecated.rst       |  6 -----
 docs/system/removed-features.rst |  6 +++++
 hw/core/machine-qmp-cmds.c       | 41 --------------------------------
 qapi/machine.json                | 22 -----------------
 4 files changed, 6 insertions(+), 69 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 484f017119..78474f0845 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -192,12 +192,6 @@ Since the ``dirty-bitmaps`` field is optionally present in both the old and
 new locations, clients must use introspection to learn where to anticipate
 the field if/when it does appear in command output.
 
-``query-cpus-fast`` ``arch`` output member (since 3.0.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The ``arch`` output member of the ``query-cpus-fast`` command is
-replaced by the ``target`` output member.
-
 chardev client socket with ``wait`` option (since 4.0)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index ad146daf9b..7942c2e513 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -100,6 +100,12 @@ Use ``migrate_set_parameter`` instead.
 
 The ``query-cpus`` command is replaced by the ``query-cpus-fast`` command.
 
+``query-cpus-fast`` ``arch`` output member (removed in 6.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``arch`` output member of the ``query-cpus-fast`` command is
+replaced by the ``target`` output member.
+
 Human Monitor Protocol (HMP) commands
 -------------------------------------
 
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index af60cd969d..68a942595a 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -24,46 +24,6 @@
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 
-static CpuInfoArch sysemu_target_to_cpuinfo_arch(SysEmuTarget target)
-{
-    /*
-     * The @SysEmuTarget -> @CpuInfoArch mapping below is based on the
-     * TARGET_ARCH -> TARGET_BASE_ARCH mapping in the "configure" script.
-     */
-    switch (target) {
-    case SYS_EMU_TARGET_I386:
-    case SYS_EMU_TARGET_X86_64:
-        return CPU_INFO_ARCH_X86;
-
-    case SYS_EMU_TARGET_PPC:
-    case SYS_EMU_TARGET_PPC64:
-        return CPU_INFO_ARCH_PPC;
-
-    case SYS_EMU_TARGET_SPARC:
-    case SYS_EMU_TARGET_SPARC64:
-        return CPU_INFO_ARCH_SPARC;
-
-    case SYS_EMU_TARGET_MIPS:
-    case SYS_EMU_TARGET_MIPSEL:
-    case SYS_EMU_TARGET_MIPS64:
-    case SYS_EMU_TARGET_MIPS64EL:
-        return CPU_INFO_ARCH_MIPS;
-
-    case SYS_EMU_TARGET_TRICORE:
-        return CPU_INFO_ARCH_TRICORE;
-
-    case SYS_EMU_TARGET_S390X:
-        return CPU_INFO_ARCH_S390;
-
-    case SYS_EMU_TARGET_RISCV32:
-    case SYS_EMU_TARGET_RISCV64:
-        return CPU_INFO_ARCH_RISCV;
-
-    default:
-        return CPU_INFO_ARCH_OTHER;
-    }
-}
-
 static void cpustate_to_cpuinfo_s390(CpuInfoS390 *info, const CPUState *cpu)
 {
 #ifdef TARGET_S390X
@@ -104,7 +64,6 @@ CpuInfoFastList *qmp_query_cpus_fast(Error **errp)
             value->props = props;
         }
 
-        value->arch = sysemu_target_to_cpuinfo_arch(target);
         value->target = target;
         if (target == SYS_EMU_TARGET_S390X) {
             cpustate_to_cpuinfo_s390(&value->u.s390x, cpu);
diff --git a/qapi/machine.json b/qapi/machine.json
index 9811927504..c0c52aef10 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -34,21 +34,6 @@
              'sh4eb', 'sparc', 'sparc64', 'tricore', 'unicore32',
              'x86_64', 'xtensa', 'xtensaeb' ] }
 
-##
-# @CpuInfoArch:
-#
-# An enumeration of cpu types that enable additional information during
-# @query-cpus-fast.
-#
-# @s390: since 2.12
-#
-# @riscv: since 2.12
-#
-# Since: 2.6
-##
-{ 'enum': 'CpuInfoArch',
-  'data': ['x86', 'sparc', 'ppc', 'mips', 'tricore', 's390', 'riscv', 'other' ] }
-
 ##
 # @CpuS390State:
 #
@@ -86,14 +71,9 @@
 # @props: properties describing to which node/socket/core/thread
 #         virtual CPU belongs to, provided if supported by board
 #
-# @arch: base architecture of the cpu
-#
 # @target: the QEMU system emulation target, which determines which
 #          additional fields will be listed (since 3.0)
 #
-# Features:
-# @deprecated: Member @arch is deprecated.  Use @target instead.
-#
 # Since: 2.12
 #
 ##
@@ -102,8 +82,6 @@
                       'qom-path'     : 'str',
                       'thread-id'    : 'int',
                       '*props'       : 'CpuInstanceProperties',
-                      'arch'         : { 'type': 'CpuInfoArch',
-                                         'features': [ 'deprecated' ] },
                       'target'       : 'SysEmuTarget' },
   'discriminator' : 'target',
   'data'          : { 's390x'        : 'CpuInfoS390' } }
-- 
2.29.2


