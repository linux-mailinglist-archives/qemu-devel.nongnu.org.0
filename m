Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB4F68C6F3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 20:39:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP7Jl-0004ni-U9; Mon, 06 Feb 2023 14:38:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP7Jj-0004nF-PZ
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:38:19 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP7Jh-0005UI-UI
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:38:19 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 rm7-20020a17090b3ec700b0022c05558d22so12406716pjb.5
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 11:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kT34oIe5200keZED1jI4hlEADTG4mUcFP2VpJ+pUKx4=;
 b=fyu4ZFxJcbPWMayBCH7lVmOo2j5jWYGriqLcB3sFHyl3IG2kO/4gtn5cPedRmtDore
 6DwxlnxolYp86XaDwXrTGtIoYSFKvs2keNK6f1brbdmbRg7IDSlodb8vTkcx+GJTeNP7
 bYvEC88JOi5HOLCoF9+CWMTUijHpP4XTbpxGahZfcIioA9v0HjLrONV+Neo2vUWq2d0l
 TWCsvUMfT1Iq0SBSjn3zYDUJnr4n5A95uwG0bwuWGkh6mdYsGNWHd3Yut+FT11wlwfWQ
 mlAvDyp52n4TkyYzci/yOyPYh2SWioyTwscCfuYBr4sXshYSl6uIA6RMtvLl+IlOs/OF
 D7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kT34oIe5200keZED1jI4hlEADTG4mUcFP2VpJ+pUKx4=;
 b=xzFHpJKUqJELFLGWp2kqCq5x0IfxRqrmtB5Z0q4D+NcUedLFV7GAGZqptVXcCqIhJn
 NiJTWRvgQG095uCM4uYYjnwk2/m2D1h/qWExFnatVq6elZoeyPhkEdjfW4BXO4NKES8f
 tOXZWtTH8CEvsvTqUIZgd5gsRviLRIYNFiEcVijw9JQkdSPHdLwmz5uvjoJffkMvFjzM
 Y9XirzXZ1gPe5Th/wQt1j59H3p7UTZXWZbNjOaG9FecaIkFGmxWQQTwvTTHh4DmKyoGb
 LS6M585yn75baKxuk9+nsHgJI+53y+dC5tamIM8Nanf4QVXZutWsSWwdW4vhtG1aSYng
 0l9w==
X-Gm-Message-State: AO0yUKVtQDk1iutZeyvAGn2r3GgUlRQzmRH7G5q1gBsROhoyI73Qk9RM
 m0RzbZ31Kxux5b2Sq3nOziHklfDh8lwEZA9KljF8uA==
X-Google-Smtp-Source: AK7set9vNL2GYPdZJziuYzI3e+iLVnAg70UecKbHtqkenu1YIi3D8W36fZcEjO7fUSDV3nlkMrfAeA==
X-Received: by 2002:a05:6a20:7d82:b0:bd:b81:2bc3 with SMTP id
 v2-20020a056a207d8200b000bd0b812bc3mr477677pzj.2.1675712295549; 
 Mon, 06 Feb 2023 11:38:15 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a170902780600b001929f0b4582sm7190058pll.300.2023.02.06.11.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 11:38:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: sidneym@quicinc.com, mburton@qti.qualcomm.com, bcain@quicinc.com,
 mathbern@qti.qualcomm.com, Jorgen.Hansen@wdc.com, Ajay.Joshi@wdc.com
Subject: [PATCH 1/1] accel/tcg: Allow the second page of an instruction to be
 MMIO
Date: Mon,  6 Feb 2023 09:38:09 -1000
Message-Id: <20230206193809.1153124-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206193809.1153124-1-richard.henderson@linaro.org>
References: <20230206193809.1153124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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


