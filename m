Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD4035F9BA
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 19:24:51 +0200 (CEST)
Received: from localhost ([::1]:46478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWjFy-0004UL-Gr
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 13:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lWiwJ-0002v4-EL
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 13:04:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lWiwH-0008Qo-TO
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 13:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618419869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tI3CepMnsIYacmApf5xeEBxhlkxYaW1/TVU3GqiQscs=;
 b=S8WdOqmcNuihd5yBXoel7HL6OOttHWFWzC0akBxiTIsAt4/+X6kHGcrottCV0SgDyX2qQw
 jtdPKyXWwJxz9SB+vqYB6FcX2oESKSvP7PRi4b+QzG86HXZhM9PT750FnbQvOr7hHtzBKW
 QCmBsyGV4/35NEmIczx11xjivvfHDbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-IWVe9U1BPtKjQVBxCFjEKw-1; Wed, 14 Apr 2021 13:04:25 -0400
X-MC-Unique: IWVe9U1BPtKjQVBxCFjEKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9115B5B38C;
 Wed, 14 Apr 2021 17:04:24 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-18.ams2.redhat.com
 [10.36.114.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 009D010023AC;
 Wed, 14 Apr 2021 17:04:21 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 06/15] qemu_iotests: insert gdbserver command line as
 wrapper for qemu binary
Date: Wed, 14 Apr 2021 19:03:43 +0200
Message-Id: <20210414170352.29927-7-eesposit@redhat.com>
In-Reply-To: <20210414170352.29927-1-eesposit@redhat.com>
References: <20210414170352.29927-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 tests/qemu-iotests/iotests.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 380527245e..4f3fb13915 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -582,7 +582,8 @@ class VM(qtest.QEMUQtestMachine):
 
     def __init__(self, path_suffix=''):
         name = "qemu%s-%d" % (path_suffix, os.getpid())
-        super().__init__(qemu_prog, qemu_opts, name=name,
+        super().__init__(qemu_prog, qemu_opts, wrapper=qemu_gdb,
+                         name=name,
                          test_dir=test_dir,
                          socket_scm_helper=socket_scm_helper,
                          sock_dir=sock_dir)
-- 
2.30.2


