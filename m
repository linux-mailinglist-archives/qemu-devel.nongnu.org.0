Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F173B8BFF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 04:14:38 +0200 (CEST)
Received: from localhost ([::1]:43906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lymDt-0000JR-7s
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 22:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym9X-00005S-T4
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:10:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym9L-0006Aq-MR
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625105394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SrVvtiamtoKBBAdc8CRuXaN5L70firT/IGp7P3q6JW0=;
 b=PJkXQ/2UPQ0tFqlTEK07uy4vxshPZeMG7OsvLC2JU7tDZJ8Z8yHvHBI5zxWZtp2Y6g/bcY
 Z3uhFS5jSQz+QvZXaca2jxSoTiKlQ+G+wPxcXbs4d2NtvEI+/ijdwOBf7DnCywi3Ubh76D
 Hz2F8b8Amq1T8ofIRRyv8YMyF1hvr/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-sgRtS3mON_2DesFw2zXdTw-1; Wed, 30 Jun 2021 22:09:52 -0400
X-MC-Unique: sgRtS3mON_2DesFw2zXdTw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3563362FC;
 Thu,  1 Jul 2021 02:09:51 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98C195C225;
 Thu,  1 Jul 2021 02:09:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/15] python: only check qemu/ subdir with flake8
Date: Wed, 30 Jun 2021 22:09:16 -0400
Message-Id: <20210701020921.1679468-11-jsnow@redhat.com>
In-Reply-To: <20210701020921.1679468-1-jsnow@redhat.com>
References: <20210701020921.1679468-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

flake8 is a little eager to check everything it can. Limit it to
checking inside the qemu namespace directory only. Update setup.cfg now
that the exclude patterns are no longer necessary.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-id: 20210629214323.1329806-11-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/setup.cfg       | 2 --
 python/tests/flake8.sh | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/python/setup.cfg b/python/setup.cfg
index e730f208d3..11f71d5312 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -62,8 +62,6 @@ console_scripts =
 [flake8]
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
 exclude = __pycache__,
-          .venv,
-          .tox,
 
 [mypy]
 strict = True
diff --git a/python/tests/flake8.sh b/python/tests/flake8.sh
index 51e0788462..1cd7d40fad 100755
--- a/python/tests/flake8.sh
+++ b/python/tests/flake8.sh
@@ -1,2 +1,2 @@
 #!/bin/sh -e
-python3 -m flake8
+python3 -m flake8 qemu/
-- 
2.31.1


