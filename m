Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39F12D7D9B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:05:45 +0100 (CET)
Received: from localhost ([::1]:39372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmnY-0004Nk-PM
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxt-0007XK-0N
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxa-0003R8-FZ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orX9E/BqF8hypEKpiucSGtJYx7UZaFRHsfAJQWe4uVc=;
 b=OXsQC9+6IPm0SZQnId4voq6lus1mGD8GnmXQmNA+kEVJeNjg07ztxVPAb0qFlUfIrXBysE
 XtTamam2tWW9r/0xmgPqAUdLSYD9w2vE1oZ/SrnZeMsaTrvPoVrSi7Pa71zunlnxHDTQEN
 2l0fn4WowAg83SxamUXMF4PTMfHxl6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-m3d8j6MSPia4IzKg44RAbw-1; Fri, 11 Dec 2020 12:11:55 -0500
X-MC-Unique: m3d8j6MSPia4IzKg44RAbw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58949800D55;
 Fri, 11 Dec 2020 17:11:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29C3C6F45E;
 Fri, 11 Dec 2020 17:11:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A065811328A9; Fri, 11 Dec 2020 18:11:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/20] hmp: Simplify how qmp_human_monitor_command() gets
 output
Date: Fri, 11 Dec 2020 18:11:33 +0100
Message-Id: <20201211171152.146877-2-armbru@redhat.com>
In-Reply-To: <20201211171152.146877-1-armbru@redhat.com>
References: <20201211171152.146877-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: mdroth@linux.vnet.ibm.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 48c043d0d1 "hmp: human-monitor-command: stop using the Memory
chardev driver" left us "if string is non-empty, duplicate it, else
duplicate the empty string".  Meh.  Duplicate it unconditionally.

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/misc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/monitor/misc.c b/monitor/misc.c
index 398211a034..6c3e8506a9 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -136,11 +136,7 @@ char *qmp_human_monitor_command(const char *command_line, bool has_cpu_index,
     handle_hmp_command(&hmp, command_line);
 
     WITH_QEMU_LOCK_GUARD(&hmp.common.mon_lock) {
-        if (qstring_get_length(hmp.common.outbuf) > 0) {
-            output = g_strdup(qstring_get_str(hmp.common.outbuf));
-        } else {
-            output = g_strdup("");
-        }
+        output = g_strdup(qstring_get_str(hmp.common.outbuf));
     }
 
 out:
-- 
2.26.2


