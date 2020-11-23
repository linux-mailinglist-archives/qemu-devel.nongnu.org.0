Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8DD2C14D7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 20:58:07 +0100 (CET)
Received: from localhost ([::1]:41250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khHyQ-0005uQ-Fy
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 14:58:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpO-00069w-JJ
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpI-0007k2-7D
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606160918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAUVZP9nYfuG8G2+CohpECtHtyf1TwVHOQefZEgDKOI=;
 b=QokVownIuf4EbvZiELuA4jG1DTXzx+jVdxBoiXWvitksQcXy5JjJM0TPIAIGTnBNc7PYHe
 HSS4S8+ys+/CvCThGKRDpBi2JZVWfqJi3SIOk4R+mxkz1POfWgFlehDPxk9vz9FihjEUCY
 MQrpmaSVxlX9P8zr/ebR7Eok1mpiJlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-Cqsf9VSdMWa44_otnDMnsw-1; Mon, 23 Nov 2020 14:48:36 -0500
X-MC-Unique: Cqsf9VSdMWa44_otnDMnsw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C13B063CE6
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 19:48:26 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4495E10021AA;
 Mon, 23 Nov 2020 19:48:23 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/19] qnum: Make num_x/num_y variables at qnum_is_equal()
 const
Date: Mon, 23 Nov 2020 14:48:01 -0500
Message-Id: <20201123194818.2773508-3-ehabkost@redhat.com>
In-Reply-To: <20201123194818.2773508-1-ehabkost@redhat.com>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qobject_to() drops const-ness by accident, but our function
arguments (x, y) are const.  Make num_x/num_y const too.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch added in v3 of the series.
---
 qobject/qnum.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qobject/qnum.c b/qobject/qnum.c
index d328d91fcb..e5ea728638 100644
--- a/qobject/qnum.c
+++ b/qobject/qnum.c
@@ -209,8 +209,8 @@ char *qnum_to_string(QNum *qn)
  */
 bool qnum_is_equal(const QObject *x, const QObject *y)
 {
-    QNum *num_x = qobject_to(QNum, x);
-    QNum *num_y = qobject_to(QNum, y);
+    const QNum *num_x = qobject_to(QNum, x);
+    const QNum *num_y = qobject_to(QNum, y);
 
     switch (num_x->kind) {
     case QNUM_I64:
-- 
2.28.0


