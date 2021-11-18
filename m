Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A996455E62
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 15:39:09 +0100 (CET)
Received: from localhost ([::1]:39018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mniZA-00011L-Ju
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 09:39:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mniWO-0004kz-37
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:36:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mniWK-0004mR-VJ
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637246172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TqVcZztcI/sVqqYp7S4eoNXMMYvntX6jtEZp9tYZMsg=;
 b=Xqko0TlbalRqWbKqQoQhYyCGVeyBPL/XW5Gbdve7/1T6sHzguGJE/HCZDlq3TbUs4Ou1CD
 vRH24tCXqUYOgy6WwOrN9NxYfB9AwiG3lLooYFNtGw3LVWbwgbA4RG8pXUeqF9RZ9QV54a
 3IDd/5OwKUKPvKDiuiVpIbCOtGGmWLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-Dmp2MQIWM2yFQXaVPq2g5w-1; Thu, 18 Nov 2021 09:36:11 -0500
X-MC-Unique: Dmp2MQIWM2yFQXaVPq2g5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4253804142;
 Thu, 18 Nov 2021 14:36:09 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 783D5604CC;
 Thu, 18 Nov 2021 14:36:02 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] block: support sha256 fingerprint with pre-blockdev
 options
Date: Thu, 18 Nov 2021 14:35:46 +0000
Message-Id: <20211118143547.2045554-3-berrange@redhat.com>
In-Reply-To: <20211118143547.2045554-1-berrange@redhat.com>
References: <20211118143547.2045554-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When support for sha256 fingerprint checking was aded in

  commit bf783261f0aee6e81af3916bff7606d71ccdc153
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Tue Jun 22 12:51:56 2021 +0100

    block/ssh: add support for sha256 host key fingerprints

it was only made to work with -blockdev. Getting it working with
-drive requires some extra custom parsing.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/ssh.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/block/ssh.c b/block/ssh.c
index e0fbb4934b..fcc0ab765a 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -556,6 +556,11 @@ static bool ssh_process_legacy_options(QDict *output_opts,
             qdict_put_str(output_opts, "host-key-check.type", "sha1");
             qdict_put_str(output_opts, "host-key-check.hash",
                           &host_key_check[5]);
+        } else if (strncmp(host_key_check, "sha256:", 7) == 0) {
+            qdict_put_str(output_opts, "host-key-check.mode", "hash");
+            qdict_put_str(output_opts, "host-key-check.type", "sha256");
+            qdict_put_str(output_opts, "host-key-check.hash",
+                          &host_key_check[7]);
         } else if (strcmp(host_key_check, "yes") == 0) {
             qdict_put_str(output_opts, "host-key-check.mode", "known_hosts");
         } else {
-- 
2.31.1


