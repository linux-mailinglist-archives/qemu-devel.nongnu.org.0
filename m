Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0C8617B12
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 11:50:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqXmg-0001yG-R0; Thu, 03 Nov 2022 06:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1oqXmT-0001wn-Hg
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 06:49:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1oqXmP-0006nt-TC
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 06:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667472540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=pdvLPeIXX14v9L373p1TA5wskSCMO4JjjC+04vQ7Gv4=;
 b=dfeRU1EbHHfGi13ea4UYKoOwPfRP9/WAN4RKBYa8QusyeXOZHZ4m4uDSjL2Hb/cyYGln0g
 STuTo80DYZwRPhvwU64Suio4fTJu8oIex1Tls7DxVqWQxa11bXwg8fYGiabN90VCXfXQGZ
 MBLcBo6Kdk4752VFnToJYUwxVy00exE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-oAr9yuEDPLaMtwx1chsm5A-1; Thu, 03 Nov 2022 06:47:25 -0400
X-MC-Unique: oAr9yuEDPLaMtwx1chsm5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4510B185A79C;
 Thu,  3 Nov 2022 10:47:25 +0000 (UTC)
Received: from cav-thunderx1s-cn88xx-03.khw4.lab.eng.bos.redhat.com
 (cav-thunderx1s-cn88xx-03.khw4.lab.eng.bos.redhat.com [10.19.240.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 103872024CBF;
 Thu,  3 Nov 2022 10:47:25 +0000 (UTC)
From: Zhenyu Zhang <zhenyzha@redhat.com>
To: qemu-devel@nongnu.org
Cc: zhenyzha@redhat.com, shan.gavin@gmail.com, liuyd.fnst@fujitsu.com,
 eric.auger@redhat.com
Subject: [PATCH] qom.json: default the prealloc-threads to smp-cpus
Date: Thu,  3 Nov 2022 06:47:16 -0400
Message-Id: <20221103104716.179635-1-zhenyzha@redhat.com>
MIME-Version: 1.0\nContent-Type: text/plain;
 charset=UTF-8\nContent-Transfer-Encoding: 8bit
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=zhenyzha@redhat.com;
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
---
 qapi/qom.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 87fcad2423..ac4cd213a7 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -576,7 +576,7 @@
 #
 # @prealloc: if true, preallocate memory (default: false)
 #
-# @prealloc-threads: number of CPU threads to use for prealloc (default: 1)
+# @prealloc-threads: number of CPU threads to use for prealloc (default: smp-cpus) (since 7.1)
 #
 # @prealloc-context: thread context to use for creation of preallocation threads
 #                    (default: none) (since 7.2)
-- 
2.31.1


