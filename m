Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6439454675
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 13:37:01 +0100 (CET)
Received: from localhost ([::1]:54964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnKBQ-00087W-DK
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 07:37:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnKAK-0006Pl-Uq
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 07:35:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnKAJ-0004bD-Cc
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 07:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637152550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTNtSt9bkGOnttpG0XfMFr62z7chItuoyRUPlpke2UQ=;
 b=Jtrm/c5y6njjMsv0W4KZDNmWbp0cKFvLEDekgRNYMTAUSSpFJYHii2AYrxwEcaxsU6dr6E
 yYF3qAA0AWyb5cIlZ/AaCjACRvkD0PkoJakl4a25k7pro7F8BEylxUg5E8jegvbaH+YvNp
 n8R1q7hfZU593djafuh6PEbRAUXz+6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-HthrIJ8RMNaxLZRmV7nltA-1; Wed, 17 Nov 2021 07:35:47 -0500
X-MC-Unique: HthrIJ8RMNaxLZRmV7nltA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3947B8799F0;
 Wed, 17 Nov 2021 12:35:46 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 664CC3AEF;
 Wed, 17 Nov 2021 12:35:42 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v2 1/2] hw/nvme/ctrl: Fix buffer overrun in
 nvme_changed_nslist (CVE-2021-3947)
Date: Wed, 17 Nov 2021 13:35:33 +0100
Message-Id: <20211117123534.2900334-2-philmd@redhat.com>
In-Reply-To: <20211117123534.2900334-1-philmd@redhat.com>
References: <20211117123534.2900334-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Gaurav Kamathe <gkamathe@redhat.com>, qemu-block@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-stable@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both 'buf_len' and 'off' arguments are under guest control.
Since nvme_c2h() doesn't check out of boundary access, the
caller must check for eventual buffer overrun on 'trans_len'.

Cc: qemu-stable@nongnu.org
Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Fixes: f432fdfa121 ("support changed namespace asynchronous event")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/nvme/ctrl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 6a571d18cfa..93a24464647 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4168,8 +4168,11 @@ static uint16_t nvme_changed_nslist(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     int i = 0;
     uint32_t nsid;
 
-    memset(nslist, 0x0, sizeof(nslist));
     trans_len = MIN(sizeof(nslist) - off, buf_len);
+    if (trans_len >= sizeof(nslist)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+    memset(nslist, 0x0, sizeof(nslist));
 
     while ((nsid = find_first_bit(n->changed_nsids, NVME_CHANGED_NSID_SIZE)) !=
             NVME_CHANGED_NSID_SIZE) {
-- 
2.31.1


