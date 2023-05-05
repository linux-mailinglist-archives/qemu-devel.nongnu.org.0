Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF0C6F8640
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 17:54:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puxkg-0003LS-J5; Fri, 05 May 2023 11:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puxkd-0003Jg-8k
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:53:43 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puxka-0008DD-Dw
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:53:42 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30771c68a9eso1477720f8f.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 08:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683302019; x=1685894019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uhx8xf/tUsvgHorzJjHLi5H+bMJr8MaQ/Qyfkil5mMk=;
 b=jxQT7RAnRiG+4jZWepXpJwwqyv1KyR0mYc+xl8K2zGZmMTT2NN1ZlH8jHLiSgONI0c
 Ouqxu2+vgaAg41DJy+2/lrstpWTiZlgXgDxAJmN27nt4iJydj7zD3DNq7SZlbZXE7Raa
 PM3Sm8ScRO541hN/9vIlwjSQDG4iyqwN4N/aMYMnFEb4Zxt/8CEUhSkmlg/tKHodPauB
 2xkFoXG5NLicCJL4/Nk/hUjF5zlC4EHfWV2NNTOkU+Kwhl098hm5rfDUWoYMtKhm/XvS
 AZElG/dQzuvIUqv87OI4u/kIh46Rx8m2Poe2wbMebQcACMg7loYxH7yOLY8vKylh2d0Y
 5CYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683302019; x=1685894019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uhx8xf/tUsvgHorzJjHLi5H+bMJr8MaQ/Qyfkil5mMk=;
 b=PGPn/aEdoaKbDsAGY0Ur+PMDQAaJhlncI6p9t2Urb6VmjK2Nt02iCFB0yAzs0Ax4He
 BHlW0rdWqpxODo06OMz1L16mIzwcZx5nUF1m/LP0cZAAWxt3IdHCh7XxM3SLfTytYSBe
 WfkfrifmRjAk+8h+dWyvRTqYJRJEUuh1NOIy7d26Ui7dTWKsDOVLQ5n3y1uUE2nkHZEh
 xYI5azvS6WPq/1jW+XVknZvxtrudsKGdQrYLv3+s5O6rv7cc0iqlG+rnR3kLNIouZY6U
 EGuSjd/NAKlP9tFzj4VHgcOuxLj/stVImDsJZXpEKNkCPWOQUy5XSMnPaA01GVZH4wjC
 r+oA==
X-Gm-Message-State: AC+VfDwpmhCTnRIgTY2vF1BiLlJNpMv0KG2W99KiHWAn/wcnRzLgG5KP
 8bAw2KQMQ/P5xcuarbteS2DZVQ==
X-Google-Smtp-Source: ACHHUZ6W8k4PVy/as8I8u8Zze+cgI00CESukf0Fi8L7Qqk9fUnFLqdraeChi+jaw5noonBKKXhgr/g==
X-Received: by 2002:a5d:4309:0:b0:306:492c:cdd8 with SMTP id
 h9-20020a5d4309000000b00306492ccdd8mr1596190wrq.15.1683302019226; 
 Fri, 05 May 2023 08:53:39 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v1-20020adff681000000b003047297a5e8sm2756925wrp.54.2023.05.05.08.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 08:53:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0B3851FFBF;
 Fri,  5 May 2023 16:53:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <michael.roth@amd.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 04/10] scripts/qapi: document the tool that generated the
 file
Date: Fri,  5 May 2023 16:53:30 +0100
Message-Id: <20230505155336.137393-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230505155336.137393-1-alex.bennee@linaro.org>
References: <20230505155336.137393-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This makes it a little easier for developers to find where things
where being generated.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230503091756.1453057-5-alex.bennee@linaro.org>
---
 scripts/qapi/gen.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 8f8f784f4a..e724507e1a 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -162,7 +162,7 @@ def __init__(self, fname: str, blurb: str, pydoc: str):
 
     def _top(self) -> str:
         return mcgen('''
-/* AUTOMATICALLY GENERATED, DO NOT MODIFY */
+/* AUTOMATICALLY GENERATED by QAPIGenC, DO NOT MODIFY */
 
 /*
 %(blurb)s
@@ -195,7 +195,7 @@ def _bottom(self) -> str:
 
 class QAPIGenTrace(QAPIGen):
     def _top(self) -> str:
-        return super()._top() + '# AUTOMATICALLY GENERATED, DO NOT MODIFY\n\n'
+        return super()._top() + '# AUTOMATICALLY GENERATED by QAPIGenTrace, DO NOT MODIFY\n\n'
 
 
 @contextmanager
-- 
2.39.2


