Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7164F08E0
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Apr 2022 13:03:43 +0200 (CEST)
Received: from localhost ([::1]:43668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nay1G-00071r-Gt
	for lists+qemu-devel@lfdr.de; Sun, 03 Apr 2022 07:03:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naxyl-0004hz-1j
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 07:01:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naxyf-0001VG-Co
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 07:01:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648983660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s2QKMtJSbKYwZ3Fs4Cvv4gGrh4h+Z1nu9GE+rJgCLkI=;
 b=Psy5Q9px1uu79oPHBx39b7MFYpxBbVvapnlsfk/SAPCYLJgkEi2rWBmN/9b3TNAzHqCcNy
 bgyhwVzg/jn77awo8X7undSaFrIfDUbYU6ss5AqBdhTrl89HOnKbgpfLj+EUU6CdoQFLW2
 aR984GSzZMJi2IwQ0EhgxGu+WOmqBF0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-fJAs5RHOMZyTB-TZI_fdDg-1; Sun, 03 Apr 2022 07:00:57 -0400
X-MC-Unique: fJAs5RHOMZyTB-TZI_fdDg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95C8E3C01D8B;
 Sun,  3 Apr 2022 11:00:56 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-82.pek2.redhat.com [10.72.12.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9351F40D02E1;
 Sun,  3 Apr 2022 11:00:51 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v4 0/3] hw/arm/virt: Fix CPU's default NUMA node ID
Date: Sun,  3 Apr 2022 19:00:33 +0800
Message-Id: <20220403110036.5531-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the CPU-to-NUMA association isn't provided by user, the default NUMA
node ID for the specific CPU is returned from virt_get_default_cpu_node_id().
Unfortunately, the default NUMA node ID breaks socket boundary and leads to
the broken CPU topology warning message in Linux guest. This series intends
to fix the issue.

  PATCH[1/3] Uses SMP configuration to populate CPU topology
  PATCH[2/3] Fixes the broken CPU topology by considering the socket boundary
             when the default NUMA node ID is given
  PATCH[3/3] Uses the populated CPU topology to build PPTT table, instead of
             calculate it again

Changelog
=========
v4:
   * Apply '% ms->smp.{clusters, cores, threads} as x86 does
     in virt_possible_cpu_arch_ids()                            (Igor)
   * s/within cluster/within cluster\/die/ for 'core-id' in
     qapi/machine.json                                          (Igor)
   * Use [0 - possible_cpus->len] as ACPI processor UID to
     build PPTT table and PATCH[v3 4/4] is dropped              (Igor)
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


Gavin Shan (3):
  hw/arm/virt: Consider SMP configuration in CPU topology
  hw/arm/virt: Fix CPU's default NUMA node ID
  hw/acpi/aml-build: Use existing CPU topology to build PPTT table

 hw/acpi/aml-build.c | 95 +++++++++++++++++++++++++++++++++------------
 hw/arm/virt.c       | 19 ++++++++-
 qapi/machine.json   |  6 ++-
 3 files changed, 92 insertions(+), 28 deletions(-)

-- 
2.23.0


