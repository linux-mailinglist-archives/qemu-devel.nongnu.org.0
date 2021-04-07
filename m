Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191D4356E02
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 15:59:47 +0200 (CEST)
Received: from localhost ([::1]:50724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU8ig-0005hU-4a
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 09:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lU8aR-0004Jw-Bw
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lU8aL-00068W-G3
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:51:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617803464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dr/Edrw3t7ZX6Ov/GKXZk/NBJ/+rVL5wqc9yNJeU/HI=;
 b=QrpdXeuQvRLFKTWE05sgtuazSst99pivxDFML+NpqMjvug7aZrqCaphLCgJGLdnr+uatCP
 cXk1EapIEjBuA4rQya12LBuAMOukdWFBWuq1Bv48nWS/UezH4Hm/ELvPOrdTecahOZn4/U
 mPJzZ1MeuLjXfcFvz44NBgRHRbGxHrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-V0iBgL0DP0OhAzUfV5KA2g-1; Wed, 07 Apr 2021 09:51:00 -0400
X-MC-Unique: V0iBgL0DP0OhAzUfV5KA2g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D33406D249;
 Wed,  7 Apr 2021 13:50:59 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-163.ams2.redhat.com
 [10.36.115.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C1AE19CB4;
 Wed,  7 Apr 2021 13:50:57 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 10/11] qemu_iotests: insert valgrind command line as
 wrapper for qemu binary
Date: Wed,  7 Apr 2021 15:50:20 +0200
Message-Id: <20210407135021.48330-11-eesposit@redhat.com>
In-Reply-To: <20210407135021.48330-1-eesposit@redhat.com>
References: <20210407135021.48330-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The priority will be given to gdb command line, meaning if -gdb
and -valgrind parameters are given, only gdb will be wrapped around
the qemu binary.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 tests/qemu-iotests/iotests.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index b6166b6f7b..b23bfdfdff 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -590,7 +590,8 @@ class VM(qtest.QEMUQtestMachine):
 
     def __init__(self, path_suffix=''):
         name = "qemu%s-%d" % (path_suffix, os.getpid())
-        super().__init__(qemu_prog, qemu_opts, wrapper=qemu_gdb,
+        wrapper = qemu_gdb if qemu_gdb else qemu_valgrind
+        super().__init__(qemu_prog, qemu_opts, wrapper=wrapper,
                          name=name,
                          test_dir=test_dir,
                          socket_scm_helper=socket_scm_helper,
-- 
2.30.2


