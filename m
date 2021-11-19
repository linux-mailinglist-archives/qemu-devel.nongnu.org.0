Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D644568F0
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 05:08:34 +0100 (CET)
Received: from localhost ([::1]:48890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnvCT-0005af-Gj
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 23:08:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnv7y-0000ZC-Sg
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 23:03:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnv7x-0006B2-20
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 23:03:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637294632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RUDN9BM9JKMzh4bzsDUnOA725hqQKT4s96FHXKw7UeI=;
 b=C2NRpRm6h2ByReBkFwd9TQfR8/YcLJhZWXMgz/EHTAoJ8x+cAX70d1UswZ0gURKWc5I/KY
 uuziYNUywWvfZhbVKk7FCw/KrtmRe/IPHEbWw4LA1wNa38FsZC6MRFv26/l35PGaMc8R0M
 E3gEs6oyEhpSc5OOSKhSZbRGuvNPXGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256---Fbfp4KNKy7YHESYXb-Pg-1; Thu, 18 Nov 2021 23:03:50 -0500
X-MC-Unique: --Fbfp4KNKy7YHESYXb-Pg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE03B18125C0;
 Fri, 19 Nov 2021 04:03:49 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-18.pek2.redhat.com [10.72.13.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21D5F60BF1;
 Fri, 19 Nov 2021 04:03:46 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 3/3] net/colo-compare.c: Fix incorrect return when input wrong
 size
Date: Fri, 19 Nov 2021 12:03:36 +0800
Message-Id: <20211119040336.14460-4-jasowang@redhat.com>
In-Reply-To: <20211119040336.14460-1-jasowang@redhat.com>
References: <20211119040336.14460-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/colo-compare.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 1225f40..b966e7e 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -807,7 +807,7 @@ static int compare_chr_send(CompareState *s,
     }
 
     if (!size) {
-        return 0;
+        return -1;
     }
 
     entry = g_slice_new(SendEntry);
-- 
2.7.4


