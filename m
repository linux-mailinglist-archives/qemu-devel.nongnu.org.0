Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2718840DC19
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:00:59 +0200 (CEST)
Received: from localhost ([::1]:58914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQrwg-0001H3-7x
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQrp5-0006jK-U6
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:53:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQrp2-0007bx-UT
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631800384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fN4a8CXPpMWNNcc6nJagJ20NV7dMZ7qMAgiIJ7asXx4=;
 b=ikkms1Y0su8wUMOD8iORCwTJpYoU0R1oZ8UWOHyPdn2BUt74Zy0kWJFZZVU+JYBfR6DSv5
 u+ySbEBJehtLNzS0eecaPiqg/TCHhvGA7ThTKcWatLvgwziWBbtf2BfAk68o1jZKQ5/+cg
 QycaRiCvkjiWlA3m503XyhihgvYqcR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-t-isCO-7NSONmhkzL0EzNQ-1; Thu, 16 Sep 2021 09:53:02 -0400
X-MC-Unique: t-isCO-7NSONmhkzL0EzNQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2842D802E29
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 13:53:02 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.194.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F288A19739;
 Thu, 16 Sep 2021 13:53:00 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, slp@redhat.com, thuth@redhat.com
Subject: [PULL 1/2] tools/virtiofsd: Add fstatfs64 syscall to the seccomp
 allowlist
Date: Thu, 16 Sep 2021 14:52:40 +0100
Message-Id: <20210916135241.150566-2-dgilbert@redhat.com>
In-Reply-To: <20210916135241.150566-1-dgilbert@redhat.com>
References: <20210916135241.150566-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The virtiofsd currently crashes on s390x when doing something like
this in the guest:

 mkdir -p /mnt/myfs
 mount -t virtiofs myfs /mnt/myfs
 touch /mnt/myfs/foo.txt
 stat -f /mnt/myfs/foo.txt

The problem is that the fstatfs64 syscall is called in this case
from the virtiofsd. We have to put it on the seccomp allowlist to
avoid that the daemon gets killed in this case.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2001728
Suggested-by: Vivek Goyal <vgoyal@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210914123214.181885-1-thuth@redhat.com>
Reviewed-by: Vivek Goyal <vgoyal@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_seccomp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
index f49ed94b5e..a3ce9f898d 100644
--- a/tools/virtiofsd/passthrough_seccomp.c
+++ b/tools/virtiofsd/passthrough_seccomp.c
@@ -51,6 +51,7 @@ static const int syscall_allowlist[] = {
     SCMP_SYS(fsetxattr),
     SCMP_SYS(fstat),
     SCMP_SYS(fstatfs),
+    SCMP_SYS(fstatfs64),
     SCMP_SYS(fsync),
     SCMP_SYS(ftruncate),
     SCMP_SYS(futex),
-- 
2.31.1


