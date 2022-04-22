Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AE850C01A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 21:06:54 +0200 (CEST)
Received: from localhost ([::1]:49698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhycH-00054j-Cj
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 15:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhyLq-0000fn-11
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:49:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhyLo-0007ul-Hx
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:49:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650653392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6PC+vEYF5dluFPLZg9z7UF/7+z4kkJHhGyFPqAAsWm0=;
 b=Bo9+P1/a1f53AaoGn32zyMVDxBcIWmNcAMLiuORXroAzUM9+cZ9srUiW/MiP9G+RBXvqhy
 2tYheI1c3IyJhivW0bUQnwoqmjS+YMNmpK1qj7E2e+fuAWRZ4n9Ri5+NWjxRscso0pP5NG
 +S1x4TfwPm040IxqDzylf/gkAjtqZzQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-i2e_Z5x2OkSw8jr4q-qOUQ-1; Fri, 22 Apr 2022 14:49:43 -0400
X-MC-Unique: i2e_Z5x2OkSw8jr4q-qOUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04D00811E76
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 18:49:43 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.10.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA9061468940;
 Fri, 22 Apr 2022 18:49:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu.qmp PATCH 05/12] add a couple new trove classifiers
Date: Fri, 22 Apr 2022 14:49:33 -0400
Message-Id: <20220422184940.1763958-6-jsnow@redhat.com>
In-Reply-To: <20220422184940.1763958-1-jsnow@redhat.com>
References: <20220422184940.1763958-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: John Snow <jsnow@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
---
 setup.cfg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/setup.cfg b/setup.cfg
index 0a1c215..000f00a 100644
--- a/setup.cfg
+++ b/setup.cfg
@@ -12,6 +12,7 @@ long_description = file:PACKAGE.rst
 long_description_content_type = text/x-rst
 classifiers =
     Development Status :: 3 - Alpha
+    Intended Audience :: Developers
     License :: OSI Approved :: GNU General Public License v2 (GPLv2)
     Natural Language :: English
     Operating System :: OS Independent
@@ -21,6 +22,7 @@ classifiers =
     Programming Language :: Python :: 3.8
     Programming Language :: Python :: 3.9
     Programming Language :: Python :: 3.10
+    Topic :: System :: Emulators
     Typing :: Typed
 
 [options]
-- 
2.34.1


