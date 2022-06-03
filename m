Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC49053C637
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 09:32:20 +0200 (CEST)
Received: from localhost ([::1]:37570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx1n9-0004h0-Au
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 03:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx1HT-0005g5-7h
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:59:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx1HQ-0003Ki-7n
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654239571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EU4c4qAlX5b5mWHedXjmwguRtObwdcqZHncJpkJVYGM=;
 b=Xn1qR77/qngwZyR2plQqMJxgdXmLiY8VP6luA9qpAnpduKtcU0kK4PhcreqZViaCTLJ4t0
 xCusH/0YFw9ICKKjXewKv07lYEzL5PByCubfhnPNZovWwh4o7Sscrcf7zFiSHRHQReaTos
 G7OwS+7Mm/L68bhmOHdiA5Ie4PjFSu8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-ygheTbZGMbq8gax4FKngmw-1; Fri, 03 Jun 2022 02:59:28 -0400
X-MC-Unique: ygheTbZGMbq8gax4FKngmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D9E0101A54E;
 Fri,  3 Jun 2022 06:59:27 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B25792166B26;
 Fri,  3 Jun 2022 06:59:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org, Miaoqian Lin <linmq006@gmail.com>,
 Hao Wu <wuhaotsh@google.com>
Subject: [PULL 08/12] qtest/npcm7xx_pwm-test: Fix memory leak in mft_qom_set
Date: Fri,  3 Jun 2022 08:59:01 +0200
Message-Id: <20220603065905.23805-9-thuth@redhat.com>
In-Reply-To: <20220603065905.23805-1-thuth@redhat.com>
References: <20220603065905.23805-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Miaoqian Lin <linmq006@gmail.com>

g_strdup_printf() allocated memory for path, we should free it with
g_free() when no longer needed.

Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Message-Id: <20220531080921.4704-1-linmq006@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/npcm7xx_pwm-test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index c4a5fdcacd..e320a625c4 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -268,6 +268,9 @@ static void mft_qom_set(QTestState *qts, int index, const char *name,
             path, name, value);
     /* The qom set message returns successfully. */
     g_assert_true(qdict_haskey(response, "return"));
+
+    qobject_unref(response);
+    g_free(path);
 }
 
 static uint32_t get_pll(uint32_t con)
-- 
2.31.1


