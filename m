Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57F8612642
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 00:45:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oouY4-0003TN-Of; Sat, 29 Oct 2022 18:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oouY2-0003So-MM
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 18:43:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oouY0-0002Q1-R6
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 18:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667083404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NklmTCly+O2jixEBqYygzCH7H/fTKXf/Ut3Ljc4qBms=;
 b=Cdh0OBtRMsEFc+lxB/cmpnKlKtMW5JETysurkdO871TUiQMydC/xwjABPz2DjZFi/g5aU5
 H8PFyTYd3ooI9Cm4KCd6Wvec7wGd0DNp2M/XpsdL1JOvesT8grPyVN8qveF2u+qcFVLQ+t
 TYasnBbcIBR7p5IFTC7oC+PfKDw1Pn4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-mZ06fn4bOq6OI73lqXkTAA-1; Sat, 29 Oct 2022 18:43:18 -0400
X-MC-Unique: mZ06fn4bOq6OI73lqXkTAA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D1263C02192;
 Sat, 29 Oct 2022 22:43:18 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-151.bne.redhat.com [10.64.54.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A7642027062;
 Sat, 29 Oct 2022 22:43:14 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v7 0/7] hw/arm/virt: Improve address assignment for high
 memory regions
Date: Sun, 30 Oct 2022 06:43:00 +0800
Message-Id: <20221029224307.138822-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There are three high memory regions, which are VIRT_HIGH_REDIST2,
VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
are floating on highest RAM address. However, they can be disabled
in several cases.

(1) One specific high memory region is disabled by developer by
    toggling vms->highmem_{redists, ecam, mmio}.

(2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
    'virt-2.12' or ealier than it.

(3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
    on 32-bits system.

(4) One specific high memory region is disabled when it breaks the
    PA space limit.

The current implementation of virt_set_memmap() isn't comprehensive
because the space for one specific high memory region is always
reserved from the PA space for case (1), (2) and (3). In the code,
'base' and 'vms->highest_gpa' are always increased for those three
cases. It's unnecessary since the assigned space of the disabled
high memory region won't be used afterwards.

The series intends to improve the address assignment for these
high memory regions and introduces new properties for user to
selectively disable those 3 high memory regions.

PATCH[1-4] preparatory work for the improvment
PATCH[5]   improve high memory region address assignment
PATCH[6]   adds 'compact-highmem' to enable or disable the optimization
PATCH[7]   adds properties so that high memory regions can be disabled

v6: https://lists.nongnu.org/archive/html/qemu-arm/2022-10/msg00490.html
v5: https://lists.nongnu.org/archive/html/qemu-arm/2022-10/msg00280.html
v4: https://lists.nongnu.org/archive/html/qemu-arm/2022-10/msg00067.html
v3: https://lists.nongnu.org/archive/html/qemu-arm/2022-09/msg00258.html
v2: https://lore.kernel.org/all/20220815062958.100366-1-gshan@redhat.com/T/
v1: https://lists.nongnu.org/archive/html/qemu-arm/2022-08/msg00013.html

Changelog
==========
v7:
  * Pick review-by from Connie/Eric/Marc                       (Connie/Eric/Marc)
  * Use 'base - 1' to update 'vms->highest_gpa' in PATCH[v7 5] (Eric)
  * Replace 'even' with 'even if' in the comments about the
    legacy and compact layout in PATCH[v7 6]                   (Connie)
  * The maximal supported CPUs are calculated based on
    property 'highmem-redists' and the improved comments and
    error messages for this property                           (Connie)
v6:
  * Pick review-by from Connie/Eric                            (Connie/Eric)
  * Make the changes obvious in PATCH[v6 5/7]                  (Eric)
  * Move the example to commit log and describe the legacy
    and compact layout in code's comments in PATCH[v6 6/7]     (Eric)
  * Comment and commit message improvements                    (Connie/Eric)
  * Add 3 properties in PATCH[v6 7/7], allowing user to disable
    those 3 high memory regions                                (Marc)
v5:
  * Pick review-by and tested-by                               (Connie/Zhenyu)
  * Add extra check in PATCH[v5 4/6]                           (Connie)
  * Improve comments about compatibility for disabled regions
    in PATCH[v5 5/6]                                           (Connie)
v4:
  * Add virt_get_high_memmap_enabled() helper                  (Eric)
  * Move 'vms->highmem_compact' and related logic from
    PATCH[v4 6/6] to PATCH[v4 5/6] to avoid git-bisect
    breakage                                                   (Eric)
  * Document the legacy and optimized high memory region
    layout in commit log and source code                       (Eric)
v3:
  * Reorder the patches                                        (Gavin)
  * Add 'highmem-compact' property for backwards compatibility (Eric)
v2:
  * Split the patches for easier review                        (Gavin)
  * Improved changelog                                         (Marc)
  * Use 'bool fits' in virt_set_high_memmap()                  (Eric)

Gavin Shan (7):
  hw/arm/virt: Introduce virt_set_high_memmap() helper
  hw/arm/virt: Rename variable size to region_size in
    virt_set_high_memmap()
  hw/arm/virt: Introduce variable region_base in virt_set_high_memmap()
  hw/arm/virt: Introduce virt_get_high_memmap_enabled() helper
  hw/arm/virt: Improve high memory region address assignment
  hw/arm/virt: Add 'compact-highmem' property
  hw/arm/virt: Add properties to disable high memory regions

 docs/system/arm/virt.rst |  17 ++++
 hw/arm/virt.c            | 193 ++++++++++++++++++++++++++++++++-------
 include/hw/arm/virt.h    |   2 +
 3 files changed, 177 insertions(+), 35 deletions(-)

-- 
2.23.0


