Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BA55793E5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:11:58 +0200 (CEST)
Received: from localhost ([::1]:40456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhOf-0007Zr-No
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHN-00026d-J1
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHM-0002ye-2p
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658214263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yCe8RnBaqi/5K/5ixqgamPhWm/Um76icno4qSl9vjE0=;
 b=g0ooQnTKn34S/6NqZcZS5OpH6KuoBI6epr4O4Rez0emhmVJHWZFBaqqwyqozX9ZFrmUyrO
 NP9RxY25GPECYlUMcRXUb3/XOX+9LyoKkUpHmRRyW0FMGMbrZDh0wB5Efdb2Gxqfr1LTTj
 0kK8L1EJKlo6AW5hK7cCUirW3hdqmUs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-zKriHjtwOJ69YwTQ-zZkKA-1; Tue, 19 Jul 2022 03:04:22 -0400
X-MC-Unique: zKriHjtwOJ69YwTQ-zZkKA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9ADC811E7A;
 Tue, 19 Jul 2022 07:04:21 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08F7640CFD0A;
 Tue, 19 Jul 2022 07:04:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 08/14] tests/vm: add 1GB extra memory per core
Date: Tue, 19 Jul 2022 09:04:06 +0200
Message-Id: <20220719070412.16757-9-thuth@redhat.com>
In-Reply-To: <20220719070412.16757-1-thuth@redhat.com>
References: <20220719070412.16757-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

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
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220708153503.18864-9-jsnow@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/basevm.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index d7d0413df3..4fd9af10b7 100644
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
2.31.1


