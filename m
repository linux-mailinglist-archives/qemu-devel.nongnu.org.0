Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB465310003
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 23:22:45 +0100 (CET)
Received: from localhost ([::1]:34628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7n1Q-0008Sg-Bt
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 17:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7mzb-0007pU-OG
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 17:20:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7mzP-0001fK-Sp
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 17:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612477231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NskRHw0DW2WNKp3FHeQ8VkowP4UIajgFl7QbPvnoKBs=;
 b=gMuhvzFlVB934i+iid47w5pmcYaEy0zNvGx7YmQAAaVMjofMCvIottLIeFBz9pye0mnrnL
 Cpd2PckuoG+oJs1YQiE7WLK8/pjDCPGltkCq+o0VTUAuEtPoIrp0n4vF3WxdJU+l+kNfa/
 dGruWjFfYsyRRHl2TtW2Qj8u7I5+teI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-Vonc0m-COmi1Jz8_Ud2tzg-1; Thu, 04 Feb 2021 17:20:30 -0500
X-MC-Unique: Vonc0m-COmi1Jz8_Ud2tzg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 731C1107AD5C;
 Thu,  4 Feb 2021 22:20:22 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E239510016FA;
 Thu,  4 Feb 2021 22:20:21 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] sockets: Use SOMAXCONN for Unix socket listen()
Date: Thu,  4 Feb 2021 16:20:18 -0600
Message-Id: <20210204222018.1432848-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: berrange@redhat.com, rjones@redhat.com, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our default of a backlog of 1 connection is rather puny, particularly
for scenarios where we expect multiple listeners to connect (such as
qemu-nbd -e X).  For Unix sockets, there's no real harm in supporting
a larger backlog, and a definite benefit to the clients: at least on
Linux, a client trying to connect to a Unix socket with a backlog gets
an EAGAIN failure with no way to poll() for when the backlog is no
longer present short of sleeping an arbitrary amount of time before
retrying.

See https://bugzilla.redhat.com/1925045 for a demonstration of where
our low backlog prevents libnbd from connecting as many parallel
clients as it wants.

Reported-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 util/qemu-sockets.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 8af0278f15c6..a7573e9f0fda 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1059,7 +1059,7 @@ int unix_listen(const char *str, Error **errp)

     saddr = g_new0(UnixSocketAddress, 1);
     saddr->path = g_strdup(str);
-    sock = unix_listen_saddr(saddr, 1, errp);
+    sock = unix_listen_saddr(saddr, SOMAXCONN, errp);
     qapi_free_UnixSocketAddress(saddr);
     return sock;
 }
-- 
2.30.0


