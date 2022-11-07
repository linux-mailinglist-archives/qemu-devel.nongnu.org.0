Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B91761F0E4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 11:37:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orzUs-0006zv-7M; Mon, 07 Nov 2022 05:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1orzTv-0006vt-5d
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 05:36:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1orzTo-0002By-Ue
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 05:35:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667817347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SwFtzWCIuTp4d0VfFxyWaEal4gwo53+nlY0mrufu+uQ=;
 b=iiXsm9UVrPSa31cFjCTi2qhIllgD3ZQ3ok9GefSZJ5APg1Vh5Ps2ygV2xmkGlOn9Emz6Vz
 /DOgvC4WQKWSVY9X0zNVgOUQqO2W+VrfqrXTQcnRkHDIKoUiX2vaMrpEnui2qacIVWLbXN
 LaY8i2LfTBHbenMyFicdHSRQEfnxspU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-QvEf5-TUPMSriKsDFqhOSg-1; Mon, 07 Nov 2022 05:35:44 -0500
X-MC-Unique: QvEf5-TUPMSriKsDFqhOSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D783985A583;
 Mon,  7 Nov 2022 10:35:43 +0000 (UTC)
Received: from f36-work.redhat.com (unknown [10.39.194.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D9AA4221F;
 Mon,  7 Nov 2022 10:35:42 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, bin.meng@windriver.com, mcascell@redhat.com,
 XRivenDell@outlook.com, coc.cyqh@gmail.com, ningqiang1@huawei.com
Subject: [PATCH] hw/sd/sdhci: reset data count in
 sdhci_buff_access_is_sequential()
Date: Mon,  7 Nov 2022 11:35:10 +0100
Message-Id: <20221107103510.34588-1-mcascell@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
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

Make sure to reset data_count if it's equal to (or exceeds) block_size.
This prevents an off-by-one read / write when accessing s->fifo_buffer
in sdhci_read_dataport / sdhci_write_dataport, both called right after
sdhci_buff_access_is_sequential.

Fixes: CVE-2022-3872
Reported-by: RivenDell <XRivenDell@outlook.com>
Reported-by: Siqi Chen <coc.cyqh@gmail.com>
Reported-by: ningqiang <ningqiang1@huawei.com>
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
---
 hw/sd/sdhci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 306070c872..aa2fd79df2 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -978,6 +978,10 @@ static bool sdhci_can_issue_command(SDHCIState *s)
 static inline bool
 sdhci_buff_access_is_sequential(SDHCIState *s, unsigned byte_num)
 {
+    if (s->data_count >= (s->blksize & BLOCK_SIZE_MASK)) {
+        s->data_count = 0;
+    }
+
     if ((s->data_count & 0x3) != byte_num) {
         trace_sdhci_error("Non-sequential access to Buffer Data Port register"
                           "is prohibited\n");
-- 
2.38.1


