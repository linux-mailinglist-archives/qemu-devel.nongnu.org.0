Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A08757A5AC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 19:46:09 +0200 (CEST)
Received: from localhost ([::1]:34616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrIO-0001Xh-3r
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 13:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDqcf-0006s0-7g
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDqcd-0002xT-CV
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658250177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C3RsTzpUpSmcwAiXumCHZkL1L95oYVF7nTyhzOb0/Tk=;
 b=c9NjfkX0GP8V+ZgzBz+gIXnurcP1k+ZYfrkiA2ItAdM5SsWdqm06h5c1aRqYQ8x7Ccz34n
 sPMv4nlefWasCiBJpAllzazEA6pkw43tT2Snc0PJm5gA+bSeP3o2T/ffVXbObvcRMGPT7H
 BX8ZuflxqvkGq4gQ5M/ak0Ag97hGBRQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-ioFdnXOHNgipgIAidS7b0w-1; Tue, 19 Jul 2022 13:02:55 -0400
X-MC-Unique: ioFdnXOHNgipgIAidS7b0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B95E380673A;
 Tue, 19 Jul 2022 17:02:55 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85B6840CFD0A;
 Tue, 19 Jul 2022 17:02:54 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com,
 huangy81@chinatelecom.cn
Subject: [PULL 24/29] migration: remove unreachable code after reading data
Date: Tue, 19 Jul 2022 18:02:16 +0100
Message-Id: <20220719170221.576190-25-dgilbert@redhat.com>
In-Reply-To: <20220719170221.576190-1-dgilbert@redhat.com>
References: <20220719170221.576190-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Daniel P. Berrangé <berrange@redhat.com>

The code calls qio_channel_read() in a loop when it reports
QIO_CHANNEL_ERR_BLOCK. This code is reported when errno==EAGAIN.

As such the later block of code will always hit the 'errno != EAGAIN'
condition, making the final 'else' unreachable.

Fixes: Coverity CID 1490203
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220627135318.156121-1-berrange@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/qemu-file.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 2f266b25cd..4f400c2e52 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -411,10 +411,8 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
         f->total_transferred += len;
     } else if (len == 0) {
         qemu_file_set_error_obj(f, -EIO, local_error);
-    } else if (len != -EAGAIN) {
-        qemu_file_set_error_obj(f, len, local_error);
     } else {
-        error_free(local_error);
+        qemu_file_set_error_obj(f, len, local_error);
     }
 
     return len;
-- 
2.36.1


