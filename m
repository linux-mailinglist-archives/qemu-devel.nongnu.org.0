Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5E351D91A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 15:27:57 +0200 (CEST)
Received: from localhost ([::1]:50238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmxzv-0006Mg-S9
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 09:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nmxxU-0004oU-Nu
 for qemu-devel@nongnu.org; Fri, 06 May 2022 09:25:24 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:34073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nmxxR-0001WP-2O
 for qemu-devel@nongnu.org; Fri, 06 May 2022 09:25:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651843518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bE/HVaw2oIKo1cwQ5JQGGCcThU6Kr9CU/dgyEhoImIE=;
 b=eYQeBwC+mortN/qaEmZdSHp4H3q42ZIe7SwRJuWkSUSQ8E13Oo4ZJaURp4PWCHcKLmeiR8
 dDE2uOEisvTitv8FwPjGGOicCaca0ITm93PSA79FtJlyDwaVsj7wvWesBwi1S6ef8QQupa
 ekUCtoOSP8C37+vfhYFSNYP9ItrIOxQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-tU0C-ehLMz-uolDmWEiirw-1; Fri, 06 May 2022 09:25:17 -0400
X-MC-Unique: tU0C-ehLMz-uolDmWEiirw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EB81185A7A4;
 Fri,  6 May 2022 13:25:17 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9A6C40F160;
 Fri,  6 May 2022 13:25:15 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com
Cc: stefanb@linux.vnet.ibm.com,
	cohuck@redhat.com,
	f4bug@amsat.org
Subject: [PATCH v5 0/2] vfio/common: remove spurious tpm-crb-cmd misalignment
 warning
Date: Fri,  6 May 2022 15:25:08 +0200
Message-Id: <20220506132510.1847942-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.74; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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

The CRB command buffer currently is a RAM MemoryRegion and given
its base address alignment, it causes an error report on
vfio_listener_region_add(). This region could have been a RAM device
region, easing the detection of such safe situation but this option
was not well received. So let's add a helper function that uses the
memory region owner type to detect the situation is safe wrt
the assignment. Other device types can be checked here if such kind
of problem occurs again.

As TPM devices can be compiled out we need to introduce a stub
for TPM_IS_CRB.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/tpm-crb-vfio-v5

History:

v4 -> v5:
- Add sysemu: tpm: Add a stub function for TPM_IS_CRB to fix
  compilation error if CONFIG_TPM is unset

Eric Auger (2):
  sysemu: tpm: Add a stub function for TPM_IS_CRB
  vfio/common: remove spurious tpm-crb-cmd misalignment warning

 hw/vfio/common.c     | 27 ++++++++++++++++++++++++++-
 hw/vfio/trace-events |  1 +
 include/sysemu/tpm.h |  6 ++++++
 3 files changed, 33 insertions(+), 1 deletion(-)

-- 
2.35.1


