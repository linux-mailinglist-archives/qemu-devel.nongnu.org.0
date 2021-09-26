Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB97418A59
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 19:27:04 +0200 (CEST)
Received: from localhost ([::1]:35328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUXvV-0005MG-Uc
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 13:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mUXmC-0004ij-UU
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 13:17:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mUXmA-00083v-Nc
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 13:17:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632676637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fOyT0x6SER/gK+VWZc4/Hyx5U0c8qWbpjJkx0t+tqWA=;
 b=WRX3yR73/r48e8aabwCt+/jKLvhBSRSc428zSL2QDcCOkBV9Xa06IKFoRU0aQT7wm7sdHp
 HVqcB4dczm6bncK0TcHvPjfmmTBtXYI6Eyy5UC4McqmK9044LubLRPrHVDY3NSem+lgNFi
 KUYQnhA3cKSIkUNkbg4D12AwPch++pc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-qZD35fhdNjOZBYG2fI5iLw-1; Sun, 26 Sep 2021 13:17:15 -0400
X-MC-Unique: qZD35fhdNjOZBYG2fI5iLw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8516B1084686
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 17:17:14 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 549AF60657
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 17:17:14 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 3/5] hexagon: use env keyword argument to pass PYTHONPATH
Date: Sun, 26 Sep 2021 13:17:06 -0400
Message-Id: <20210926171708.455435-4-pbonzini@redhat.com>
In-Reply-To: <20210926171708.455435-1-pbonzini@redhat.com>
References: <20210926171708.455435-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This feature is new in meson 0.57 and allows getting rid of the "env" wrapper.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/hexagon/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index 6fd9360b74..c6d858ffb2 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -156,7 +156,8 @@ dectree_generated = custom_target(
     'dectree_generated.h.inc',
     output: 'dectree_generated.h.inc',
     depends: [iset_py],
-    command: ['env', 'PYTHONPATH=' + meson.current_build_dir(), files('dectree.py'), '@OUTPUT@'],
+    env: {'PYTHONPATH': meson.current_build_dir()},
+    command: [python, files('dectree.py'), '@OUTPUT@'],
 )
 hexagon_ss.add(dectree_generated)
 
-- 
2.27.0



