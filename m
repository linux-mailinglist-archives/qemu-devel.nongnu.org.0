Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6211515AA66
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 14:51:35 +0100 (CET)
Received: from localhost ([::1]:38162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1sQQ-0002vu-Ee
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 08:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39306)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j1sIl-00075R-MZ
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:43:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j1sIk-00044l-Km
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:43:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57230
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j1sIk-00044J-H3
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581515018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X6WUlVonFsZtKBb2gz2kBtwE/N1ki16+gfem00/U4IQ=;
 b=fthkQl54GpsGQWP5CmuBQ7vZaAxX0PFEUnAfbX8kIYG6wrLMceIlYo5g9ylahlTiu92qiJ
 9ZsyA6ov+hBI8oSiCbDPhdRCPZZ0sqHxu2WK1STtolt+CxVxocFL5HXd6uzUlz7IfkCiGI
 JDxYQZl75vw8YCzBaPlDCH+vldyVNvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-cj85Ev7bMKW_HkOU6GKc-A-1; Wed, 12 Feb 2020 08:43:36 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 577F6DBB8;
 Wed, 12 Feb 2020 13:43:35 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-92.ams2.redhat.com [10.36.117.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E6031001B08;
 Wed, 12 Feb 2020 13:43:33 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 fixed 06/16] exec: Reuse qemu_ram_apply_settings() in
 qemu_ram_remap()
Date: Wed, 12 Feb 2020 14:42:44 +0100
Message-Id: <20200212134254.11073-7-david@redhat.com>
In-Reply-To: <20200212134254.11073-1-david@redhat.com>
References: <20200212134254.11073-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: cj85Ev7bMKW_HkOU6GKc-A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I don't see why we shouldn't apply all settings to make it look like the
surrounding RAM (and enable proper VMA merging).

Note: memory backend settings might have overridden these settings. We
would need a callback to let the memory backend fix that up.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 exec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/exec.c b/exec.c
index 31a462a7d3..f7525867ec 100644
--- a/exec.c
+++ b/exec.c
@@ -2552,8 +2552,7 @@ void qemu_ram_remap(ram_addr_t addr, ram_addr_t lengt=
h)
                                  length, addr);
                     exit(1);
                 }
-                memory_try_enable_merging(vaddr, length);
-                qemu_ram_setup_dump(vaddr, length);
+                qemu_ram_apply_settings(vaddr, length);
             }
         }
     }
--=20
2.24.1


