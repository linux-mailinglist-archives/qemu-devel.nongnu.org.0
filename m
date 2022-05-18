Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7DA52B5C4
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 11:28:45 +0200 (CEST)
Received: from localhost ([::1]:35942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrFz1-0003uW-Vy
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 05:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nrFsx-0006Gh-P9
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:22:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nrFsq-0007DX-5E
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:22:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652865738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TfaAbmHiy1++Qz1AVY6FsYCjFB7+OlfOjASkrUP+BOA=;
 b=MLQ3g0U/liPVt9eFP+t2d5LeCAJhINNrLNQuHj45JM0rTIQDtEKo1PvE5xtSBCZqf55jqC
 I0nbBsOOoBp73R3aDM+X34ltmgnfygWf7cYBaWE680CFssdH2oZdmfJjbMB7Y+DHpVoRka
 94fg0KACr4BIhLTL2xbmCRJ2bqJJEGI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-Yr5bwG4-O1WhP_km6FUHmg-1; Wed, 18 May 2022 05:22:15 -0400
X-MC-Unique: Yr5bwG4-O1WhP_km6FUHmg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E4953802BA2;
 Wed, 18 May 2022 09:22:15 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-73.pek2.redhat.com [10.72.12.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52C3E1121314;
 Wed, 18 May 2022 09:21:56 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, drjones@redhat.com,
 wangyanan55@huawei.com, Jonathan.Cameron@Huawei.com,
 peter.maydell@linaro.org, berrange@redhat.com, thuth@redhat.com,
 eduardo@habkost.net, lvivier@redhat.com, zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: [PATCH 0/3] hw/acpi/aml-build: Fix {socket, cluster, core} IDs in PPTT
Date: Wed, 18 May 2022 17:21:38 +0800
Message-Id: <20220518092141.1050852-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
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
  -accel kvm -machine virt,gic-version=host -cpu host       \
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
what have been provided in PPTT. I also checked the PPTT table on my
host, where the 'ACPI Processor ID valid' is set for cluster/core nodes,
but missed from socket nodes.

  host# pwd
  /sys/devices/system/cpu
  host# cat cpu0/topology/physical_package_id; \
        cat cpu0/topology/cluster_id;          \
        cat cpu0/topology/core_id
  36 0 0

Gavin Shan (3):
  tests/acpi/virt: Allow PPTT ACPI table changes
  hw/acpi/aml-build: Fix {socket, cluster, core} IDs in PPTT
  tests/acpi/virt: Update PPTT ACPI table

 hw/acpi/aml-build.c       |   9 ++++++---
 tests/data/acpi/virt/PPTT | Bin 96 -> 96 bytes
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.23.0


