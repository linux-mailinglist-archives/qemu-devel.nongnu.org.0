Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F601150FAA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 19:34:19 +0100 (CET)
Received: from localhost ([::1]:45794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iygY6-00012K-MV
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 13:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58888)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iygVy-0007nA-It
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 13:32:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iygVn-0001Ff-Er
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 13:31:56 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47290
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1iygVm-0001E3-2P
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 13:31:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580754712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8y7Epc8q3phPmfn/4rrMSnCW8X62O8N9XOI00NeWjWE=;
 b=dFVLAaNMqu2cDZh6DYqf8yCT3YROD7dvOH12qszZXThQ8laMXoldyLX55qGqsTiTaijyAh
 0FFjv5VDk4pnZ7x6ht/ASuVWB5msriC+kjQ0h6TxmHEqgzDpy6oANC+LoQh9sZQAaBunJq
 X/Jc0O1m8RQ8iXeI3hSb1MFPjedz+UA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-m7BJjnKiOYCscYWBgb6JZg-1; Mon, 03 Feb 2020 13:31:49 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 556B918B9FC1;
 Mon,  3 Feb 2020 18:31:48 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-77.ams2.redhat.com [10.36.117.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA5825D9CA;
 Mon,  3 Feb 2020 18:31:46 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 03/13] exec: Reuse qemu_ram_apply_settings() in
 qemu_ram_remap()
Date: Mon,  3 Feb 2020 19:31:15 +0100
Message-Id: <20200203183125.164879-4-david@redhat.com>
In-Reply-To: <20200203183125.164879-1-david@redhat.com>
References: <20200203183125.164879-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: m7BJjnKiOYCscYWBgb6JZg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I don't see why we shouldn't apply all settings to make it look like the
surrounding RAM (and enable proper VMA merging).

Note: memory backend settings might have overridden these settings. We
would need a callback to let the memory backend fix that up.

Cc: Richard Henderson <rth@twiddle.net>
Cc: Paolo Bonzini <pbonzini@redhat.com>
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


