Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B49C1BEFD7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 07:39:00 +0200 (CEST)
Received: from localhost ([::1]:40810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU1uV-0001p2-9e
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 01:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53388)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jU1n5-000554-SN
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 01:31:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jU1n0-0002ez-GY
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 01:31:19 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:27589
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jU1mz-0002dP-3e
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 01:31:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588224672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VhvFVi1XXgtR0UyjeDgG7qFZxWmVQcz/9VcWjv99jIw=;
 b=EmRS+yIwOiKJEdB/lNFctD8jv5BoV5N11o3J8t9sNYEV5pRuJtjr6Z1s8z3xIcpGbvzyyW
 F8NhBx+2XZ4C7ZOGuIznMhzsWZio7lFeOAXnMDksHrYcjhNSnh8Q1rPFeQL+En9HglFusb
 CM9OAEbp5WtnPjhWjc/KoJRddvUoeW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-CivKsT7xOtC3hHxfjzq2gA-1; Thu, 30 Apr 2020 01:31:10 -0400
X-MC-Unique: CivKsT7xOtC3hHxfjzq2gA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AAE746B
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 05:31:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39F601001920;
 Thu, 30 Apr 2020 05:31:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0FAFE11358CD; Thu, 30 Apr 2020 07:31:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/20] qapi: Assert non-input visitors see only valid alternate
 tags
Date: Thu, 30 Apr 2020 07:31:00 +0200
Message-Id: <20200430053104.32204-17-armbru@redhat.com>
In-Reply-To: <20200430053104.32204-1-armbru@redhat.com>
References: <20200430053104.32204-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 01:04:40
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
Message-Id: <20200424084338.26803-12-armbru@redhat.com>
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


