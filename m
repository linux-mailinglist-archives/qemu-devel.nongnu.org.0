Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7154B9F78
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:00:12 +0100 (CET)
Received: from localhost ([::1]:51692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKfSF-0005c0-UG
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:00:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfPk-0002r6-3N
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:57:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfPi-00010v-6d
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645099053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X3Vyk+EeGRZobRDomz2zhPaCA3VPTU+f8xfNAUKl79A=;
 b=DshxvE8VJQfBpq1rY3OMtPUu5ZXgmbEoRgVkBqlFUYZ6KugDTCP4QPVr+bN8XS6J/TbgTU
 dtUoLrSkMbjlHgQOvGZyB6JzNDKvhi2Ui3MphnbrhFEoVIpYK9U0EN0UFd4ylCpiBsU190
 z2z/JR/EAqcDSKLMwUUBXc7VBvqg+3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-0FI_UInMNsq9AwkM8ttUmg-1; Thu, 17 Feb 2022 06:57:32 -0500
X-MC-Unique: 0FI_UInMNsq9AwkM8ttUmg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F95A1091DA0;
 Thu, 17 Feb 2022 11:57:31 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95EA5108648F;
 Thu, 17 Feb 2022 11:57:29 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/10] block: support sha256 fingerprint with pre-blockdev
 options
Date: Thu, 17 Feb 2022 11:57:15 +0000
Message-Id: <20220217115723.1782616-3-berrange@redhat.com>
In-Reply-To: <20220217115723.1782616-1-berrange@redhat.com>
References: <20220217115723.1782616-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When support for sha256 fingerprint checking was aded in

  commit bf783261f0aee6e81af3916bff7606d71ccdc153
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Tue Jun 22 12:51:56 2021 +0100

    block/ssh: add support for sha256 host key fingerprints

it was only made to work with -blockdev. Getting it working with
-drive requires some extra custom parsing.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/ssh.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/block/ssh.c b/block/ssh.c
index 3b5bf34031..ac01301409 100644
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
2.34.1


