Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB61B6FC140
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 10:07:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwIGv-00006h-6l; Tue, 09 May 2023 04:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGm-0008UO-1E
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGj-0008UV-Vd
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683619221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Ymub+txARZ2PWH5OgCKZTaI9UggN4L92uTgTN01hxc=;
 b=hJl2l6Od+Zl5GQ81RYEtU3OMJUnYP8b6x0c68ZUCn4ZHRe3ZpihXpo12m0z4UABhf4P/dd
 yHSBJ6d0bE/78/Q/KQldvxbygUJXHnhny1Gc+YRi4VlD5BpEeffU6dpkJTpGWGA5z1zw81
 mk82yMobQ2ceQsWma0IisRXIpUPU2zA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-Y2COXLq9PwGZ-9oVRgXbig-1; Tue, 09 May 2023 04:00:18 -0400
X-MC-Unique: Y2COXLq9PwGZ-9oVRgXbig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3C5F884629;
 Tue,  9 May 2023 08:00:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD94E2166B29;
 Tue,  9 May 2023 08:00:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2B38021E6681; Tue,  9 May 2023 10:00:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Ani Sinha <anisinha@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL 06/17] sphinx/qapidoc: Do not emit TODO sections into user
 manuals
Date: Tue,  9 May 2023 10:00:00 +0200
Message-Id: <20230509080011.3231661-7-armbru@redhat.com>
In-Reply-To: <20230509080011.3231661-1-armbru@redhat.com>
References: <20230509080011.3231661-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

QAPI doc comments are for QMP users: they go into the "QEMU QMP
Reference Manual" and the "QEMU Storage Daemon QMP Reference Manual".

The doc comment TODO sections are for somebody else, namely for the
people who can do: developers.  Do not emit them into the user
manuals.

This elides the following TODOs:

* SchemaInfoCommand

  # TODO: @success-response (currently irrelevant, because it's QGA, not QMP)

  This is a note to developers adding introspection to the guest
  agent.  It makes no sense to users.

* @query-hotpluggable-cpus

  # TODO: Better documentation; currently there is none.

  This is a reminder for developers.  It doesn't help users.

* @device_add

  # TODO: This command effectively bypasses QAPI completely due to its
  #       "additional arguments" business.  It shouldn't have been added to
  #       the schema in this form.  It should be qapified properly, or
  #       replaced by a properly qapified command.

  Likewise.

Eliding them is an improvement.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230428105429.1687850-7-armbru@redhat.com>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 docs/devel/qapi-code-gen.rst | 5 +++--
 docs/sphinx/qapidoc.py       | 3 +++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index ff7b74bdb2..6386b58881 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -1007,8 +1007,9 @@ A "Since: x.y.z" tagged section lists the release that introduced the
 definition.
 
 An "Example" or "Examples" section is automatically rendered entirely
-as literal fixed-width text.  In other sections, the text is
-formatted, and rST markup can be used.
+as literal fixed-width text.  "TODO" sections are not rendered at all
+(they are for developers, not users of QMP).  In other sections, the
+text is formatted, and rST markup can be used.
 
 For example::
 
diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index d791b59492..8f3b9997a1 100644
--- a/docs/sphinx/qapidoc.py
+++ b/docs/sphinx/qapidoc.py
@@ -268,6 +268,9 @@ def _nodes_for_sections(self, doc):
         """Return list of doctree nodes for additional sections"""
         nodelist = []
         for section in doc.sections:
+            if section.name and section.name == 'TODO':
+                # Hide TODO: sections
+                continue
             snode = self._make_section(section.name)
             if section.name and section.name.startswith('Example'):
                 snode += self._nodes_for_example(section.text)
-- 
2.39.2


