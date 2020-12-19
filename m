Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2549D2DEE6D
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 12:10:04 +0100 (CET)
Received: from localhost ([::1]:56454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqa7f-0007Fu-6W
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 06:10:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtx-00057b-SM
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtm-0007IG-V7
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1KYwEpAPrt3ArSPA+Bhqpfo1OJ8m+fTgasqNMiqO+LQ=;
 b=URZ6xTBpCI8sWu51lhFyn55nwX3PIZdTDhOQ7Ose6UBaszsFD0S7+lIaw0xA6sNGvgdUgl
 EsWFsTvb/sxwovKkcqN6RkQSxT8gNam37AovxZwls60gY5REoQJ91To8cq4XvuV6FXiWJ2
 w5O2jIj3Vc/YLWnuW6VVngvKATob0Fo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-lff89r2gOFWkw44Jr6DFog-1; Sat, 19 Dec 2020 05:55:37 -0500
X-MC-Unique: lff89r2gOFWkw44Jr6DFog-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBA64801A9D;
 Sat, 19 Dec 2020 10:55:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE34610016FB;
 Sat, 19 Dec 2020 10:55:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 87940112688E; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/33] hmp: Simplify how qmp_human_monitor_command() gets output
Date: Sat, 19 Dec 2020 11:55:13 +0100
Message-Id: <20201219105532.1734134-15-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
References: <20201219105532.1734134-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: peter.maydell@linaro.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 48c043d0d1 "hmp: human-monitor-command: stop using the Memory
chardev driver" left us "if string is non-empty, duplicate it, else
duplicate the empty string".  Meh.  Duplicate it unconditionally.

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201211171152.146877-2-armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 monitor/misc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/monitor/misc.c b/monitor/misc.c
index f2ee7cd77a..33d0dae2e8 100644
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


