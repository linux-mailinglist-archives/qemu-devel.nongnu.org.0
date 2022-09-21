Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C325C042E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 18:31:25 +0200 (CEST)
Received: from localhost ([::1]:46050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob2dA-0005Tl-Qj
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 12:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2Gp-0003To-LI
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:08:20 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2Gm-0000bz-Ih
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:08:19 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 h130-20020a1c2188000000b003b4cadadce7so8115821wmh.3
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 09:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8wlJEOjCIqrgKcd8hYGZEfi/YjXbLCd9HqD3SSKCejY=;
 b=nKSVH8n+7fIS3nSDQq/+9YSUxw/54UBP8h4BuTs6AG8M1y0aXsVm1dArRdtwS1fo7u
 rXPu6O38uN0hlb1LRd8J9Q6aXMhU9Ka1d+DJhI8ykyXoyz4zntoAXXfEbZEguqeQ1vSc
 CykwOdaK99lDsk+FSq6to6/dogKFNCrs7TFTuAcCP/uMamlWRgcngwb/l3MCNulq0H6m
 4Ma1n5RriNgWVqPkUkUmGTTIHY4cQILpUC6CZ3uD21gDN1CDyLrSbJHAFM1Clk6HYJI9
 THPD6lT3XKy85lrUq+lsiOUD2+BYnIT/11LiOB5fBE77u8fIDwF6XwF8zcFd8IXQ5e8I
 rTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8wlJEOjCIqrgKcd8hYGZEfi/YjXbLCd9HqD3SSKCejY=;
 b=a0X5U5qHMYDsNFmqdz81ess82nEHGYV5zUsJE8cpxFNGEEnuM0pkUBizu5fwnS7r7i
 xT+ZFRXd/Z63LlU3NBOn/4iOYrMb8q1uExG/qWFs7jUu6oBpuOp/bpUWKhigJKZAwTFe
 4P/mZh4JHKWWxfhWXfJY2HSMAWxC0I/h+UxLzcJUhixwMzThbscydxrGATfaJlQ0ZJD4
 Kh6uLe+IkMOsYVQNsw4lVMQeeOv9Vot25sRMpHYbM17dnMZlkw1fZobNHzmkqbFGmIWb
 +OoH20eo+MuU+UgjWZfUzmQij4WeZt2nbhaediLfR6yERG+1KmKJyNZqZo9h/BnnROG0
 haxA==
X-Gm-Message-State: ACrzQf2QwGeaW3KEqfOkzP4qIpiFK2c3oawJjjEWPSad1TO2TkrkBBaW
 l0MY55X9D0LG6fPQ48RGYm1bEw==
X-Google-Smtp-Source: AMsMyM7KuU6xe7NQDV5szGuiS31kW6dXUoLdm/yheN9AkDu6oqCFrCQ0hZzDXnCfzeNWmENNvsV+MA==
X-Received: by 2002:a05:600c:4e0a:b0:3b4:91fe:80e3 with SMTP id
 b10-20020a05600c4e0a00b003b491fe80e3mr6449775wmq.91.1663776495707; 
 Wed, 21 Sep 2022 09:08:15 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 iv14-20020a05600c548e00b003b435c41103sm4800673wmb.0.2022.09.21.09.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 09:08:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B7F221FFBE;
 Wed, 21 Sep 2022 17:08:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH v1 06/10] plugins: Assert mmu_idx in range before use in
 qemu_plugin_get_hwaddr
Date: Wed, 21 Sep 2022 17:07:57 +0100
Message-Id: <20220921160801.1490125-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921160801.1490125-1-alex.bennee@linaro.org>
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
---
 plugins/api.c | 2 ++
 1 file changed, 2 insertions(+)

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


