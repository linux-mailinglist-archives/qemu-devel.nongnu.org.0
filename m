Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8A125B060
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 17:58:00 +0200 (CEST)
Received: from localhost ([::1]:46254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDV95-0002ju-DK
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 11:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDV1L-00012p-Cq
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 11:49:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDV1J-0005TM-KS
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 11:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599061796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wLbELblpV5S2N7qQ1QcNRijkVAuwaCSCO3+z9cGFr0M=;
 b=igLvzRtT1XawxFKECFQUZ+w54o9w47giYBwl0csodnRyUXbqMCFFnRN1FeGjxitKL7Z5Do
 6rub5D3iHZW5GEIl2aosz3XGd1RyEKHiUNHRCgUk0pvSdruqFS400QvrD0folhlwaDnrRF
 9F6+JK58Pj7zlhZeWU0LolKMJJWOC90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-WAX7e0yBOMCc2sTdMb3sXQ-1; Wed, 02 Sep 2020 11:49:54 -0400
X-MC-Unique: WAX7e0yBOMCc2sTdMb3sXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F41218015FA;
 Wed,  2 Sep 2020 15:49:53 +0000 (UTC)
Received: from thuth.com (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 294225D9CC;
 Wed,  2 Sep 2020 15:49:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 11/15] tests/qtest/ipmi-kcs: Fix assert side-effect
Date: Wed,  2 Sep 2020 17:49:28 +0200
Message-Id: <20200902154932.390595-12-thuth@redhat.com>
In-Reply-To: <20200902154932.390595-1-thuth@redhat.com>
References: <20200902154932.390595-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 01:13:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fix assert side-effect reported by Coverity:

  /qemu/tests/qtest/ipmi-kcs-test.c: 84 in kcs_wait_obf()
  83         while (IPMI_KCS_CMDREG_GET_OBF() == 0) {
  >>>     CID 1432368:  Incorrect expression  (ASSERT_SIDE_EFFECT)
  >>>     Argument "--count" of g_assert() has a side effect.  The containing function might work differently in a non-debug build.
  84             g_assert(--count != 0);

Reported-by: Coverity (CID 1432368)
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200902080801.160652-2-philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/ipmi-kcs-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/ipmi-kcs-test.c b/tests/qtest/ipmi-kcs-test.c
index 693a6aacb5..fc0a918c8d 100644
--- a/tests/qtest/ipmi-kcs-test.c
+++ b/tests/qtest/ipmi-kcs-test.c
@@ -81,7 +81,8 @@ static void kcs_wait_obf(void)
 {
     unsigned int count = 1000;
     while (IPMI_KCS_CMDREG_GET_OBF() == 0) {
-        g_assert(--count != 0);
+        --count;
+        g_assert(count != 0);
     }
 }
 
-- 
2.18.2


