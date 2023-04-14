Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E75346E1C0C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 07:56:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnCP9-0007Qa-7l; Fri, 14 Apr 2023 01:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pnCP0-0007Og-C9
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:55:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pnCOn-0000LP-Hu
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681451704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ghbh4qRNVDBPRglbq18ow59ZrTEcqWklHbrforGx4nU=;
 b=K74J+SxhZrMbxNDC1bh25KE/GRt836ZoP1k9pDg3hYkr8CrXDP4ZNhcGwARWsb9HcK1rn0
 X/yziQosR/85b2sBUUPAkHCpI7M0LYDcHn2rqp0F4SQYgfDkOLatnGG7QFfXbxzwHi4nHa
 CD9naGdwg9fYe34vZxEiSY9FpzzHEiU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-9Yj4XkhvNM-fdzw72wrKrg-1; Fri, 14 Apr 2023 01:54:53 -0400
X-MC-Unique: 9Yj4XkhvNM-fdzw72wrKrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D73173C0F38C;
 Fri, 14 Apr 2023 05:54:52 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5280DC1602A;
 Fri, 14 Apr 2023 05:54:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Kyle Evans <kevans@freebsd.org>,
 Beraldo Leal <bleal@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH v2 04/10] tests/vm: Configure netbsd to use Python 3.10
Date: Fri, 14 Apr 2023 01:54:43 -0400
Message-Id: <20230414055449.4028284-5-jsnow@redhat.com>
In-Reply-To: <20230414055449.4028284-1-jsnow@redhat.com>
References: <20230414055449.4028284-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

NetBSD removes some packages from the Python stdlib, but only
re-packages them for Python 3.10. Switch to using Python 3.10.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/vm/netbsd | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index 0b9536ca17..13eae109c0 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -30,6 +30,7 @@ class NetBSDVM(basevm.BaseVM):
         "git-base",
         "pkgconf",
         "xz",
+        "python310",
         "ninja-build",
 
         # gnu tools
-- 
2.39.2


