Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2026A4448
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:24:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe6x-0001Ln-2p; Mon, 27 Feb 2023 09:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe6r-00016K-91
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:09 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe6p-0007y7-Ma
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:08 -0500
Received: by mail-wr1-x42b.google.com with SMTP id bx12so3187544wrb.11
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CnN1bti1BVbfMA3pVea86tfxztwo7BnR5XFtex2Mw6k=;
 b=Bz4NjgRcD6QwVWwJfkFGmOpxVDhZ3qzEI2U8ikRalPpfoYSgXrjtRT2EBdsqldrS1D
 ItwBexyQDqVZtzXxR+szBKFAVLBx0gnoCE/XF9ItrxV3fjo7/1pYKQTxhXYvko/zFQUR
 c2A71czY3/PiZVvDo+iHLTLLt18ekSjABrXj8aQAEKD4M1IXDY4gyj1dhtO2e2GwoSS6
 T+TxEUKhc457pc/YoY874oX6lL4UAemcEEgzkl01ZRRkP04Yvl1u2ce7FeqjR5/7DHmS
 3HWBkSVhKfoGLYbSFbeNZYgpOS1aQGGh95MSddrlSs1SuPzJssrcC+xPnjTwb8lMpQOQ
 bV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CnN1bti1BVbfMA3pVea86tfxztwo7BnR5XFtex2Mw6k=;
 b=lZgobpQtn7eSPhcuvsJ0+gmDyl4dIea1cuw9JpvvTj+DiYAj7LB5T0eJEU4sbezBf9
 nFc2M1xwdGB+93L97q5cPc2V4exhBBJg0XHWjcLdOTUKpkpGlDQqCOaXnuZG8CAWt+iy
 TihFpIvekK3FKTIlNHT1Oy+KU6x6g/bxYbdVBgdCsPk0q9b5Q951nCDPi7nXEUG4Crsz
 xtCSPr/U8pwC5dOyoUrUSZVd2JYCiOOU/x+mVWvte2vXHMpI57BwrO1/vxS+bnT6vzn2
 dF4Lx7t7GbOZHz15+vi7/HlHCx8a00K0pMVpo2ftJ7GHpu+feR6VnU/iFsxdvCHHk/Ds
 c6hw==
X-Gm-Message-State: AO0yUKVD76WVpVfkdHw2BtjPxxujQ02zKbeJunYHwPPLtPq+mKFOw2Uu
 KUAwH01C89f10I5MpYm0d5HiZoDelGeSjOOC
X-Google-Smtp-Source: AK7set8QbK2RxSo6qSJX68IQ/h3ipydP+zTAw62RKelU5JamBdhxBKBjRX4iUg3XSvroIQVZd7A/Ww==
X-Received: by 2002:a05:6000:1372:b0:2ca:9950:718 with SMTP id
 q18-20020a056000137200b002ca99500718mr4405822wrz.52.1677506646219; 
 Mon, 27 Feb 2023 06:04:06 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c18-20020adfed92000000b002c54c9bd71fsm7343997wro.93.2023.02.27.06.04.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:04:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 030/126] sysemu/kvm: Remove CONFIG_USER_ONLY guard
Date: Mon, 27 Feb 2023 15:00:37 +0100
Message-Id: <20230227140213.35084-21-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

User emulation shouldn't really include this header; if included
these declarations are guarded by CONFIG_KVM_IS_POSSIBLE.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221216220738.7355-2-philmd@linaro.org>
---
 include/sysemu/kvm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index e9a97eda8c..c8281c07a7 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -471,10 +471,8 @@ uint64_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index);
 
 void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len);
 
-#if !defined(CONFIG_USER_ONLY)
 int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
                                        hwaddr *phys_addr);
-#endif
 
 #endif /* NEED_CPU_H */
 
-- 
2.38.1


