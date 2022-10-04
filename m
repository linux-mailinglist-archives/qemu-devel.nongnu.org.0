Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023465F3AB3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 02:34:01 +0200 (CEST)
Received: from localhost ([::1]:34038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofVsm-0005wD-3Q
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 20:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofVlj-0007on-GL
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 20:26:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofVlf-0004r6-Cu
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 20:26:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664843197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0I/lEiOBQ3COXqfsbRBTyni/ySvMDvCrmKW7u9qW9ZA=;
 b=SHPPf8y4beuHGgb5urE2RUIbCcZr8Qx1NamYbLArUVR+A4Twvsa+9+e4zjHaROj8qvUHxl
 3XmTg3Js+1+GFdsK3ZlsuWUOj1EVWWTsX8Gd1NNwmbtw3jVLarqIoflCOG389L1W6HTG5z
 3V8MG+0FdlHXAqaXuX8NgAbOEAPpsog=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-opumObTUO9GHnQRQECEEvQ-1; Mon, 03 Oct 2022 20:26:34 -0400
X-MC-Unique: opumObTUO9GHnQRQECEEvQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2BA71C05197;
 Tue,  4 Oct 2022 00:26:33 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D84F40C206B;
 Tue,  4 Oct 2022 00:26:30 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v4 0/6] hw/arm/virt: Improve address assignment for high
 memory regions
Date: Tue,  4 Oct 2022 08:26:21 +0800
Message-Id: <20221004002627.59172-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
high memory regions.

PATCH[1-4] preparatory work for the improvment
PATCH[5]   improve high memory region address assignment
PATCH[6]   adds 'compact-highmem' to enable or disable the optimization

History
=======
v3: https://lists.nongnu.org/archive/html/qemu-arm/2022-09/msg00258.html
v2: https://lore.kernel.org/all/20220815062958.100366-1-gshan@redhat.com/T/
v1: https://lists.nongnu.org/archive/html/qemu-arm/2022-08/msg00013.html

Changelog
==========
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

Gavin Shan (6):
  hw/arm/virt: Introduce virt_set_high_memmap() helper
  hw/arm/virt: Rename variable size to region_size in
    virt_set_high_memmap()
  hw/arm/virt: Introduce variable region_base in virt_set_high_memmap()
  hw/arm/virt: Introduce virt_get_high_memmap_enabled() helper
  hw/arm/virt: Improve high memory region address
  hw/arm/virt: Add 'compact-highmem' property

 docs/system/arm/virt.rst |   4 ++
 hw/arm/virt.c            | 131 +++++++++++++++++++++++++++++----------
 include/hw/arm/virt.h    |   2 +
 3 files changed, 104 insertions(+), 33 deletions(-)

-- 
2.23.0


