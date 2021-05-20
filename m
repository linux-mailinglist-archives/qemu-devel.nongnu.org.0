Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00CC38B5C3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 20:08:13 +0200 (CEST)
Received: from localhost ([::1]:45338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljn5h-0001qz-2Q
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 14:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljmrY-0002ux-7C
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljmr3-0006dC-EF
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:53:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621533184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B+anRg/0RPO2Euj/9Ppbrr5zyoz8p3qnHbW6T6AUoso=;
 b=H2/JbHFrRzzBnBYtlhCbjbY53fjEKFpM7H5bTpr6TbpJfIxGpOSskSZfFoinziv+//noT8
 DOxNXSkL3hcbQCSSQp2PEF/mDnkqppRrgVpn14u6vkJATACK46SOPb9ZMURUWrVMbk46fM
 3qmPJTLaT2dqnbESsUhLJ3ApkK5I+D4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-hvvkvqeZNIePWCV0i-u8uA-1; Thu, 20 May 2021 13:53:00 -0400
X-MC-Unique: hvvkvqeZNIePWCV0i-u8uA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 750FF801B19;
 Thu, 20 May 2021 17:52:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F1BF6064B;
 Thu, 20 May 2021 17:52:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 483EB1138468; Thu, 20 May 2021 19:52:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/15] qapi/parser: Assert lexer value is a string
Date: Thu, 20 May 2021 19:52:46 +0200
Message-Id: <20210520175256.1119684-6-armbru@redhat.com>
In-Reply-To: <20210520175256.1119684-1-armbru@redhat.com>
References: <20210520175256.1119684-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

The type checker can't narrow the type of the token value to string,
because it's only loosely correlated with the return token.

We know that a token of '#' should always have a "str" value.
Add an assertion.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210519183951.3946870-6-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/parser.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index d620706fff..0bc852eda7 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -304,6 +304,7 @@ def get_doc(self, info):
         cur_doc = QAPIDoc(self, info)
         self.accept(False)
         while self.tok == '#':
+            assert isinstance(self.val, str)
             if self.val.startswith('##'):
                 # End of doc comment
                 if self.val != '##':
-- 
2.26.3


