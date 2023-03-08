Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DA46B129E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 21:05:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa01f-00012T-Qt; Wed, 08 Mar 2023 15:04:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pa01Z-00011a-Lx
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:04:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pa01X-0006xn-Iy
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:04:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678305870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7VdawxskoZ4vJELFk7KkOnzsqTS1Pl8mUwZ2u9LYOB8=;
 b=Ff9yvjjdCHecw99yedYMHtDmPwWYD9JU5Ke2Lq2e4TtLqUPA1cYkPi8HNHi1oRTyu4Rps7
 /VN2sJgFh7nV2MCmXM3tudLWJdmNcDNyMRtFDBN4Qa7c0aJmOdU2KGW3aGdoPNj4aRhH58
 ILMcbIJxIN68UBMymvz1YWc932M5no0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-QqPvE2rLOYuuILuSJOypcA-1; Wed, 08 Mar 2023 15:04:27 -0500
X-MC-Unique: QqPvE2rLOYuuILuSJOypcA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E7C21C27D8E;
 Wed,  8 Mar 2023 20:04:27 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.45.224.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FB672026D4B;
 Wed,  8 Mar 2023 20:04:26 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 3/5] qga/win/installer: add VssOption to installer
Date: Wed,  8 Mar 2023 22:04:17 +0200
Message-Id: <20230308200419.453688-4-kkostiuk@redhat.com>
In-Reply-To: <20230308200419.453688-1-kkostiuk@redhat.com>
References: <20230308200419.453688-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
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

From: Kfir Manor <kfir@daynix.com>

Adds registry value VssOption with value 1 to QEMU Guest Agent VSS Provider service registry key

Signed-off-by: Kfir Manor <kfir@daynix.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/installer/qemu-ga.wxs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index 46ae9e7a13..df572adb4a 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -122,6 +122,10 @@
               <RegistryValue Type="integer" Name="TypesSupported" Value="7" />
               <RegistryValue Type="string" Name="EventMessageFile" Value="[qemu_ga_directory]qemu-ga.exe" />
             </RegistryKey>
+            <RegistryKey Root="HKLM"
+                         Key="System\CurrentControlSet\Services\QEMU Guest Agent VSS Provider">
+              <RegistryValue Type="integer" Name="VssOption" Value="1" />
+            </RegistryKey>
           </Component>
         </Directory>
       </Directory>
-- 
2.25.1


