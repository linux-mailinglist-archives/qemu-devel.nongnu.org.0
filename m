Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1525929B5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 08:41:25 +0200 (CEST)
Received: from localhost ([::1]:37532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNTmu-0006MH-8U
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 02:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oNTcI-0000sj-SV
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 02:30:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oNTcF-0000Ox-6u
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 02:30:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660545021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t//RPkk8qsPy8JgZVz6T9NGR3ElCqof5zdv/H95KjT0=;
 b=GVf9QO8iiPVeewASCARUh96ybEbwMo7Sja6moHwERDkr98/RiCtIAAd3MrsBq7uFg+QJ3+
 bbogJCrGyJAfVBDruxyykSzr8tJJJVb4yh0c10Bkx6UjDyhM3tqofR+vEKp24SkJ3SRHK2
 Qqdx0FZU/UvUpHsq7onWETaqW4PunkE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-anSrCpKSP0W1--1WrVo10Q-1; Mon, 15 Aug 2022 02:30:20 -0400
X-MC-Unique: anSrCpKSP0W1--1WrVo10Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBECD8037AF;
 Mon, 15 Aug 2022 06:30:19 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-77.bne.redhat.com [10.64.54.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 968622026D64;
 Mon, 15 Aug 2022 06:30:16 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v2 0/4] hw/arm/virt: Improve address assignment for high
 memory regions
Date: Mon, 15 Aug 2022 14:29:54 +0800
Message-Id: <20220815062958.100366-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
high memory regions:

PATCH[1] and PATCH[2] are cleanup and preparatory works.
PATCH[3] improves address assignment for these high memory regions
PATCH[4] moves the address assignment logic into standalone helper

History
=======
v1: https://lists.nongnu.org/archive/html/qemu-arm/2022-08/msg00013.html

Changelog
=========
v2:
  * Split the patches for easier review                        (Gavin)
  * Improved changelog                                         (Marc)
  * Use 'bool fits' in virt_set_high_memmap()                  (Eric)


Gavin Shan (4):
  hw/arm/virt: Rename variable size to region_size in virt_set_memmap()
  hw/arm/virt: Introduce variable region_base in virt_set_memmap()
  hw/arm/virt: Improve address assignment for high memory regions
  virt/hw/virt: Add virt_set_high_memmap() helper

 hw/arm/virt.c | 84 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 34 deletions(-)

-- 
2.23.0


