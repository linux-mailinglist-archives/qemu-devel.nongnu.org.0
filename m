Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662AE205CF7
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 22:07:45 +0200 (CEST)
Received: from localhost ([::1]:48480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnpCq-0006PD-G9
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 16:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jnp0J-00048e-LX
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 15:54:47 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:56007
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jnp0I-0007dB-0s
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 15:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592942084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5IU006YQ88d5veC791l8custkvzJFLj9YkpXAZ+R5j4=;
 b=CBfRVFu2EdBtRaHeMfZfX/HaTaslrlUir24IJlXogm1giRmnYOHrmrKEmnzUlE8E38Nmdv
 hpBDvwwsymmhFg2Tjoi6tDX+bReSu4hhTR21WAbOdxQYGmsvbnsleecULllvDZQqBZE9ky
 9S4vFn/K/WOpaJ75Uc9gWVVFc+4kLXs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-V60IVn-LNiyFLUtTgUgG4g-1; Tue, 23 Jun 2020 15:54:43 -0400
X-MC-Unique: V60IVn-LNiyFLUtTgUgG4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DBA51005512
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 19:54:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3205910013C0;
 Tue, 23 Jun 2020 19:54:42 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ibex_uart: fix XOR-as-pow
Date: Tue, 23 Jun 2020 15:54:41 -0400
Message-Id: <20200623195441.14646-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:55:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The xor-as-pow warning in clang actually detected a genuine bug.
Fix it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/char/ibex_uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index 3e0dd9968e..45cd724998 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -331,7 +331,7 @@ static void ibex_uart_write(void *opaque, hwaddr addr,
         if (value & UART_CTRL_NCO) {
             uint64_t baud = ((value & UART_CTRL_NCO) >> 16);
             baud *= 1000;
-            baud /= 2 ^ 20;
+            baud >>= 20;
 
             s->char_tx_time = (NANOSECONDS_PER_SECOND / baud) * 10;
         }
-- 
2.26.2


