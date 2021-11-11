Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0667144D5C0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:23:14 +0100 (CET)
Received: from localhost ([::1]:35692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml8Aj-00059F-6T
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:23:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml7vA-0005DY-G1
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:07:08 -0500
Received: from [2a00:1450:4864:20::430] (port=34495
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml7v7-0001kH-VD
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:07:07 -0500
Received: by mail-wr1-x430.google.com with SMTP id d5so9169692wrc.1
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 03:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J1v0TEt4nFAPDqyOkQCB7uRP6b4G3GMZ4DQtpMIJcMM=;
 b=WUNXmJeK/GZTMCrNfFGMBbPqImbQuHgnuvORU6UpFVJbIU1sgQ6k7DzI0sNBJXAvDW
 xgGiJFXB1jSi84xEYqgNhfCkU54+rimozBcdeG5y+I6Xqcg2EdUg+RyGDiPp6PPM/MFN
 auY1IpGlW5QtfIsock4RA9YyJlzQvjZ5GaUT4aTrZR93WDaM6STsJQBTy1e3Qitozx3o
 Zht+7D2ZDBZNhqxeQk7jq826H4ME2H3Jzd2UXD3+1n+u3A9B1OEFdAb9Jy/J0blGG5A0
 7Ufv1gsWMt97Lgaleg3NxYn/lqry9FY/L2cv3084lrgCBFzl2RJvwP54RyDypxZ0bTbu
 H+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J1v0TEt4nFAPDqyOkQCB7uRP6b4G3GMZ4DQtpMIJcMM=;
 b=mqCZY2VfNEyzw1/K1x1JGerVlUFkOeilN1Qm2FejUm/+sIEy5XIodFrLgHZ0uw8sns
 PhipmQIiCnqZAcqBFfgVVCbNdmtHT9okrcpvKV+b5Abtg7fW5JPW/MgGg+uNusjpnSYW
 0m2Jw8t9BvNgh7VAW1ISV9ALrgO0yFJqQNnt+g4sxlGjET0lcmJlgtYTHxZ0fXR7jfRq
 l9L7bJsB0fdCcIARYim63ObqmyjqpMS+tV0bOqu1tPEA84PXP3ailO2GWrDyWGVODxvI
 LoiQavKPV/N0fD4K9qVw0B1WCIIcyO5qSC0k6QXUvwpEKhJXUz289ogMX7zHg8m76tW8
 n/Og==
X-Gm-Message-State: AOAM530vBiBw9yX8DnhkgVl3scJK86SFZmaPXg+P0N6AzeSJULHsC5T0
 Q2lzHwYhbjWSfOPg1AcMiIEKxMBWBi5B9yxlpPU=
X-Google-Smtp-Source: ABdhPJzrgxsA21QH8kTBShVbaO7jNgqEQA7j9mWIYBYKzh1Ut3qeyev0R9bc6yQmH8ErPSOpFodlaw==
X-Received: by 2002:a5d:4d81:: with SMTP id b1mr8111822wru.366.1636628824695; 
 Thu, 11 Nov 2021 03:07:04 -0800 (PST)
Received: from localhost.localdomain
 (10.red-95-125-227.dynamicip.rima-tde.net. [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id j8sm2536684wrh.16.2021.11.11.03.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 03:07:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] tcg/s390x: Fix tcg_out_vec_op argument type
Date: Thu, 11 Nov 2021 12:06:56 +0100
Message-Id: <20211111110656.237727-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111110656.237727-1-richard.henderson@linaro.org>
References: <20211111110656.237727-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Miroslav Rezanina <mrezanin@redhat.com>

Newly defined tcg_out_vec_op (34ef767609 tcg/s390x: Add host vector framework)
for s390x uses pointer argument definition.
This fails on gcc 11 as original declaration uses array argument:

In file included from ../tcg/tcg.c:430:
/builddir/build/BUILD/qemu-6.1.50/tcg/s390x/tcg-target.c.inc:2702:42: error: argument 5 of type 'const TCGArg *' {aka 'const long unsigned int *'} declared as a pointer [-Werror=array-parameter=]
 2702 |                            const TCGArg *args, const int *const_args)
      |                            ~~~~~~~~~~~~~~^~~~
../tcg/tcg.c:121:41: note: previously declared as an array 'const TCGArg[16]' {aka 'const long unsigned int[16]'}
  121 |                            const TCGArg args[TCG_MAX_OP_ARGS],
      |                            ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
In file included from ../tcg/tcg.c:430:
/builddir/build/BUILD/qemu-6.1.50/tcg/s390x/tcg-target.c.inc:2702:59: error: argument 6 of type 'const int *' declared as a pointer [-Werror=array-parameter=]
 2702 |                            const TCGArg *args, const int *const_args)
      |                                                ~~~~~~~~~~~^~~~~~~~~~
../tcg/tcg.c:122:38: note: previously declared as an array 'const int[16]'
  122 |                            const int const_args[TCG_MAX_OP_ARGS]);
      |                            ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixing argument type to pass build.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211027085629.240704-1-mrezanin@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 8938c446c8..57e803e339 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2699,7 +2699,8 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
 
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                            unsigned vecl, unsigned vece,
-                           const TCGArg *args, const int *const_args)
+                           const TCGArg args[TCG_MAX_OP_ARGS],
+                           const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGType type = vecl + TCG_TYPE_V64;
     TCGArg a0 = args[0], a1 = args[1], a2 = args[2];
-- 
2.25.1


