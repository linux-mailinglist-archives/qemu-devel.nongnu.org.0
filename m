Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7B76F03C4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 11:54:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pryKJ-0005RT-EJ; Thu, 27 Apr 2023 05:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pryKA-0005NN-6C
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:54:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pryK3-0000NP-Pk
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:54:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682589233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHYyBz+fmnoc8Dkb2G/7Q1mzvfUIsMnmiow0yU6kOro=;
 b=J5bD4yMbs7e6tbkU6LbN1N0grqdeSNc4D3SDLNwazeSgcIVrNfz/TSv+DA80fHFxocRm8R
 CSS717ZAbhfa2eZrvFhlIUTjhWX6tekUnHtP71HaR66J0lRBs4VLACqWKU5lSBk6lQbeol
 K0eBm4UwwYG1mLSftqSfjEt4iCvEHV0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-jT5YynCLNcKZHx1KyPXdsg-1; Thu, 27 Apr 2023 05:53:49 -0400
X-MC-Unique: jT5YynCLNcKZHx1KyPXdsg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0B6485A5A3;
 Thu, 27 Apr 2023 09:53:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F9A8C15BA0;
 Thu, 27 Apr 2023 09:53:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 77E9E21E66EF; Thu, 27 Apr 2023 11:53:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, eblake@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 arei.gonglei@huawei.com, pizhenwei@bytedance.com, jsnow@redhat.com,
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, quintela@redhat.com, jasowang@redhat.com,
 yuval.shaia.ml@gmail.com, stefanha@redhat.com, kraxel@redhat.com,
 kkostiuk@redhat.com, qemu-block@nongnu.org, marcandre.lureau@gmail.com,
 david@redhat.com
Subject: [PATCH 17/16] docs/devel/qapi-code-gen: Describe some doc markup
 pitfalls
Date: Thu, 27 Apr 2023 11:53:45 +0200
Message-Id: <20230427095346.1238913-1-armbru@redhat.com>
In-Reply-To: <20230425064223.820979-1-armbru@redhat.com>
References: <20230425064223.820979-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
---
 docs/devel/qapi-code-gen.rst | 53 ++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index d81aac7a19..14983b074c 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -1059,6 +1059,59 @@ For example::
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


