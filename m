Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFA940D24C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:20:16 +0200 (CEST)
Received: from localhost ([::1]:57100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQish-00028Q-SO
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQij7-000704-03
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQij2-0000Wk-1n
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631765415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=US60V94xYr0YwASCa+Z1LSb/8isp127gJbojQVNlda4=;
 b=HBg5G/LldPp5ELhhk+V9QyrhPw0Tj2JWdBUcDlUDAP3MOCC9z0R5yTs6cbHN84ZxI6YWT5
 em8/4R2eO/wN71TCrpuFeDQbxsBplPjCHgx6JEuJ2fRaCNxVhuHiMV9NQ651IQ2AXLa7O7
 SpW52d+6vtwM6/WqUOGnFCzPb+mZP+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-Krg-4ZdMOlubqCAQGYreWQ-1; Thu, 16 Sep 2021 00:10:12 -0400
X-MC-Unique: Krg-4ZdMOlubqCAQGYreWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50F6F801B3D;
 Thu, 16 Sep 2021 04:10:11 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABC5319C79;
 Thu, 16 Sep 2021 04:10:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/16] iotests/297: modify is_python_file to work from any
 CWD
Date: Thu, 16 Sep 2021 00:09:44 -0400
Message-Id: <20210916040955.628560-6-jsnow@redhat.com>
In-Reply-To: <20210916040955.628560-1-jsnow@redhat.com>
References: <20210916040955.628560-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a directory argument to is_python_file to allow it to work correctly
no matter what CWD we happen to run it from. This is done in
anticipation of running the iotests from another directory (./python/).

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297 | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index b04cba5366..3e86f788fc 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -39,14 +39,16 @@ SKIP_FILES = (
 )
 
 
-def is_python_file(filename):
-    if not os.path.isfile(filename):
+def is_python_file(filename: str, directory: str = '.') -> bool:
+    filepath = os.path.join(directory, filename)
+
+    if not os.path.isfile(filepath):
         return False
 
     if filename.endswith('.py'):
         return True
 
-    with open(filename, encoding='utf-8') as f:
+    with open(filepath, encoding='utf-8') as f:
         try:
             first_line = f.readline()
             return re.match('^#!.*python', first_line) is not None
-- 
2.31.1


