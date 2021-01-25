Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B38030257C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 14:29:03 +0100 (CET)
Received: from localhost ([::1]:37172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l41vS-0004LF-4a
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 08:29:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l41tc-0003VC-Bd
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 08:27:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l41tE-00019t-9X
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 08:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611581199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p6di9iKNOUKAkPfwCF6qlxTpwF41usl7ZzwpFioWevU=;
 b=HGMUtbP1I9FJn/hXviqS1qq2CMoLjsqdYbcWBHCYsv786aTqYfpXVq44Ae6ZebzVJiuV2h
 XeQFKqzPNHiIV4JK7k/s5v5lwqxoJg3TddYkDXtIy8Sql45y7YpJuaUV8DEeyiCgwhyRM8
 ajNJS/UHnR/+JWFqttmR1ZMwYOK99Gs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-TpHlV262PFuzkAR_GkWYvw-1; Mon, 25 Jan 2021 08:26:37 -0500
X-MC-Unique: TpHlV262PFuzkAR_GkWYvw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05DB0107ACE6;
 Mon, 25 Jan 2021 13:26:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDA2F4D;
 Mon, 25 Jan 2021 13:26:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 36D2F113865F; Mon, 25 Jan 2021 14:26:35 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] error: Fix "Converting to ERRP_GUARD()" doc on "valid at
 return"
Date: Mon, 25 Jan 2021 14:26:35 +0100
Message-Id: <20210125132635.1253219-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: vsementsov@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setting errp = NULL is wrong: the automatic error propagation still
propagates the dangling pointer _auto_errp_prop.local_err.  We need to
set *errp = NULL to clear the dangling pointer.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qapi/error.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qapi/error.h b/include/qapi/error.h
index eaa05c4837..4a9260b0cc 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -235,7 +235,7 @@
  *    error_propagate_prepend(errp, *errp, ...) by error_prepend(errp, ...)
  *
  * 4. Ensure @errp is valid at return: when you destroy *errp, set
- *    errp = NULL.
+ *    *errp = NULL.
  *
  * Example:
  *
-- 
2.26.2


