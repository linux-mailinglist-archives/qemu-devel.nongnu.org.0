Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01F64DAE08
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 11:04:08 +0100 (CET)
Received: from localhost ([::1]:50142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUQVj-0003uq-Nc
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 06:04:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQLN-0000iT-08
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:53:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQLJ-0007l3-K6
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647424401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7MnmzRNk2O7XAJo+TtgtV7pLw/JMZCwSBizaRHTfkzs=;
 b=HCoE+klkarmixs7Qs0igRVwZnqsgDXG4rr0wG8bpxEqd32p7qrJ1NXk4+QRGGTBHUnJ4VW
 +2Qry9lBkCbsRby+1imxkMx3ZOuGqMpWroMY9hWGpFk/GJWIeU3eaU9b/KDzYuAKPLuLKA
 bOOGy8pOFmcl60z43lhPl4/juwlji9o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-Yp11DNbFMCmilv5sq-EwSw-1; Wed, 16 Mar 2022 05:53:20 -0400
X-MC-Unique: Yp11DNbFMCmilv5sq-EwSw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6BF93C11C75
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 09:53:19 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A272E112D187;
 Wed, 16 Mar 2022 09:53:18 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 11/27] osdep: poison HOST_WORDS_BIGENDIAN
Date: Wed, 16 Mar 2022 13:53:15 +0400
Message-Id: <20220316095315.2613667-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/osdep.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 322103aadbdc..7175ee53a217 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -34,6 +34,12 @@
 #include "exec/poison.h"
 #endif
 
+/*
+ * HOST_WORDS_BIGENDIAN was replaced with HOST_BIG_ENDIAN. Prevent it from
+ * creeping back in.
+ */
+#pragma GCC poison HOST_WORDS_BIGENDIAN
+
 #include "qemu/compiler.h"
 
 /* Older versions of C++ don't get definitions of various macros from
-- 
2.35.1.273.ge6ebfd0e8cbb


