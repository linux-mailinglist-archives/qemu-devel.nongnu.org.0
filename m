Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF4665459E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 18:31:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8PNx-00035g-GG; Thu, 22 Dec 2022 12:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1p8PNv-00035X-LH
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 12:29:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1p8PNt-0005qb-Ro
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 12:29:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671730172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Fm/C/qySg1soD452064uMlJCmJgRKi9L3OJjCG0b/fQ=;
 b=E9fjdJLsYeWYvQXQ9wrc3XGcHFMFhKsEuza5Q49TcR/An0fsQGj5/2Cgnd3vWwbqj31sJm
 +n/QCkVdD1W+FKhdnvD+VEglRjmQrYEn/jsSanwk5KVuCQB4jajvvjHVPfaMY9BjeIq281
 Zb+1u8BXmtGzZzffvIbO9t2On+qRVHM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-SYIuijz6PlKZXnhxCMKI5g-1; Thu, 22 Dec 2022 12:29:29 -0500
X-MC-Unique: SYIuijz6PlKZXnhxCMKI5g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9485780D0E6;
 Thu, 22 Dec 2022 17:29:28 +0000 (UTC)
Received: from f36-work.redhat.com (unknown [10.39.192.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3A64492B00;
 Thu, 22 Dec 2022 17:29:27 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	mcascell@redhat.com
Subject: [PATCH] nubus-device: fix memory leak in nubus_device_realize
Date: Thu, 22 Dec 2022 18:29:15 +0100
Message-Id: <20221222172915.671597-1-mcascell@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
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

Local variable "name" is allocated through strdup_printf and should be
freed with g_free() to avoid memory leak.

Fixes: 3616f424 ("nubus-device: add romfile property for loading declaration ROMs")
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
---
 hw/nubus/nubus-device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index 0f1852f671..49008e4938 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -80,6 +80,7 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
                                &error_abort);
         ret = load_image_mr(path, &nd->decl_rom);
         g_free(path);
+        g_free(name);
         if (ret < 0) {
             error_setg(errp, "could not load romfile \"%s\"", nd->romfile);
             return;
-- 
2.38.1


