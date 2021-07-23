Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DE73D3857
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 12:09:41 +0200 (CEST)
Received: from localhost ([::1]:52568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6s7g-0008Bb-Rx
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 06:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6s40-0002wv-Kp
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:05:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6s3x-0007FY-Jy
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627034749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GN6pgXZNs4ngS7CjJRFpmIK7L+C9Jao6DY9HTA1vLtE=;
 b=GYdG/gXei0lsLkUwic3pDSVOcizzjkaDbo6CVDf8hloVhSwnmBWCjoq3UPW9RrMkmOysT5
 kKWtZcs5bWZe679e1ZqdkUhX7BFkY0ch4ndSsL1LLMA5iM5sEBKC6DVKEIeqwXihOG2lg6
 rnxPnYfz+Ds0NbM3d7BicYPJCXgJ5QM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-v4UFg3tLMteTzSUuC10UAQ-1; Fri, 23 Jul 2021 06:05:47 -0400
X-MC-Unique: v4UFg3tLMteTzSUuC10UAQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0659180FCCD;
 Fri, 23 Jul 2021 10:05:46 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-253.ams2.redhat.com [10.36.112.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D5AC18431;
 Fri, 23 Jul 2021 10:05:45 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] MAINTAINERS: Add memory_mapping.h and memory_mapping.c to
 "Memory API"
Date: Fri, 23 Jul 2021 12:05:32 +0200
Message-Id: <20210723100532.27353-4-david@redhat.com>
In-Reply-To: <20210723100532.27353-1-david@redhat.com>
References: <20210723100532.27353-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both files logically belong to "Memory API" and are not yet listed
anywhere else explicitly. Let's add them to "Memory API".

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 190a90b541..445f7fe2d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2460,9 +2460,11 @@ F: include/exec/memop.h
 F: include/exec/memory.h
 F: include/exec/ram_addr.h
 F: include/exec/ramblock.h
+F: include/sysemu/memory_mapping.h
 F: softmmu/dma-helpers.c
 F: softmmu/ioport.c
 F: softmmu/memory.c
+F: softmmu/memory_mapping.c
 F: softmmu/physmem.c
 F: include/exec/memory-internal.h
 F: scripts/coccinelle/memory-region-housekeeping.cocci
-- 
2.31.1


