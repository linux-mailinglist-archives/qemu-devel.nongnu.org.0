Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4BF5698F6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 06:07:40 +0200 (CEST)
Received: from localhost ([::1]:60458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Inj-0006U3-Bf
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 00:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9Ijc-0003dE-D6
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 00:03:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9IjZ-0008Dy-Gd
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 00:03:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657166599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRKBQamr/85kyaYuX5mWgzy/vvLNJp/dZKHc2HThgMU=;
 b=icsIl+U/XdQ4XCoLTfaLK0agtM2gRBe7p1pFdUWn8X9JKZ2PtQxZe6NglOxQIe3vbWRttT
 3xCB85b1MSMKkqf8IXNg+59+kPSxTaISzUoJs5ul6l5Q/2xnKY+YLeTkQ43p1avRBdKpxY
 /sH5k6ilzsqcAzDwLKcgXft2Tnp7Dks=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-WHscINeSOj6yCpbGEmAjnw-1; Thu, 07 Jul 2022 00:03:16 -0400
X-MC-Unique: WHscINeSOj6yCpbGEmAjnw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D25E6185A7B2;
 Thu,  7 Jul 2022 04:03:15 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 603D62EF97;
 Thu,  7 Jul 2022 04:03:15 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v3 08/13] tests/vm: add 1GB extra memory per core
Date: Thu,  7 Jul 2022 00:03:05 -0400
Message-Id: <20220707040310.4163682-9-jsnow@redhat.com>
In-Reply-To: <20220707040310.4163682-1-jsnow@redhat.com>
References: <20220707040310.4163682-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you try to run a 16 or 32 threaded test, you're going to run out of
memory very quickly with qom-test and a few others. Bump the memory
limit to try to scale with larger-core machines.

Granted, this means that a 16 core processor is going to ask for 16GB,
but you *probably* meet that requirement if you have such a machine.

512MB per core didn't seem to be enough to avoid ENOMEM and SIGABRTs in
the test cases in practice on a six core machine; so I bumped it up to
1GB which seemed to help.

Add this magic in early to the configuration process so that the
config file, if provided, can still override it.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/vm/basevm.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index d7d0413df35..4fd9af10b7f 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -99,6 +99,11 @@ def __init__(self, args, config=None):
         self._source_path = args.source_path
         # Allow input config to override defaults.
         self._config = DEFAULT_CONFIG.copy()
+
+        # 1GB per core, minimum of 4. This is only a default.
+        mem = max(4, args.jobs)
+        self._config['memory'] = f"{mem}G"
+
         if config != None:
             self._config.update(config)
         self.validate_ssh_keys()
-- 
2.34.3


