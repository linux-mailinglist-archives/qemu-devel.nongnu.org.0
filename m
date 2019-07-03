Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F9E5EE7F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 23:28:48 +0200 (CEST)
Received: from localhost ([::1]:40798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1himo3-0000Vv-FI
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 17:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38115)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1himVG-000682-QD
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:09:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1himVF-0006yW-Gn
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:09:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51492)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1himVF-0006sL-6G
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:09:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DDFF030842AC;
 Wed,  3 Jul 2019 21:09:11 +0000 (UTC)
Received: from localhost (ovpn-116-30.gru2.redhat.com [10.97.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E70452737;
 Wed,  3 Jul 2019 21:09:11 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Date: Wed,  3 Jul 2019 18:07:56 -0300
Message-Id: <20190703210821.27550-19-ehabkost@redhat.com>
In-Reply-To: <20190703210821.27550-1-ehabkost@redhat.com>
References: <20190703210821.27550-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 03 Jul 2019 21:09:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v5 18/43] numa: deprecate implict memory
 distribution between nodes
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Implicit RAM distribution between nodes has exactly the same issues as:
  "numa: deprecate 'mem' parameter of '-numa node' option"
only with QEMU being the user that's 'adding' 'mem' parameter.

Deprecate it, to get it out of the way so that we could consolidate
guest RAM allocation using memory backends making it consistent and
possibly later on transition to using memory devices instead of
adhoc memory mapping for the initial RAM.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <1559205199-233510-4-git-send-email-imammedo@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/numa.c       | 3 +++
 qemu-deprecated.texi | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index b15fbdf79a..b74262b743 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -405,6 +405,9 @@ void numa_complete_configuration(MachineState *ms)
         if (i == nb_numa_nodes) {
             assert(mc->numa_auto_assign_ram);
             mc->numa_auto_assign_ram(mc, numa_info, nb_numa_nodes, ram_size);
+            warn_report("Default splitting of RAM between nodes is deprecated,"
+                        " Use '-numa node,memdev' to explictly define RAM"
+                        " allocation per node");
         }
 
         numa_total = 0;
diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 44c9a95966..2fe9b72121 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -104,6 +104,14 @@ In future new machine versions will not accept the option but it will still
 work with old machine types. User can check QAPI schema to see if the legacy
 option is supported by looking at MachineInfo::numa-mem-supported property.
 
+@subsection -numa node (without memory specified) (since 4.1)
+
+Splitting RAM by default between NUMA nodes has the same issues as @option{mem}
+parameter described above with the difference that the role of the user plays
+QEMU using implicit generic or board specific splitting rule.
+Use @option{memdev} with @var{memory-backend-ram} backend or @option{mem} (if
+it's supported by used machine type) to define mapping explictly instead.
+
 @section QEMU Machine Protocol (QMP) commands
 
 @subsection block-dirty-bitmap-add "autoload" parameter (since 2.12.0)
-- 
2.18.0.rc1.1.g3f1ff2140


