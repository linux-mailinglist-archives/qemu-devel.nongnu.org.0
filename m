Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 792D11B7ED9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 21:27:07 +0200 (CEST)
Received: from localhost ([::1]:50204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jS3yc-0001VN-GW
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 15:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52974)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jS3sL-0003RG-PP
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 15:20:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jS3sL-00044k-Au
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 15:20:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43630
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jS3sK-00043f-Tv
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 15:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587756036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nIGapMzDofjp/ghREMvtjE5FNZiHL0mZUvxZbHgl4Hs=;
 b=iUkWrooTbZXtlWllGRyrOZuw8XcjrrmPQwU0QT7qNtsvXFriaG2vKzBD8mYmnTjr1mqcFi
 swebJCEA+UKyeJ5YO+yV9ZEFs4I9Qyj8b2/QvbAReykdISkWdHuxAtnm45eYUm/bU7ywJk
 tHt2/cBRiS/a/Ai80JR3DPW8DvTgg5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-mRAiuoVTNm2vRpBpT0rz7w-1; Fri, 24 Apr 2020 15:20:34 -0400
X-MC-Unique: mRAiuoVTNm2vRpBpT0rz7w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66CA7460
 for <qemu-devel@nongnu.org>; Fri, 24 Apr 2020 19:20:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BC875EDE0;
 Fri, 24 Apr 2020 19:20:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 30EC911358BF; Fri, 24 Apr 2020 21:20:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] s390x/cpumodel: Fix harmless misuse of
 visit_check_struct()
Date: Fri, 24 Apr 2020 21:20:19 +0200
Message-Id: <20200424192027.11404-4-armbru@redhat.com>
In-Reply-To: <20200424192027.11404-1-armbru@redhat.com>
References: <20200424192027.11404-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 13:45:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit e47970f51d "s390x/cpumodel: Fix query-cpu-model-FOO error API
violations" neglected to change visit_end_struct()'s Error ** argument
along with the others.  If visit_end_struct() failed, we'd take the
success path.  Fortunately, it can't fail here:
qobject_input_check_struct() checks we consumed the whole dictionary,
and to get here, we did.  Fix it anyway.

Cc: David Hildenbrand <david@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 target/s390x/cpu_models.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 7c32180269..87a8028ad3 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -524,7 +524,7 @@ static void cpu_model_from_info(S390CPUModel *model, co=
nst CpuModelInfo *info,
             }
         }
         if (!err) {
-            visit_check_struct(visitor, errp);
+            visit_check_struct(visitor, &err);
         }
         visit_end_struct(visitor, NULL);
         visit_free(visitor);
--=20
2.21.1


