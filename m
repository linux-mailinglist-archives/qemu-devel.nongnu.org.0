Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DBE37B184
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 00:17:08 +0200 (CEST)
Received: from localhost ([::1]:45866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgagd-00056S-LE
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 18:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaWN-0008TV-MT
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaWL-0006cI-Qd
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620770789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9rkUphiFWgxIY4ugyKiKF34Jvg+Dnahj0kYjwUJ7AMI=;
 b=CLrZWUJad3uVN/7uDwDNODv9KDmKn0KXKlhp6G0OESBEacw/yHT58/qML9FoxPRgl2GTXm
 JUgdpMXu3afY4J2qS76oC/UTEZCNoX8TFFqdy19EKtvgIxsfCSUlSnGCvXrjaj9Xqte0O4
 ikHvx/TYJEgdZqLeAFESHk3G7srBXvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-v0MybDeKPZyQ6BvuKdw_3g-1; Tue, 11 May 2021 18:06:27 -0400
X-MC-Unique: v0MybDeKPZyQ6BvuKdw_3g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7250107ACCD;
 Tue, 11 May 2021 22:06:26 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4017BA6F;
 Tue, 11 May 2021 22:06:25 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/21] qapi: [WIP] Enable linters on parser.py
Date: Tue, 11 May 2021 18:06:01 -0400
Message-Id: <20210511220601.2110055-22-jsnow@redhat.com>
In-Reply-To: <20210511220601.2110055-1-jsnow@redhat.com>
References: <20210511220601.2110055-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Only works after we excise QAPIDoc, of course.)
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/mypy.ini | 6 ------
 scripts/qapi/pylintrc | 3 +--
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/scripts/qapi/mypy.ini b/scripts/qapi/mypy.ini
index 1a72be2c788..56c0f306c5e 100644
--- a/scripts/qapi/mypy.ini
+++ b/scripts/qapi/mypy.ini
@@ -3,12 +3,6 @@ strict = True
 disallow_untyped_calls = False
 python_version = 3.6
 
-[mypy-qapi.parser]
-# QAPISchemaParser is done, I promise!
-disallow_untyped_defs = False
-disallow_incomplete_defs = False
-check_untyped_defs = False
-
 [mypy-qapi.qapidoc]
 disallow_untyped_defs = False
 disallow_incomplete_defs = False
diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
index ec7605edade..b41a26c1ceb 100644
--- a/scripts/qapi/pylintrc
+++ b/scripts/qapi/pylintrc
@@ -2,8 +2,7 @@
 
 # Add files or directories matching the regex patterns to the ignore list.
 # The regex matches against base names, not paths.
-ignore-patterns=parser.py,
-                qapidoc.py,
+ignore-patterns=qapidoc.py,
                 schema.py,
 
 
-- 
2.30.2


