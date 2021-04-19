Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968F4364A71
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:20:37 +0200 (CEST)
Received: from localhost ([::1]:54902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZRk-0007el-Kt
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZPl-0005uS-DQ
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:18:33 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZPj-0000y6-Vd
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:18:33 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c15so26235160wro.13
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pi4Yqp/Ga3uNxjsupGFLY1gAQ5ebMQowaCuPTS7xonw=;
 b=MfFAGYhNTJSwbC6t2CU94Ccq6va8Po2S2i9nydoA7azvNCnXcUq4Siz8WF9FiIgwFu
 h52pWk+pPNNZEfYR8qNHdEUg5hbQGVeqEnrTus8s6rgDeCoK+/o/LU6+q3G679M/QfG4
 jzOyFFDAJTXxHG/BFANPiZYVZYEbHOXuXh/hvzFtAo8MBD67wqUuHwwsxQQrKWvf13q8
 xEewZYdxbgd2Hc7YQ8oPivnneq4KiB02sO1ZaFk4tPftcJhjdyTJU9h848siQord2wWj
 PY0fc5MdSVxICbCFd/+cNZ6mb/f8tNRaIylTrHzlKwzV/ryMQhczw0LH8DhmYABD3QIW
 3WRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pi4Yqp/Ga3uNxjsupGFLY1gAQ5ebMQowaCuPTS7xonw=;
 b=NSr/soMkLhAORCHpjrlUzs/6kGopfYfT9eHfOxh3wbbhqg11PT3qm3BsHqZYlr4qoz
 fHdpgn3TL/xeDtSBMoqHNmmI9y6MIMSyX77Do58W1TO6l16XHNQnzJMH29gv4594PC/G
 r1QVdXIzgDqol8q21Y6pKAiYcQWq6nJ5PWTacC+rWBv19PvlXjYhY/o/UvI4peZ3EfUa
 7Hq9jTtLBozEmk8midtBUA7TfMIbh0AZCBkL81ciSQC0dViWjqUyTye6TyMeKA8XZBtP
 1LKz8OIw2BTfBHrNAda/OcfLsSSpzIOoDTu1xvW/89aPN0q0C5+6af+sfPfgdwlePtwP
 KzTg==
X-Gm-Message-State: AOAM532syIyXmU4cx5CT0MnBv+PwFaxnkf3yQYruEVMHMSt+yek/FSX6
 126HG0xJXnwa5TvXuZiHE+i3ix32njKoIw==
X-Google-Smtp-Source: ABdhPJwbH+mBtdLwl0+wvzq4Xn2JF1cKppojS+1jkY9jP02xNiPUpT4oTeNxoZrAcxBak6cHt2FzeQ==
X-Received: by 2002:a05:6000:1aca:: with SMTP id
 i10mr16385482wry.194.1618859910013; 
 Mon, 19 Apr 2021 12:18:30 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id k7sm23595803wrw.64.2021.04.19.12.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 12:18:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/30] target/mips: Simplify meson TCG rules
Date: Mon, 19 Apr 2021 21:17:54 +0200
Message-Id: <20210419191823.1555482-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419191823.1555482-1-f4bug@amsat.org>
References: <20210419191823.1555482-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have the mips_tcg_ss source set for TCG-specific files,
use it for mxu_translate.c and tx79_translate.c to simplify a bit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/meson.build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/mips/meson.build b/target/mips/meson.build
index 3b131c4a7f6..3733d1200f7 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -26,10 +26,9 @@
   'translate_addr_const.c',
   'txx9_translate.c',
 ))
-mips_ss.add(when: ['CONFIG_TCG', 'TARGET_MIPS64'], if_true: files(
+mips_tcg_ss.add(when: 'TARGET_MIPS64', if_true: files(
   'tx79_translate.c',
-))
-mips_tcg_ss.add(when: 'TARGET_MIPS64', if_false: files(
+), if_false: files(
   'mxu_translate.c',
 ))
 
-- 
2.26.3


