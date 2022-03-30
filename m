Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F41D84ECC48
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:29:43 +0200 (CEST)
Received: from localhost ([::1]:57970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZd4h-0002lK-3f
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:29:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZczg-0006TP-Ju
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:24:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZcze-0005EJ-3X
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:24:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648664669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G3u6SuJ4ud4t9n1vYizE8sH2yljeaJOWLv5ms5gZX/I=;
 b=WmjFpjV5+ZcRl8rR2cJ/Vf1Verkw2ZSpYFGCSsm4A2HqFrzLTUab4YOHybq16MPWDuoSdc
 Sv7jAIRUl+9Y8FS/Un7l6FyQEp0PRY7R3+xvxWWdXW1N+PnXv1UuT1+ypuT8+/r1aheuqq
 3bI2gNpmr3brXU4zfYa+G49xYQCq/YA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-bYzdN1hWMMCCSDKpKyn2Ow-1; Wed, 30 Mar 2022 14:24:28 -0400
X-MC-Unique: bYzdN1hWMMCCSDKpKyn2Ow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8B323820541
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 18:24:27 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.35.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59E182166B3F;
 Wed, 30 Mar 2022 18:24:27 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu.qmp PATCH 07/13] add a couple new trove classifiers
Date: Wed, 30 Mar 2022 14:24:18 -0400
Message-Id: <20220330182424.3438872-8-jsnow@redhat.com>
In-Reply-To: <20220330182424.3438872-1-jsnow@redhat.com>
References: <20220330182424.3438872-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 setup.cfg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/setup.cfg b/setup.cfg
index 776f4f1..44f913d 100644
--- a/setup.cfg
+++ b/setup.cfg
@@ -14,6 +14,7 @@ long_description = file:PACKAGE.rst
 long_description_content_type = text/x-rst
 classifiers =
     Development Status :: 3 - Alpha
+    Intended Audience :: Developers
     License :: OSI Approved :: GNU General Public License v2 (GPLv2)
     Natural Language :: English
     Operating System :: OS Independent
@@ -23,6 +24,7 @@ classifiers =
     Programming Language :: Python :: 3.8
     Programming Language :: Python :: 3.9
     Programming Language :: Python :: 3.10
+    Topic :: System :: Emulators
     Typing :: Typed
 
 [options]
-- 
2.34.1


