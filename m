Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA5D65B126
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 12:30:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCJ0a-00075r-G2; Mon, 02 Jan 2023 06:29:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pCJ0W-00075O-LW
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:29:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pCJ0U-0007zG-Fx
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672658968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WRZYxfMVM8KY5WiXPMetfg9W0oQmIo5RrlWrhFLLx2k=;
 b=N7tv2px1duVZRS8EDPhFkrS08uVzQudYb9ZdL+MnRHldwiZ4iTqHjYZQ709NZHrhHE7h/k
 ksW5InHGt6SdwoHOrokqjvwSJDlGmW7e14omQ+kyCoUyaVhA2pHKHiMflacdOfAnJrnAnS
 iuijyUVslogefExnFwIHvzf3Sc2/Pv4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-4l7t8BOROj-JOQatOkBI1w-1; Mon, 02 Jan 2023 06:29:25 -0500
X-MC-Unique: 4l7t8BOROj-JOQatOkBI1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02111101A52E;
 Mon,  2 Jan 2023 11:29:25 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F21E540C2064;
 Mon,  2 Jan 2023 11:29:22 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Chenyi Qiang <chenyi.qiang@intel.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [GIT PULL 0/4] Host Memory Backends and Memory devices queue
 2023-01-02
Date: Mon,  2 Jan 2023 12:29:17 +0100
Message-Id: <20230102112921.68077-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 222059a0fccf4af3be776fe35a5ea2d6a68f9a0b:

  Merge tag 'pull-ppc-20221221' of https://gitlab.com/danielhb/qemu into staging (2022-12-21 18:08:09 +0000)

are available in the Git repository at:

  https://github.com/davidhildenbrand/qemu.git tags/mem-2023-01-02

for you to fetch changes up to 6bb613f0812d1364fc8fcf0846647446884d5148:

  hostmem: Honor multiple preferred nodes if possible (2022-12-28 14:59:55 +0100)

----------------------------------------------------------------
Hi,

"Host Memory Backends" and "Memory devices" queue ("mem"):
- virtio-mem fixes
- Use new MPOL_PREFERRED_MANY mbind() policy for memory backends if
  possible

----------------------------------------------------------------
Chenyi Qiang (2):
  virtio-mem: Fix the bitmap index of the section offset
  virtio-mem: Fix the iterator variable in a vmem->rdl_list loop

Michal Privoznik (1):
  hostmem: Honor multiple preferred nodes if possible

Philippe Mathieu-Daudé (1):
  virtio-mem: Fix typo in function name

 backends/hostmem.c     | 19 +++++++++++++++++--
 hw/virtio/virtio-mem.c | 18 +++++++++---------
 meson.build            |  5 +++++
 3 files changed, 31 insertions(+), 11 deletions(-)

-- 
2.39.0


