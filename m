Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97403465A8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:49:50 +0100 (CET)
Received: from localhost ([::1]:43190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkE1-0008N2-Qb
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjKu-0006KT-4W
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:52:53 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjKg-0003uI-RR
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:52:48 -0400
Received: by mail-wr1-x433.google.com with SMTP id j18so21283365wra.2
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 08:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2tqEBEhucvZcgWy/Gv5gUAbVkIKCsYndhLQthoTcvxQ=;
 b=cKZ+lq+ADunFv7l+2A7y34777RxN18u0xW4rznOGl6JIP+ZGaDrrjPd4gEYOfBYevD
 br9Xafag0uMZdj9a+3jPOd5V7f5y2x5Z4BsRXNgy/LfeleyJwKU+YYIGOX2TPgjUmB8M
 ZYyZ6x8m2YTvjgNf07nG+RUTZ1oxm6RZoTRBrYUhgxwrcVzwdcRO23kgU/0Onqs61DZl
 KHB0QnHtBaDFynS4ZFsAqwowhpcQGfbunpEOGk7KwdZ7Lp5l/pwiFyC2xQpzCZrV618J
 fuxml/uG31FeUCIhrdkTp28Vej6Nr9vUv7v4UQl6p/JMmJXydfFFyAuwXlLqrBIIkwu8
 UyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2tqEBEhucvZcgWy/Gv5gUAbVkIKCsYndhLQthoTcvxQ=;
 b=QJw6qdh5ABPBEi/9rXlPvfNHXfx2CPqAQDoo+fp50zfSKCoXyZLQFPVNo1Q1TjpLsi
 3GGruCerIQjIsFA8uUeT93MpA8NgmSfJqK2QKiMuPiDyBWoppt7/nHQdq+j0/zz+l/w8
 UeFAzpoX7jt00cR+7eR/6e3scP9bJXJpt0QJaJG+19U/3qsYInEgdKEBXGVx+J1MBzXD
 nf4VFfQMIX0lKeiZQUg9S4A89jMHq2eaP7hxw+DyVqcb6/ZOfbEYG1i9aKnoiEI0jgIl
 87bJoiCDyeHZZpEAfuEZyg+sFyGfrXyHUvUQ5UkmJKk8f/At1euUByBeJ8inpdGEzTYD
 Yp0w==
X-Gm-Message-State: AOAM532dvikTpzMLFJQHADWxZ1rwpUdSuUZheBuj7ZwqBiUsomRGQbUu
 UKnIouPHvuRoX60/MywP1SVJLvwMf57IQQ==
X-Google-Smtp-Source: ABdhPJw1f142JLVfRiMoZ5HW0dvrlehLaxwmjAVKAT4ostlh8buEh8bM8bKQiDijWqefA2J0P/68tQ==
X-Received: by 2002:a5d:628c:: with SMTP id k12mr4645497wru.316.1616514756151; 
 Tue, 23 Mar 2021 08:52:36 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h25sm3368979wml.32.2021.03.23.08.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:52:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 13/13] meson: Only build ROM/BIOS when system emulation is
 built
Date: Tue, 23 Mar 2021 16:51:32 +0100
Message-Id: <20210323155132.238193-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323155132.238193-1-f4bug@amsat.org>
References: <20210323155132.238193-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As it is pointless to build ROMs/BIOS for user-only emulation,
restrict this directory to system-mode emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index e484670c5b7..457a07047b1 100644
--- a/meson.build
+++ b/meson.build
@@ -2378,7 +2378,9 @@
 
 subdir('scripts')
 subdir('tools')
-subdir('pc-bios')
+if have_system
+  subdir('pc-bios')
+endif
 subdir('docs')
 subdir('tests')
 if gtk.found()
-- 
2.26.2


