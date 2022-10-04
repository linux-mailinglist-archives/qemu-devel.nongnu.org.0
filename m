Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1786A5F4494
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:44:52 +0200 (CEST)
Received: from localhost ([::1]:40652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiE6-0002Ab-6f
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgO-0007Q2-Ds
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:00 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgM-00008g-P7
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:00 -0400
Received: by mail-wm1-x334.google.com with SMTP id t4so8835027wmj.5
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jSmfjv0ctja6HwiXXo3PB6e8oy0gMZiBORhXoR2vclY=;
 b=scMcTcXFZW+0RHO5twtfPbureADnmoqR1EReSXJH64RUAC2ogM45OX82f0nasZePAg
 JIcmxq8GLF0dhyOyM0WQhDAKwAMSmATu7GEUkpy6JlL7sway6UvR5K90AtKrMZZ0PWAZ
 jmJBhAXxp32IIErAq6oWLgpo7qDSuhS6iU0TQVDsD7ZH5mhXPRAxy2helH8FlPDebQtn
 ZxY5M3B07TJjVbx3olbEq3pF0aXrHqfCh9mHTYmrfvyzeqJVftADWT/A9UIy1zaluCK0
 BMW1uDP7nCOYGonpFn+ya+7WQRGwUsgyvdfCXsOIIyAIXMdTQei+GhMjLzLitKCO92er
 11jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jSmfjv0ctja6HwiXXo3PB6e8oy0gMZiBORhXoR2vclY=;
 b=2TT/p9I0mdEbgJHk4LBDBoKjWLq6Rnopj4rAt/8TK1nzfXeTonDPrtOLpWJOK5G+iX
 6SbZ4nBgpRBjSMq6Kx1YasNjYBifaLZYG/o5SQOR1CeCG48tRhK9HoRFBNfJiAkmxTA/
 UmInW4BuuNeykyc0Q9NZKx6THg5HlKfqoxG2m8wV5Q7GCrzgQ5yvyPSb7C9Q6xbmfa3v
 ff8jCQilJppZNCTDJUK6Z1EyQkQE8mQuFjnrGTvrxRQvu2cE6/SnJxmDv4gImyNqIYJt
 wxifUMoxrMGE/TbOlZ3H2v5bcUUIjW1H6sCKBHj6b8GLPofTiTRx3F7yRphXoYhYCULM
 SVAw==
X-Gm-Message-State: ACrzQf0gtg0Amia5p/7zNsYFhZJvrAvRGYSAY5dZn9gIpUg9l5utEcH2
 y6ZtXk2NfA6cqJzL4Ig+rmBA8g==
X-Google-Smtp-Source: AMsMyM5Da9wQ5LfgQlg/Q2umvlFp4f9aONFmJKHl+JM3bDuJbD7Ga+FtmZrxDaz3iHDHH4o8tr33Ig==
X-Received: by 2002:a7b:c8d6:0:b0:3b4:868b:afc3 with SMTP id
 f22-20020a7bc8d6000000b003b4868bafc3mr9917718wml.66.1664888996025; 
 Tue, 04 Oct 2022 06:09:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 12-20020a05600c240c00b003b4764442f0sm14523827wmp.11.2022.10.04.06.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:09:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 67A981FFD8;
 Tue,  4 Oct 2022 14:01:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PULL 36/54] plugins: Assert mmu_idx in range before use in
 qemu_plugin_get_hwaddr
Date: Tue,  4 Oct 2022 14:01:20 +0100
Message-Id: <20221004130138.2299307-37-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Coverity reports out-of-bound accesses here.  This should be a
false positive due to how the index is decoded from MemOpIdx.

Fixes: Coverity CID 1487201
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Message-Id: <20220401190233.329360-1-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220929114231.583801-37-alex.bennee@linaro.org>

diff --git a/plugins/api.c b/plugins/api.c
index 7bf71b189d..2078b16edb 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -289,6 +289,8 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
     enum qemu_plugin_mem_rw rw = get_plugin_meminfo_rw(info);
     hwaddr_info.is_store = (rw & QEMU_PLUGIN_MEM_W) != 0;
 
+    assert(mmu_idx < NB_MMU_MODES);
+
     if (!tlb_plugin_lookup(cpu, vaddr, mmu_idx,
                            hwaddr_info.is_store, &hwaddr_info)) {
         error_report("invalid use of qemu_plugin_get_hwaddr");
-- 
2.34.1


