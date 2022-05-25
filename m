Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A28533A41
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 11:50:57 +0200 (CEST)
Received: from localhost ([::1]:48896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntnfM-0001ZV-DK
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 05:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntnL7-000591-Ms
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:30:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntnL6-0007DH-0W
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:30:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653470999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P51fDGloyqVtEqkvZpadDAQW/ortHnvlYS2RquGPI6M=;
 b=hKieAa3PlNnoUp2+/V6aXbGcaP4rHafDSjIVf3I6Iv3xQPy+R/GXNjQfSObMr5JeZ3CvjQ
 zMeSezCnQDfWfjYNa/zUArDopQFeUhIHbn4lkE0btxWeT8+2QUEj36BWJGh9gILpODxK/Q
 ZMws+dwcEWwRe6Td1KAhX28rSHhUJ0s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-xypsux7vNuOLpSIfx8vo-g-1; Wed, 25 May 2022 05:29:48 -0400
X-MC-Unique: xypsux7vNuOLpSIfx8vo-g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC4A8101AA45;
 Wed, 25 May 2022 09:29:47 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.195.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2472112131E;
 Wed, 25 May 2022 09:29:46 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL v2 4/4] qga-win32: Add support for NVME bus type
Date: Wed, 25 May 2022 12:29:38 +0300
Message-Id: <20220525092938.945611-5-kkostiuk@redhat.com>
In-Reply-To: <20220525092938.945611-1-kkostiuk@redhat.com>
References: <20220525092938.945611-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
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

Bus type spaces (Indicates a storage spaces bus) is not
supported, so return it as unknown.

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220524154344.869638-2-kkostiuk@redhat.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/commands-win32.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index dcdeb76a68..36f94c0f9c 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -490,6 +490,11 @@ static GuestDiskBusType win2qemu[] = {
 #if (_WIN32_WINNT >= 0x0601)
     [BusTypeVirtual] = GUEST_DISK_BUS_TYPE_VIRTUAL,
     [BusTypeFileBackedVirtual] = GUEST_DISK_BUS_TYPE_FILE_BACKED_VIRTUAL,
+    /*
+     * BusTypeSpaces currently is not suported
+     */
+    [BusTypeSpaces] = GUEST_DISK_BUS_TYPE_UNKNOWN,
+    [BusTypeNvme] = GUEST_DISK_BUS_TYPE_NVME,
 #endif
 };
 
-- 
2.25.1


