Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2D369C478
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 04:25:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTwmN-00019i-NI; Sun, 19 Feb 2023 22:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTwmL-00018v-7z
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 22:23:49 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTwmJ-0005px-O4
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 22:23:48 -0500
Received: by mail-pj1-x102f.google.com with SMTP id e13so1903631pjt.4
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 19:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gmPWamcS039ttvGx+0lkOqlpPNASpmKk9ydxcZXcCPQ=;
 b=NqcROCFoPy2d/NxUlGPdbaV3r1FHLet8VoX4MJnu0AjqJPDI5ChfBjIkP9/2sFqYEg
 OH9aNk+6QNLg0IVH38vdfLwjMXoVAhn8l6T725mlINHdXpVZSXFYeY788DCW9OqWwbXT
 QwvSWLNwEFgTfpDfrXIvcqnt3vwaSNwbeYIF9I9obPApQRrulukmBaeV35uGr8zl+cBB
 pSQvacDZ2dCLU792gYRYJHAxx7Rz0CxdRc4XokGKne5zva4zZKpIiAt/ka8Rp8eFF5fX
 98sGX5RqdEP94mLrSfhQobQFx/r56jx3VtHOZ5kVUe2JS/RZItRoAvDAROZDp3Qnr5zj
 VpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gmPWamcS039ttvGx+0lkOqlpPNASpmKk9ydxcZXcCPQ=;
 b=fi5Yt/dGcIV5XIrOl0YYJn6GUAZDNVwRgKWfMTlimug/mCETHJP6sxpYSj3d1//5Th
 /mK38u6yYFUMn1GzWMi5rYGcGOddyd3aWoEE4x8MkyYp49K75PjdMbHkjej11Gac4YlQ
 ElW9VyNYkCY94e7SEsmThOiAbqVMc/0rM69xY9zFZomkPRfMSrBaUQMuNDz4m5/SdCJ/
 GcCeIGzwlJNvYsZzqYj1YKUkKpqeHuGYNf92RiXNcAQO/5Hltn1HwUpPTGfHTUjk5aTF
 UdZK7ViqcSQdprqgkykzXXJtTqI2b+SNW1ZxyDgRfJCq4MQn/XS7wKooi3N8yFPpumoL
 izlg==
X-Gm-Message-State: AO0yUKUeIjNRm2JbqJJnlXQ6mS68fezwnThANToIwff5YRySy0rQo3Qn
 IJyaFB5YSWKuZ70jHoH3nJsUbWHqG3LsIbxF7io=
X-Google-Smtp-Source: AK7set+JLca32i6PpzVlQN2MYXibGX1kgoPQ8uS1YCB33oikoJiMD3ZJqMDmm4ifT6x9Z7tkb5cK0Q==
X-Received: by 2002:a17:902:d4c3:b0:19c:17d1:28a4 with SMTP id
 o3-20020a170902d4c300b0019c17d128a4mr412493plg.67.1676863426206; 
 Sun, 19 Feb 2023 19:23:46 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a170902d34b00b00198e1bc9d83sm6621302plk.266.2023.02.19.19.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 19:23:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Sid Manning <sidneym@quicinc.com>,
 =?UTF-8?q?J=C3=B8rgen=20Hansen?= <Jorgen.Hansen@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 1/7] accel/tcg: Allow the second page of an instruction to be
 MMIO
Date: Sun, 19 Feb 2023 17:23:32 -1000
Message-Id: <20230220032338.5619-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220032338.5619-1-richard.henderson@linaro.org>
References: <20230220032338.5619-1-richard.henderson@linaro.org>
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


