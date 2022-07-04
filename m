Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA525659B8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:26:00 +0200 (CEST)
Received: from localhost ([::1]:38112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8NxX-0007sP-Lp
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8Nuu-000515-PB
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:23:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8Nut-0002MH-BX
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656948194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5v2G6lem/ZEC576JClSBjYZBfiuor+hY2xGADyGt3w=;
 b=ChTAHQyGAPYXW4KFeWoT4ALXwSJhV0eUKp4JZLqPdYgrG7ACsCSAS9UyFPzsaRpFKxg749
 CGacBH17r1hpehNQkjjVwulMqjbAEWVtm/aLdisOhH/rYSpD+sINp7+toT3cdw1i549B5t
 2+EDCummmcaVQtIn4Rqr+2BNNOHrgbo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-Tmb0p90DMkyGJY5AhEj8nA-1; Mon, 04 Jul 2022 11:23:13 -0400
X-MC-Unique: Tmb0p90DMkyGJY5AhEj8nA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA36E101A586;
 Mon,  4 Jul 2022 15:23:12 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36615C28100;
 Mon,  4 Jul 2022 15:23:11 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 3/7] tests/style: check for mixups of bool constants with
 int variables
Date: Mon,  4 Jul 2022 16:22:59 +0100
Message-Id: <20220704152303.760983-4-berrange@redhat.com>
In-Reply-To: <20220704152303.760983-1-berrange@redhat.com>
References: <20220704152303.760983-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

The 'true' and 'false' constants should only ever be used with the
'bool' type, never 'int'.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/style.mak | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/style.mak b/tests/style.mak
index 32c7e706ba..ae658395c9 100644
--- a/tests/style.mak
+++ b/tests/style.mak
@@ -22,3 +22,9 @@
 
 include tests/style-infra.mak
 include tests/style-excludes.mak
+
+# Use 'bool', not 'int', when assigning true or false
+sc_int_assign_bool:
+	@prohibit='\<int\>.*= *(true|false)\b' \
+	halt='use bool type for boolean values' \
+	$(_sc_search_regexp)
-- 
2.36.1


