Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501646C8187
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:40:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfjQc-0000MX-1r; Fri, 24 Mar 2023 11:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pfjQY-0000Kw-7T
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:34:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pfjQV-0008LD-Vc
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:34:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679672033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mAbBS99Tk9MDN9Xt1Z8xKBYlOLKgeBrUM86VYJIwmRw=;
 b=RbFsZZgOnMlwLk6GrzgSsXs1xXYJRbvF7/iqDojKT0+qlvvtlYSbdnYRXRADIxLGRDCEt8
 exa8oSTuB3uwb3mW/K5xu5rTKklPpMSl4dTHbl9tBL5DvBzNeiImJmT+c6cBKeCJkfZnwF
 e9B3gH0tumfKdHbBqKyt0bQncRvEMek=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-Oe1Kg4kHOFCe83_YFWW3zw-1; Fri, 24 Mar 2023 11:33:51 -0400
X-MC-Unique: Oe1Kg4kHOFCe83_YFWW3zw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A041685C069
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 15:33:51 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EA8D2166B29
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 15:33:51 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] systemd: Also clear LISTEN_FDNAMES during systemd socket
 activation
Date: Fri, 24 Mar 2023 10:33:49 -0500
Message-Id: <20230324153349.1123774-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Some time after systemd documented LISTEN_PID and LISTEN_FDS for
socket activation, they later added LISTEN_FDNAMES; now documented at:
https://www.freedesktop.org/software/systemd/man/sd_listen_fds.html

In particular, look at the implementation of sd_listen_fds_with_names():
https://github.com/systemd/systemd/blob/main/src/libsystemd/sd-daemon/sd-daemon.c

If we ever pass LISTEN_PID=xxx and LISTEN_FDS=n to a child process,
but leave LISTEN_FDNAMES=... unchanged as inherited from our parent
process, then our child process using sd_listen_fds_with_names() might
see a mismatch in the number of names (unexpected -EINVAL failure), or
even if the number of names matches the values of those names may be
unexpected (with even less predictable results).

Usually, this is not an issue - the point of LISTEN_PID is to tell
systemd socket activation to ignore all other LISTEN_* if they were
not directed to this particular pid.  But if we end up consuming a
socket directed to this qemu process, and later decide to spawn a
child process that also needs systemd socket activation, we must
ensure we are not leaking any stale systemd variables through to that
child.  The easiest way to do this is to wipe ALL LISTEN_* variables
at the time we consume a socket, even if we do not yet care about a
LISTEN_FDNAMES passed in from the parent process.

See also https://lists.freedesktop.org/archives/systemd-devel/2023-March/048920.html

Thanks: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 util/systemd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/util/systemd.c b/util/systemd.c
index 5bcac9b4016..ced518f771b 100644
--- a/util/systemd.c
+++ b/util/systemd.c
@@ -51,6 +51,7 @@ unsigned int check_socket_activation(void)
     /* So these are not passed to any child processes we might start. */
     unsetenv("LISTEN_FDS");
     unsetenv("LISTEN_PID");
+    unsetenv("LISTEN_FDNAMES");

     /* So the file descriptors don't leak into child processes. */
     for (i = 0; i < nr_fds; ++i) {
-- 
2.39.2


