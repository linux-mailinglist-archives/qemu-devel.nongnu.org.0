Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7599504AD5
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 04:12:15 +0200 (CEST)
Received: from localhost ([::1]:53156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngGs8-00050g-LC
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 22:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ngGqp-0003Ij-Ev
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 22:10:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ngGqm-0000vu-1y
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 22:10:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650247846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d3E/TagPWo8evq1cxKnqXwItb51OBJdtWXF8D37z6nI=;
 b=iUlxi4P0UCoAmHSeyAjo60IkJKsBhWGBVNJVHEDzrNxsh9O6onXsYEOqM0fafllt4uMrnE
 84CbicuQ3nJ2A0rAgAGyv9N5R6c70In55VeyvCSrbbQ4fO5H7F1m2ZRznO5Nt53k/g77Om
 yd2+WgUf/GOdPrEt0yjN8zlObyr0YRQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-iaImdtf9Pg6tT-rGEBNp1w-1; Sun, 17 Apr 2022 22:10:41 -0400
X-MC-Unique: iaImdtf9Pg6tT-rGEBNp1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 601148001EA;
 Mon, 18 Apr 2022 02:10:40 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-13-171.pek2.redhat.com [10.72.13.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36AF61121333;
 Mon, 18 Apr 2022 02:10:00 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v6 0/4] hw/arm/virt: Fix CPU's default NUMA node ID
Date: Mon, 18 Apr 2022 10:09:16 +0800
Message-Id: <20220418020920.144263-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: eduardo@habkost.net, peter.maydell@linaro.org, drjones@redhat.com,
 shan.gavin@gmail.com, mst@redhat.com, thuth@redhat.com, armbru@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 wangyanan55@huawei.com, pbonzini@redhat.com, Jonathan.Cameron@Huawei.com,
 ani@anisinha.ca, imammedo@redhat.com, lvivier@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the CPU-to-NUMA association isn't provided by user, the default NUMA
node ID for the specific CPU is returned from virt_get_default_cpu_node_id().
Unfortunately, the default NUMA node ID breaks socket boundary and leads to
the broken CPU topology warning message in Linux guest. This series intends
to fix the issue.

  PATCH[1/4] Add cluster-id to CPU instance property
  PATCH[2/4] Uses SMP configuration to populate CPU topology
  PATCH[3/4] Fixes the broken CPU topology by considering the socket boundary
             when the default NUMA node ID is given
  PATCH[4/4] Uses the populated CPU topology to build PPTT table, instead of
             calculate it again

Changelog
=========
v6:
   * Fixed description for 'cluster-id'                         (Yanan)
   * Remove '% ms->smp.sockets' in socket ID calculation        (Yanan)
   * Fixed tests/qtest/numa-test/aarch64_numa_cpu()             (Yanan)
   * Initialized offset variables in build_pptt()               (Jonathan)
   * Added comments about the layout of cpus[n].props.*_id      (Igor)
v4/v5:
   * Split PATCH[v3 1/3] to PATCH[v5 1/4] and PATCH[v5 2/4].
     Verify or dump 'clsuter-id' in various spots               (Yanan)
   * s/within cluster/within cluster\/die/ for 'core-id' in
     qapi/machine.json                                          (Igor)
   * Apply '% ms->smp.{sockets, clusters, cores, threads} in
     virt_possible_cpu_arch_ids() as x86 does                   (Igor)
   * Use [0 - possible_cpus->len] as ACPI processor UID to
     build PPTT table and PATCH[v3 4/4] is dropped              (Igor)
   * Simplified build_pptt() to add all entries in one loop
     on ms->possible_cpus                                       (Igor)
v3:
   * Split PATCH[v2 1/3] to PATCH[v3 1/4] and PATCH[v3 2/4]     (Yanan)
   * Don't take account of die ID in CPU topology population
     and added assert(!mc->smp_props.dies_supported)            (Yanan/Igor)
   * Assign cluster_id and use it when building PPTT table      (Yanan/Igor)
v2:
   * Populate the CPU topology in virt_possible_cpu_arch_ids()
     so that it can be reused in virt_get_default_cpu_node_id() (Igor)
   * Added PATCH[2/3] to use the existing CPU topology when the
     PPTT table is built                                        (Igor)
   * Added PATCH[3/3] to take thread ID as ACPI processor ID
     in MADT and SRAT table                                     (Gavin)

Gavin Shan (4):
  qapi/machine.json: Add cluster-id
  hw/arm/virt: Consider SMP configuration in CPU topology
  hw/arm/virt: Fix CPU's default NUMA node ID
  hw/acpi/aml-build: Use existing CPU topology to build PPTT table

 hw/acpi/aml-build.c        | 105 +++++++++++++++----------------------
 hw/arm/virt.c              |  19 ++++++-
 hw/core/machine-hmp-cmds.c |   4 ++
 hw/core/machine.c          |  16 ++++++
 qapi/machine.json          |   6 ++-
 tests/qtest/numa-test.c    |   3 +-
 6 files changed, 86 insertions(+), 67 deletions(-)

-- 
2.23.0


