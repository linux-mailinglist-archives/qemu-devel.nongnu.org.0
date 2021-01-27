Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20609305E9B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 15:49:36 +0100 (CET)
Received: from localhost ([::1]:35530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4m8V-0004ch-2f
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 09:49:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l4m6p-0003jV-9z
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:47:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l4m6l-0000rH-3Z
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:47:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611758865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P6ff4aGRxXyVN5P2cbOblOCfj5qVRgvZQzT+1NZgCok=;
 b=JVOtM0XfjBB00WiM1f2iDC0gHr8TScUYM+n6pHFdQ6OlOqvsMrlVOjHU/VEG5A18OBAZf4
 mIJXzVSIJp3IGMeQu/A6T2e/4crZ9yCSpVuFKXWxYck7DsM9xk5AxJf9USgh3JgAyYs3Yt
 TldDkJ/tJp+RKBpuvbMxyzTwIK0oknw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-b4fnVZvvNWWEufiflBcYSw-1; Wed, 27 Jan 2021 09:47:42 -0500
X-MC-Unique: b4fnVZvvNWWEufiflBcYSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB5C51922023
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 14:47:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C111219D9D;
 Wed, 27 Jan 2021 14:47:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 39B91113865F; Wed, 27 Jan 2021 15:47:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/interop/qmp-spec: Document the request queue limit
Date: Wed, 27 Jan 2021 15:47:34 +0100
Message-Id: <20210127144734.2367693-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, jsnow@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/interop/qmp-spec.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/docs/interop/qmp-spec.txt b/docs/interop/qmp-spec.txt
index cdf5842555..b0e8351d5b 100644
--- a/docs/interop/qmp-spec.txt
+++ b/docs/interop/qmp-spec.txt
@@ -133,9 +133,11 @@ to pass "id" with out-of-band commands.  Passing it with all commands
 is recommended for clients that accept capability "oob".
 
 If the client sends in-band commands faster than the server can
-execute them, the server will stop reading the requests from the QMP
-channel until the request queue length is reduced to an acceptable
-range.
+execute them, the server will stop reading requests until the request
+queue length is reduced to an acceptable range.
+
+To ensure commands to be executed out-of-band get read and executed,
+the client should have at most eight in-band commands in flight.
 
 Only a few commands support out-of-band execution.  The ones that do
 have "allow-oob": true in output of query-qmp-schema.
-- 
2.26.2


