Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ADA4E67B1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 18:22:39 +0100 (CET)
Received: from localhost ([::1]:44580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXRAT-0000Gd-Eo
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 13:22:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nXR3l-0002dN-GG
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:15:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nXR3g-0007NL-Si
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:15:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648142134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wmo9H9BkKbHuA5SYjyvivPTWynA+2KUslQ161QLJVjA=;
 b=f6VXO7bu4TDuAxWsi5W1632bY5jgFp7DyF2v5J9UKBGDDlMoHeKNSl+MgmuMnJcG1f53kl
 4IMRtwHN+Hj0xfWvRhPq6z4jZJjV79wVTO2/A8//29/+OboRbx9Rvk5638Iw3gRiRuCJ/p
 gDWjU0ztkAYJxy6pKKDdUGlglC9h2Aw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-V9s0-TyqOYemH9CS2g8zlQ-1; Thu, 24 Mar 2022 13:15:31 -0400
X-MC-Unique: V9s0-TyqOYemH9CS2g8zlQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BACEF2800F6D;
 Thu, 24 Mar 2022 17:15:30 +0000 (UTC)
Received: from localhost (unknown [10.39.195.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69AF34010A3C;
 Thu, 24 Mar 2022 17:15:30 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-7.0 1/2] block: Fix misleading hexadecimal format
Date: Thu, 24 Mar 2022 17:15:26 +0000
Message-Id: <20220324171527.1256604-2-stefanha@redhat.com>
In-Reply-To: <20220324171527.1256604-1-stefanha@redhat.com>
References: <20220324171527.1256604-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

"0x%u" format is very misleading, replace by "0x%x".

Found running:

  $ git grep -E '0x%[0-9]*([lL]*|" ?PRI)[dDuU]' block/

Inspired-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Message-id: 20220323114718.58714-2-philippe.mathieu.daude@gmail.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/parallels-ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/parallels-ext.c b/block/parallels-ext.c
index cb22a427d7..5122f67ac2 100644
--- a/block/parallels-ext.c
+++ b/block/parallels-ext.c
@@ -261,7 +261,7 @@ static int parallels_parse_format_extension(BlockDriverState *bs,
             break;
 
         default:
-            error_setg(errp, "Unknown feature: 0x%" PRIu64, fh.magic);
+            error_setg(errp, "Unknown feature: 0x%" PRIx64, fh.magic);
             goto fail;
         }
 
-- 
2.35.1


