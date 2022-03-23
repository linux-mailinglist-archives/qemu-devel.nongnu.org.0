Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3866F4E5622
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:16:15 +0100 (CET)
Received: from localhost ([::1]:49480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3eg-0006Rk-92
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:16:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3O2-0003Tv-Ng
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 11:59:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3O1-0004r5-59
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 11:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dAhTBNzXXuL5l9gc81kKvNBhe53DiQ3sQsWkjiaygXk=;
 b=OoHgjPW2AozSB7xDNxBSnRrOAjgtvQKa0+A0dBNRC/FDQ0GpPmCAefBf1jHZ3aD13/zgmv
 frlWmkMBqyrxzsGr7D/rlMCAkThfED+6iJX2rWDMxCPcDVf+Hd1Ol7wBbC2P3jt/ODE7zS
 ux6pxV8tPKn5P8iUQUjlUB9LpCshUVI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-zgxWD9oiNnqDXEwQ2Wlm5A-1; Wed, 23 Mar 2022 11:58:57 -0400
X-MC-Unique: zgxWD9oiNnqDXEwQ2Wlm5A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04BD8296A607
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 15:58:57 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E4C1403D186;
 Wed, 23 Mar 2022 15:58:55 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 08/32] osdep: poison {HOST,TARGET}_WORDS_BIGENDIAN
Date: Wed, 23 Mar 2022 19:57:19 +0400
Message-Id: <20220323155743.1585078-9-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/osdep.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 9f06bf536fb1..95a14914d13b 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -34,6 +34,18 @@
 #include "exec/poison.h"
 #endif
 
+/*
+ * HOST_WORDS_BIGENDIAN was replaced with HOST_BIG_ENDIAN. Prevent it from
+ * creeping back in.
+ */
+#pragma GCC poison HOST_WORDS_BIGENDIAN
+
+/*
+ * TARGET_WORDS_BIGENDIAN was replaced with TARGET_BIG_ENDIAN. Prevent it from
+ * creeping back in.
+ */
+#pragma GCC poison TARGET_WORDS_BIGENDIAN
+
 #include "qemu/compiler.h"
 
 /* Older versions of C++ don't get definitions of various macros from
-- 
2.35.1.273.ge6ebfd0e8cbb


