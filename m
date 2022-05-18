Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF65852B666
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 11:35:09 +0200 (CEST)
Received: from localhost ([::1]:42788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrG5D-0000VS-4y
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 05:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nrFtN-0006OI-Pz
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:22:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nrFtL-0007I9-LK
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652865771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wi+/wAh8Ld7y03HJi2uiOo45prX4Bqt/snnNRxJMOTk=;
 b=IjdaLhizVhjK7f5Bzx/BFXDWY0dmKwTtGsWJsoGGjD1Mi3LjawjNCmelDBChud/ELjcdMe
 a3ond/AFLCFPQxZt6HvcoKj6XdnQ5mr+VDhxc0/iO+ysP2ISahMSe2FQbc/D6IJ6wQaOIy
 1MNqQlC/xsFGlEu9gdHftwCQ8tLdt3M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-LAl0ihKeOnqe0lXi1IGoGQ-1; Wed, 18 May 2022 05:22:47 -0400
X-MC-Unique: LAl0ihKeOnqe0lXi1IGoGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DFE78032EA;
 Wed, 18 May 2022 09:22:47 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-73.pek2.redhat.com [10.72.12.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C7951121314;
 Wed, 18 May 2022 09:22:36 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, drjones@redhat.com,
 wangyanan55@huawei.com, Jonathan.Cameron@Huawei.com,
 peter.maydell@linaro.org, berrange@redhat.com, thuth@redhat.com,
 eduardo@habkost.net, lvivier@redhat.com, zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: [PATCH 2/3] hw/acpi/aml-build: Fix {socket, cluster, core} IDs in PPTT
Date: Wed, 18 May 2022 17:21:40 +0800
Message-Id: <20220518092141.1050852-3-gshan@redhat.com>
In-Reply-To: <20220518092141.1050852-1-gshan@redhat.com>
References: <20220518092141.1050852-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The {socket, cluster, core} IDs detected from Linux guest aren't
matching with what have been provided in PPTT. The flag used for
'ACPI Processor ID valid' is missed for {socket, cluster, core}
nodes. In this case, Linux guest takes the offset between the
node and PPTT header as the corresponding IDs, as the following
logs show.

  /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64    \
  -accel kvm -machine virt,gic-version=host -cpu host        \
  -smp 8,sockets=2,clusters=2,cores=2,threads=1
    :

  # cd /sys/devices/system/cpu
  # for i in `seq 0 15`; do cat cpu$i/topology/physical_package_id; done
    36  36  36  36  36  36  36  36
    336 336 336 336 336 336 336 336
  # for i in `seq 0 15`; do cat cpu$i/topology/cluster_id; done
    56  56  56  56  196 196 196 196
    356 356 356 356 496 496 496 496
  # for i in `seq 0 15`; do cat cpu$i/topology/core_id; done
    76  76  136 136 216 216 276 276
    376 376 436 436 516 516 576 576

This fixes the issue by setting 'ACPI Processor ID valid' flag for
{socket, cluster, core} nodes. With this applied, the IDs are exactly
what have been provided in PPTT.

  # for i in `seq 0 15`; do cat cpu$i/topology/physical_package_id; done
  0 0 0 0 0 0 0 0
  1 1 1 1 1 1 1 1
  # for i in `seq 0 15`; do cat cpu$i/topology/cluster_id; done
  0 0 0 0 1 1 1 1
  0 0 0 0 1 1 1 1
  # for i in `seq 0 15`; do cat cpu$i/topology/core_id; done
  0 0 1 1 0 0 1 1
  0 0 1 1 0 0 1 1

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/acpi/aml-build.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index e6bfac95c7..89f191fd3b 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2026,7 +2026,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
             core_id = -1;
             socket_offset = table_data->len - pptt_start;
             build_processor_hierarchy_node(table_data,
-                (1 << 0), /* Physical package */
+                (1 << 0) | /* Physical package */
+                (1 << 1),  /* ACPI Processor ID valid */
                 0, socket_id, NULL, 0);
         }
 
@@ -2037,7 +2038,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 core_id = -1;
                 cluster_offset = table_data->len - pptt_start;
                 build_processor_hierarchy_node(table_data,
-                    (0 << 0), /* Not a physical package */
+                    (0 << 0) | /* Not a physical package */
+                    (1 << 1),  /* ACPI Processor ID valid */
                     socket_offset, cluster_id, NULL, 0);
             }
         } else {
@@ -2055,7 +2057,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 core_id = cpus->cpus[n].props.core_id;
                 core_offset = table_data->len - pptt_start;
                 build_processor_hierarchy_node(table_data,
-                    (0 << 0), /* Not a physical package */
+                    (0 << 0) | /* Not a physical package */
+                    (1 << 1),  /* ACPI Processor ID valid */
                     cluster_offset, core_id, NULL, 0);
             }
 
-- 
2.23.0


