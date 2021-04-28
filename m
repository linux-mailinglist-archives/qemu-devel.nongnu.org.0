Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4682F36D894
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:49:03 +0200 (CEST)
Received: from localhost ([::1]:40764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbkYo-0000yt-89
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbkTX-00045n-8m
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:43:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbkTV-00009x-JV
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:43:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619617410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=20qt2EnzwFpcw01o+wmJhQR2fpMjgJcjeppQq//Cu0U=;
 b=OKSVcZuN4g7wSMXZ9IT3Ywk0tTweffPsnJsJHV7mLkfP+8zFJHrpUGTgFYtOF+bOYqIdFB
 jNeAuOdmvXJyYUAkSHleo8P4e1MIeZrIRz9kPf8GE9K2oqGv5Vlmn8qWiv1oAfw8uHCxUX
 sTlb6kiF2ZEqIp5ykCopRYvb3U/YbmQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-Z1pkYwpQN3uqz3-Lm8N1Ew-1; Wed, 28 Apr 2021 09:43:28 -0400
X-MC-Unique: Z1pkYwpQN3uqz3-Lm8N1Ew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2410501ED;
 Wed, 28 Apr 2021 13:43:27 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-36.ams2.redhat.com [10.36.114.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B303760C05;
 Wed, 28 Apr 2021 13:43:23 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 13/15] hmp: Print "share" property of memory backends with
 "info memdev"
Date: Wed, 28 Apr 2021 15:37:52 +0200
Message-Id: <20210428133754.10713-14-david@redhat.com>
In-Reply-To: <20210428133754.10713-1-david@redhat.com>
References: <20210428133754.10713-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nitesh Lal <nilal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's print the property.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Eric Blake <eblake@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/core/machine-hmp-cmds.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
index 58248cffa3..004a92b3d6 100644
--- a/hw/core/machine-hmp-cmds.c
+++ b/hw/core/machine-hmp-cmds.c
@@ -110,6 +110,8 @@ void hmp_info_memdev(Monitor *mon, const QDict *qdict)
                        m->value->dump ? "true" : "false");
         monitor_printf(mon, "  prealloc: %s\n",
                        m->value->prealloc ? "true" : "false");
+        monitor_printf(mon, "  share: %s\n",
+                       m->value->share ? "true" : "false");
         monitor_printf(mon, "  policy: %s\n",
                        HostMemPolicy_str(m->value->policy));
         visit_complete(v, &str);
-- 
2.30.2


