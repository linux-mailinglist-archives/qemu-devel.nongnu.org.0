Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE75D41278E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 22:56:10 +0200 (CEST)
Received: from localhost ([::1]:49448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSQKg-0004mg-27
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 16:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mSQEq-0004Xr-PN
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 16:50:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mSQEp-0008L2-BQ
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 16:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632171006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SrnR0JFTLBagWY4aAzwbjJw0gLiDnNpkAkBlvs3OkZ8=;
 b=CajBchGohBUEHu4qkQU5/SyquTPr8H0g/RiMz9K9e+nPqZs5GnJF3Ja2pwZZEeg3uGZCcm
 zg0H47Re+N43LqPJYUkKstP2zZFitbBlQMj0MYSk9AU+Vl7UxqKAqggmwY1Wm0YKBOHEBB
 lWOF5Vrx7IpVrjF13WKBRjXtgCpJ7PQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-G6Y66GosOxCz5k2hgmNmmQ-1; Mon, 20 Sep 2021 16:50:05 -0400
X-MC-Unique: G6Y66GosOxCz5k2hgmNmmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92E341923761
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 20:50:03 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.16.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1862619D9D;
 Mon, 20 Sep 2021 20:50:01 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] avocado_qemu: fix inheritance order on LinuxTest class
Date: Mon, 20 Sep 2021 17:49:32 -0300
Message-Id: <20210920204932.94132-7-willianr@redhat.com>
In-Reply-To: <20210920204932.94132-1-willianr@redhat.com>
References: <20210920204932.94132-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Class hierarchy on Python is defined from right to left. Although the
current code is not harmful, let's fix it to avoid problems in the future.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 35318ce2a9..1841053e2c 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -424,7 +424,7 @@ def default_kernel_params(self):
         return self._info.get('kernel_params', None)
 
 
-class LinuxTest(Test, LinuxSSHMixIn):
+class LinuxTest(LinuxSSHMixIn, Test):
     """Facilitates having a cloud-image Linux based available.
 
     For tests that indend to interact with guests, this is a better choice
-- 
2.31.1


