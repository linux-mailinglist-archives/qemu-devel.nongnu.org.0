Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F07D6C0D89
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 10:40:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peByq-0001Uw-Hs; Mon, 20 Mar 2023 05:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1peByj-0001So-8g
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 05:38:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1peByh-0003RZ-Nu
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 05:38:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679305134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=er6HxXaSUpLlPAYMXhQkWRGD4PHEZ80o0XL/Qk7g+Jc=;
 b=Y1loBAAwtxM+SwOhzHz9n9TebXfab4OiIFhLw9gxz/w55p3toz2Xs7Fy2sQWbme/vWlmR5
 vxdhotRZYVd9h5d6SUbN0FnjRMdeel6i434gTZKcIf+y+tjC49rcQgbKU0/U3nYnZc9Tm1
 RbFc404Ax4fEhjTf8nUj+IHxtTbtotg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-TCcMTRpQNbaV-0F_iOd1Fg-1; Mon, 20 Mar 2023 05:38:51 -0400
X-MC-Unique: TCcMTRpQNbaV-0F_iOd1Fg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0878996DC83;
 Mon, 20 Mar 2023 09:38:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5FF040C6E67;
 Mon, 20 Mar 2023 09:38:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C57AE18000AA; Mon, 20 Mar 2023 10:38:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 2/6] bios-tables-test: use 128M numa nodes on aarch64
Date: Mon, 20 Mar 2023 10:38:43 +0100
Message-Id: <20230320093847.539751-3-kraxel@redhat.com>
In-Reply-To: <20230320093847.539751-1-kraxel@redhat.com>
References: <20230320093847.539751-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

Recent edk2 versions don't boot with very small numa nodes.
Bump the size from 64M to 128M.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/qtest/bios-tables-test.c         |   6 +++---
 tests/data/acpi/virt/SRAT.acpihmatvirt | Bin 240 -> 240 bytes
 tests/data/acpi/virt/SSDT.memhp        | Bin 1817 -> 1817 bytes
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 76d510091177..873358943784 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1679,9 +1679,9 @@ static void test_acpi_virt_tcg_acpi_hmat(void)
     test_acpi_one(" -machine hmat=on"
                   " -cpu cortex-a57"
                   " -smp 4,sockets=2"
-                  " -m 256M"
-                  " -object memory-backend-ram,size=64M,id=ram0"
-                  " -object memory-backend-ram,size=64M,id=ram1"
+                  " -m 384M"
+                  " -object memory-backend-ram,size=128M,id=ram0"
+                  " -object memory-backend-ram,size=128M,id=ram1"
                   " -object memory-backend-ram,size=128M,id=ram2"
                   " -numa node,nodeid=0,memdev=ram0"
                   " -numa node,nodeid=1,memdev=ram1"
diff --git a/tests/data/acpi/virt/SRAT.acpihmatvirt b/tests/data/acpi/virt/SRAT.acpihmatvirt
index 691ef56e34bc84509270db316d908f5979c209bb..6fe55dd7d07fef0f8fe16a209e96a89dd48ca240 100644
GIT binary patch
delta 67
zcmeys_<@ltILI;N0|NsC^R$Uvjf@-<d*mlxmepX?U;>JPK>(EIfYJ<%Fb0qY0P4I6
AJ^%m!

delta 59
zcmeys_<@ltILI;N0|NsC^Qwtljf^Z4d*l^dfLst@flv$#j4%d}X4GJsxL6ecZ+{66

diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.memhp
index 2fcfc5fda955dc4ba78a5f4116eed99ec7202fbd..ef93c44464f1fe38f7e5babd5d67f345cc6363a6 100644
GIT binary patch
delta 22
dcmbQqH<OPmIM^jblAVEpap^`bUUsI7&Hz1t1wsG-

delta 22
dcmbQqH<OPmIM^jblAVEpv2i08FFVs$X8=5?1wsG-

-- 
2.39.2


