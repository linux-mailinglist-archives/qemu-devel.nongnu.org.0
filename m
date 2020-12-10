Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2122D61B4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:25:22 +0100 (CET)
Received: from localhost ([::1]:50526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOkr-0002HM-CA
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:25:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOb8-0004wn-9S
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:15:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOaq-00015U-TI
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607616898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T1eQNMQIdNN5bzE208jYoemEsZ10JBeNTxKm962RAgE=;
 b=gWqVcI/oq2kebtpCHnxWCc2lnyA/yz7jV1KV3iUCv0CEQ5IQjBnlY/RuucdLEojSgv+RaO
 nDCU70qWEa5iyjEiIvVPkuzzbSxb0I0HAJWa7lWbIabYG10peLcVQXKERKvxibEqkDM/j/
 PPpvFzkgrqBjEZzWnR+EJgsKVkdjQL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-eL7DjK7VN7msli7EatUP8Q-1; Thu, 10 Dec 2020 11:14:56 -0500
X-MC-Unique: eL7DjK7VN7msli7EatUP8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD7581005513;
 Thu, 10 Dec 2020 16:14:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D8441002388;
 Thu, 10 Dec 2020 16:14:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 81F5F10FA0A7; Thu, 10 Dec 2020 17:14:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/10] tests/check-qnum: Cover qnum_to_string() for "unround"
 argument
Date: Thu, 10 Dec 2020 17:14:47 +0100
Message-Id: <20201210161452.2813491-6-armbru@redhat.com>
In-Reply-To: <20201210161452.2813491-1-armbru@redhat.com>
References: <20201210161452.2813491-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qnum_to_string() has a FIXME comment about rounding errors due to
insufficient precision.  Cover it: 2.718281828459045 gets converted to
"2.718282".  The next commit will fix it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/check-qnum.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/check-qnum.c b/tests/check-qnum.c
index 4105015872..a73809d021 100644
--- a/tests/check-qnum.c
+++ b/tests/check-qnum.c
@@ -150,6 +150,12 @@ static void qnum_to_string_test(void)
     g_assert_cmpstr(tmp, ==, "0.42");
     g_free(tmp);
     qobject_unref(qn);
+
+    qn = qnum_from_double(2.718281828459045);
+    tmp = qnum_to_string(qn);
+    g_assert_cmpstr(tmp, ==, "2.718282"); /* BUG */
+    g_free(tmp);
+    qobject_unref(qn);
 }
 
 int main(int argc, char **argv)
-- 
2.26.2


