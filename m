Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1785869EC9F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:01:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUeQu-00032m-RR; Tue, 21 Feb 2023 21:00:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUeQp-00032D-J0
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:00:31 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUeQn-00013C-Vy
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:00:31 -0500
Received: by mail-pl1-x629.google.com with SMTP id ko13so7785068plb.13
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gmPWamcS039ttvGx+0lkOqlpPNASpmKk9ydxcZXcCPQ=;
 b=aEBfDQSyrYtobx8mlTuoJz7N2Sq/XYrHSVsHFCtoeIDUxKtH2fEtfso7pxE1H+/hN/
 JX4YsKQrD/fQJ9lfSYAmK2OwX1r1BlvpQFxNAlMWZH/DO9gAqQDZ4FJjBJFWaTfQkyG3
 AdGofU4T+bn1S1TRpAmhjfU5zgrc2OnB3nRkTJ+RGer832RbVJbIgi52m3NaeIBZsYJo
 3LW4ac2ileLOxW3PXfYKBIRmN7JDOiFxxgjoAcFNgeanv7GajJZoJUa5OCfPUmDiVNTP
 yQkD4gFVoPb6w2ppojz4UN5UqX/GjSGPzUQL8E6crDUFj02VvuWZ3eybtC4PewPiPfOm
 NYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gmPWamcS039ttvGx+0lkOqlpPNASpmKk9ydxcZXcCPQ=;
 b=YuZPeFAN934/8CA2ajMCqtsEa3DpOZtuMCxgxtbIkSlorZYzscfp2UzMvOwU4KfcZI
 LIVKMGGaDizdpt3DCBArTXpS5H9+uhdS6m8APlDZuAjNZGqcEP9ttdhZeJGOUFo/vrOU
 2cXifxVeUB4hfVNDOf7U/aWR29+NvJYq+MpgMGAR3EzcXkSrx717aah0LLJttglr9H3S
 65+yhHtRBXUOjlpyaf2K+uMoq8s7EhLkb9ZotZzSUfQfwbLVndcixoK+/Cj+7DPSE3kJ
 EiI01U/Nfs8/870src8sTQdo+BJwnpTdZhKYWIGzJfc9TjTPHwrTzRE/X8G5BqCYSymN
 82Hg==
X-Gm-Message-State: AO0yUKVPyySWYuEvVKn/P/amgnf/F2NFcDkZOr7xVkwZTxaIe8AvipXD
 2xca82WtlFEEG6wd/cb8zbcT1fR/nC43amZgEHU=
X-Google-Smtp-Source: AK7set+Cua7WM8ALMfAuvioAo+neKcK/+eaRxkHjiQ6eBaU4hGPq3kRzYLsXLfZ+SqnOEM8g/+WvQw==
X-Received: by 2002:a17:903:284d:b0:19a:9943:17fe with SMTP id
 kq13-20020a170903284d00b0019a994317femr5976457plb.50.1677031227989; 
 Tue, 21 Feb 2023 18:00:27 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c10200b00189743ed3b6sm91468pli.64.2023.02.21.18.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:00:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Sid Manning <sidneym@quicinc.com>,
 =?UTF-8?q?J=C3=B8rgen=20Hansen?= <Jorgen.Hansen@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 1/8] accel/tcg: Allow the second page of an instruction to
 be MMIO
Date: Tue, 21 Feb 2023 16:00:16 -1000
Message-Id: <20230222020023.904232-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222020023.904232-1-richard.henderson@linaro.org>
References: <20230222020023.904232-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

If an instruction straddles a page boundary, and the first page
was ram, but the second page was MMIO, we would abort.  Handle
this as if both pages are MMIO, by setting the ram_addr_t for
the first page to -1.

Reported-by: Sid Manning <sidneym@quicinc.com>
Reported-by: Jørgen Hansen <Jorgen.Hansen@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translator.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index ef5193c67e..1cf404ced0 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -176,8 +176,16 @@ static void *translator_access(CPUArchState *env, DisasContextBase *db,
         if (host == NULL) {
             tb_page_addr_t phys_page =
                 get_page_addr_code_hostp(env, base, &db->host_addr[1]);
-            /* We cannot handle MMIO as second page. */
-            assert(phys_page != -1);
+
+            /*
+             * If the second page is MMIO, treat as if the first page
+             * was MMIO as well, so that we do not cache the TB.
+             */
+            if (unlikely(phys_page == -1)) {
+                tb_set_page_addr0(tb, -1);
+                return NULL;
+            }
+
             tb_set_page_addr1(tb, phys_page);
 #ifdef CONFIG_USER_ONLY
             page_protect(end);
-- 
2.34.1


