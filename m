Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0352D0C98
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 10:05:50 +0100 (CET)
Received: from localhost ([::1]:53976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmCSq-0003bX-Ql
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 04:05:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kmCRX-00037x-IM
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 04:04:28 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:51348 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kmCRU-0001a3-4C
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 04:04:27 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 9BB6541325;
 Mon,  7 Dec 2020 09:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1607331860; x=
 1609146261; bh=VzXiQdgsK15H6qEna+2MFYrw5lI1rzQN+hkIPLD8gbk=; b=S
 hqIBE06sbzja9V7qNQuGlFR6vlQxhR/c8oK6TEpFBwoEIrcbmVD7IXznd2sFzID6
 wLXxPISk8jpD4GJEXoi+a8q/pFRJ/EvZXwTDrXPQuMskYE6/PqnQyLayj26/p9Tu
 1M1uAnTqAiD2eBjlWlDUh+fo7RhNn77JX438F/rZfA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nX5gvo-ekv3H; Mon,  7 Dec 2020 12:04:20 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1FB5341318;
 Mon,  7 Dec 2020 12:04:19 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 7 Dec
 2020 12:04:19 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH for-6.0] accel: Wire accel to /machine
Date: Mon, 7 Dec 2020 11:46:22 +0300
Message-ID: <20201207084621.23876-1-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.29.2
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no generic way to query current accel and its properties via QOM
because there's no link between an accel and current machine.

The change adds the link, i.e. if HVF is enabled the following will be
available in QOM:

  (qemu) qom-get /machine/accel type
  "hvf-accel"

Suggested-by: Markus Armbruster <armbru@redhat.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---

Hi,

this is a follow up patch that deprecates earlier series [1].

An outstanding issue is whether management applications can rely on the
value of /machine/accel/type and output of qom-list-types command [2][3]
to get current and present accels?

i.e. would it be ok if libvirt assumes that everything up to the first
dash in the accel type is the name of the accel (as specified via -M
accel=ACCEL flag) when it performs QEMU probing?

Also, Eduardo and Claudio earlier had ideas to provide cpu-specific
accel subclasses [4][5].

1. https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg03944.html
2. https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg04212.html
3. https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg07062.html
4. https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg06513.html
5. https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg06741.html

Thanks,
Roman

 accel/accel.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/accel/accel.c b/accel/accel.c
index cb555e3b06..45c5bf87b1 100644
--- a/accel/accel.c
+++ b/accel/accel.c
@@ -56,10 +56,11 @@ int accel_init_machine(AccelState *accel, MachineState *ms)
     if (ret < 0) {
         ms->accelerator = NULL;
         *(acc->allowed) = false;
-        object_unref(OBJECT(accel));
     } else {
         object_set_accelerator_compat_props(acc->compat_props);
+        object_property_add_child(OBJECT(ms), "accel", OBJECT(accel));
     }
+    object_unref(OBJECT(accel));
     return ret;
 }
 
-- 
2.29.2


