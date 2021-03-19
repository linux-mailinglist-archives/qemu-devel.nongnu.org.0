Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DD23419B0
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:16:07 +0100 (CET)
Received: from localhost ([::1]:47704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCAo-0002XE-2i
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lNC83-0000ox-PF
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:13:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lNC82-0008SP-48
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:13:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616148793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gm0bKn2AknzXfWOrVnF1vpMqFpQSv+NvTkNokQkf9SU=;
 b=Lfg1hNaLeN2DVlYzBI2VlvXKGN+V8CEE45rGU8cZ+CKodMdejqfB+136enlCMHyx37qtkx
 BaJBRoC/u5NCHwU847h/w1b2IptxrHDCJAWOvVzdKEZZTvymVvNbAALFrA2sxMXYPooc8C
 LDh3j1BxhmWVkgjHRrCWOj8vOZotw+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-jfFwo_aXOjmwTPLhBgSbbw-1; Fri, 19 Mar 2021 06:13:11 -0400
X-MC-Unique: jfFwo_aXOjmwTPLhBgSbbw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D411180FCAC;
 Fri, 19 Mar 2021 10:13:10 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-11.ams2.redhat.com [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E87F910013C1;
 Fri, 19 Mar 2021 10:13:06 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/14] softmmu/physmem: Fix qemu_ram_remap() to handle
 shared anonymous memory
Date: Fri, 19 Mar 2021 11:12:19 +0100
Message-Id: <20210319101230.21531-4-david@redhat.com>
In-Reply-To: <20210319101230.21531-1-david@redhat.com>
References: <20210319101230.21531-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RAM_SHARED now also properly indicates shared anonymous memory. Let's check
that flag for anonymous memory as well, to restore the proper mapping.

Fixes: 06329ccecfa0 ("mem: add share parameter to memory-backend-ram")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 softmmu/physmem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index afff96a6dc..cc59f05593 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2222,13 +2222,13 @@ void qemu_ram_remap(ram_addr_t addr, ram_addr_t length)
                 abort();
             } else {
                 flags = MAP_FIXED;
+                flags |= block->flags & RAM_SHARED ?
+                         MAP_SHARED : MAP_PRIVATE;
                 if (block->fd >= 0) {
-                    flags |= (block->flags & RAM_SHARED ?
-                              MAP_SHARED : MAP_PRIVATE);
                     area = mmap(vaddr, length, PROT_READ | PROT_WRITE,
                                 flags, block->fd, offset);
                 } else {
-                    flags |= MAP_PRIVATE | MAP_ANONYMOUS;
+                    flags |= MAP_ANONYMOUS;
                     area = mmap(vaddr, length, PROT_READ | PROT_WRITE,
                                 flags, -1, 0);
                 }
-- 
2.29.2


