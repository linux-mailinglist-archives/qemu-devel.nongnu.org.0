Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E55925BD20
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 10:25:12 +0200 (CEST)
Received: from localhost ([::1]:59312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDkYR-0004zk-DM
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 04:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kDkXE-0003CL-Q1
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 04:23:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34574
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kDkXD-0008TQ-7S
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 04:23:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599121434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UjDCYTpK1JOw4ypOGJNlm7ftRL0hXOjYJHqEdU5A9Uc=;
 b=RmtF8LiaeCWStvZEBu8o/23Wrnk5Tz9H8F9wfvAeLDsVoOi14USjG4/R7wA3dtUSj4T9NF
 JJoXeGWwb3BpkLXJH56RQxqcfKqsHPAeed+3xQiIZjepW6A+akVMUcKWOZI66iKpzpdbKW
 9lUN3IxnxreHO0H2guIqg50Wor8fZ4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-nMtJYnZsMxewRb_jXmLDUA-1; Thu, 03 Sep 2020 04:23:52 -0400
X-MC-Unique: nMtJYnZsMxewRb_jXmLDUA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 921A985C731;
 Thu,  3 Sep 2020 08:23:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-68.ams2.redhat.com
 [10.36.113.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9ACC5C1C2;
 Thu,  3 Sep 2020 08:23:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C9EEE10C7784; Thu,  3 Sep 2020 10:23:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/8] qapi: Document event VSERPORT_CHANGE is rate-limited
Date: Thu,  3 Sep 2020 10:23:43 +0200
Message-Id: <20200903082344.1877175-8-armbru@redhat.com>
In-Reply-To: <20200903082344.1877175-1-armbru@redhat.com>
References: <20200903082344.1877175-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:58:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit e2ae6159de "virtio-serial: report frontend connection state via
monitor" neglected to document the new event is rate-limited.  Fix
that.

Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Eric Blake <eblake@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20200806081147.3123652-3-armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qapi/char.json | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/qapi/char.json b/qapi/char.json
index 8aeedf96b2..b4d66ec90b 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -562,6 +562,8 @@
 #
 # @open: true if the guest has opened the virtio-serial port
 #
+# Note: This event is rate-limited.
+#
 # Since: 2.1
 #
 # Example:
-- 
2.26.2


