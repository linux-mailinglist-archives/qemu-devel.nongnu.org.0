Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2A26D462A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 15:50:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjKYq-0002ty-5H; Mon, 03 Apr 2023 09:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYo-0002t0-Lx
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:26 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYm-0004tX-6v
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:26 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 hg25-20020a05600c539900b003f05a99a841so240162wmb.3
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 06:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680529762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dHHLYJ1Q7CDYpzOnQyJie+UJ0r74Mi54/+ouByLjk3E=;
 b=CWzuya7JW2bY34opxAKYIrNfyS65J2Ve7Op8RUvVCTJWgo8mFVV0WttZ5XTBIOpOuw
 qEc0uVEkLj4BSXrkGYzQuo4l+mgtk1/Cg5F8oZdEugZIT790Y3kd7/R/ROH79z7UrZQ0
 v3Sn6tKQEDY9L3zgiYs7vsdbe8VCOYPEkeTzMCKl6g63yKNr+tFOllZTZi0lmaKWowSm
 PARwtkZgJ1mpnizEjF6BHJMoGJzl5i5cHzOy7KasRbZka01wrMHVeI0zfyoEPcjqUfVu
 oF/kl0e4k2mu2v96VOyu3vif1056EhDnaETNYv0h58W43SS6YkTyw2bu6X5j4qNswFKj
 vOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680529762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dHHLYJ1Q7CDYpzOnQyJie+UJ0r74Mi54/+ouByLjk3E=;
 b=I06xUuPu0UDUOxMDH3/LQDW17aYDXsYCcxJnqLpWgJo0/c9VWyRTxDibKOR2p2i7eU
 j8LfITFajPwYyFR6fOGZ4omLyNV2JGGivqr6R50O1hKTttK40UNn0I2W+flS5HvSACVW
 E4b24vt2nCAULWNca9JJ3RfX0PktsHXgswvdE+NNEMLkyiB9yVjVUWTBPo56Jr21LUKB
 KWyvaD82bTmMwKv4REF/uuxe36y8IumHyH3G3yxAIs5L6gHlzmzjawHuyvUEUEC5hS0V
 cMb73M37SK1kiAlj8cIbDoAvUIESSuUI9PQrOZEchvCU4Suw9IoniQumtNtbfa8jSP/4
 u+Xw==
X-Gm-Message-State: AO0yUKXdzopt+7xjQeXkmdEtGk106xpti100Y/j5/G3kfzUHbrZ1vHlI
 P4QQp2r1klSUj4mroTLiNbsONA==
X-Google-Smtp-Source: AK7set8bJ8p2Mjm4rby/PfqCRzfAP52hZFXF8mjkWC1Vnn5qr98rrvtqR8gLVZ45HJE2Z+KffldK9w==
X-Received: by 2002:a05:600c:acb:b0:3ee:4f92:907b with SMTP id
 c11-20020a05600c0acb00b003ee4f92907bmr26589298wmr.14.1680529762237; 
 Mon, 03 Apr 2023 06:49:22 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 iv19-20020a05600c549300b003ef69873cf1sm19941464wmb.40.2023.04.03.06.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 06:49:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 05D4F1FFBB;
 Mon,  3 Apr 2023 14:49:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v2 03/11] gdbstub: don't report auxv feature unless on Linux
Date: Mon,  3 Apr 2023 14:49:12 +0100
Message-Id: <20230403134920.2132362-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403134920.2132362-1-alex.bennee@linaro.org>
References: <20230403134920.2132362-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The later handler if conditionally compiled only for Linux but we
forgot to ensure we don't advertise it lest we confuse our BSD
brethren.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Fixes: 51c623b0de ("gdbstub: add support to Xfer:auxv:read: packet")
Reported-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Tested-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20230403120250.2071560-1-alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 2a66371aa5..0760d78685 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -1468,7 +1468,7 @@ static void handle_query_supported(GArray *params, void *user_ctx)
             ";ReverseStep+;ReverseContinue+");
     }
 
-#ifdef CONFIG_USER_ONLY
+#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
     if (gdbserver_state.c_cpu->opaque) {
         g_string_append(gdbserver_state.str_buf, ";qXfer:auxv:read+");
     }
-- 
2.39.2


