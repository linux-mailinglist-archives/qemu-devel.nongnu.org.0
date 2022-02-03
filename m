Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D85D4A8D08
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:12:57 +0100 (CET)
Received: from localhost ([::1]:49398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFiTQ-0000AD-Bl
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:12:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhcm-000248-5O
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:18:32 -0500
Received: from [2607:f8b0:4864:20::1035] (port=40531
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhck-0002F7-7a
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:18:31 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 z10-20020a17090acb0a00b001b520826011so10930751pjt.5
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=53ArPqORfrQgTzup1/6eK038xsx8Kl+Z0nexhJe9lsI=;
 b=Ev+gm4j8DOXSHtjR7yTfaSt8iWLMqAIiTVnc8J3nGxgL+CCkWl9jqdPWjTPKOhfYLy
 q0uIWX/elxgjlQKxV9HJ8EBfXVUxhEawdwRQmqo7XCSX3ny27ZwkvmCDNjb/EUsTdeza
 a3VsxJHeO6yyCHnhv+PLC+lm7093vtL868fxyuWrye2DAQIBXOjnKlNxLGvUZpMNabsN
 Fi9SQ7jqupIAnIzoEO/CkDpv8WylsNhalqxN6ImSA3OMUu6UiwB9soGN++P/h24UkTnR
 rS7UexZ3l4p4gjVjxnluEv7dmgEru+I9rIKrGx9cYi/PuCXt29k/5lsqi7FXfwnhoXbR
 Pnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=53ArPqORfrQgTzup1/6eK038xsx8Kl+Z0nexhJe9lsI=;
 b=alcZMWW7KP6iIK3SDQE2F2sAXMsP5dcFhjGMP295O2ufRSM6/GpZhxzYwzQRlk1DMN
 YMvcvFASUi7UtUdXUAeiHmLbM+BggYgpJiBs65XjidcH06+Np1WxHhNnZ0Jk7B8LOOlU
 LTH+Pv9kInet1G73fLY1wQLsAaDObyLq561CKMCbpbjju84Bt1raIstWtrWDlL60VaEj
 S+H1lVSZOSgjDPckf6h8TkoWFynyT3Q+r4IJNOMHgRgpl+OnOkjJdBiyX5o7fvbEAMD9
 GfdB6+nbnEs8FZu+UCUC53P/2Z7Na/TxD6JvA3nCrjPQxWTuFXvqLx25caSLToEnCX3M
 mIJw==
X-Gm-Message-State: AOAM531UwoSuy9wXEgtPhfrY7fvUJxJcd4ECgvcRVMWx6GFI64IMY9ly
 s+PMg20GslUCj2axgY4BQQMG6aQXW3I=
X-Google-Smtp-Source: ABdhPJwRMcJxLaQqyaucqyDZZGN3/TBcZdpLEfIKUaS1QugEep8h/4nAg9n8hBInF6YGWBzmilrZbQ==
X-Received: by 2002:a17:902:d044:: with SMTP id
 l4mr37586531pll.5.1643915908750; 
 Thu, 03 Feb 2022 11:18:28 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id u18sm31076562pfi.185.2022.02.03.11.18.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:18:28 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 01/21] accel: Restrict sysemu stubs to system emulation
Date: Thu,  3 Feb 2022 20:17:54 +0100
Message-Id: <20220203191814.45023-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
References: <20220203191814.45023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/stubs/meson.build | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/accel/stubs/meson.build b/accel/stubs/meson.build
index 12dd1539af..0249b9258f 100644
--- a/accel/stubs/meson.build
+++ b/accel/stubs/meson.build
@@ -1,4 +1,7 @@
-specific_ss.add(when: 'CONFIG_HAX', if_false: files('hax-stub.c'))
-specific_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
-specific_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
-specific_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
+sysemu_stubs_ss = ss.source_set()
+sysemu_stubs_ss.add(when: 'CONFIG_HAX', if_false: files('hax-stub.c'))
+sysemu_stubs_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
+sysemu_stubs_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
+sysemu_stubs_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
+
+specific_ss.add_all(when: ['CONFIG_SOFTMMU'], if_true: sysemu_stubs_ss)
-- 
2.34.1


