Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCCB38B4E4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:07:16 +0200 (CEST)
Received: from localhost ([::1]:54490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljm8h-0004S6-El
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljm7M-0001cN-AV
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:05:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljm7B-0005cL-0Q
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:05:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621530340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e0SNQoAqdb4bl76wcRMsvUXYfkexwm35ttQDzweDdUk=;
 b=WzEItpa/LNikurzXjuRQOinUTa7oXqOJ0oEGoBXCsBe6SE7UusSp3FHBtKz6LXcq5/NjBI
 mdCMv7sTgntk4uykpjhZG9fyV3ykvt/cx2KhsuVJxlrDHihypDmSwGhGq+7oBcfFKN5vvO
 Y2zxjOP7EL3TgS3F3+50XpwUd6Jwujw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-tbQBEVasNjuWj4k9eSfn9g-1; Thu, 20 May 2021 13:05:38 -0400
X-MC-Unique: tbQBEVasNjuWj4k9eSfn9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C7411020C38;
 Thu, 20 May 2021 17:05:36 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-166.ams2.redhat.com
 [10.36.113.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2E4F5D6D5;
 Thu, 20 May 2021 17:05:34 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 4/9] accel/tcg: Assert that tb->size != 0 after translation
Date: Thu, 20 May 2021 19:05:14 +0200
Message-Id: <20210520170519.300951-5-cohuck@redhat.com>
In-Reply-To: <20210520170519.300951-1-cohuck@redhat.com>
References: <20210520170519.300951-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

If arch-specific code generates a translation block of size 0,
tb_gen_code() may generate a spurious exception. Add an assertion in
order to catch such situations early.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210416154939.32404-5-iii@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 accel/tcg/translate-all.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index fbf8fc630b27..640ff6e3e706 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1912,6 +1912,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
     tcg_ctx->cpu = env_cpu(env);
     gen_intermediate_code(cpu, tb, max_insns);
+    assert(tb->size != 0);
     tcg_ctx->cpu = NULL;
     max_insns = tb->icount;
 
-- 
2.31.1


