Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32746284B6C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 14:12:04 +0200 (CEST)
Received: from localhost ([::1]:46498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPlp5-0004w7-8V
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 08:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kPln4-0003Ds-Rq
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 08:09:58 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:41772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kPln3-0004DA-6z
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 08:09:58 -0400
Received: by mail-pg1-x543.google.com with SMTP id g9so7364405pgh.8
 for <qemu-devel@nongnu.org>; Tue, 06 Oct 2020 05:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vwWICdvW/zCGPD13s4UEGsuus824XjxUxjGQ4brZjgg=;
 b=bdAbn5U8O55gv9zt0BgJZGlpIr+TwRiQh1uosXXFEnxNI0lujoYGScM5iNxFwQ/9/f
 u321hqCbTRFyqWlzHtdovTZu7T6H8fJC8DcjOZZl2tDwoizW/VbsiAL4xcWUzgeQngxA
 Vw0Yteh9jx7OK8x/e0oCej6/zEQtbuZHVUvBAERKmuSh8z7EZwp31t/wqeb8zRHl7fgS
 SgC0tf1BdA0UIzgHETLUCc5aD/Z/n8YQcpKYWvG17cxp3LAjxLj+BZFDAxzn8AcqsdSI
 IyBYnsd0O7uh2TGvOeNK1j29ddfCJ/fVSHec/IM4DOn2rBjc7pFp2LLpyiYWApAO9MIx
 r1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vwWICdvW/zCGPD13s4UEGsuus824XjxUxjGQ4brZjgg=;
 b=LZoWpQiQgyqGfnXH+stljQ5ZnLftSuB6/sOV1+3TyCKmSYiswRd+eyB0EoIx4AQKEj
 KJ31eeYgEk89RkLrjJESUdl1PnhzFtzf1MsYNHYxX+mjLBTw4jBu1OqYRHIKsXH3dKhb
 7+u1RkDBXmsc5iCGrQ2eNOXzyIOHWdkoVIZueWYB8mLfkLNGYH7vqYSbydy9dTwCxPNF
 sO2BS1geeBnzS9Xpx42MdlftSHc5crrJfMVZ/mLb4cNh3q6EMdxW/gOTkO0ftkznRjt0
 ZwoWMEWABNtcJaTm4I8gKP+/l2PeHY2mW9t9Q13tZbkVgNWEEN/dht1nAVnrjuOb/pEQ
 eiRg==
X-Gm-Message-State: AOAM533z8MNL932B30a0k9sVAP3VMSqQOpf1uqwFPPe9LyHOMPiLhvRI
 iiKwPFB/GamWoDicuhbNR9wUBUXJcDrKfQ==
X-Google-Smtp-Source: ABdhPJwRFrysBkPxm75fACk4FnTODJOElwZIAW+fn0oi4Clr2JG5ZEsQkO2479DU0QqyXxsznK2TDA==
X-Received: by 2002:a62:6c2:0:b029:142:2501:397c with SMTP id
 185-20020a6206c20000b02901422501397cmr4196363pfg.65.1601986195433; 
 Tue, 06 Oct 2020 05:09:55 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id f4sm2965681pgk.19.2020.10.06.05.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 05:09:54 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/7] plugins: Fixes a issue when dlsym failed,
 the handle not closed
Date: Tue,  6 Oct 2020 20:08:54 +0800
Message-Id: <20201006120900.1579-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201006120900.1579-1-luoyonggang@gmail.com>
References: <20201006120900.1579-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 plugins/loader.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/plugins/loader.c b/plugins/loader.c
index 685d334e1a..8ac5dbc20f 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -235,6 +235,7 @@ static int plugin_load(struct qemu_plugin_desc *desc, const qemu_info_t *info)
     return rc;
 
  err_symbol:
+    g_module_close(ctx->handle);
  err_dlopen:
     qemu_vfree(ctx);
     return 1;
-- 
2.28.0.windows.1


