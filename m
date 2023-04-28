Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C4B6F157A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:30:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLLu-0006Lt-QS; Fri, 28 Apr 2023 06:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLLm-0006JB-2Y
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:29:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLLj-0007Ma-2m
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682677750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lmXSi46piOfuf8hoH+8j3jnr9T73v2e9Grtb1mbVpa0=;
 b=HibTDavoWlbk6+ye4j+2xg8G7i/vVprg75uHye4ftpJt0cApYDGVL8Ek+VgrC6ZibfzNRd
 pJIvyCq5SN164mWdJ9LUYL2GwG21l9yYItxHm9kKwHyGu+hLtXnNbiFAArPRpS/Tgz8ihI
 zclY11a2tTavxQ2RHfM3NQIC/hv65H4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-I91Xpmc8NwKULpN5L3HEmw-1; Fri, 28 Apr 2023 06:29:04 -0400
X-MC-Unique: I91Xpmc8NwKULpN5L3HEmw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79EB638221CE;
 Fri, 28 Apr 2023 10:29:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 595871410F1C;
 Fri, 28 Apr 2023 10:29:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 616A421C6901; Fri, 28 Apr 2023 12:29:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Juan Quintela <quintela@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL 17/17] docs/devel/qapi-code-gen: Describe some doc markup
 pitfalls
Date: Fri, 28 Apr 2023 12:29:01 +0200
Message-Id: <20230428102901.1685375-18-armbru@redhat.com>
In-Reply-To: <20230428102901.1685375-1-armbru@redhat.com>
References: <20230428102901.1685375-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Message-Id: <20230427095346.1238913-1-armbru@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 docs/devel/qapi-code-gen.rst | 53 ++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index ea0592034a..af1986f33e 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -1060,6 +1060,59 @@ For example::
    'returns': ['BlockStats'] }
 
 
+Markup pitfalls
+~~~~~~~~~~~~~~~
+
+A blank line is required between list items and paragraphs.  Without
+it, the list may not be recognized, resulting in garbled output.  Good
+example::
+
+ # An event's state is modified if:
+ #
+ # - its name matches the @name pattern, and
+ # - if @vcpu is given, the event has the "vcpu" property.
+
+Without the blank line this would be a single paragraph.
+
+Indentation matters.  Bad example::
+
+ # @none: None (no memory side cache in this proximity domain,
+ #              or cache associativity unknown)
+
+The description is parsed as a definition list with term "None (no
+memory side cache in this proximity domain," and definition "or cache
+associativity unknown)".
+
+Section tags are case-sensitive and end with a colon.  Good example::
+
+ # Since: 7.1
+
+Bad examples (all ordinary paragraphs)::
+
+ # since: 7.1
+
+ # Since 7.1
+
+ # Since : 7.1
+
+Likewise, member descriptions require a colon.  Good example::
+
+ # @interface-id: Interface ID
+
+Bad examples (all ordinary paragraphs)::
+
+ # @interface-id   Interface ID
+
+ # @interface-id : Interface ID
+
+Undocumented members are not flagged, yet.  Instead, the generated
+documentation describes them as "Not documented".  Think twice before
+adding more undocumented members.
+
+When you change documentation comments, please check the generated
+documentation comes out as intended!
+
+
 Client JSON Protocol introspection
 ==================================
 
-- 
2.39.2


