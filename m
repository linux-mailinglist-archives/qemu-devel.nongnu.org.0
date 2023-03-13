Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42816B7386
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 11:14:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbfBJ-0003qj-Os; Mon, 13 Mar 2023 06:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbfB6-0003SJ-UY
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:13:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbfB5-0004OM-Jk
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:13:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678702395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2ey6Me3RzhUnLl6Ogy7OrIpD9dgOkdSTYWhTPkqQR8=;
 b=bbb1zQ0SqLwF6v8k06qkX/sYaY9mEgduBIZRwiF1uJhUMV6DH6FCtI23pGbFQ8wwIRiPDh
 ipfX4oSt/0cnReTJZxg1l92t8dPh6OVQDCu97vifFDRzI0wyQLZtsCEGUuZA9Gm0F80PxJ
 0HKRAhguuw2T5pTgr7qYrgIJgqWf6go=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-w2juYfhuMoi9F31ZU74Uaw-1; Mon, 13 Mar 2023 06:13:13 -0400
X-MC-Unique: w2juYfhuMoi9F31ZU74Uaw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50EC81C05141;
 Mon, 13 Mar 2023 10:13:13 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 898E940C83A9;
 Mon, 13 Mar 2023 10:13:12 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 14/18] ui/sdl: add QEMU_ENABLE_SDL_LOGGING
 setting/environment
Date: Mon, 13 Mar 2023 14:12:03 +0400
Message-Id: <20230313101207.375125-15-marcandre.lureau@redhat.com>
In-Reply-To: <20230313101207.375125-1-marcandre.lureau@redhat.com>
References: <20230313101207.375125-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Enable SDL logging when QEMU_ENABLE_SDL_LOGGING variable is set, as
suggested by Sam Lantinga, upstream SDL maintainer.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/sdl2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 137f7ab57f..221cdced60 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -843,6 +843,10 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
     }
 #endif
 
+    if (SDL_GetHintBoolean("QEMU_ENABLE_SDL_LOGGING", SDL_FALSE)) {
+        SDL_LogSetAllPriority(SDL_LOG_PRIORITY_VERBOSE);
+    }
+
     if (SDL_Init(SDL_INIT_VIDEO)) {
         fprintf(stderr, "Could not initialize SDL(%s) - exiting\n",
                 SDL_GetError());
-- 
2.39.2


