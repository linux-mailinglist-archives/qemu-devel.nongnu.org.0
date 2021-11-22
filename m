Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47161458EBE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 13:53:35 +0100 (CET)
Received: from localhost ([::1]:56766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp8pC-0000we-DX
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 07:53:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mp8eO-0005eB-8a
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:42:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mp8eM-0000SW-Ec
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:42:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637584941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GO6Cf+oYPuEAdZYlyCQcLQGlYrS0+VewS+fPf2+wz+I=;
 b=CSWm5HyHJyw1q7IfFn6BnTPWUJ22rHuNipAUZtyh/Mo9stAEQEEDZGvb/UKYVCaPLTkpYi
 7Qe4vTZr6OUneLJa7/JzsdjNDi6MVIxKyR3bwG2RG7eq2L+s0+R3Was2rqkAkPExOCA7bH
 xBGu3TbpOGt/czKCxUK8sWOcwtOn6gs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-DSIAELzkM5umyDzpA_UaMA-1; Mon, 22 Nov 2021 07:42:18 -0500
X-MC-Unique: DSIAELzkM5umyDzpA_UaMA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 314B48066EC;
 Mon, 22 Nov 2021 12:42:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE111ADCD;
 Mon, 22 Nov 2021 12:42:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A04AD1800939; Mon, 22 Nov 2021 13:40:15 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/8] microvm: check g_file_set_contents() return value
Date: Mon, 22 Nov 2021 13:40:15 +0100
Message-Id: <20211122124015.909318-9-kraxel@redhat.com>
In-Reply-To: <20211122124015.909318-1-kraxel@redhat.com>
References: <20211122124015.909318-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Message-Id: <20211108130718.840216-3-kraxel@redhat.com>
---
 hw/i386/microvm-dt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index a6a59a6e12cd..9c3c4995b41d 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -336,7 +336,10 @@ void dt_setup_microvm(MicrovmMachineState *mms)
 
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
2.33.1


