Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E456F5ECB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 21:03:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puHkP-0001qr-Pi; Wed, 03 May 2023 15:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1puHkN-0001oQ-IM
 for qemu-devel@nongnu.org; Wed, 03 May 2023 15:02:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1puHkL-0004vi-Oh
 for qemu-devel@nongnu.org; Wed, 03 May 2023 15:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683140557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5drMnwCth7rxuSJPqx4SwAVCfRpz8mWFhYUcdoOB1m0=;
 b=LZ4suq0HC5DNb2Ydj65x+v64f9v+AFCJ6aVQe6zo14sNT+6/yRfQ5mDToSRZsBD91SIQju
 rkHhlzPsJpn3GJe5TM7y7ObUmT1/vsMXqIU6H3w8M212iqhHkqXI6Hv8ryuqjja6F2gR44
 ePzqjBoxAatTrh0PPAinj9GE+phYkL4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-vioEeJxUOiix2AsVZgyjqQ-1; Wed, 03 May 2023 15:02:35 -0400
X-MC-Unique: vioEeJxUOiix2AsVZgyjqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 301FB811E7B
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 19:02:35 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE67B1410F2A;
 Wed,  3 May 2023 19:02:34 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 1/2] systemd: Also clear LISTEN_FDNAMES during systemd socket
 activation
Date: Wed,  3 May 2023 14:02:31 -0500
Message-Id: <20230503190232.362022-2-eblake@redhat.com>
In-Reply-To: <20230503190232.362022-1-eblake@redhat.com>
References: <20230503190232.362022-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Message-Id: <20230324153349.1123774-1-eblake@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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
2.40.1


