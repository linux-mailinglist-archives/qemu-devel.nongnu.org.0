Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EDF448013
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 14:11:07 +0100 (CET)
Received: from localhost ([::1]:47376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk4QU-0007N0-Vd
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 08:11:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mk4N7-00039s-Sq
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 08:07:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mk4N4-0006OV-T2
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 08:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636376854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xbjzdTc+wpcrc9npey7akvdS72EUVW2ck0PNaT5/v6w=;
 b=DLTF/P/dAMfSKVj6L3sFSsnlAatWKrDOpT8vDtI3GzaKnQc7Anl4lpJfBsxLTpl0NBdMig
 oQpR/q92XS87UKhrQhFKVW2vEuVYSQftIF97eEejfevDhRk1U6D2Wts2byP1pc4pntcz2v
 auee7PfE0KPVsfRQp+4HMI4aA2tmC1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-VwXlIMckNNOIJizKkf6zxw-1; Mon, 08 Nov 2021 08:07:31 -0500
X-MC-Unique: VwXlIMckNNOIJizKkf6zxw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D0EC802C98;
 Mon,  8 Nov 2021 13:07:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 092DE19C79;
 Mon,  8 Nov 2021 13:07:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BD5DC1805C80; Mon,  8 Nov 2021 14:07:18 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] microvm: check g_file_set_contents() return value
Date: Mon,  8 Nov 2021 14:07:18 +0100
Message-Id: <20211108130718.840216-3-kraxel@redhat.com>
In-Reply-To: <20211108130718.840216-1-kraxel@redhat.com>
References: <20211108130718.840216-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: CID 1465239
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/microvm-dt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index ad4e48e5fe60..774e0bc7fef3 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -334,7 +334,10 @@ void dt_setup_microvm(MicrovmMachineState *mms)
 
     if (debug) {
         fprintf(stderr, "%s: writing microvm.fdt\n", __func__);
-        g_file_set_contents("microvm.fdt", mms->fdt, size, NULL);
+        if (!g_file_set_contents("microvm.fdt", mms->fdt, size, NULL)) {
+            fprintf(stderr, "%s: writing microvm.fdt failed\n", __func__);
+            return;
+        }
         int ret = system("dtc -I dtb -O dts microvm.fdt");
         if (ret != 0) {
             fprintf(stderr, "%s: oops, dtc not installed?\n", __func__);
-- 
2.31.1


