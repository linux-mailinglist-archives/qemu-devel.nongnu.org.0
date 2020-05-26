Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9A31A3509
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Apr 2020 15:42:33 +0200 (CEST)
Received: from localhost ([::1]:49524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMXRw-0003N6-B1
	for lists+qemu-devel@lfdr.de; Thu, 09 Apr 2020 09:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60018)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jMXR8-0002tn-KT
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 09:41:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jMXR7-0007sQ-IF
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 09:41:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57927
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jMXR7-0007s4-FL
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 09:41:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586439700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=a/91yVqxZcIw63YdAoEj4/KvkSzFyEzMQaQgQKTdxPQ=;
 b=eSLjDuiVfGNYvSbSlP9umYzRYNOJkwqHvO/g+IMqK/1I0ELFUZvZg+pWjzxJNEP4SJl4Qi
 w9/pTkQ47ekjQGrSMbjx4TRa6OjTVLBZV0T7PfqzPbj7q5Qj7NeOjfaqIoQGHtqlb9mbHr
 FNk7ccEFAArjSFzGMUOtCr9MhCE5Ad8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-18IP8MpDNpKI47ubX3AkAQ-1; Thu, 09 Apr 2020 09:41:38 -0400
X-MC-Unique: 18IP8MpDNpKI47ubX3AkAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC5D98017FD;
 Thu,  9 Apr 2020 13:41:37 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C3C11195B1;
 Thu,  9 Apr 2020 13:41:36 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.0] vl.c: error out if -mem-path is used together with -M
 memory-backend
Date: Thu,  9 Apr 2020 09:41:33 -0400
Message-Id: <20200409134133.11339-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: pbonzini@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

the former is not actually used by explicit backend, so instead of
silently ignoring the option in non valid context, exit with error.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 softmmu/vl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 58a40bcfc1..32c0047889 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4315,6 +4315,11 @@ void qemu_init(int argc, char **argv, char **envp)
                              "explicitly specified 'memory-backend' proper=
ty");
                 exit(EXIT_FAILURE);
         }
+        if (mem_path) {
+            error_report("'-mem-path' can't be used together with"
+                         "'-machine memory-backend'");
+            exit(EXIT_FAILURE);
+        }
         ram_size =3D backend_size;
     }
=20
--=20
2.18.1


