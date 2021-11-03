Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B843444454
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:10:35 +0100 (CET)
Received: from localhost ([::1]:55146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHuM-00042z-9F
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHos-0003Da-B1
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:55 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHoo-0000PD-5q
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:52 -0400
Received: by mail-wm1-x329.google.com with SMTP id z200so2221915wmc.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=50HBQi4Hy5jMLr0JSY8l5M1bqyl8v0Na28qxD2VdzUY=;
 b=mq5oTi8l7/rxkxTFqfa/CAYGLbkymxslQtD0/QYeXtr7VsvmdqaRXBQXTqhv0YFYIk
 G7YgiMmdvW5ayunqKjlGKOtsZz6sRtY1n3H5V2RtlQxYPCeZhKRufkgg4US94YjSNbY0
 S8GKxArXdKTmMpCZ4UkITZ3n9xaqFHPTxxfx7O6yf6WI/t3KEBL1mFczM492zkYHa+eL
 mFDP2n6heDF37tQlG/sseNw95SDAJUhLC20XN/SozqbDunydXgd13ZcCtcZZGsN/Uk3Q
 9FrFdwUVqEk/0/kkdWdwpzGqTy4ygk2gCUEB0veUP09YJZQmdbSZ8s+vvHEUJxUfZ2mw
 E2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=50HBQi4Hy5jMLr0JSY8l5M1bqyl8v0Na28qxD2VdzUY=;
 b=ppvi/LZ4/y2nNJQ7KQO3rh0jb3xAXQcn8Rosri6ShhgmqSUsKKaSxwCgPBY+vmv9LO
 zOwKYYMs0FiDSpNRbnPA6qSuXQEWNvY1FyvOdYGlPn40h+iW98CSVLa5uzRScW/C72kt
 tkt1libkYBD8DC+52RDCX5kd/MDp+LnDPnlwNaZTSrQoevd/M5ySsYohjTqzYK0jlCT9
 gDrOJUl8DY7RT3QRb4r7CctfCpyEXY9RMf2zXPuZp0NEqhMQu5jOFH1SX831pZ4qmV7a
 +FTyM4zI0VS0+gud8RGg3kXLba4699PcL54paEiMWwOwu8VykYEnTEldH5uwMMJocB0F
 0WAA==
X-Gm-Message-State: AOAM532ZieTGqme5PjEUAEfEoj5LSzX9nSJ6yYlQMey4plqa96SbFPSZ
 FoVoH0VIWmRmZQLqR7vM4/C7PHQyciA=
X-Google-Smtp-Source: ABdhPJwQPH12mbMvt7QL7ZLRJMPsqgfTtcQYQ4lK4LY2Ri96y3sSaCgZv5j7c1u40lsFUD+at4Zw4A==
X-Received: by 2002:a1c:f219:: with SMTP id s25mr16370161wmc.31.1635951886490; 
 Wed, 03 Nov 2021 08:04:46 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:04:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/27] Makefile: Fix gtags generation
Date: Wed,  3 Nov 2021 16:04:16 +0100
Message-Id: <20211103150442.387121-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

We should use "-print" or otherwise all "-prone" is ignored.

Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210804132328.41353-2-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index fe9415ac64..1b36bf2af4 100644
--- a/Makefile
+++ b/Makefile
@@ -256,7 +256,7 @@ gtags:
 		"GTAGS", "Remove old $@ files")
 	$(call quiet-command, 				\
 	        (cd $(SRC_PATH) && 			\
-		 $(find-src-path) | gtags -f -), 	\
+		 $(find-src-path) -print | gtags -f -),	\
 		"GTAGS", "Re-index $(SRC_PATH)")
 
 .PHONY: TAGS
-- 
2.31.1



