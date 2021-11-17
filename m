Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014CB455123
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 00:28:49 +0100 (CET)
Received: from localhost ([::1]:35764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnUMB-0008K7-SB
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 18:28:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnUIK-0004LL-Gk
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 18:24:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnUI5-0002Rj-Ta
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 18:24:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637191473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6bR7W7pApBvDZKc22ceTHQaPDWCmswmmkM55lsqJEG0=;
 b=gSBMCtDOJKxD5zkWca+1pbIb/Wd2Ck5/E8aYoZnP13ngmJ1AJivjLlTaZDLFhW/i1+yq/z
 LjfCWGusUWXQUYBTsHQqOfDSsrUN8hSV/9ARTN8eZ1LXK9iz9GpfWAvzSXBQ7CejX6ldb5
 3R8knC1NuF27c7F/VhRetM1o/LBG9AU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-DUlM9fNgOjGtyg4-aMNEJg-1; Wed, 17 Nov 2021 18:24:30 -0500
X-MC-Unique: DUlM9fNgOjGtyg4-aMNEJg-1
Received: by mail-wm1-f72.google.com with SMTP id
 v10-20020a1cf70a000000b00318203a6bd1so2096137wmh.6
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 15:24:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6bR7W7pApBvDZKc22ceTHQaPDWCmswmmkM55lsqJEG0=;
 b=eBkz9X1fiXeANEDZeWhqWyt6aSZXSN/63VHXYgDiCzDk7XOPvwtZ+7f6OHeh/36IeP
 ugkxPQP1DxNTJaE1BEanvyzWQJldw6MXyn9WDxnGNX2YyG1jjAvr3t86fhrrGV8NRxq1
 A9gik/Bu1X4reW+Y5//YoVSeIiOGvRRCbUEobyEHCGQrILnhR3eLh2CPQIMzQl0AHHln
 vKmJs6uOuOpadGr0NorGL4KPtV2kOPzJmeesKX2b84gnRf+c4Y4cbj4MAEOt4l6DHIvA
 aERIjjvHL/iYnotQRvOnC6zACoHfgRK7A7VdO9PjMTWnu5LUpGaTMPIqDRv1ax5ZMEGS
 4xVA==
X-Gm-Message-State: AOAM532SZKSMD804ANb4ctdkJqAmerHM3yK/27DXj05gio5ydh/OFmnq
 Z0ATJbWlI7/VnZL7cCBCBCNgeufFNgyG1SILqjaKY/qtp4eeDZPNfux25HPiwb26eg6oJQ4Dv11
 nc9d/nmchNW4ZyD616rqMvJjSJd+exe2zWgpr92mz8p0qNHr2nC0W6EDq4oo23Jtl
X-Received: by 2002:adf:cd04:: with SMTP id w4mr24522506wrm.406.1637191469043; 
 Wed, 17 Nov 2021 15:24:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGxtaX0G+egFTZet/iUx41TG3FEKtOefK0jxFu1kZ72hhvLUj/7u9sSkax6mmviUIVLb0rBg==
X-Received: by 2002:adf:cd04:: with SMTP id w4mr24522464wrm.406.1637191468803; 
 Wed, 17 Nov 2021 15:24:28 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 k8sm1153363wrn.91.2021.11.17.15.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 15:24:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v2 1/2] hw/block/fdc: Kludge missing floppy drive to
 fix CVE-2021-20196
Date: Thu, 18 Nov 2021 00:24:21 +0100
Message-Id: <20211117232422.1026411-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211117232422.1026411-1-philmd@redhat.com>
References: <20211117232422.1026411-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gaoning Pan <pgn@zju.edu.cn>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Guest might select another drive on the bus by setting the
DRIVE_SEL bit of the DIGITAL OUTPUT REGISTER (DOR).
The current controller model doesn't expect a BlockBackend
to be NULL. A simple way to fix CVE-2021-20196 is to create
an empty BlockBackend when it is missing. All further
accesses will be safely handled, and the controller state
machines keep behaving correctly.

Fixes: CVE-2021-20196
Reported-by: Gaoning Pan (Ant Security Light-Year Lab) <pgn@zju.edu.cn>
BugLink: https://bugs.launchpad.net/qemu/+bug/1912780
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/338
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/fdc.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index fa933cd3263..eab17e946d6 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -1161,7 +1161,19 @@ static FDrive *get_drv(FDCtrl *fdctrl, int unit)
 
 static FDrive *get_cur_drv(FDCtrl *fdctrl)
 {
-    return get_drv(fdctrl, fdctrl->cur_drv);
+    FDrive *cur_drv = get_drv(fdctrl, fdctrl->cur_drv);
+
+    if (!cur_drv->blk) {
+        /*
+         * Kludge: empty drive line selected. Create an anonymous
+         * BlockBackend to avoid NULL deref with various BlockBackend
+         * API calls within this model (CVE-2021-20196).
+         * Due to the controller QOM model limitations, we don't
+         * attach the created to the controller.
+         */
+        cur_drv->blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
+    }
+    return cur_drv;
 }
 
 /* Status A register : 0x00 (read-only) */
-- 
2.31.1


