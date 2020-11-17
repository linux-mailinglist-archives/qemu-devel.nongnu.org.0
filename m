Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2BB2B5C94
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 11:06:55 +0100 (CET)
Received: from localhost ([::1]:34480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kext0-0005F7-SW
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 05:06:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexka-0003o6-SN
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexkZ-0003ZK-3e
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605607090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iiiN84M9qNCYrV6ZuA1ioDrQ3xK431Fv7dDz215n99c=;
 b=Rgws4wz4OmEu39IlZi5YcftGZXbzyAENmivLHHVyFuTTjNyBTeA6Y/rKiu1mFhmTx+c4sb
 S4Q4hkPFEsrar3ckCBejRVUcTXrWK6Z2X+/avGQcMfSLBB69IxJ6YsOS04QWwqzOiDVxqZ
 EL0b2yRnVJGEmZe0loENyuQwwvQy02M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-jxdUpk40OlC-TOh5TuwwTg-1; Tue, 17 Nov 2020 04:58:06 -0500
X-MC-Unique: jxdUpk40OlC-TOh5TuwwTg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B28D188C12C;
 Tue, 17 Nov 2020 09:58:05 +0000 (UTC)
Received: from thuth.com (ovpn-113-138.ams2.redhat.com [10.36.113.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81AA95B4B6;
 Tue, 17 Nov 2020 09:58:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/12] ads7846: put it into the 'input' category
Date: Tue, 17 Nov 2020 10:57:46 +0100
Message-Id: <20201117095748.122371-11-thuth@redhat.com>
In-Reply-To: <20201117095748.122371-1-thuth@redhat.com>
References: <20201117095748.122371-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
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

From: Gan Qixin <ganqixin@huawei.com>

The category of the ads7846 device is not set, put it into the 'input'
category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201112125824.763182-3-ganqixin@huawei.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/display/ads7846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/display/ads7846.c b/hw/display/ads7846.c
index 023165b2a3..cb3a431cfd 100644
--- a/hw/display/ads7846.c
+++ b/hw/display/ads7846.c
@@ -163,10 +163,12 @@ static void ads7846_realize(SSISlave *d, Error **errp)
 
 static void ads7846_class_init(ObjectClass *klass, void *data)
 {
+    DeviceClass *dc = DEVICE_CLASS(klass);
     SSISlaveClass *k = SSI_SLAVE_CLASS(klass);
 
     k->realize = ads7846_realize;
     k->transfer = ads7846_transfer;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
 static const TypeInfo ads7846_info = {
-- 
2.18.4


