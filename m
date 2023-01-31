Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A67C682A26
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:14:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMndE-0002k7-3x; Tue, 31 Jan 2023 05:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncu-0002L8-45
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncr-0002Vw-KS
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675159945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8QqPa90m9ApJCBGVjhce1PoGh8rW4bdZtoHNWW3edy8=;
 b=Wqy8DjvYQtr5NYirTmA6lvcnVHLdun537VrM+2sjrP1aAdlKWUuzH+JnOI9nzB5e3rOa+C
 JsqSVcsFaFUyCrD5b8PSif/3XbAvhCfVS4qB8L1OFn4rpZx/63ic9hNO84BgMpAXUaFfNG
 Tz234GZrrzSvoeDJGi9CX89ZjUsNgxQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-vn2ZTKksNW2VkCZoCXClaw-1; Tue, 31 Jan 2023 05:12:23 -0500
X-MC-Unique: vn2ZTKksNW2VkCZoCXClaw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EB3418483B3;
 Tue, 31 Jan 2023 10:12:22 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE33BC15BAD;
 Tue, 31 Jan 2023 10:12:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 12/27] qemu/bswap: Use compiler __builtin_bswap() on Haiku
Date: Tue, 31 Jan 2023 11:11:50 +0100
Message-Id: <20230131101205.1499867-13-thuth@redhat.com>
In-Reply-To: <20230131101205.1499867-1-thuth@redhat.com>
References: <20230131101205.1499867-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since commit efc6c070aca ("configure: Add a test for the minimum
compiler version") the minimum compiler version required for GCC
is 4.8, which supports __builtin_bswap().
Remove the Haiku specific ifdef'ry.

This reverts commit 652a46ebba970017c7a23767dcc983265cdb8eb7
("bswap.h: Include <endian.h> on Haiku for bswap operations").

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230111163147.71761-5-philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/qemu/bswap.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index fd5a98125a..8cd5a2b02e 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -6,8 +6,6 @@
 # include <machine/bswap.h>
 #elif defined(__FreeBSD__)
 # include <sys/endian.h>
-#elif defined(__HAIKU__)
-# include <endian.h>
 # else
 #define BSWAP_FROM_FALLBACKS
 #endif /* ! CONFIG_MACHINE_BSWAP_H */
-- 
2.31.1


