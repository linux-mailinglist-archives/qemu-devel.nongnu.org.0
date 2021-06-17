Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCE63AB31E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 13:58:04 +0200 (CEST)
Received: from localhost ([::1]:44502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqep-0006QR-Cc
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 07:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqax-0006sU-2O
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:54:03 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqav-0005Iv-Kd
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:54:02 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e22so2861297wrc.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 04:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+jgVQlH2ZLclahkepwe/jy0S2FD3dNErrT3z+1Ksb0M=;
 b=Iwd60xuZjpJGwG+LwZyaNmfItJOD/FJ2+T93IOBnxXDHNhzaNSphuSSBCgdcDORg5b
 QfI1i/JKSH63W20qI/eV56RRdknMuOkefb9AuzNU9ENEK99zb1RvAPGeMCT0Y/iPBpQX
 1FHtH7c3TrJ49O9kSLQ7kXWjjHHVEi0gMYsLaR48gdpWvVEBNfQpzQOdh+nAo8eiyX9d
 k0yQuXnYqLgiJFixd+vEqmKzeutJLf5HyIuhwjvffpEEhtSvc76SeIPvvq5VWdiIt3s2
 r9S+gM79r713P4MnyJMehzXB0RvS9TMkmtzBSQtz7dOjChZTQ2QAoUTKIeOECASZgxEo
 5viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+jgVQlH2ZLclahkepwe/jy0S2FD3dNErrT3z+1Ksb0M=;
 b=iIILDffhUs8kerATi69zc3fiOE0edGm2Agl7TtnMwUJgZMZPLodPxGqtBBiwaVt1yb
 B3ApV3wx2JwR+HWA2zGdpHGFkpB8ZPqTlHYPmnHmXnGclWQ01cOC6uF9VUFagmL/H0VR
 tTMzSHBr3PtDlZDxkUXAx02jkhjOCcXh+sTH7TM7XwzR9ULA0FnCkWVJBRMwL8e72iWo
 YlMutAFuk+KatYHHp8ZQsZdh5UxQ9f6PZSQrrfZOv2IXfMgCwn865wCjSFsl91vi+Ihy
 nC9PJRqvOSpc+sh/wnKa19x7frwn6KhDVGaNXXZmnga2Vim14JYsQKglA3DHwTyaWDej
 UqwA==
X-Gm-Message-State: AOAM531ia2txfOwIGP089OfCyauKIF+ju6tk3U1phRmFNMcg55xngJEM
 ueucNhwnrSGSYaxBXfZ5Jo8IMayXWjB2jg==
X-Google-Smtp-Source: ABdhPJxlMaX6LbeJQo3w9yS2feZHWLGxEY3MUsI+tIk2OM/1mSFaqoERiQEGTP8gYN6DvYvQ+fcwlw==
X-Received: by 2002:a5d:51c3:: with SMTP id n3mr5171928wrv.322.1623930840006; 
 Thu, 17 Jun 2021 04:54:00 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id t9sm4646977wmq.14.2021.06.17.04.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:53:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/15] hw/i2c/ppc4xx_i2c: Add reference to datasheet
Date: Thu, 17 Jun 2021 13:53:24 +0200
Message-Id: <20210617115334.2761573-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617115334.2761573-1-f4bug@amsat.org>
References: <20210617115334.2761573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It took me a while to find this model datasheet, since it is
an OCR scan. Add a reference to save other developers time.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/ppc4xx_i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
index c0a8e045670..f4c5bc12d36 100644
--- a/hw/i2c/ppc4xx_i2c.c
+++ b/hw/i2c/ppc4xx_i2c.c
@@ -1,6 +1,8 @@
 /*
  * PPC4xx I2C controller emulation
  *
+ * Documentation: PPC405GP User's Manual, Chapter 22. IIC Bus Interface
+ *
  * Copyright (c) 2007 Jocelyn Mayer
  * Copyright (c) 2012 François Revol
  * Copyright (c) 2016-2018 BALATON Zoltan
-- 
2.31.1


