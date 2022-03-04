Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E904CD821
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:41:02 +0100 (CET)
Received: from localhost ([::1]:57948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQA3B-0001w5-Rw
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:41:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nQA00-0007XQ-9F
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:37:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nQ9zy-0007WI-Ox
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:37:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646408262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aC/9+ovHaTetUqJKmZNYrehqP2GdRa9M7e1buQepVAQ=;
 b=bGOZ5gzDa1MqSPY3ksSBPJc5AyJDHn8UMcWWFZoccINT4KAMa2uo7LWM5KN0n50FWeMJmb
 Ed5UHgTHzVGSrg2rlohcw08fu+ohc+98jjZtVcgcfhQGBXn/vtPxbFBngVt1iWUkhJLQzK
 lMfpuXosMxrrXsalRNEtmhMgbNv5pDc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-OIGM29gTOk-0GnQVjzmLIw-1; Fri, 04 Mar 2022 10:37:39 -0500
X-MC-Unique: OIGM29gTOk-0GnQVjzmLIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BAC61854E26;
 Fri,  4 Mar 2022 15:37:38 +0000 (UTC)
Received: from localhost (unknown [10.39.193.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCC0E1037F29;
 Fri,  4 Mar 2022 15:37:37 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/5] block/amend: Clean up job on early failure
Date: Fri,  4 Mar 2022 16:37:25 +0100
Message-Id: <20220304153729.711387-2-hreitz@redhat.com>
In-Reply-To: <20220304153729.711387-1-hreitz@redhat.com>
References: <20220304153729.711387-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/amend.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/amend.c b/block/amend.c
index 329bca53dc..f465738665 100644
--- a/block/amend.c
+++ b/block/amend.c
@@ -134,6 +134,7 @@ void qmp_x_blockdev_amend(const char *job_id,
     s->force = has_force ? force : false;
 
     if (blockdev_amend_pre_run(s, errp)) {
+        job_early_fail(&s->common);
         return;
     }
 
-- 
2.34.1


