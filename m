Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233212C14C6
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 20:54:39 +0100 (CET)
Received: from localhost ([::1]:60940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khHv4-0002FN-0h
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 14:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpK-00069T-Pw
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpH-0007jz-TC
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606160918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GZo5wy4nPrfx/mSiUDTwi2pKM+9qGPHBm6ffZ/XCySk=;
 b=N6W/TLyt25CA8h20ipcU0wUBAPPRjMdVkf1df/HO1visK9RxMv30PVWDki+ohbjcle6p9X
 Y/P6MbgM0EcMTZgwaCx/J3RFp1KY+G3CgIMifzTp8KpFc8mS8hiNhxxPSaFuwfVXeSef10
 u1meVnjNFstGexcg8ILYIMNAyp60GFQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-bNoAumd8NvqXgUj9KR4amg-1; Mon, 23 Nov 2020 14:48:36 -0500
X-MC-Unique: bNoAumd8NvqXgUj9KR4amg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6827F1007483
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 19:48:22 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28BE15D6DC;
 Mon, 23 Nov 2020 19:48:22 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/19] qnum: Make qnum_get_double() get const pointer
Date: Mon, 23 Nov 2020 14:48:00 -0500
Message-Id: <20201123194818.2773508-2-ehabkost@redhat.com>
In-Reply-To: <20201123194818.2773508-1-ehabkost@redhat.com>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

qnum_get_double() won't change the object, the argument can be
const.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/qapi/qmp/qnum.h | 2 +-
 qobject/qnum.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h
index bbae0a5ec8..3e9ecd324e 100644
--- a/include/qapi/qmp/qnum.h
+++ b/include/qapi/qmp/qnum.h
@@ -64,7 +64,7 @@ int64_t qnum_get_int(const QNum *qn);
 bool qnum_get_try_uint(const QNum *qn, uint64_t *val);
 uint64_t qnum_get_uint(const QNum *qn);
 
-double qnum_get_double(QNum *qn);
+double qnum_get_double(const QNum *qn);
 
 char *qnum_to_string(QNum *qn);
 
diff --git a/qobject/qnum.c b/qobject/qnum.c
index 7012fc57f2..d328d91fcb 100644
--- a/qobject/qnum.c
+++ b/qobject/qnum.c
@@ -144,7 +144,7 @@ uint64_t qnum_get_uint(const QNum *qn)
  *
  * qnum_get_double() loses precision for integers beyond 53 bits.
  */
-double qnum_get_double(QNum *qn)
+double qnum_get_double(const QNum *qn)
 {
     switch (qn->kind) {
     case QNUM_I64:
-- 
2.28.0


