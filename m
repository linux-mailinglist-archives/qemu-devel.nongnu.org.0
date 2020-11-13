Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66A42B1916
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 11:32:43 +0100 (CET)
Received: from localhost ([::1]:50660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdWNm-0003gT-Hk
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 05:32:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1kdWMg-00036w-7v
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:31:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1kdWMZ-0000kA-6D
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605263484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bqr5FYTKpXn7+CW/Ni0UeBe+j7w+EwIxdYKHa4i2nH8=;
 b=a+j+1VmZUNzevltVyBCfoIyqnpfxeWHnaODflk8Z51pZwJuQi48ualuDATE+Hsh+85JAcr
 pEaGCk792ZfVRaQ6pK0d8bQ+VERSsBzPZfWhs3h/Z46KAPN8jT25c6NcLYNNe/UOcGmp6X
 /dd9QnmYe8OPc2aeQQc/VDZ9UG91vwo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-TgwVhZb7OnCLsN82UIB5TQ-1; Fri, 13 Nov 2020 05:31:21 -0500
X-MC-Unique: TgwVhZb7OnCLsN82UIB5TQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A1E18030BC;
 Fri, 13 Nov 2020 10:31:20 +0000 (UTC)
Received: from f32-work.redhat.com (unknown [10.40.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F9F55C26A;
 Fri, 13 Nov 2020 10:31:17 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] net/e1000e_core: adjust count if RDH exceeds RDT in
 e1000e_ring_advance()
Date: Fri, 13 Nov 2020 11:31:13 +0100
Message-Id: <20201113103113.223239-1-mcascell@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mcascell@redhat.com, dmitry.fleytman@gmail.com, gaoning.pgn@antgroup.com,
 jasowang@redhat.com, lersek@redhat.com, 330cjfdn@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The e1000e_write_packet_to_guest() function iterates over a set of
receive descriptors by advancing rx descriptor head register (RDH) from
its initial value to rx descriptor tail register (RDT). The check in
e1000e_ring_empty() is responsible for detecting whether RDH has reached
RDT, terminating the loop if that's the case. Additional checks have
been added in the past to deal with bogus values submitted by the guest
to prevent possible infinite loop. This is done by "wrapping around" RDH
at some point and detecting whether it assumes the original value during
the loop.

However, when e1000e is configured to use the packet split feature, RDH is
incremented by two instead of one, as the packet split descriptors are
32 bytes while regular descriptors are 16 bytes. A malicious or buggy
guest may set RDT to an odd value and transmit only null RX descriptors.
This corner case would prevent RDH from ever matching RDT, leading to an
infinite loop. This patch adds a check in e1000e_ring_advance() to make sure
RDH does not exceed RDT in a single incremental step, adjusting the count
value accordingly.

This issue was independently reported by Gaoning Pan (Zhejiang University)
and Cheolwoo Myung.

Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Tested-by: Mauro Matteo Cascella <mcascell@redhat.com>
Reported-by: Gaoning Pan <gaoning.pgn@antgroup.com>
Reported-by: Cheolwoo Myung <330cjfdn@gmail.com>
---
Changes since previous version:
Take the initial values of RDH/RDT into account. Address the case where RDH is
less than RDT and (RDH + count) would exceed RDT.

Patch v1:
https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg01492.html

References:
https://git.qemu.org/?p=qemu.git;a=commit;h=dd793a74882477ca38d49e191110c17dfe
https://git.qemu.org/?p=qemu.git;a=commit;h=4154c7e03fa55b4cf52509a83d50d6c09d743b7
http://www.intel.com/content/dam/doc/datasheet/82574l-gbe-controller-datasheet.pdf

 hw/net/e1000e_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index bcfd46696f..324cc14ffb 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -829,6 +829,11 @@ e1000e_ring_head_descr(E1000ECore *core, const E1000E_RingInfo *r)
 static inline void
 e1000e_ring_advance(E1000ECore *core, const E1000E_RingInfo *r, uint32_t count)
 {
+    if (count > 1 && core->mac[r->dh] < core->mac[r->dt] &&
+        core->mac[r->dh] + count > core->mac[r->dt]) {
+        count = core->mac[r->dt] - core->mac[r->dh];
+    }
+
     core->mac[r->dh] += count;
 
     if (core->mac[r->dh] * E1000_RING_DESC_LEN >= core->mac[r->dlen]) {
-- 
2.28.0


