Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E405A523
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 21:28:23 +0200 (CEST)
Received: from localhost ([::1]:35730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgwXm-0004OM-Ml
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 15:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40763)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hgvxb-0004Fu-Pg
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 14:51:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hgvxX-0003ZE-BJ
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 14:50:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58660)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hgvxW-0003IP-UW
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 14:50:55 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 672B73082131;
 Fri, 28 Jun 2019 18:50:34 +0000 (UTC)
Received: from localhost (ovpn-116-7.gru2.redhat.com [10.97.116.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B63CF5D705;
 Fri, 28 Jun 2019 18:50:33 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Fri, 28 Jun 2019 15:47:30 -0300
Message-Id: <20190628184742.5961-18-ehabkost@redhat.com>
In-Reply-To: <20190628184742.5961-1-ehabkost@redhat.com>
References: <20190628184742.5961-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 28 Jun 2019 18:50:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 17/29] numa: deprecate 'mem' parameter of
 '-numa node' option
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

The parameter allows to configure fake NUMA topology where guest
VM simulates NUMA topology but not actually getting performance
benefits from it. The same or better results could be achieved
using 'memdev' parameter.
Beside of unpredictable performance, '-numa node.mem' option has
other issues when it's used with combination of -mem-path +
+ -mem-prealloc + memdev backends (pc-dimm), breaking binding of
memdev backends since mem-path/mem-prealloc are global and affect
the most of RAM allocations.

It's possible to make memdevs and global -mem-path/mem-prealloc
to play nicely together but that will just complicate already
complicated code and add unobious ways it could break on 2
different memmory allocation pathes and their combinations.

Instead of it, consolidate all guest RAM allocation over memdev
which still allows to create fake NUMA configurations if desired
and leaves one simplifyed code path to consider when it comes
to guest RAM allocation.

To achieve desired simplification deprecate 'mem' parameter as its
ad-hoc partitioning of initial RAM MemoryRegion can't be translated
to memdev based backend transparently to users and in compatible
manner (migration wise).

Later down the road that will allow to consolidate means of how
guest RAM is allocated and would permit us to clean up quite
a bit memory allocations and numa code, leaving only 'memdev'
implementation in place.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <1559205199-233510-3-git-send-email-imammedo@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 numa.c               |  2 ++
 qemu-deprecated.texi | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/numa.c b/numa.c
index 7594eb5a7e..7d449c7e95 100644
--- a/numa.c
+++ b/numa.c
@@ -122,6 +122,8 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
 
     if (node->has_mem) {
         numa_info[nodenr].node_mem = node->mem;
+        warn_report("Parameter -numa node,mem is deprecated,"
+                    " use -numa node,memdev instead");
     }
     if (node->has_memdev) {
         Object *o;
diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index df04f2840b..44c9a95966 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -88,6 +88,22 @@ The @code{-realtime mlock=on|off} argument has been replaced by the
 The ``-virtfs_synth'' argument is now deprecated. Please use ``-fsdev synth''
 and ``-device virtio-9p-...'' instead.
 
+@subsection -numa node,mem=@var{size} (since 4.1)
+
+The parameter @option{mem} of @option{-numa node} is used to assign a part of
+guest RAM to a NUMA node. But when using it, it's impossible to manage specified
+RAM chunk on the host side (like bind it to a host node, setting bind policy, ...),
+so guest end-ups with the fake NUMA configuration with suboptiomal performance.
+However since 2014 there is an alternative way to assign RAM to a NUMA node
+using parameter @option{memdev}, which does the same as @option{mem} and adds
+means to actualy manage node RAM on the host side. Use parameter @option{memdev}
+with @var{memory-backend-ram} backend as an replacement for parameter @option{mem}
+to achieve the same fake NUMA effect or a properly configured
+@var{memory-backend-file} backend to actually benefit from NUMA configuration.
+In future new machine versions will not accept the option but it will still
+work with old machine types. User can check QAPI schema to see if the legacy
+option is supported by looking at MachineInfo::numa-mem-supported property.
+
 @section QEMU Machine Protocol (QMP) commands
 
 @subsection block-dirty-bitmap-add "autoload" parameter (since 2.12.0)
-- 
2.18.0.rc1.1.g3f1ff2140


