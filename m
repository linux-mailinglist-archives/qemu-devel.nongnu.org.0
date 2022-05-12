Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF27525183
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:46:33 +0200 (CEST)
Received: from localhost ([::1]:41992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npB1M-0006qp-OG
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npApc-0006Ak-Rz
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:34:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npApb-0003RW-4t
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:34:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652369661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8o+ph8BTyXCS9KvKvIQa4Ljx49+bdnjo25PLmYJa1MY=;
 b=NziVAq0tYddOn63yvsMqBOudPygRwsgGi3V+Dl+Egao3CjiJwylVSgPecPpMwovpzZwa8C
 a89pp7w0VL0Q09EvM4GCkYsKCChJlZ5l/qhBCM6WxgYpD6ahU0W9ZAv5EQW84eb21ru/hn
 SyI62ZVOWwa+n8SuTQRdI3xtOOguE/Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-V156yKbEN8-qTedH0XdpXA-1; Thu, 12 May 2022 11:34:18 -0400
X-MC-Unique: V156yKbEN8-qTedH0XdpXA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D330185A79C;
 Thu, 12 May 2022 15:34:18 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97EF1416156;
 Thu, 12 May 2022 15:34:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 06/10] hw/block/fdc: Prevent end-of-track overrun
 (CVE-2021-3507)
Date: Thu, 12 May 2022 17:33:57 +0200
Message-Id: <20220512153401.202863-7-kwolf@redhat.com>
In-Reply-To: <20220512153401.202863-1-kwolf@redhat.com>
References: <20220512153401.202863-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Per the 82078 datasheet, if the end-of-track (EOT byte in
the FIFO) is more than the number of sectors per side, the
command is terminated unsuccessfully:

* 5.2.5 DATA TRANSFER TERMINATION

  The 82078 supports terminal count explicitly through
  the TC pin and implicitly through the underrun/over-
  run and end-of-track (EOT) functions. For full sector
  transfers, the EOT parameter can define the last
  sector to be transferred in a single or multisector
  transfer. If the last sector to be transferred is a par-
  tial sector, the host can stop transferring the data in
  mid-sector, and the 82078 will continue to complete
  the sector as if a hardware TC was received. The
  only difference between these implicit functions and
  TC is that they return "abnormal termination" result
  status. Such status indications can be ignored if they
  were expected.

* 6.1.3 READ TRACK

  This command terminates when the EOT specified
  number of sectors have been read. If the 82078
  does not find an I D Address Mark on the diskette
  after the second· occurrence of a pulse on the
  INDX# pin, then it sets the IC code in Status Regis-
  ter 0 to "01" (Abnormal termination), sets the MA bit
  in Status Register 1 to "1", and terminates the com-
  mand.

* 6.1.6 VERIFY

  Refer to Table 6-6 and Table 6-7 for information
  concerning the values of MT and EC versus SC and
  EOT value.

* Table 6·6. Result Phase Table

* Table 6-7. Verify Command Result Phase Table

Fix by aborting the transfer when EOT > # Sectors Per Side.

Cc: qemu-stable@nongnu.org
Cc: Hervé Poussineau <hpoussin@reactos.org>
Fixes: baca51faff0 ("floppy driver: disk geometry auto detect")
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/339
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211118115733.4038610-2-philmd@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/fdc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 347875a0cd..57bb355794 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -1530,6 +1530,14 @@ static void fdctrl_start_transfer(FDCtrl *fdctrl, int direction)
         int tmp;
         fdctrl->data_len = 128 << (fdctrl->fifo[5] > 7 ? 7 : fdctrl->fifo[5]);
         tmp = (fdctrl->fifo[6] - ks + 1);
+        if (tmp < 0) {
+            FLOPPY_DPRINTF("invalid EOT: %d\n", tmp);
+            fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, FD_SR1_MA, 0x00);
+            fdctrl->fifo[3] = kt;
+            fdctrl->fifo[4] = kh;
+            fdctrl->fifo[5] = ks;
+            return;
+        }
         if (fdctrl->fifo[0] & 0x80)
             tmp += fdctrl->fifo[6];
         fdctrl->data_len *= tmp;
-- 
2.35.3


