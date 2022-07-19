Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BDB5793DE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:10:32 +0200 (CEST)
Received: from localhost ([::1]:36434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhNH-0004lq-8a
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHY-0002hk-Pm
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHX-00030N-9k
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658214274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hM+KUjnNCDrn+8brryG9f3B4r99oqVCjJWAnfAM2dkw=;
 b=K8azdpzdNb7hB8LAJ4HHeF0YjUUCqXgcAkpemrEv0Zv0umM/j+Z2ju82mO5Fz91LqDUsk0
 iXvvDvWXCRuv7+DUjEQ7ar5bCU1VPT8rslbuBS3R1znI0cyeV6H94SoORhE9Kkoh8TMvxw
 jJIY90OfOhj7yGCD5Op1b2jE+LHxHzM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-IZkKFCYrOvCsFaxYH_hZKQ-1; Tue, 19 Jul 2022 03:04:27 -0400
X-MC-Unique: IZkKFCYrOvCsFaxYH_hZKQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18C8F85A588;
 Tue, 19 Jul 2022 07:04:27 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 755BF404C6ED;
 Tue, 19 Jul 2022 07:04:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>
Subject: [PULL 14/14] python/qemu/qmp/legacy: Replace 'returns-whitelist' with
 the correct type
Date: Tue, 19 Jul 2022 09:04:12 +0200
Message-Id: <20220719070412.16757-15-thuth@redhat.com>
In-Reply-To: <20220719070412.16757-1-thuth@redhat.com>
References: <20220719070412.16757-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

'returns-whitelist' has been renamed to 'command-returns-exceptions' in
commit b86df3747848 ("qapi: Rename pragma *-whitelist to *-exceptions").

Message-Id: <20220711095721.61280-1-thuth@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 python/qemu/qmp/legacy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/python/qemu/qmp/legacy.py b/python/qemu/qmp/legacy.py
index 03b5574618..1951754455 100644
--- a/python/qemu/qmp/legacy.py
+++ b/python/qemu/qmp/legacy.py
@@ -50,7 +50,7 @@
 
 # QMPMessage can be outgoing commands or incoming events/returns.
 # QMPReturnValue is usually a dict/json object, but due to QAPI's
-# 'returns-whitelist', it can actually be anything.
+# 'command-returns-exceptions', it can actually be anything.
 #
 # {'return': {}} is a QMPMessage,
 # {} is the QMPReturnValue.
-- 
2.31.1


