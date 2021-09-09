Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4C74046DD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 10:16:16 +0200 (CEST)
Received: from localhost ([::1]:47718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOFEG-0002Rg-NM
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 04:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mOFAk-0000aj-KQ
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:12:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mOFAh-00006n-Vv
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:12:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631175152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TNTcTQ+ISj3v3Er4vqu8GBD8XAmjNDI9D+77ojF2TJQ=;
 b=BavwUDqN09Ngjvipj9lBucSfL/aje124YWhAV7x7VxRobB09LUw65GXdRMwmZi/j8Qf8ND
 hI4shS1ZL8ewQ5E2zHawmrD1yY8D9YwItb4DdpSBTftJgfCPhZ4oU3j/EKLjarfvg7ZCPb
 zWT79CpkLXNj1k5JuoVXKElTIl+v27k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-unykdFXgPQuvYvmqen2RNg-1; Thu, 09 Sep 2021 04:12:31 -0400
X-MC-Unique: unykdFXgPQuvYvmqen2RNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A21D81835AC2;
 Thu,  9 Sep 2021 08:12:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49555100EBBF;
 Thu,  9 Sep 2021 08:12:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BECC11138611; Thu,  9 Sep 2021 10:12:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hmp: Unbreak "change vnc"
Date: Thu,  9 Sep 2021 10:12:18 +0200
Message-Id: <20210909081219.308065-2-armbru@redhat.com>
In-Reply-To: <20210909081219.308065-1-armbru@redhat.com>
References: <20210909081219.308065-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-stable@nongnu.org, dgilbert@redhat.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

HMP command "change vnc" can take the password as argument, or prompt
for it:

    (qemu) change vnc password 123
    (qemu) change vnc password
    Password: ***
    (qemu)

This regressed in commit cfb5387a1d "hmp: remove "change vnc TARGET"
command", v6.0.0.

    (qemu) change vnc passwd 123
    Password: ***
    (qemu) change vnc passwd
    (qemu)

The latter passes NULL to qmp_change_vnc_password(), which is a no-no.
Looks like it puts the display into "password required, but none set"
state.

The logic error is easy to miss in review, but testing should've
caught it.

Fix the obvious way.

Fixes: cfb5387a1de2acda23fb5c97d2378b9e7ddf8025
Cc: qemu-stable@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/hmp-cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index e00255f7ee..a7e197a90b 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1496,7 +1496,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
         }
         if (strcmp(target, "passwd") == 0 ||
             strcmp(target, "password") == 0) {
-            if (arg) {
+            if (!arg) {
                 MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
                 monitor_read_password(hmp_mon, hmp_change_read_arg, NULL);
                 return;
-- 
2.31.1


