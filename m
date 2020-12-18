Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E006C2DE1B2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:02:46 +0100 (CET)
Received: from localhost ([::1]:48236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDX3-00028H-NM
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCe-00039Z-C1
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:41:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCc-0004Yv-JP
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:41:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608288097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rxhTpWjjggPSysnfNJSR2RuDfOejyTuimqUQkrjiBT0=;
 b=KueNAHi5YxfEgl4EOpblQxsEkZkTOhfCWIS62v+fL1tj4Tj7yFAzOsRhNZYtdIO/aYk5cx
 tKg7Wwzk6uvCWALQh8lddAfX/tYkaKN4NAN9CqlYcvOyO46gCsoMO3zSyzFs0d9vReU8Q5
 MyUTqo8gT3Q7nSXgqnlPX5iberXvrhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-MRJ3Ot_gOqaCVcNgxdUPag-1; Fri, 18 Dec 2020 05:41:33 -0500
X-MC-Unique: MRJ3Ot_gOqaCVcNgxdUPag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43E8A801B12;
 Fri, 18 Dec 2020 10:41:32 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-200.ams2.redhat.com
 [10.36.114.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 423A660C15;
 Fri, 18 Dec 2020 10:41:30 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, aiyutao@huawei.com, peter.maydell@linaro.org,
 vgoyal@redhat.com, lersek@redhat.com, alex.chen@huawei.com,
 armbru@redhat.com, tu.guoyi@h3c.com
Subject: [PULL 03/15] monitor:Don't use '#' flag of printf format ('%#') in
 format strings
Date: Fri, 18 Dec 2020 10:41:05 +0000
Message-Id: <20201218104117.199096-4-dgilbert@redhat.com>
In-Reply-To: <20201218104117.199096-1-dgilbert@redhat.com>
References: <20201218104117.199096-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yutao Ai <aiyutao@huawei.com>

Delete '#' and use '0x' prefix instead

Signed-off-by: Yutao Ai <aiyutao@huawei.com>
Message-Id: <20201125014514.55562-4-aiyutao@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 monitor/misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/misc.c b/monitor/misc.c
index 09f9a74d78..6f5ae096dc 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -919,7 +919,7 @@ static void hmp_ioport_read(Monitor *mon, const QDict *qdict)
         suffix = 'l';
         break;
     }
-    monitor_printf(mon, "port%c[0x%04x] = %#0*x\n",
+    monitor_printf(mon, "port%c[0x%04x] = 0x%0*x\n",
                    suffix, addr, size * 2, val);
 }
 
-- 
2.29.2


