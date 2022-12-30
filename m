Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D4B6593C9
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:22:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2sM-0003o0-D1; Thu, 29 Dec 2022 19:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rX-00039H-04
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:05 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rQ-0002f8-7P
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:00 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so20260341pjj.4
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WRnYCcPWX5BOQQf1a59sccPy8bi18QDF38eChoryi3g=;
 b=fddGhnrit6uLD0IY1PsgSgxr2j+Irtqe/mcmGcCeeIGqaST4bcThiIEJvcyFkY9lRf
 k81MFDIAaeLt+L68nJc3hoCNIe0X1u5j4Ut0qDaYbkJJAVTC4fqG42XBH204zR7wqSDL
 HpyTARBORX4tzCTzBQeohE5U/2nZHbt8s1PEy6q8oOSLUgXSzmmLrxE2Fe7H7OXl37fF
 VJg53oKfwyKVGc7RA0xnEPDHP8QrlQlP5agQBLpAoDdH9U6cajxcOnaw3zMevR4yq01P
 qcgmdvxIey2JBXSXAVcJKGDfhfX2vd4phOCMS+3g0HsquO95x9K3WdIgVpISf7JEp5lp
 WZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WRnYCcPWX5BOQQf1a59sccPy8bi18QDF38eChoryi3g=;
 b=62saUgMYNbVZYMWaTeRlN9jSdOxGpF8CrRPuaGFj2x8EzdYQ3ADpxsNbQpNMH7YJu8
 0SswmhN80p9sBXRwzlISBvcVmNOf4Oz2/wZ0Ilbpeegfzwyr6ALAvPz/zYIvjM3uYOGJ
 rbCyIcIl2RD6wwo3qZCjf0qJzX+KxihQCnwpOz5kCWjoKNAlKAIdfo4nrQpci4ndeKG6
 KgfXRnxKHtTR3JGbVrSFNcWaFIVTPBMhlPJjZfRzVY8oKJB6/+KkemSwH25PTqN0v5v+
 CVI1pUJSwMtRw1QDU+B1IE8wrFjuWTai2oTGiFIMB1m2qBlCqN+NqRJWovEYv44rzdFK
 BfLA==
X-Gm-Message-State: AFqh2kq38neU3J6Aaju18HCky60kRjEYX0sYmJ41uW+d2NS/0hIhkPJ1
 2kNsgXpDdFlcl05vkvexAr/F55Mr8vS0dwAS
X-Google-Smtp-Source: AMrXdXtUQ9tDdgGYTXzp/VU2QhBugna4JCdN6KTKW2lRosbPNZpYyg9wuyVev8I3Zsm9tqYYxCaoeA==
X-Received: by 2002:a17:902:ec89:b0:186:b063:32e with SMTP id
 x9-20020a170902ec8900b00186b063032emr45957411plg.62.1672358573167; 
 Thu, 29 Dec 2022 16:02:53 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 33/47] accel/tcg/plugin: Avoid duplicate copy in copy_call
Date: Thu, 29 Dec 2022 16:02:07 -0800
Message-Id: <20221230000221.2764875-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

We copied all of the arguments in copy_op_nocheck.
We only need to replace the one argument that we change.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 9e359c006a..77e6823d6b 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -397,9 +397,7 @@ static TCGOp *copy_call(TCGOp **begin_op, TCGOp *op, void *empty_func,
 
     func_idx = TCGOP_CALLO(op) + TCGOP_CALLI(op);
     *cb_idx = func_idx;
-
     op->args[func_idx] = (uintptr_t)func;
-    op->args[func_idx + 1] = old_op->args[func_idx + 1];
 
     return op;
 }
-- 
2.34.1


