Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 970C830F493
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:08:23 +0100 (CET)
Received: from localhost ([::1]:50014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fJ0-0004IF-Jn
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7fCe-0003gL-6t
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:01:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7fCa-00007F-HJ
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:01:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612447303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kCkCGcSd4+EHtfCUhrTpgqeZA87reYcrwgi2tA/mqsc=;
 b=aGJ71VcH8NAX9wqLvzAQRxJdFxReEA1dQmg0rHBAHeogp0RRLYPiVPyfXFFg1ch+pc2BOl
 jj6kcQieED1AtCW9pv9sEGYGcozu18OwxuFpqgBSLBtfqq5yFohsTQUnkqp3nIJHq8YOy+
 gBdP+eV2+PAsxr3aPWTWStiYfe3cnk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492--kSpU7ftNU67VxAs21ffXQ-1; Thu, 04 Feb 2021 09:01:41 -0500
X-MC-Unique: -kSpU7ftNU67VxAs21ffXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE361874981;
 Thu,  4 Feb 2021 14:01:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D1375C6B8;
 Thu,  4 Feb 2021 14:01:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7BF0E1132EA4; Thu,  4 Feb 2021 15:01:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] docs/interop/qmp-spec: Document the request queue limit
Date: Thu,  4 Feb 2021 15:01:33 +0100
Message-Id: <20210204140136.2769065-7-armbru@redhat.com>
In-Reply-To: <20210204140136.2769065-1-armbru@redhat.com>
References: <20210204140136.2769065-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210127144734.2367693-1-armbru@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
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


