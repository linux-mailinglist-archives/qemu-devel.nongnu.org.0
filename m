Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 919335640A4
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 16:10:33 +0200 (CEST)
Received: from localhost ([::1]:54008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7dpQ-00026B-LL
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 10:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dcE-0006sQ-4w
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:54 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:40674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dcC-0000c2-OV
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:53 -0400
Received: by mail-io1-xd35.google.com with SMTP id s17so4727870iob.7
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 06:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jr2ulGcMEKrHmmAlCFEgoWkB7hLef5OTmCJlYGF3poM=;
 b=0YGja7Nwvit7klDaa3jfr2JaHcbIhVDlIsAdG/DrqvqZgGA/1x6Nqw7g7xP8QjHCrl
 Zze4SRQghje0xV9loc+G+s0L1UA7nKL1UwfF6QM0JUsokuTjTG5BB36jRFvQNz+hnBuK
 IIunzV3SVPafyQh10Xw/LpyUZCm4IMtZZmhJ4BFq5L9mCYseJYjDz+C7TTZCwUedtPTo
 /untV2fX64JDM27IpjKoourSdr52wwhfK0IOG77uKNAc0Ip/rN9UXKr1WCNh0LPqnBh7
 t/bGL2mCQDwZYaWoTQ+q38vkn/x1RZYb4GCB3ljKkNSbbdFz9/w3eqYYyYrSX98r8/eV
 gjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jr2ulGcMEKrHmmAlCFEgoWkB7hLef5OTmCJlYGF3poM=;
 b=EQPXNZU2li3RAT3r72YR/ODZglFaxF8PZ9SH3Qnlvp4keJuYj+pY5NpZ5P6365uvte
 0uMAC517INDNWTE3VIhFdutXN8rg/xYl7H7n0RHDEOPzuvoPoOOllSKAMjDubtMJL83P
 hVedboOpqvUrEG9l52DVRGP+hbBIivcPLetTCaK/NuIVKJna0/YdEUXnTHZm4jGzimKO
 n3Oh0wEqmCLpXxgUMue0Hkqdta7uU8SjRctSMLG6eQHITpy/4FLOFABC6u0Xs1aiMEob
 ZQkHx7RFGI91Zx5ijII5qVcJH+WFtg6HmOxtwVnf/Ehpx+yfxwc5YvIul5r/HeGika2j
 5unQ==
X-Gm-Message-State: AJIora+H4Rdup1oFInWsSSSo9ELTNaokKP9CQqWPEbVdwP+bv/rJTvGQ
 Uip0/eMDLl9Pl0j4aKAZM5xEBwIGJ2bEvQ==
X-Google-Smtp-Source: AGRyM1ssuoPevqOblct0KwuWRJfwYXZS++F6ZN6hJ432QCdmVYO8HsJbHHXG7oi45t4Z6VCDLQwYJw==
X-Received: by 2002:a6b:6512:0:b0:674:ee9a:21fe with SMTP id
 z18-20020a6b6512000000b00674ee9a21femr10427488iob.168.1656770211559; 
 Sat, 02 Jul 2022 06:56:51 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q189-20020a6b8ec6000000b0065a47e16f4esm11584278iod.32.2022.07.02.06.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 06:56:50 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 11/11] bsd-user: Remove stray 'inline' from do_bsd_close
Date: Sat,  2 Jul 2022 07:57:06 -0600
Message-Id: <20220702135706.73622-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220702135706.73622-1-imp@bsdimp.com>
References: <20220702135706.73622-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In the last series, I inadvertantly didn't remove this inline, but did
all the others. Remove it for consistency.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsd-file.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 108a5061850..588e0c50d45 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -252,7 +252,7 @@ static abi_long do_bsd_openat(abi_long arg1, abi_long arg2,
 }
 
 /* close(2) */
-static inline abi_long do_bsd_close(abi_long arg1)
+static abi_long do_bsd_close(abi_long arg1)
 {
     return get_errno(close(arg1));
 }
-- 
2.33.1


