Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACE6652C41
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 06:05:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7rGO-0002Iu-DW; Wed, 21 Dec 2022 00:03:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7rGL-0002HT-0i
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 00:03:29 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7rGJ-0003Ov-FF
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 00:03:28 -0500
Received: by mail-pl1-x632.google.com with SMTP id b2so1752362pld.7
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 21:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=znZNd3WG/BhN4qCSHGo7fJ9BmZ3G69LA+YD4Q3QuGKE=;
 b=QQb4qA9mlJQuPb5HL3ire0ouceqMrntlm1GE9yMPMDocvkDfq42rMgcxdyFKj2PYoX
 TxNg0xGvSenZ9PSkr8dKBlv++xOcmLV+hgdQ6LIdCFmEuAio9j1diIiPr7OBiNGaUPkG
 3kzfQL0HJ3VHjdJ4nSmg/ao2Nmw9834CMDKirnkVfbnfmbDHY3/TDk8qAX5RIQ463d2/
 JS9hqp9GWv/B/Am1ytfnt7yXDBWw6H3vsADyIlsprUSCtinE7LYWzaFOp5m3Tl7oA1wU
 SFtB/UwKQrBPX9QcA347eoglDwxVP6HUejE3Db3b9J9sdRoPm57R7wSp1sdDJWC4E1BI
 tk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=znZNd3WG/BhN4qCSHGo7fJ9BmZ3G69LA+YD4Q3QuGKE=;
 b=w4mhdvQbh6DWYhlHahY7P4aw7VAJN0lzwQ2PPVKiA4WED1eK6deEAADdVb2DWACgn6
 WahY7qu/xIJdmiuHTn8hZIXPyrXE4gs11uTtUcqukl87KGfmYML9LHKEvA6C6lPhbEso
 4PCtUjKS+ZLmQl824NUngDv5g0Xm2LUpaiANybSQVrUjYRcg0QemMdbRPrKOE2k0wqnC
 7iMKfGkA+LilSeDOklxJbWbY2qs+T8U3BKAV/cvOsMczpejOUHp21Y/kIMzJxzFOzd7Q
 GSCH2aLPGbvHmbdWRqwbQUkG2sDWQ1l/h5P38ULAkZpSIC/IjILatO7uFgRyYt67pIol
 82SA==
X-Gm-Message-State: AFqh2krXcj+porSinzYv3DIVZNdcl1EYyisizvUjQ/iVSTrfNyjRT+bC
 VyH9gG2rbRZcd33EPnpOglj2vEHjMh3XU08B
X-Google-Smtp-Source: AMrXdXst8cLgKj9PQFWwLyyabgYnX0xglToL8CAEQGchf4ngu4z1ha9KZ4xNsr5Br8TZNFAYAXMrxQ==
X-Received: by 2002:a17:90b:3689:b0:223:7922:654d with SMTP id
 mj9-20020a17090b368900b002237922654dmr823581pjb.5.1671599006094; 
 Tue, 20 Dec 2022 21:03:26 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a17090a688800b002135e8074b1sm390645pjd.55.2022.12.20.21.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 21:03:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 10/14] accel/tcg: Restrict cpu_io_recompile() to system
 emulation
Date: Tue, 20 Dec 2022 21:03:09 -0800
Message-Id: <20221221050313.2950701-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221050313.2950701-1-richard.henderson@linaro.org>
References: <20221221050313.2950701-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Missed in commit 6526919224 ("accel/tcg: Restrict cpu_io_recompile()
from other accelerators").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221209093649.43738-2-philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index e1429a53ac..35419f3fe1 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -43,12 +43,12 @@ void tb_invalidate_phys_page_fast(struct page_collection *pages,
 struct page_collection *page_collection_lock(tb_page_addr_t start,
                                              tb_page_addr_t end);
 void page_collection_unlock(struct page_collection *set);
+G_NORETURN void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
 #endif /* CONFIG_SOFTMMU */
 
 TranslationBlock *tb_gen_code(CPUState *cpu, target_ulong pc,
                               target_ulong cs_base, uint32_t flags,
                               int cflags);
-G_NORETURN void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
 void page_init(void);
 void tb_htable_init(void);
 void tb_reset_jump(TranslationBlock *tb, int n);
-- 
2.34.1


