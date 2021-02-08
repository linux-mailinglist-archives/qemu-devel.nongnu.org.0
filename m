Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6F9313D73
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:27:55 +0100 (CET)
Received: from localhost ([::1]:50444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BGM-0005oP-Fu
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:27:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l94oY-0003xu-Iw
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:34:53 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l94oP-0003uy-LQ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:34:46 -0500
Received: by mail-wm1-x32c.google.com with SMTP id i9so12914820wmq.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 03:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NRipOYGkJlw71cozvw80LImxtUVgB5q/r0TWkP1rEHo=;
 b=qOnnBnrNcGeBw7byLNuHyvFjRTwZe0O8F8nM6nv01CdlRtlTim03fdePgWin0EQCG4
 JokRH7vxEb1aqJERyo/P7BUHP0IeCg/wa9v8ItZ8Qnx79vCPzcbgAbhr8Jna4Zde8omn
 XOR9cWkuoi70lNrP5/KKlp+GStb7oQLKM4A7EHomxpXT5xd19zo1R7/1mBc0eeZJ+O3I
 HOsMhAI04v38c/nCdT17aQzwZVSAErMX2UoTKXbUpV4mh0smAQ829Mtilz83u1tmn4v+
 5vy21pswTw410eMZ5OeqUR/t6wd8c9KjDW3lQY0TXY+H7xdlk6xDLoItkB0H17kFP1pw
 E9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NRipOYGkJlw71cozvw80LImxtUVgB5q/r0TWkP1rEHo=;
 b=MuC8gGQFcCvBh6M3lWdvMvPorumrTepvKIuMETn7pnDC5dYFKyxZ1xYjn0r7XDd14g
 kso6+Rm4r+dvHAXBcxkCU78KTzHk/EVIvsNIPMfqAE1dkhQvyKfxcxyMNQDwHLX9/Hdj
 DpboVqqAs/6iEQEJfivwADbwS3mHpp1s4FVm7fJKB5dvzQth0kwuaCUSu/o4zK/6zKiU
 LE4KpXCfszSgxr37jwotDFNQAGQNgaUclCEKh28RJtATeoMKQB2sE1+OfJl8U0wbwT5O
 ITlN5NSmGD04EMCqOGWM2bI/47kUcnEiG9kIF/JTdHmva8kxK94YQm9gFL64PSZ+J0nr
 uZ6g==
X-Gm-Message-State: AOAM5333FU3rhS5ON75WPnolTjWyXUkk7Gg0MtCz8/VD0+pxhcusL/rp
 yLMMqR6HhJX1MQ+c8pJIAtPh6F42V0ZELg==
X-Google-Smtp-Source: ABdhPJw/sNXRp51imHj58BIrcuT9hhY86sk5wt/ywjWaT1C9YFB0RKvc1YXctX3LFp2Dkt02wW+jlg==
X-Received: by 2002:a05:600c:1986:: with SMTP id
 t6mr14269979wmq.92.1612784076230; 
 Mon, 08 Feb 2021 03:34:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a21sm16818134wmb.5.2021.02.08.03.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 03:34:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] gdbstub: Remove unused gdb_get_float32() and
 gdb_get_float64()
Date: Mon,  8 Feb 2021 11:34:27 +0000
Message-Id: <20210208113428.7181-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208113428.7181-1-peter.maydell@linaro.org>
References: <20210208113428.7181-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The functions gdb_get_float32() and gdb_get_float64() are now unused;
remove them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/gdbstub.h | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index ff0b7bc45ec..a024a0350df 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -135,26 +135,6 @@ static inline int gdb_get_reg128(GByteArray *buf, uint64_t val_hi,
     return 16;
 }
 
-static inline int gdb_get_float32(GByteArray *array, float32 val)
-{
-    uint8_t buf[sizeof(CPU_FloatU)];
-
-    stfl_p(buf, val);
-    g_byte_array_append(array, buf, sizeof(buf));
-
-    return sizeof(buf);
-}
-
-static inline int gdb_get_float64(GByteArray *array, float64 val)
-{
-    uint8_t buf[sizeof(CPU_DoubleU)];
-
-    stfq_p(buf, val);
-    g_byte_array_append(array, buf, sizeof(buf));
-
-    return sizeof(buf);
-}
-
 static inline int gdb_get_zeroes(GByteArray *array, size_t len)
 {
     guint oldlen = array->len;
-- 
2.20.1


