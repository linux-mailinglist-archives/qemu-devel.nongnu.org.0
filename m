Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C584F5E56B0
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 01:19:49 +0200 (CEST)
Received: from localhost ([::1]:41940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob90O-00062a-HK
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 19:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ob8us-0008Kb-Dv
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 19:14:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ob8up-0001qh-7h
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 19:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663802040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cDj/bCcZJ3kvOGEZHuBAu+/jvYP/iDltadLCS0HVfUQ=;
 b=SoNCio20+8iaKsEz+nIu4g1BTEPUKuq/ZiSvHMd+zAebE/FuWlQW1LnuOflcZEuhkYk8Rd
 TlsqlJ6ackpjB+VKAhyF5TlWtgFHyPOtgUR5nTLWNv0qX9p/YjMT3UO6/RY13wXOpB1/Cx
 UxsViAt0fA3cQ8anHuU4Nj/LgT6bRy8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-viREKygmMB6J2lTsZQ2T0Q-1; Wed, 21 Sep 2022 19:13:56 -0400
X-MC-Unique: viREKygmMB6J2lTsZQ2T0Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AE7A1C0BC68;
 Wed, 21 Sep 2022 23:13:56 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-126.bne.redhat.com [10.64.54.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BF552166B26;
 Wed, 21 Sep 2022 23:13:52 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v3 0/5] hw/arm/virt: Improve address assignment for high
 memory regions
Date: Thu, 22 Sep 2022 07:13:44 +0800
Message-Id: <20220921231349.274049-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

PATCH[1-3] preparatory work for the improvment
PATCH[4]   improve high memory region address assignment
PATCH[5]   adds 'highmem-compact' to enable or disable the optimization

History
=======
v2: https://lore.kernel.org/all/20220815062958.100366-1-gshan@redhat.com/T/
v1: https://lists.nongnu.org/archive/html/qemu-arm/2022-08/msg00013.html

Changelog
==========
v3:
  * Reorder the patches                                        (Gavin)
  * Add 'highmem-compact' property for backwards compatibility (Eric)
v2:
  * Split the patches for easier review                        (Gavin)
  * Improved changelog                                         (Marc)
  * Use 'bool fits' in virt_set_high_memmap()                  (Eric)

Gavin Shan (5):
  hw/arm/virt: Introduce virt_set_high_memmap() helper
  hw/arm/virt: Rename variable size to region_size in
    virt_set_high_memmap()
  hw/arm/virt: Introduce variable region_base in virt_set_high_memmap()
  hw/arm/virt: Improve high memory region address assignment
  hw/arm/virt: Add 'highmem-compact' property

 docs/system/arm/virt.rst |   4 ++
 hw/arm/virt.c            | 116 ++++++++++++++++++++++++++++-----------
 include/hw/arm/virt.h    |   2 +
 3 files changed, 89 insertions(+), 33 deletions(-)

-- 
2.23.0


