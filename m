Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8FF4CFC45
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:07:51 +0100 (CET)
Received: from localhost ([::1]:51798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBDS-00074Z-Mr
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:07:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAik-0004qa-Ev
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAii-0008BP-8W
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646649363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4hzzdM4EB8R0VL5oB5/SFcL14VY3+8SjltyLTPj44NU=;
 b=ggg09cXxe53eMg38lvzy8BWhGR5AKAUxZjNJWvZUJzSgHdXyPynKlT7PPbiZRGvugEXzHF
 SgknaL4kvOTCpztblkL0ZAKxre1QmaVYNzJ7nkIH/yb47t2rDahVmwgBAjyxjAvgzmKLhI
 EkAGTXbYph5a7KtEFTUnleU8VPbuBSo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-m8fddpYmPzitcOSnL-sxuA-1; Mon, 07 Mar 2022 05:36:00 -0500
X-MC-Unique: m8fddpYmPzitcOSnL-sxuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94A80801AFC;
 Mon,  7 Mar 2022 10:35:59 +0000 (UTC)
Received: from localhost (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3421A783AA;
 Mon,  7 Mar 2022 10:35:59 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/23] block/curl.c: Set error message string if
 curl_init_state() fails
Date: Mon,  7 Mar 2022 11:35:28 +0100
Message-Id: <20220307103549.808809-3-hreitz@redhat.com>
In-Reply-To: <20220307103549.808809-1-hreitz@redhat.com>
References: <20220307103549.808809-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In curl_open(), the 'out' label assumes that the state->errmsg string
has been set (either by curl_easy_perform() or by manually copying a
string into it); however if curl_init_state() fails we will jump to
that label without setting the string.  Add the missing error string
setup.

(We can't be specific about the cause of failure: the documentation
of curl_easy_init() just says "If this function returns NULL,
something went wrong".)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220222152341.850419-2-peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/curl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/curl.c b/block/curl.c
index 6a6cd72975..9516852971 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -759,6 +759,8 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags,
     // Get file size
 
     if (curl_init_state(s, state) < 0) {
+        pstrcpy(state->errmsg, CURL_ERROR_SIZE,
+                "curl library initialization failed.");
         goto out;
     }
 
-- 
2.34.1


