Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33614E2B68
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:01:48 +0100 (CET)
Received: from localhost ([::1]:52934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWJXX-0002PS-C9
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:01:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nWJUp-00006w-L6
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:58:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nWJUn-0006IL-49
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:58:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647874736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dg8mCr/qGKVyyU4d8arD2ZcLBzN01dE7u2SHrrxCwTQ=;
 b=bas5RmNaEIJE9qcdyTFEAW7lMhgG1vl7bP0WDDnuKC3Notc26s5c+NxjgScea22SfgFLAD
 yHlFp4Du0BtjEiQRKzEaciGOUfI2K8XCbG8lLD+S8rgVf7oU+ekK5IXuJYCc4e+ZBk3a3m
 62XbGo0r3TKP1No0uS8Q0wKM7rRhb0A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-QunEJuQ_NCGUzaXJ3ZKsTQ-1; Mon, 21 Mar 2022 10:58:55 -0400
X-MC-Unique: QunEJuQ_NCGUzaXJ3ZKsTQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 922F8811E75;
 Mon, 21 Mar 2022 14:58:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D5151402642;
 Mon, 21 Mar 2022 14:58:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4B2E721A3F41; Mon, 21 Mar 2022 15:58:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] block-qdict: Fix -Werror=maybe-uninitialized build failure
Date: Mon, 21 Mar 2022 15:58:50 +0100
Message-Id: <20220321145853.2523825-2-armbru@redhat.com>
In-Reply-To: <20220321145853.2523825-1-armbru@redhat.com>
References: <20220321145853.2523825-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>

Building QEMU on Fedora 37 (Rawhide Prerelease) ppc64le failed with the
following error:

    $ ../configure --prefix=/usr/local/qemu-disabletcg --target-list=ppc-softmmu,ppc64-softmmu --disable-tcg --disable-linux-user
    ...
    $ make -j$(nproc)
    ...
    In file included from /root/qemu/include/qapi/qmp/qdict.h:16,
                     from /root/qemu/include/block/qdict.h:13,
                     from ../qobject/block-qdict.c:11:
    /root/qemu/include/qapi/qmp/qobject.h: In function ‘qdict_array_split’:
    /root/qemu/include/qapi/qmp/qobject.h:49:17: error: ‘subqdict’ may be used uninitialized [-Werror=maybe-uninitialized]
       49 |     typeof(obj) _obj = (obj);                                   \
          |                 ^~~~
    ../qobject/block-qdict.c:227:16: note: ‘subqdict’ declared here
      227 |         QDict *subqdict;
          |                ^~~~~~~~
    cc1: all warnings being treated as errors

Fix build failure by expanding the ternary operation.
Tested with `make check-unit` (the check-block-qdict test passed).

Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220311221634.58288-1-muriloo@linux.ibm.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 qobject/block-qdict.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qobject/block-qdict.c b/qobject/block-qdict.c
index 1487cc5dd8..4a83bda2c3 100644
--- a/qobject/block-qdict.c
+++ b/qobject/block-qdict.c
@@ -251,12 +251,12 @@ void qdict_array_split(QDict *src, QList **dst)
         if (is_subqdict) {
             qdict_extract_subqdict(src, &subqdict, prefix);
             assert(qdict_size(subqdict) > 0);
+            qlist_append_obj(*dst, QOBJECT(subqdict));
         } else {
             qobject_ref(subqobj);
             qdict_del(src, indexstr);
+            qlist_append_obj(*dst, subqobj);
         }
-
-        qlist_append_obj(*dst, subqobj ?: QOBJECT(subqdict));
     }
 }
 
-- 
2.35.1


