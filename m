Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8BF30883D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:26:52 +0100 (CET)
Received: from localhost ([::1]:56962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RvP-0004kA-Al
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnU-0004n0-Og
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:44 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnT-00064z-Aw
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:40 -0500
Received: by mail-ed1-x52a.google.com with SMTP id c2so10094194edr.11
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0WilWvWorACj3g5EAvXIIkMK139ofJdUm71cXfooZT8=;
 b=FYQsnb9YI9Z/3nbuDjwQ73Q3Wo8jSOR3DML2SLmjt22WjDYWaMTDvxd2ZnXBTMRCpQ
 +w0Rfc+g7aJqMymP30S/Qqtix++pvMGMSwJZ3PW0g484XatKfYUE7zjEBJ5SQ8qdlxq9
 xhmZ0vNAq/HU0r8q5Pc78KqpAbGKxFPs32pFnCz4PsLvtVFKtUblIFdRqQNmhz6S8uxI
 DKJ/8Zobw4B0tR9WOreDTjvFv5i5SJdocMAB+3E4VuG70IpXEUbJ2tohQDKx3MJrx/vr
 oWRIms5iTsZG7CoeniQkcHdlCZoES+dwE6kArp7BxBeeSalGx/Oh+XGdlZkY5ykDUrO5
 CXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0WilWvWorACj3g5EAvXIIkMK139ofJdUm71cXfooZT8=;
 b=MqQJu4R6McQGM3aaj0GKnwn/4MnvrpcKZqxoN2dYaOriP0bYap6Hbzxk1MnoItRUYF
 DiMpby3nV0R/wI26oiACefjQ/VfD+4tCEoEYW1FvwecFwBHR0WiEYk1U5cyHWWERHoDo
 1c7IVr4Ich3U945Bwj90U2XreH0WdSEuf8f4gG0Rqh2Nkqv6Zfx6be6cmGLSRZWVx0s+
 Z2rtllFGAyHqUjvBmQahxLgTvd1j/uOoqONbpQRGfrhtY54rDgbRHHAsRR6IcaInRx0B
 BBuw0sClx6vmzh5qNNOHKwigk7+Jh06GQBZxcaaNodAunRKc/quJt+iCvqiSQE4jx38F
 34zA==
X-Gm-Message-State: AOAM531jnEdGwXaQpXpG3mpTXLfu8AVxzwHjy8q8+JiWtWwkPEejfYgE
 bv9eW21nSL8chaA2c7zjrIq9GjnCl/S/JA==
X-Google-Smtp-Source: ABdhPJxwzlI+/MrXbKBRO2YkMXqyJY9J/3Q3uwAMR4APldB8f2oG84QpoB9vl+eXgAgWjsrN48MQfg==
X-Received: by 2002:a50:b246:: with SMTP id o64mr4329447edd.132.1611919118018; 
 Fri, 29 Jan 2021 03:18:38 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/36] tests/meson: Only build softfloat objects if TCG is
 selected
Date: Fri, 29 Jan 2021 12:18:03 +0100
Message-Id: <20210129111814.566629-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210122204441.2145197-3-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/meson.build b/tests/meson.build
index 29ebaba48d..6f1ff926d2 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -276,7 +276,9 @@ test('decodetree', sh,
      workdir: meson.current_source_dir() / 'decode',
      suite: 'decodetree')
 
-subdir('fp')
+if 'CONFIG_TCG' in config_all
+  subdir('fp')
+endif
 
 if not get_option('tcg').disabled()
   if 'CONFIG_PLUGIN' in config_host
-- 
2.29.2



