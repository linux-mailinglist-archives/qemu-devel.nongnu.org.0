Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1549A1B6065
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 18:08:40 +0200 (CEST)
Received: from localhost ([::1]:58098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jReP1-00011E-0b
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 12:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59880)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jReHl-00063F-NF
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 12:01:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jReHQ-00022z-K0
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 12:01:08 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37979
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jReHQ-0001yX-2W
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 12:00:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587657641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mDIuVuNGP9U1znFRvNxfe9I5PKzD+02dNqwuJis8ezs=;
 b=aIVvBiQ+HjSZkhLeoRbLAHKGdn3d/nHC+EZLstSGZ90mqrBR4JvijIP1qXPlcYlTBCljWu
 p0mA90QBN4B4PnJ5kDWPWSXoUoDvtanYG49rBppsZKdP7MLCtigcW4ulCew/jz5NhGuCDW
 Gh/tQh77GgOcwZH3yD0/HWYoVhtX3qU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-NPLc0572Om-8IiNHh-QUSQ-1; Thu, 23 Apr 2020 12:00:39 -0400
X-MC-Unique: NPLc0572Om-8IiNHh-QUSQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FE6F8014D5;
 Thu, 23 Apr 2020 16:00:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDA3D196AE;
 Thu, 23 Apr 2020 16:00:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5D68011358BF; Thu, 23 Apr 2020 18:00:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/13] qapi: Fix typo in visit_start_list()'s contract
Date: Thu, 23 Apr 2020 18:00:26 +0200
Message-Id: <20200423160036.7048-4-armbru@redhat.com>
In-Reply-To: <20200423160036.7048-1-armbru@redhat.com>
References: <20200423160036.7048-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 02:14:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qapi/visitor.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qapi/visitor.h b/include/qapi/visitor.h
index 7f63e4c381..c5d0ce9184 100644
--- a/include/qapi/visitor.h
+++ b/include/qapi/visitor.h
@@ -345,9 +345,9 @@ void visit_end_struct(Visitor *v, void **obj);
  * input visitors set *@list to NULL.
  *
  * After visit_start_list() succeeds, the caller may visit its members
- * one after the other.  A real visit (where @obj is non-NULL) uses
+ * one after the other.  A real visit (where @list is non-NULL) uses
  * visit_next_list() for traversing the linked list, while a virtual
- * visit (where @obj is NULL) uses other means.  For each list
+ * visit (where @list is NULL) uses other means.  For each list
  * element, call the appropriate visit_type_FOO() with name set to
  * NULL and obj set to the address of the value member of the list
  * element.  Finally, visit_end_list() needs to be called with the
--=20
2.21.1


