Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42E8274BB4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 23:55:02 +0200 (CEST)
Received: from localhost ([::1]:54144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKqFZ-0005Zi-TR
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 17:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpgC-0007WC-SP
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:18:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpgA-0006eD-OH
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:18:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600809506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43bTF9s1dRQvu261U43X/7PVH8f8W3mJYCwEL5RBQDk=;
 b=id3x6+KfPZ16KtOjOkVGGL9I4uGMJkd20NiaMtPJ14rcpNSs2/xnZC+snQ6/zmjCbLOxd5
 3PKNJmCGTTtUTM+oisZvkfPZfLJ0ynDqUKif0MgRudNRDCo5Rs9KV8+jURKGjoZqwPz3fW
 N+vpQVOh8JYHsbXBDssU0I0GznbMdrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-GwQOHXWWOuy_VydmK4BCMw-1; Tue, 22 Sep 2020 17:18:24 -0400
X-MC-Unique: GwQOHXWWOuy_VydmK4BCMw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16D9357056;
 Tue, 22 Sep 2020 21:18:23 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27A7F5DE86;
 Tue, 22 Sep 2020 21:18:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 13/14] qapi/doc.py: Assert type of object variant
Date: Tue, 22 Sep 2020 17:18:01 -0400
Message-Id: <20200922211802.4083666-14-jsnow@redhat.com>
In-Reply-To: <20200922211802.4083666-1-jsnow@redhat.com>
References: <20200922211802.4083666-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 15:47:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Objects may have variants, but those variants must themselves be
objects. This is difficult to express with our current type system and
hierarchy, so instead pepper in an assertion.

Note: These assertions don't appear to be useful yet because schema.py
is not yet typed. Once it is, these assertions will matter.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/doc.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/qapi/doc.py b/scripts/qapi/doc.py
index b96d9046d3..3de592e220 100644
--- a/scripts/qapi/doc.py
+++ b/scripts/qapi/doc.py
@@ -206,6 +206,7 @@ def texi_members(doc: QAPIDoc,
     if base:
         items += '@item The members of @code{%s}\n' % base.doc_type()
     for variant in variants.variants if variants else ():
+        assert isinstance(variant.type, QAPISchemaObjectType)
         when = ' when @code{%s} is @t{"%s"}%s' % (
             variants.tag_member.name, variant.name,
             texi_if(variant.ifcond, " (", ")"))
-- 
2.26.2


