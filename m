Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CE4DEAB4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 13:20:48 +0200 (CEST)
Received: from localhost ([::1]:38092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMVjz-0007W6-4L
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 07:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46457)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iMVQ0-0003fC-40
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 07:00:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iMVPy-00041S-2z
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 07:00:07 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44301
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iMVPw-0003yT-5S
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 07:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571655602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7SS/1tNTnDzcfBW9a9+raQ+6Bii4YZUoFu+jznNG9jg=;
 b=alsl3gOMt5Ic+b9eCY357t5yDnrx3kTeyK5qHsVu+Tbytn3lprykFgpzki8UzIjB2JeP1l
 LqeetYHFGYMl2sfiSr8GC5+6sz1PzwD9BMssZmzKWJvCSol1xZMnLxUUcoWEYOXI9R6fIQ
 k5Iu5OVCg1JVU1v3YEWCcMCPib1Gt5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-JW2fB6wxO-Wh3mlVYdEJ4w-1; Mon, 21 Oct 2019 06:59:58 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 755FF800D41;
 Mon, 21 Oct 2019 10:59:57 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-232.ams2.redhat.com
 [10.36.117.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9BFF60619;
 Mon, 21 Oct 2019 10:59:55 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com
Subject: [PATCH 14/30] virtiofsd: add -o source=PATH to help output
Date: Mon, 21 Oct 2019 11:58:16 +0100
Message-Id: <20191021105832.36574-15-dgilbert@redhat.com>
In-Reply-To: <20191021105832.36574-1-dgilbert@redhat.com>
References: <20191021105832.36574-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: JW2fB6wxO-Wh3mlVYdEJ4w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: piaojun@huawei.com, eguan@linux.alibaba.com, vgoyal@Redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

The -o source=3DPATH option will be used by most command-line invocations.
Let's document it!

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 contrib/virtiofsd/passthrough_ll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/passthr=
ough_ll.c
index 63a32c87c3..847814b793 100644
--- a/contrib/virtiofsd/passthrough_ll.c
+++ b/contrib/virtiofsd/passthrough_ll.c
@@ -1237,6 +1237,7 @@ int main(int argc, char *argv[])
 =09if (opts.show_help) {
 =09=09printf("usage: %s [options]\n\n", argv[0]);
 =09=09fuse_cmdline_help();
+=09=09printf("    -o source=3DPATH             shared directory tree\n");
 =09=09fuse_lowlevel_help();
 =09=09ret =3D 0;
 =09=09goto err_out1;
--=20
2.23.0


