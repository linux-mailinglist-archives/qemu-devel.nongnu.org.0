Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED78316469
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 11:57:03 +0100 (CET)
Received: from localhost ([::1]:41894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9nB8-0006w1-MY
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 05:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9nA4-0006Ts-B8
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 05:55:56 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:47578 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9nA1-00059X-HU
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 05:55:55 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 211AD4127A;
 Wed, 10 Feb 2021 10:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1612954547; x=
 1614768948; bh=uUf5lxo6U5kD5S7uSInma0aKFrqzAqo1ojskcGwHWIE=; b=j
 UsGBMtdiPWy5gtQxNwuGeiuh5k/pYPtxy7RYHnPr8HEzqM5bFTvnhopV7p4UNKWM
 i4NATnStDGisoS7mTmVRfPGy2CxqEj/EPvKrMUkq8rEWFAIDn1QKNiAozFbZ0ldE
 5OCjvO+DFWssvICzwoWT/brchqlDeAMIUEZG5IhMSQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V2qyCb5UnbRP; Wed, 10 Feb 2021 13:55:47 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id B819E411F8;
 Wed, 10 Feb 2021 13:55:47 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 10
 Feb 2021 13:55:47 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] util/osdep: Avoid mprotect() RWX->NONE on Big Sur 11.2
Date: Wed, 10 Feb 2021 13:55:27 +0300
Message-ID: <20210210105527.74943-1-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's a change in mprotect() behaviour [1] in the latest macOS on M1
and it's not yet clear if it's going to be fixed by Apple. For now we
can avoid unsupported mprotect() calls. QEMU and qtests work fine
without it.

1. https://gist.github.com/hikalium/75ae822466ee4da13cbbe486498a191f

Buglink: https://bugs.launchpad.net/qemu/+bug/1914849
Apple-Feedback: FB8994773
Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 util/osdep.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/util/osdep.c b/util/osdep.c
index 66d01b9160..1edd7b1caf 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -111,6 +111,12 @@ int qemu_mprotect_none(void *addr, size_t size)
 #ifdef _WIN32
     return qemu_mprotect__osdep(addr, size, PAGE_NOACCESS);
 #else
+# if defined(__APPLE__) && defined(__arm64__)
+    if (__builtin_available(macOS 11.2, *)) {
+        /* mprotect() in macOS 11.2 can't switch RWX to NONE */
+        return 0;
+    }
+# endif
     return qemu_mprotect__osdep(addr, size, PROT_NONE);
 #endif
 }
-- 
2.30.0


