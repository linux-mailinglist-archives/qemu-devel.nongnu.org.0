Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9385619477
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 11:32:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqty3-0001t8-Qr; Fri, 04 Nov 2022 06:30:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1oqty0-0001sW-O5
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 06:30:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1oqtxz-0006Em-13
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 06:30:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667557824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=NCMN+xGxqe7a4FWCbJQA1oeaIjbE3zOC2qxXhz6XIrk=;
 b=RSSPWAi4PLYRLYXorD2JIXUTA/DWqtkJu5n0UZ6hy2CYrTU0bf/Mqx7jCu8FiB6kvRk2+9
 bovoZDto/RhNyErgZFifrY9VRHc2UiJqE1se14Qx3J4SHi0o4vOYxfp/YdWaWMM9Nwl4Nr
 Fo+OhL6bSy6N2kTWnoRIL3ZLRmd9/oA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-_FYBRK44OSS5a3XN2c5hZA-1; Fri, 04 Nov 2022 06:30:21 -0400
X-MC-Unique: _FYBRK44OSS5a3XN2c5hZA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AC64101A54E;
 Fri,  4 Nov 2022 10:30:20 +0000 (UTC)
Received: from cav-thunderx1s-cn88xx-03.khw4.lab.eng.bos.redhat.com
 (cav-thunderx1s-cn88xx-03.khw4.lab.eng.bos.redhat.com [10.19.240.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 543F42022C2B;
 Fri,  4 Nov 2022 10:30:20 +0000 (UTC)
From: Zhenyu Zhang <zhenyzha@redhat.com>
To: qemu-devel@nongnu.org
Cc: zhenyzha@redhat.com, philmd@linaro.org, shan.gavin@gmail.com,
 liuyd.fnst@fujitsu.com, eric.auger@redhat.com, imammedo@redhat.com,
 armbru@redhat.com
Subject: [PATCH v2] qom.json: default the prealloc-threads to smp-cpus
Date: Fri,  4 Nov 2022 06:30:17 -0400
Message-Id: <20221104103017.181600-1-zhenyzha@redhat.com>
MIME-Version: 1.0\nContent-Type: text/plain;
 charset=UTF-8\nContent-Transfer-Encoding: 8bit
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=zhenyzha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, BOGUS_MIME_VERSION=3.499,
 DKIMWL_WL_HIGH=-1.047, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since the amount of prealloc-threads to smp-cpus is
defaulted in hostmem, so sync this information.

Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>

v1: https://www.mail-archive.com/qemu-devel@nongnu.org/msg919682.html

Changelog
=========
v2:
  * This property is available since 5.0.                     (Philippe)
---
 qapi/qom.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 87fcad2423..b2f6bceec7 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -576,7 +576,7 @@
 #
 # @prealloc: if true, preallocate memory (default: false)
 #
-# @prealloc-threads: number of CPU threads to use for prealloc (default: 1)
+# @prealloc-threads: number of CPU threads to use for prealloc (default: smp-cpus) (since 5.0)
 #
 # @prealloc-context: thread context to use for creation of preallocation threads
 #                    (default: none) (since 7.2)
-- 
2.31.1


