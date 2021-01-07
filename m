Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0371F2EE8D5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:38:24 +0100 (CET)
Received: from localhost ([::1]:39262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdvD-0003Io-2d
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:38:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdiA-0000Ha-0G
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:24:54 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdi8-0005Hc-7K
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:24:53 -0500
Received: by mail-wm1-x330.google.com with SMTP id 3so6819436wmg.4
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dcR5NfJ4bwd3GfZx+pYyGxxdnoF1o7zacb4JP8su4Rw=;
 b=SKxTZgOcgVzHj3DKPn6v+2IU+QoulCHt2RAJKbmiMqIZnukJVsAKErS3PvVBt9Q9yh
 2lGahRiDR+l/rqT3vU5Rlr7uE4D/PPsmqVuQS0ZEYVoGHODToRH8+a11bOyrVS2XLiaK
 buPBkjlqfnXvGbScV48QroYRf3Fu9qGfr+EBb5PYaoPoiSp08efBI13MZkHsVb2q4y2S
 hJLMKEQRFq9g0Jhwvyhr9Q9wUvhODDTN3rHToc+YlMJJ6WnNoOpbykFRipjrcIWnDr0K
 GVXK5Wgqq5NlSCAwwEy4jYNdPZjBfkWzipWwDxzzjJV8KNXJkVsj4zYgYn8pkBJ3CDDo
 oexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dcR5NfJ4bwd3GfZx+pYyGxxdnoF1o7zacb4JP8su4Rw=;
 b=jdBTDZlyoT4OUrQGffUvtBv8NOq6yossHtjz9hxeSWtuaZK0Kk1h9+M0MEG6uf84En
 lS9UJF+QpdkA1mm0stLED/H2ZLlX/DzxtAtxYS6fsjtpj1UyIMQ/EeBsVX02dtFVQyo2
 13YI1GCMcz4SZT+9/f73OROB6AM5Q7E3OHxfvr9NjrHqYqOxF4GSs74aObwMH1nyxqeu
 3MTw2pIE0onwMT2MZPXJo91xJYAUjzlMGeixsfiPs++R4VwQhMgQqK8DYdX1qNB9hYPR
 9Gq4rnuVaKZPlXutdMkk27tKDs8+FlW1rSETVjzDo6sVmUfwYKxSI3KZCvVDRG4mqTY/
 35zw==
X-Gm-Message-State: AOAM531B7I+yLDMKwGJAeCTwj8qhXaWkY0S1o5bfzHLnZzj93aUzq70c
 ATEMRyXaV6kiSVmjnW9/xbRTrHmLcio=
X-Google-Smtp-Source: ABdhPJxYDqODrrjf7pdQ0Z0PcI2BySmJ6bIXEkP3iZ8g95kryCbIw8SkmdqWfWVT/ysqEfYlDJrIFA==
X-Received: by 2002:a1c:4954:: with SMTP id w81mr527168wma.60.1610058290666;
 Thu, 07 Jan 2021 14:24:50 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id v65sm5262739wme.23.2021.01.07.14.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:24:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/66] target/mips: Remove consecutive CONFIG_USER_ONLY ifdefs
Date: Thu,  7 Jan 2021 23:22:09 +0100
Message-Id: <20210107222253.20382-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201214183739.500368-5-f4bug@amsat.org>
---
 target/mips/helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/mips/helper.c b/target/mips/helper.c
index 92bd3fb8550..cfb6d82fd33 100644
--- a/target/mips/helper.c
+++ b/target/mips/helper.c
@@ -552,9 +552,7 @@ hwaddr mips_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     }
     return phys_addr;
 }
-#endif /* !CONFIG_USER_ONLY */
 
-#if !defined(CONFIG_USER_ONLY)
 #if !defined(TARGET_MIPS64)
 
 /*
-- 
2.26.2


