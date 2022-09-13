Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0196A5B6B69
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 12:10:39 +0200 (CEST)
Received: from localhost ([::1]:36370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY2sI-0005nC-Gj
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 06:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oY2q7-0004Au-Tu
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:08:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oY2q4-0002Hs-1Q
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663063698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SG5xz2Tr9/FtyqUF9qZEqgCeLlQ6UnNEyTC/ShXjrb4=;
 b=FSpg0Ib5Bw3r2Y35uwCulQ3NT31YbCuIO8UraqWn+zFiciNYP4YAx+EI/g8msv/6RSIjbJ
 c7PQ/1dpOtNYItPmaM4E9u4l9lDHtrImeSwig0oxCPKBQmoSjjgVWrGqhLSPOw+2UTaS+j
 dRUfJuNrgfP4bm7W1Npjsytq4pCOZ9U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-eW7GJPy7M4-t1e06SJIQCQ-1; Tue, 13 Sep 2022 06:08:17 -0400
X-MC-Unique: eW7GJPy7M4-t1e06SJIQCQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C02C885A585
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 10:08:16 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57BF31121314;
 Tue, 13 Sep 2022 10:08:16 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	armbru@redhat.com
Subject: [PATCH] keyval: Print types on merge inconsistency
Date: Tue, 13 Sep 2022 11:08:11 +0100
Message-Id: <20220913100811.99746-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

When 'keyval_do_merge' checks consistency of types, if they mismatch
print the types so we get a hint of what's going on.

e.g.
qemu-system-x86_64: Parameter 'memory' used inconsistently (qstring/qdict)

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 util/keyval.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/util/keyval.c b/util/keyval.c
index 66a5b4740f..9757adf31f 100644
--- a/util/keyval.c
+++ b/util/keyval.c
@@ -329,8 +329,10 @@ static void keyval_do_merge(QDict *dest, const QDict *merged, GString *str, Erro
         old_value = qdict_get(dest, ent->key);
         if (old_value) {
             if (qobject_type(old_value) != qobject_type(ent->value)) {
-                error_setg(errp, "Parameter '%s%s' used inconsistently",
-                           str->str, ent->key);
+                error_setg(errp, "Parameter '%s%s' used inconsistently (%s/%s)",
+                           str->str, ent->key,
+                           QType_str(qobject_type(old_value)),
+                           QType_str(qobject_type(ent->value)));
                 return;
             } else if (qobject_type(ent->value) == QTYPE_QDICT) {
                 /* Merge sub-dictionaries.  */
-- 
2.37.3


