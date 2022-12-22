Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5250C653DEB
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 11:04:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8IQX-0004SP-5U; Thu, 22 Dec 2022 05:03:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8IQS-0004O2-W0
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:03:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8IQR-0007Zk-Hi
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:03:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671703422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YAO4peMhkDZkQG1gK3DSNk1I7034SMQCpeRmycglLHg=;
 b=WK8oaLJYHXg1hc8Jcnv+SfhYyotgVQ+w8c0jrsZMB65jdGjNVaROul9/+2uaNl6vHKJimg
 62vIx2fKIocK7KUgWw5LvKgJfDLpSUxxa5LEm4QQc2D9nnXMeBraDQGgclXctFaC2Xg059
 yDIWxtFwJCgNKmasq5K8biiGQRXd2Kg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-AnNrWTcVM12LJZ71dnzlDA-1; Thu, 22 Dec 2022 05:03:39 -0500
X-MC-Unique: AnNrWTcVM12LJZ71dnzlDA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDF921C0CE6D;
 Thu, 22 Dec 2022 10:03:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2194492B02;
 Thu, 22 Dec 2022 10:03:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2311921E6881; Thu, 22 Dec 2022 11:03:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, jonathan.cameron@huawei.com,
 philmd@linaro.org
Subject: [PATCH v2 7/7] include/hw/cxl: Break inclusion loop cxl_pci.h and
 cxl_cdat_h
Date: Thu, 22 Dec 2022 11:03:30 +0100
Message-Id: <20221222100330.380143-8-armbru@redhat.com>
In-Reply-To: <20221222100330.380143-1-armbru@redhat.com>
References: <20221222100330.380143-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

hw/cxl/cxl_pci.h and hw/cxl/cxl_cdat.h include each other.  The former
doesn't actually need the latter, so drop that inclusion to break the
loop.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/cxl/cxl_pci.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
index aca14845ab..01e15ed5b4 100644
--- a/include/hw/cxl/cxl_pci.h
+++ b/include/hw/cxl/cxl_pci.h
@@ -11,7 +11,6 @@
 #define CXL_PCI_H
 
 #include "qemu/compiler.h"
-#include "hw/cxl/cxl_cdat.h"
 
 #define CXL_VENDOR_ID 0x1e98
 
-- 
2.38.1


