Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA51B54E511
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 16:39:31 +0200 (CEST)
Received: from localhost ([::1]:56696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1qeg-0004Km-Pv
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 10:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o1qSt-0007e3-ON
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:27:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o1qSk-0008Li-BT
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:27:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655389629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PnvBQgVfSEEBkwYFoj+TsRXzrJoZSeRlZ1fKUirKNzE=;
 b=WbP7ceM0qmwAId6Hvzg2oR8RhusmYK1K0RpQcXAhv27bRp7mnC+MQ8PCy8bP+0IGRqgAzm
 o6B1HFNeMtDClx+DOrUjVVfgwgpBWFR1uRf/7KZMfHvVwHNwH10Z1Olkn8f8GaPu0My/XZ
 qgdPVOecCW1PVtsZ2TWflh3xoqmuIcQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-eUdgqtqnPdaHxzpOMxIkDg-1; Thu, 16 Jun 2022 10:27:06 -0400
X-MC-Unique: eUdgqtqnPdaHxzpOMxIkDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F285B3C1022A;
 Thu, 16 Jun 2022 14:27:05 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85E0E2024CB6;
 Thu, 16 Jun 2022 14:27:05 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v2 10/10] tests/vm: add 512MB extra memory per core
Date: Thu, 16 Jun 2022 10:26:59 -0400
Message-Id: <20220616142659.3184115-11-jsnow@redhat.com>
In-Reply-To: <20220616142659.3184115-1-jsnow@redhat.com>
References: <20220616142659.3184115-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

Add this magic in early to the configuration process so that the
config file, if provided, can still override it.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/vm/basevm.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index d7d0413df35..69200ca5f1e 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -99,6 +99,12 @@ def __init__(self, args, config=None):
         self._source_path = args.source_path
         # Allow input config to override defaults.
         self._config = DEFAULT_CONFIG.copy()
+
+        if args.jobs and args.jobs > 4:
+            # Add a gig per every 2 jobs over 4
+            overage = (args.jobs - 4) // 2
+            self._config['memory'] = f"{4 + overage}G"
+
         if config != None:
             self._config.update(config)
         self.validate_ssh_keys()
-- 
2.34.3


