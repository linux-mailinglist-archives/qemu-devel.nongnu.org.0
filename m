Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D92DF31E322
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:42:30 +0100 (CET)
Received: from localhost ([::1]:38128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWSj-00017R-Us
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:42:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWQy-0007k7-Td
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:40 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:40739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWQx-0004aN-Df
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:40 -0500
Received: by mail-pf1-x429.google.com with SMTP id u143so29138pfc.7
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8XLEYfrw+e5ZQ107eIkxpz9hmRgx7WUPnLtGSCd3eE8=;
 b=WUwtrjqV4AVoUfw7POgGDP1UdCWp438bcwzRoEF+1o102AW6ckTMpDu/v+2ddU/vgq
 370ZVwyr42zHpimfm4oHXLj9P5pHb+eVTNLp8zuHIZHb3FOVdXB7Joz5kdZLBpF8JB14
 q+F4iVlgho8lgsAoNsXM5AFusYyq3BxLKjgThTTZC+/LPmyGFLbd+HaRTmc34PCOcyDj
 4IB8BuxpIwJ/CBQPd0xsbAvNhk9RjroWh2ipGxb9MOgBpS2JRc2yEog8bEDfDojBlWoJ
 22YEs0krVBVZ7zEdXmgCPQOV7E9cETk0CMzLlGgyc15zyKmruh0Zy1IjZe8ZnMrGUE2N
 jSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8XLEYfrw+e5ZQ107eIkxpz9hmRgx7WUPnLtGSCd3eE8=;
 b=sH7ogV/Ppu5+UUC5XrxlH5o3wb/X281XGIX8ETxMGOFtBJ+e7obtABljjHjJBCP/Ht
 99HPllgsiYHwtTKgybqF3RRerstovCFCP+mxo24TbR7mzSN7Xgc84X6HEWc8ivYsixT2
 eZNFqWyZ8mNGJvJHW6xQDYWAZCm020GZPgz67G+IGzt94KMMDKKZc218PIiIh1lHOx24
 vnekt+rI1b8A6MaV1cWP90vzuM/rB44FIWgT41dUk1Vc9wstiA02i7FCNcOXRc2dw+WF
 sen1GouAzZPOSs/nmE3BAsNUgCXlEaRvUoA2Aejf82FMK52Gp/C5WGG2WjVKe0xC7Wl+
 jm9A==
X-Gm-Message-State: AOAM533tg4NbSVAlJ7Rv1BCZZtSwZYzkQpDrILSVEzT53EEW/56kd3Tq
 8z4qgtPEdXSvtBJRsveGShiolrU1HsEobA==
X-Google-Smtp-Source: ABdhPJzByCW/7B23MvKA2Q7CQEHYkSE5a4OtvQt3jUbND5VhoNTqP1Z5qJ5uJQ5bu0+2KcqzsNkGiA==
X-Received: by 2002:a62:8453:0:b029:1e4:3a6a:d5ba with SMTP id
 k80-20020a6284530000b02901e43a6ad5bamr1563184pfd.54.1613605236665; 
 Wed, 17 Feb 2021 15:40:36 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:40:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/35] Hexagon (include/elf.h) ELF machine definition
Date: Wed, 17 Feb 2021 15:39:52 -0800
Message-Id: <20210217234023.1742406-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Define EM_HEXAGON 164

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1612763186-18161-4-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/elf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/elf.h b/include/elf.h
index 7a418ee559..f4fa3c1cd4 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -176,6 +176,7 @@ typedef struct mips_elf_abiflags_v0 {
 
 #define EM_UNICORE32    110     /* UniCore32 */
 
+#define EM_HEXAGON      164     /* Qualcomm Hexagon */
 #define EM_RX           173     /* Renesas RX family */
 
 #define EM_RISCV        243     /* RISC-V */
-- 
2.25.1


