Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A5031959F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 23:14:14 +0100 (CET)
Received: from localhost ([::1]:37644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAKE0-00012l-QK
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 17:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAK2F-0000JJ-FW
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 17:02:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAK2C-0005rY-74
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 17:02:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613080919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yE/LntIwowJP/AvdhZnvELNHjMASPOH1uXK0gHpi4vs=;
 b=Egr6CgQWRJ/0rE0HQ2Ev9PBYXKuTEFjos7yRWWa7DB2/4TBSPp56/Uzl3S52d6WT4iWl4U
 cCmkAqnNdBu9L1Vda3Pn04xFDeYZmuMl3Oc58STI3sJ3YXtPZlW143BjoJoAt+PkOTIsAA
 3iU1GjuUNKVIakG76LBXEjY3HvAwrbI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-88koqT26MmytA2GfX1UvUw-1; Thu, 11 Feb 2021 17:01:55 -0500
X-MC-Unique: 88koqT26MmytA2GfX1UvUw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D71C85B664;
 Thu, 11 Feb 2021 22:01:54 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-89.rdu2.redhat.com
 [10.10.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 443C860BF1;
 Thu, 11 Feb 2021 22:01:53 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] Python: close the log file kept by QEMUMachine before
 reading it
Date: Thu, 11 Feb 2021 17:01:41 -0500
Message-Id: <20210211220146.2525771-2-crosa@redhat.com>
In-Reply-To: <20210211220146.2525771-1-crosa@redhat.com>
References: <20210211220146.2525771-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Closing a file that is open for writing, and then reading from it
sounds like a better idea than the opposite, given that the content
will be flushed.

Reference: https://docs.python.org/3/library/io.html#io.IOBase.close
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 python/qemu/machine.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 7a40f4604b..6e44bda337 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -337,12 +337,12 @@ class QEMUMachine:
             self._qmp.close()
             self._qmp_connection = None
 
-        self._load_io_log()
-
         if self._qemu_log_file is not None:
             self._qemu_log_file.close()
             self._qemu_log_file = None
 
+        self._load_io_log()
+
         self._qemu_log_path = None
 
         if self._temp_dir is not None:
-- 
2.25.4


