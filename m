Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73F026DC3D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 14:58:52 +0200 (CEST)
Received: from localhost ([::1]:42162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kItUx-0006Pg-SX
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 08:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kItSX-0003vj-E9
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 08:56:21 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36855
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kItSV-000889-Of
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 08:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600347378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cjJfqlQma7z3TD8pd8Ml0vQMvR2GQ25+ZiU+C41xfcQ=;
 b=Uc2bg34clD0nZgBRiKyjeTQpDMNspk2mxHcSurWuvxgpUmVvVZSn8S+o1z7Fa69v/Z0Le4
 ch3zrE8/W8/WfRDs4DDa+IO8zezfvLjagSnYVy1qSQuUkqPgr1GtwtZXQfQO6FCGtEwdK1
 b1VWkav6CpoFuwdmA5pSDrUwuyRUcTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-iZwdrRaqNBSrrO4UTOq1Gw-1; Thu, 17 Sep 2020 08:56:16 -0400
X-MC-Unique: iZwdrRaqNBSrrO4UTOq1Gw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 414A48AB382;
 Thu, 17 Sep 2020 12:55:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AEAF7E731;
 Thu, 17 Sep 2020 12:55:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7D08911386A3; Thu, 17 Sep 2020 14:55:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] qom: Correct error values in two contracts
Date: Thu, 17 Sep 2020 14:55:40 +0200
Message-Id: <20200917125540.597786-3-armbru@redhat.com>
In-Reply-To: <20200917125540.597786-1-armbru@redhat.com>
References: <20200917125540.597786-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 08:56:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

object_property_get_bool()'s contract claims it returns NULL on error.
Pasto; it returns false.

object_property_get_int()'s contract claims it returns "negative".  It
actually returns -1.  All the other object_property_get_FOO()
contracts specify the exact error value, so do the same here.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qom/object.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index f75547a3fe..d0a3332c1f 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -1624,7 +1624,7 @@ bool object_property_set_bool(Object *obj, const char *name,
  * @name: the name of the property
  * @errp: returns an error if this function fails
  *
- * Returns: the value of the property, converted to a boolean, or NULL if
+ * Returns: the value of the property, converted to a boolean, or false if
  * an error occurs (including when the property value is not a bool).
  */
 bool object_property_get_bool(Object *obj, const char *name,
@@ -1649,7 +1649,7 @@ bool object_property_set_int(Object *obj, const char *name,
  * @name: the name of the property
  * @errp: returns an error if this function fails
  *
- * Returns: the value of the property, converted to an integer, or negative if
+ * Returns: the value of the property, converted to an integer, or -1 if
  * an error occurs (including when the property value is not an integer).
  */
 int64_t object_property_get_int(Object *obj, const char *name,
-- 
2.26.2


