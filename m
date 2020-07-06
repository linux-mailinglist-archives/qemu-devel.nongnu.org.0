Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F09A215CAB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 19:08:27 +0200 (CEST)
Received: from localhost ([::1]:34066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsUbS-0006RF-7s
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 13:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jsUCQ-0003nJ-2O
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 12:42:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39721
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jsUCK-00038m-Uz
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 12:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594053748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vVV6+EdoidyVAvUkJBQWiDCrIWX2cGi/pWzDsI5LJjU=;
 b=akyYnhSYs49n24nMtumnx37fQbF64AonE5v+/rNBrzbg1Ej+Vb+KPZONV6pMzhFpfjmKaz
 tx0xSEnXrBs6hFM+wWOtIU+IMyYDFyhrrfiZ4PzZOrhSN4EoeloNdDHVzYgdxx1K7J/I6/
 5ECHwtx6mQi2bllRGGzX5MREjuskdDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-to0aHpegMSS0FWSwkMbDCA-1; Mon, 06 Jul 2020 12:42:26 -0400
X-MC-Unique: to0aHpegMSS0FWSwkMbDCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57E9D8015CB;
 Mon,  6 Jul 2020 16:42:25 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0866B79249;
 Mon,  6 Jul 2020 16:42:24 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/53] iscsi: return -EIO when sense fields are meaningless
Date: Mon,  6 Jul 2020 12:41:37 -0400
Message-Id: <20200706164155.24696-36-pbonzini@redhat.com>
In-Reply-To: <20200706164155.24696-1-pbonzini@redhat.com>
References: <20200706164155.24696-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:52:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Xie Yongji <xieyongji@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xie Yongji <xieyongji@bytedance.com>

When an I/O request failed, now we only return correct
value on scsi check condition. We should also have a
default errno such as -EIO in other case.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Message-Id: <20200701105444.3226-2-xieyongji@bytedance.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/iscsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/iscsi.c b/block/iscsi.c
index 2964c9f8d2..387ed872ef 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -241,9 +241,11 @@ iscsi_co_generic_cb(struct iscsi_context *iscsi, int status,
 
     iTask->status = status;
     iTask->do_retry = 0;
+    iTask->err_code = 0;
     iTask->task = task;
 
     if (status != SCSI_STATUS_GOOD) {
+        iTask->err_code = -EIO;
         if (iTask->retries++ < ISCSI_CMD_RETRIES) {
             if (status == SCSI_STATUS_BUSY ||
                 status == SCSI_STATUS_TIMEOUT ||
-- 
2.26.2



