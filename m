Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A70130E8BB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 01:43:02 +0100 (CET)
Received: from localhost ([::1]:53884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Sjd-0001xs-JJ
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 19:43:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7SZO-0001DR-Hg
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 19:32:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7SZD-0000bv-5F
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 19:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612398734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hhSDtbsGfbobVTHftHTtFiV/76YmL0xiVKbNqWrc3lU=;
 b=IhXW9UVUiIJoEybYkPXwhmGepBFaqajmKXa1aCT3PHXHDxttoaeD7sE/lhajX2uXDpJhx8
 pMaBeNZeBfBfgqWrxwrPyFFNUgbOgNT8Ri2FG78wiAR3cXXNeSQ1w3KbQ2qfXoqYICxj3x
 9mZTW3qPLLTVVu490wwKdEuEHRFhzPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-1PAEaGzLNpaSanYAo8cERw-1; Wed, 03 Feb 2021 19:32:12 -0500
X-MC-Unique: 1PAEaGzLNpaSanYAo8cERw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF3BB8030B3
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 00:32:11 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C9471007622;
 Thu,  4 Feb 2021 00:32:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v5 05/15] qapi/introspect.py: Unify return type of _make_tree()
Date: Wed,  3 Feb 2021 19:31:57 -0500
Message-Id: <20210204003207.2856909-6-jsnow@redhat.com>
In-Reply-To: <20210204003207.2856909-1-jsnow@redhat.com>
References: <20210204003207.2856909-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Returning two different types conditionally can be complicated to
type. Return one type for consistency.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index a7ccda5ab92..7730d8ed6b2 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -29,9 +29,7 @@ def _make_tree(obj, ifcond, extra=None):
         extra = {}
     if ifcond:
         extra['if'] = ifcond
-    if extra:
-        return (obj, extra)
-    return obj
+    return (obj, extra)
 
 
 def _tree_to_qlit(obj, level=0, dict_value=False):
-- 
2.29.2


