Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A98F395DF
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 21:37:40 +0200 (CEST)
Received: from localhost ([::1]:51840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZKgF-0003Ei-ID
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 15:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51873)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hZJfN-0006Cy-I6
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 14:32:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hZJfJ-0000QK-Jv
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 14:32:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57514)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hZJfH-0000N2-VI
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 14:32:36 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DF7B318DF7C;
 Fri,  7 Jun 2019 18:32:34 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72D267D656;
 Fri,  7 Jun 2019 18:32:34 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Fri,  7 Jun 2019 15:32:27 -0300
Message-Id: <20190607183228.22454-2-ehabkost@redhat.com>
In-Reply-To: <20190607183228.22454-1-ehabkost@redhat.com>
References: <20190607183228.22454-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Fri, 07 Jun 2019 18:32:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/2] numa: improve cpu hotplug error message
 with a wrong node-id
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

On pseries, core-ids are strongly binded to a node-id by the command
line option. If an user tries to add a CPU to the wrong node, he has
an error but it is not really helpful:

  qemu-system-ppc64 ... -smp 1,maxcpus=64,cores=1,threads=1,sockets=1 \
                        -numa node,nodeid=0 -numa node,nodeid=1 ...

  (qemu) device_add power9_v2.0-spapr-cpu-core,core-id=30,node-id=1
  Error: node-id=1 must match numa node specified with -numa option

This patch improves this error message by giving to the user the good
node-id to use with the core-id he's providing

  Error: invalid node-id, must be 0

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20190529160747.778-1-lvivier@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 numa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/numa.c b/numa.c
index 3875e1efda..955ec0c830 100644
--- a/numa.c
+++ b/numa.c
@@ -470,8 +470,8 @@ void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **errp)
                                     "node-id", errp);
         }
     } else if (node_id != slot->props.node_id) {
-        error_setg(errp, "node-id=%d must match numa node specified "
-                   "with -numa option", node_id);
+        error_setg(errp, "invalid node-id, must be %"PRId64,
+                   slot->props.node_id);
     }
 }
 
-- 
2.18.0.rc1.1.g3f1ff2140


