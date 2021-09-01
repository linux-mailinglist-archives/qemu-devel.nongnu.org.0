Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB7F3FE08C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 19:00:52 +0200 (CEST)
Received: from localhost ([::1]:41642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTbW-0007NF-TS
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 13:00:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mLTM9-0003u8-SO
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:44:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mLTM6-0007Ns-Qe
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630514694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kSWKce+MqCyIWoonxLeeQPy1adRXxuehHB9sQZkGQes=;
 b=DzjEoRL7o2/4vtxtdYKPL3FvT+8Zu2BDjqUYO4M+24zEvidX8v8+pvoMeG42w0Rmnhy8k7
 2T93mt+srDFwJqxH/RhQrA+57L2/JC6bJEpZCYD35DeeunyP8WjQoRDgcokC3MC3Ya7Oof
 Xpa+P1AIA5NerNpHvlMS7+t6RwvqqGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-JO3tscs5NQGO7j2Ce-l33A-1; Wed, 01 Sep 2021 12:44:53 -0400
X-MC-Unique: JO3tscs5NQGO7j2Ce-l33A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF820801A92;
 Wed,  1 Sep 2021 16:44:51 +0000 (UTC)
Received: from pick.home.annexia.org (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F49760864;
 Wed,  1 Sep 2021 16:44:50 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg/arm: Increase stack alignment for function generation
Date: Wed,  1 Sep 2021 17:44:46 +0100
Message-Id: <20210901164446.2722007-2-rjones@redhat.com>
In-Reply-To: <20210901164446.2722007-1-rjones@redhat.com>
References: <20210901164446.2722007-1-rjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, berrange@redhat.com,
 qemu-stable@nongnu.org, sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This avoids the following assertion when the kernel initializes X.509
certificates:

[    7.315373] Loading compiled-in X.509 certificates
qemu-system-arm: ../tcg/tcg.c:3063: temp_allocate_frame: Assertion `align <= TCG_TARGET_STACK_ALIGN' failed.

Fixes: commit c1c091948ae
Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1999878
Cc: qemu-stable@nongnu.org
Tested-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 tcg/arm/tcg-target.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index d113b7f8db..09df3b39a1 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -115,7 +115,7 @@ extern bool use_neon_instructions;
 #endif
 
 /* used for function call generation */
-#define TCG_TARGET_STACK_ALIGN		8
+#define TCG_TARGET_STACK_ALIGN          16
 #define TCG_TARGET_CALL_ALIGN_ARGS	1
 #define TCG_TARGET_CALL_STACK_OFFSET	0
 
-- 
2.32.0


