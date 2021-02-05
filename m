Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78866311085
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:59:39 +0100 (CET)
Received: from localhost ([::1]:45764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l86KP-0007vn-Vt
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:59:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l86I9-0006TQ-SM
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 13:57:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l86I5-0003Na-5I
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 13:57:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612551431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cC4lg8z4hEl4vnT21LmoiUYIEZbsMxVWyOmYhUg91d0=;
 b=PAGHkWU/irJd5Pqmf4h/z1ZNAZhJ791mdctaZGrbxW1hL+W43RvHlQGRRqw9QLpwKKiEaE
 Astg34W7h+xLcuJ3Ec880LmwzbDi13lJDUDJZGxnkBqGUIHtflwVVewpSrwHbBn0FU8KS2
 czrTQle6w3mwqL1Hh7JaIDyEp22JRg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-jvj9eX1xNumetmbsEntL3A-1; Fri, 05 Feb 2021 13:57:09 -0500
X-MC-Unique: jvj9eX1xNumetmbsEntL3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FAD5801962;
 Fri,  5 Feb 2021 18:57:08 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-253.phx2.redhat.com [10.3.112.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 144C960BF1;
 Fri,  5 Feb 2021 18:57:07 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qemu-nbd: Use SOMAXCONN for socket listen() backlog
Date: Fri,  5 Feb 2021 12:57:05 -0600
Message-Id: <20210205185705.1502071-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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
Cc: berrange@redhat.com, rjones@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our default of a backlog of 1 connection is rather puny, particularly
for scenarios where we expect multiple listeners to connect (such as
qemu-nbd -e X).  This is especially important for Unix sockets, as a
definite benefit to clients: at least on Linux, a client trying to
connect to a Unix socket with a backlog gets an EAGAIN failure with no
way to poll() for when the backlog is no longer present short of
sleeping an arbitrary amount of time before retrying.

See https://bugzilla.redhat.com/1925045 for a demonstration of where
our low backlog prevents libnbd from connecting as many parallel
clients as it wants.

Reported-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---

v2: target the correct API used by qemu-nbd, rather than an unrelated
legacy wrapper [Dan]

 qemu-nbd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qemu-nbd.c b/qemu-nbd.c
index 608c63e82a25..cd20ee73be19 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -965,7 +965,8 @@ int main(int argc, char **argv)
     server = qio_net_listener_new();
     if (socket_activation == 0) {
         saddr = nbd_build_socket_address(sockpath, bindto, port);
-        if (qio_net_listener_open_sync(server, saddr, 1, &local_err) < 0) {
+        if (qio_net_listener_open_sync(server, saddr, SOMAXCONN,
+                                       &local_err) < 0) {
             object_unref(OBJECT(server));
             error_report_err(local_err);
             exit(EXIT_FAILURE);
-- 
2.30.0


