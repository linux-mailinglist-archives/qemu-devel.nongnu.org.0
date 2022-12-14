Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC65D64CE58
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 17:49:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Uu5-0004yq-TP; Wed, 14 Dec 2022 11:46:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Uu1-0004x3-4r
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:46:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Utz-0002Pl-JF
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671036398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fl4RedEE2oCibOSODXHJMgRBUFAW9UqThY0ijyCTmpA=;
 b=dxh4fIIiPxClZi5jV5MLnvfS+LZn6/jh+qeJb12Bdc/MkAue/IZTgl5gfV6BnBiKVPYt5s
 ENiPOkgm8r7KEb/zaIh2akfxrpOobAw4dIkQQP5CFQoQlDSBJ95h3DAnkHmsrJwjTwmsBH
 Lv0TachjCjSf2RseLKplemsTCzf6NHs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-mdby3INhNHas6sMKvbFmpA-1; Wed, 14 Dec 2022 11:46:36 -0500
X-MC-Unique: mdby3INhNHas6sMKvbFmpA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 221551991C44;
 Wed, 14 Dec 2022 16:46:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0067340C945A;
 Wed, 14 Dec 2022 16:46:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4439421E6493; Wed, 14 Dec 2022 17:46:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 08/14] qemu-config: Use ERRP_GUARD() where obviously appropriate
Date: Wed, 14 Dec 2022 17:46:23 +0100
Message-Id: <20221214164629.919880-9-armbru@redhat.com>
In-Reply-To: <20221214164629.919880-1-armbru@redhat.com>
References: <20221214164629.919880-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221121085054.683122-8-armbru@redhat.com>
---
 util/qemu-config.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/util/qemu-config.c b/util/qemu-config.c
index e983607b46..8c907fa83b 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -318,9 +318,9 @@ void qemu_add_opts(QemuOptsList *list)
 static int qemu_config_foreach(FILE *fp, QEMUConfigCB *cb, void *opaque,
                                const char *fname, Error **errp)
 {
+    ERRP_GUARD();
     char line[1024], prev_group[64], group[64], arg[64], value[1024];
     Location loc;
-    Error *local_err = NULL;
     QDict *qdict = NULL;
     int res = -EINVAL, lno = 0;
     int count = 0;
@@ -348,10 +348,9 @@ static int qemu_config_foreach(FILE *fp, QEMUConfigCB *cb, void *opaque,
             }
             if (qdict != prev) {
                 if (prev) {
-                    cb(prev_group, prev, opaque, &local_err);
+                    cb(prev_group, prev, opaque, errp);
                     qobject_unref(prev);
-                    if (local_err) {
-                        error_propagate(errp, local_err);
+                    if (*errp) {
                         goto out;
                     }
                 }
-- 
2.37.3


