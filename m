Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568CA1B7013
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 10:54:24 +0200 (CEST)
Received: from localhost ([::1]:55562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRu6J-00055U-CM
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 04:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36760)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jRtw4-0005hz-Jd
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 04:43:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jRtw2-0002CH-Hg
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 04:43:48 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42178
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jRtw1-00026Z-W9
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 04:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587717824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RFbWMeYh5axJy08tl7Z/bC/83o9qMilX16dPJVSkuYM=;
 b=feyoAaA+sVK4gkQce1AQlWEfe1WIMKvjFZ9gyqfySxd/hYhgN9MnRYd0F2fyEtGgA3OHTZ
 8Bt3nHr6ab5byOpJk8UChexSbkdwKOmoTMNewV86Q6DFwvdfkaKW6QFIqc+7PD1HspafXX
 zuz5gr5UZr8x8so/l+dbAUOicApHXL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-Gigd53FkP9ubrVRvARBKQg-1; Fri, 24 Apr 2020 04:43:43 -0400
X-MC-Unique: Gigd53FkP9ubrVRvARBKQg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B7AD80B709;
 Fri, 24 Apr 2020 08:43:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F000110016EB;
 Fri, 24 Apr 2020 08:43:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F28DF11358C7; Fri, 24 Apr 2020 10:43:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/15] qapi: Assert non-input visitors see only valid
 alternate tags
Date: Fri, 24 Apr 2020 10:43:34 +0200
Message-Id: <20200424084338.26803-12-armbru@redhat.com>
In-Reply-To: <20200424084338.26803-1-armbru@redhat.com>
References: <20200424084338.26803-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 02:57:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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

An alternate type's visit_type_FOO() fails when it runs into an
invalid ->type.

This is appropriate with an input visitor: visit_start_alternate()
sets ->type according to the input, and bad input can lead to bad
->type.

It should never happen with an output, clone or dealloc visitor: if it
did, the alternate being output, cloned or deallocated would be messed
up beyond repair.  Assert that.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 scripts/qapi/visit.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 678109dfb5..d5d7a1031f 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -232,6 +232,7 @@ void visit_type_%(c_name)s(Visitor *v, const char *name=
, %(c_name)s **obj, Error
     case QTYPE_NONE:
         abort();
     default:
+        assert(visit_is_input(v));
         error_setg(&err, QERR_INVALID_PARAMETER_TYPE, name ? name : "null"=
,
                    "%(name)s");
         /* Avoid passing invalid *obj to qapi_free_%(c_name)s() */
--=20
2.21.1


