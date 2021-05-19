Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083C0389651
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:12:24 +0200 (CEST)
Received: from localhost ([::1]:47848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRcF-0005kO-1Z
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljR71-00060H-Gn
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:40:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljR6w-0001zO-Oh
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:40:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621449600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aI7W7IlWiQpToC4v4jSUvx7Ftf+CA8yBdCNhfT36HQw=;
 b=XTd8h8nnUE67Hl+ThiNnhfKy+IHi8Xg0/LP+Z7w1H/KWHWBxVqjrNQVpYz9uW/U+ujW8ij
 4IyfxoPCaVpXjoKsjpC8IVHeMwPkOV9AVKJwLGwAMpVTYAEGFBmsgTuSkHU9/0cKOR7axs
 KM+osL266xOeShDdWBexoRDesMv7jPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-u6jIMFu_OqWXL29boiuAKg-1; Wed, 19 May 2021 14:39:59 -0400
X-MC-Unique: u6jIMFu_OqWXL29boiuAKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53A18800D62;
 Wed, 19 May 2021 18:39:58 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3594859443;
 Wed, 19 May 2021 18:39:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/15] qapi/parser: Assert lexer value is a string
Date: Wed, 19 May 2021 14:39:41 -0400
Message-Id: <20210519183951.3946870-6-jsnow@redhat.com>
In-Reply-To: <20210519183951.3946870-1-jsnow@redhat.com>
References: <20210519183951.3946870-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The type checker can't narrow the type of the token value to string,
because it's only loosely correlated with the return token.

We know that a token of '#' should always have a "str" value.
Add an assertion.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index d620706fffb..0bc852eda72 100644
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
2.30.2


