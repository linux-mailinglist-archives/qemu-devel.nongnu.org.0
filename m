Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34302071DB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 13:11:27 +0200 (CEST)
Received: from localhost ([::1]:44302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo3JO-0005aI-Nu
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 07:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jo302-0001eH-F5
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:51:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51404
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jo2zz-0001RE-2U
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592995882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5IU006YQ88d5veC791l8custkvzJFLj9YkpXAZ+R5j4=;
 b=QWWUls7YTirqTII9teSxNSyJb+kHTUM91eMYWV5qENh8L0IeeP91Csemam1JklfnDw+WEx
 cXUMyiV3m7RWIhbfDTfDXNuLhswV+9ozDjqlGWEeN3Cxdj6QVBVRTVIXcVv9DBA6y1P0T0
 WFrhGQI7Sop+oDCI1SZaYTdCXsWd00Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-CFmY9F9MN06ctaA1V4jFoA-1; Wed, 24 Jun 2020 06:51:20 -0400
X-MC-Unique: CFmY9F9MN06ctaA1V4jFoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBC2F87950F
 for <qemu-devel@nongnu.org>; Wed, 24 Jun 2020 10:51:19 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79214BA45
 for <qemu-devel@nongnu.org>; Wed, 24 Jun 2020 10:51:19 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/31] ibex_uart: fix XOR-as-pow
Date: Wed, 24 Jun 2020 06:50:47 -0400
Message-Id: <20200624105048.375353-30-pbonzini@redhat.com>
In-Reply-To: <20200624104917.375143-1-pbonzini@redhat.com>
References: <20200624104917.375143-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 03:27:53
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



