Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BA515193D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 12:06:24 +0100 (CET)
Received: from localhost ([::1]:56337 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyw2C-0006mJ-0F
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 06:06:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34108)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iyw15-0005PY-46
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 06:05:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iyw14-0008Gh-7R
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 06:05:15 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31608
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iyw14-0008FH-3j
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 06:05:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580814313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14kq5d+foMHeDOqerF4q1gkxPLiv0zQk7IdFqSD4D9k=;
 b=bpd4+93ziukdxbUvqWt/7PkXHcxEM/Hbv85z+WXb2m7bdrEUSPDwUdVpxeSNe/a+v8gS1o
 8b97/dqtr9Er6zxMI5FtfM3TrnEVURpdy9ZFWM1pw37ewZX9Qke3ZrVDUvPC1x+M6A92WB
 H45IykNMVHP2Tj2Gx0a5me/FEbgLLHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-uWDzXR65PdGzcevkg2OqAw-1; Tue, 04 Feb 2020 06:05:11 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64795184AEB9
 for <qemu-devel@nongnu.org>; Tue,  4 Feb 2020 11:05:10 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9F3A19486;
 Tue,  4 Feb 2020 11:05:09 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PATCH 3/4] virtiofsd: load_capng missing unlock
Date: Tue,  4 Feb 2020 11:05:00 +0000
Message-Id: <20200204110501.10731-4-dgilbert@redhat.com>
In-Reply-To: <20200204110501.10731-1-dgilbert@redhat.com>
References: <20200204110501.10731-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: uWDzXR65PdGzcevkg2OqAw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Missing unlock in error path.

Fixes: Covertiy CID 1413123
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index e6f2399efc..c635fc8820 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -232,6 +232,7 @@ static int load_capng(void)
          */
         cap.saved =3D capng_save_state();
         if (!cap.saved) {
+            pthread_mutex_unlock(&cap.mutex);
             fuse_log(FUSE_LOG_ERR, "capng_save_state (thread)\n");
             return -EINVAL;
         }
--=20
2.24.1


