Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5962754D0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 11:52:40 +0200 (CEST)
Received: from localhost ([::1]:43310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL1S3-0004LB-SB
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 05:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kL1N6-0007HD-5w
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 05:47:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kL1N2-0007Yg-64
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 05:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600854447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oo3FyNnbdE1oNfEAiuyaQMsztgoSnO7oGPNBLGVebbs=;
 b=ic3mRhibOHbyGlXzR0l8BIHnV6gZrJ59Yem/XLvw94/Pei4yNZL3NxRYloN84x+h3i+zze
 w0By5ntslYyCVJoY9nH3ppMnEXowiNrmKQR80WHy543vqWhsNUFXkSQiYBg36hh/LbvKQt
 DcVanx8q8fUbha+df7D1ho2ZVeo8qvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-3wznwnk3Poe_zpEBCKFHeg-1; Wed, 23 Sep 2020 05:47:25 -0400
X-MC-Unique: 3wznwnk3Poe_zpEBCKFHeg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B37C4186DD35;
 Wed, 23 Sep 2020 09:47:24 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B457F55778;
 Wed, 23 Sep 2020 09:47:23 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/11] smp: drop support for deprecated (invalid topologies)
Date: Wed, 23 Sep 2020 05:46:50 -0400
Message-Id: <20200923094650.1301166-12-imammedo@redhat.com>
In-Reply-To: <20200923094650.1301166-1-imammedo@redhat.com>
References: <20200923094650.1301166-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 00:53:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lersek@redhat.com, ankur.a.arora@oracle.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it's was deprecated since 3.1

Support for invalid topologies is removed, the user must ensure
that topologies described with -smp include all possible cpus,
i.e. (sockets * cores * threads) == maxcpus or QEMU will
exit with error.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 docs/system/deprecated.rst | 26 +++++++++++++-------------
 hw/core/machine.c          | 16 ++++------------
 hw/i386/pc.c               | 16 ++++------------
 3 files changed, 21 insertions(+), 37 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 808c334fe7..fb95d2ecc4 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -47,19 +47,6 @@ The 'file' driver for drives is no longer appropriate for character or host
 devices and will only accept regular files (S_IFREG). The correct driver
 for these file types is 'host_cdrom' or 'host_device' as appropriate.
 
-``-smp`` (invalid topologies) (since 3.1)
-'''''''''''''''''''''''''''''''''''''''''
-
-CPU topology properties should describe whole machine topology including
-possible CPUs.
-
-However, historically it was possible to start QEMU with an incorrect topology
-where *n* <= *sockets* * *cores* * *threads* < *maxcpus*,
-which could lead to an incorrect topology enumeration by the guest.
-Support for invalid topologies will be removed, the user must ensure
-topologies described with -smp include all possible cpus, i.e.
-*sockets* * *cores* * *threads* = *maxcpus*.
-
 ``-vnc acl`` (since 4.0.0)
 ''''''''''''''''''''''''''
 
@@ -642,6 +629,19 @@ New machine versions (since 5.1) will not accept the option but it will still
 work with old machine types. User can check the QAPI schema to see if the legacy
 option is supported by looking at MachineInfo::numa-mem-supported property.
 
+``-smp`` (invalid topologies) (removed 5.2)
+'''''''''''''''''''''''''''''''''''''''''''
+
+CPU topology properties should describe whole machine topology including
+possible CPUs.
+
+However, historically it was possible to start QEMU with an incorrect topology
+where *n* <= *sockets* * *cores* * *threads* < *maxcpus*,
+which could lead to an incorrect topology enumeration by the guest.
+Support for invalid topologies is removed, the user must ensure
+topologies described with -smp include all possible cpus, i.e.
+*sockets* * *cores* * *threads* = *maxcpus*.
+
 Block devices
 -------------
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index ea26d61237..09aee4ea52 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -754,23 +754,15 @@ static void smp_parse(MachineState *ms, QemuOpts *opts)
             exit(1);
         }
 
-        if (sockets * cores * threads > ms->smp.max_cpus) {
-            error_report("cpu topology: "
-                         "sockets (%u) * cores (%u) * threads (%u) > "
-                         "maxcpus (%u)",
+        if (sockets * cores * threads != ms->smp.max_cpus) {
+            error_report("Invalid CPU topology: "
+                         "sockets (%u) * cores (%u) * threads (%u) "
+                         "!= maxcpus (%u)",
                          sockets, cores, threads,
                          ms->smp.max_cpus);
             exit(1);
         }
 
-        if (sockets * cores * threads != ms->smp.max_cpus) {
-            warn_report("Invalid CPU topology deprecated: "
-                        "sockets (%u) * cores (%u) * threads (%u) "
-                        "!= maxcpus (%u)",
-                        sockets, cores, threads,
-                        ms->smp.max_cpus);
-        }
-
         ms->smp.cpus = cpus;
         ms->smp.cores = cores;
         ms->smp.threads = threads;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2af660c55e..53e21a186d 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -748,23 +748,15 @@ void pc_smp_parse(MachineState *ms, QemuOpts *opts)
             exit(1);
         }
 
-        if (sockets * dies * cores * threads > ms->smp.max_cpus) {
-            error_report("cpu topology: "
-                         "sockets (%u) * dies (%u) * cores (%u) * threads (%u) > "
-                         "maxcpus (%u)",
+        if (sockets * dies * cores * threads != ms->smp.max_cpus) {
+            error_report("Invalid CPU topology deprecated: "
+                         "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
+                         "!= maxcpus (%u)",
                          sockets, dies, cores, threads,
                          ms->smp.max_cpus);
             exit(1);
         }
 
-        if (sockets * dies * cores * threads != ms->smp.max_cpus) {
-            warn_report("Invalid CPU topology deprecated: "
-                        "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
-                        "!= maxcpus (%u)",
-                        sockets, dies, cores, threads,
-                        ms->smp.max_cpus);
-        }
-
         ms->smp.cpus = cpus;
         ms->smp.cores = cores;
         ms->smp.threads = threads;
-- 
2.27.0


