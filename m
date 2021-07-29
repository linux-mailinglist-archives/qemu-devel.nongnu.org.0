Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B5C3DA4C4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 15:53:47 +0200 (CEST)
Received: from localhost ([::1]:54526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m96Tq-0005Hr-Ku
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 09:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8378b2bce=sidcha@amazon.de>)
 id 1m96Sp-0004Xz-3n
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:52:43 -0400
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:17133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8378b2bce=sidcha@amazon.de>)
 id 1m96Sl-0002BX-Nc
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1627566760; x=1659102760;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=vOwTZ5orfIykxaqp7JrAwtEKMxnNxzc6TJ11+WdRNEs=;
 b=IE328I3h5Vpdm0dvlEWilG/AEzBgXoT9wPVMe6B/CL7jczpsTBpFV4zP
 ozpcmoQFNP2QqLpHwSNoW063SGvW4Xz4fn/e+zrNiBKiem3CBwwAZxLlr
 K8i5IJEV1wwNzf7KIvXXNHEClUrrFQ+3amhg4X0QZhFg0v9j4hQ3Ny0Cv Q=;
X-IronPort-AV: E=Sophos;i="5.84,278,1620691200"; d="scan'208";a="128792960"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6002.iad6.amazon.com with ESMTP; 29 Jul 2021 13:52:31 +0000
Received: from EX13D28EUC003.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id C7CD4240413; Thu, 29 Jul 2021 13:52:29 +0000 (UTC)
Received: from uc8bbc9586ea454.ant.amazon.com (10.43.160.66) by
 EX13D28EUC003.ant.amazon.com (10.43.164.43) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Thu, 29 Jul 2021 13:52:26 +0000
From: Siddharth Chandrasekaran <sidcha@amazon.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
CC: Siddharth Chandrasekaran <sidcha.dev@gmail.com>, Liran Alon
 <liran@amazon.com>, Ioannis Aslanidis <iaslan@amazon.de>,
 <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>, Siddharth Chandrasekaran
 <sidcha@amazon.de>
Subject: [PATCH] hyperv: Fix struct hv_message_header ordering
Date: Thu, 29 Jul 2021 15:52:10 +0200
Message-ID: <20210729135210.16970-1-sidcha@amazon.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.160.66]
X-ClientProxiedBy: EX13D20UWA003.ant.amazon.com (10.43.160.97) To
 EX13D28EUC003.ant.amazon.com (10.43.164.43)
Precedence: Bulk
Received-SPF: pass client-ip=52.95.49.90;
 envelope-from=prvs=8378b2bce=sidcha@amazon.de; helo=smtp-fw-6002.amazon.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

According to Hyper-V TLFS Version 6.0b, struct hv_message_header members
should be defined in the order:

	message_type, _reserved, message_flags, payload_size

but we have it defined in the order:

	message_type, payload_size, message_flags, _reserved

that is, the payload_size and _reserved members swapped. Due to this mix
up, we were inadvertently causing two issues:

    - The payload_size field has invalid data; it didn't cause an issue
      so far because we are delivering only timer messages which has fixed
      size payloads the guest probably did a sizeof(payload) instead
      relying on the value of payload_size member.

    - The message_flags was always delivered as 0 to the guest;
      fortunately, according to section 13.3.1 message_flags is also
      treated as a reserved field.

Although this is not causing an issue now, it might in future (we are
adding more message types in our VSM implementation) so fix it to
reflect the specification.

Signed-off-by: Siddharth Chandrasekaran <sidcha@amazon.de>
---
 include/hw/hyperv/hyperv-proto.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/hyperv/hyperv-proto.h b/include/hw/hyperv/hyperv-proto.h
index 21dc28aee9..f578a60e78 100644
--- a/include/hw/hyperv/hyperv-proto.h
+++ b/include/hw/hyperv/hyperv-proto.h
@@ -101,9 +101,9 @@ struct hyperv_signal_event_input {
  */
 struct hyperv_message_header {
     uint32_t message_type;
-    uint8_t  payload_size;
-    uint8_t  message_flags; /* HV_MESSAGE_FLAG_XX */
     uint8_t  _reserved[2];
+    uint8_t  message_flags; /* HV_MESSAGE_FLAG_XX */
+    uint8_t  payload_size;
     uint64_t sender;
 };
 
-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




