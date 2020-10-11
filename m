Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECAC28A62A
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Oct 2020 09:39:15 +0200 (CEST)
Received: from localhost ([::1]:50008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRVwo-0003IA-Ca
	for lists+qemu-devel@lfdr.de; Sun, 11 Oct 2020 03:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kRVt2-0006Fh-Df
 for qemu-devel@nongnu.org; Sun, 11 Oct 2020 03:35:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kRVsx-0003Gs-Ew
 for qemu-devel@nongnu.org; Sun, 11 Oct 2020 03:35:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602401711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EiSiGe2Sr1BVyh/nVct1USJZCm5n8JYMclTN1VuwLl8=;
 b=QE6pEKpcOievGzHuZdiXZ/VhTO3DRhc6+/SrlQbvJC+QZNjs6qHrBnXFZMKdNkrjlrsAhc
 lD0qZ8WnZaLErgX1gwCXTwwYsN3up3lRvWoUT3IbmD6XvwKoaRf4e0ne0uzcpxYg8ILXyg
 cAehSIIhpzJHam9sdox074rD2QWRg1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-1y5CB0R-PSK_jlPu_GSm3A-1; Sun, 11 Oct 2020 03:35:07 -0400
X-MC-Unique: 1y5CB0R-PSK_jlPu_GSm3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C80F7107ACF5;
 Sun, 11 Oct 2020 07:35:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9761646;
 Sun, 11 Oct 2020 07:35:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1537A11329AF; Sun, 11 Oct 2020 09:35:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/7] keyval: Fix and clarify grammar
Date: Sun, 11 Oct 2020 09:34:59 +0200
Message-Id: <20201011073505.1185335-2-armbru@redhat.com>
In-Reply-To: <20201011073505.1185335-1-armbru@redhat.com>
References: <20201011073505.1185335-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 02:10:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The grammar has a few issues:

* key-fragment = / [^=,.]* /

  Prose restricts key fragments: they "must be valid QAPI names or
  consist only of decimal digits".  Technically, '' consists only of
  decimal digits.  The code rejects that.  Fix the grammar.

* val          = { / [^,]* / | ',,' }

  Use + instead of *.  Accepts the same language.

* val-no-key   = / [^=,]* /

  The code rejects an empty value.  Fix the grammar.

* Section "Additional syntax for use with an implied key" is
  confusing.  Rewrite it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 util/keyval.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/util/keyval.c b/util/keyval.c
index 13def4af54..82d8497c71 100644
--- a/util/keyval.c
+++ b/util/keyval.c
@@ -16,8 +16,8 @@
  *   key-vals     = [ key-val { ',' key-val } [ ',' ] ]
  *   key-val      = key '=' val
  *   key          = key-fragment { '.' key-fragment }
- *   key-fragment = / [^=,.]* /
- *   val          = { / [^,]* / | ',,' }
+ *   key-fragment = / [^=,.]+ /
+ *   val          = { / [^,]+ / | ',,' }
  *
  * Semantics defined by reduction to JSON:
  *
@@ -71,12 +71,16 @@
  * Awkward.  Note that we carefully restrict alternate types to avoid
  * similar ambiguity.
  *
- * Additional syntax for use with an implied key:
+ * Alternative syntax for use with an implied key:
  *
- *   key-vals-ik  = val-no-key [ ',' key-vals ]
- *   val-no-key   = / [^=,]* /
+ *   key-vals     = [ key-val-1st { ',' key-val } [ ',' ] ]
+ *   key-val-1st  = val-no-key | key-val
+ *   val-no-key   = / [^=,]+ /
  *
- * where no-key is syntactic sugar for implied-key=val-no-key.
+ * where val-no-key is syntactic sugar for implied-key=val-no-key.
+ *
+ * Note that you can't use the sugared form when the value contains
+ * '=' or ','.
  */
 
 #include "qemu/osdep.h"
-- 
2.26.2


