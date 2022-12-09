Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CE96484C1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 16:13:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3f29-0002kI-Aa; Fri, 09 Dec 2022 10:11:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3f27-0002jr-7D
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:11:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3f25-0004lU-Na
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:11:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670598683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GcyRxaXRPgMt9VEi0pUUYUkPvjh9rEiKkaviONxTRA0=;
 b=Pag1oepJ4NmbVpovCFXBFMF5iBKh3XK9iTfI12IAicJj9NfHEVb2ZbXcn+LtDeP4DkJj/S
 GJiKTBaBCcnosrm9vFqW7cW9eR7tZKfso4Dz0LnI/FExXOuuPUIko0YFmJ7NyrX3VjHjJ1
 qznGjgAP4c5H9mH325IGYOWw3cTpdGc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-J7RHJUdjNzaqHUNTeOyipA-1; Fri, 09 Dec 2022 10:11:18 -0500
X-MC-Unique: J7RHJUdjNzaqHUNTeOyipA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09B152A59568;
 Fri,  9 Dec 2022 15:11:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 907532024CC1;
 Fri,  9 Dec 2022 15:11:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 61D1521E6921; Fri,  9 Dec 2022 16:11:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,  marcel.apfelbaum@gmail.com,  ben.widawsky@intel.com,
 jonathan.cameron@huawei.com,  philmd@linaro.org
Subject: [PATCH 6/5] include/hw/cxl: Break inclusion loop
References: <20221209134802.3642942-1-armbru@redhat.com>
Date: Fri, 09 Dec 2022 16:11:14 +0100
In-Reply-To: <20221209134802.3642942-1-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 9 Dec 2022 14:47:57 +0100")
Message-ID: <875yekehnx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

hw/cxl/cxl_pci.h and hw/cxl/cxl_cdat.h include each other.  Neither
header actually needs the other one.  Drop both #include directives.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/cxl/cxl_cdat.h | 1 -
 include/hw/cxl/cxl_pci.h  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/include/hw/cxl/cxl_cdat.h b/include/hw/cxl/cxl_cdat.h
index 7f67638685..e3fd737f9d 100644
--- a/include/hw/cxl/cxl_cdat.h
+++ b/include/hw/cxl/cxl_cdat.h
@@ -10,7 +10,6 @@
 #ifndef CXL_CDAT_H
 #define CXL_CDAT_H
 
-#include "hw/cxl/cxl_pci.h"
 #include "hw/pci/pcie_doe.h"
 
 /*
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
2.37.3


