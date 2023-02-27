Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30666A4447
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:24:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeFY-0003Oo-3F; Mon, 27 Feb 2023 09:13:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeF3-0000Yv-6Z
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:37 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeEp-0001JX-2H
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:24 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bv17so6379787wrb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0Wm8wUq0a5iz19694eHb2ATNFE27FYGPtcFCbACRkdY=;
 b=oJ4GoZV/VB2o9JuVoACwtxpeWStDtuE5eN8Jjai8aJwBA5cYEl3f/oqNtZqZBC5GK9
 SPeS8u2sOsSdLGAB8WD2NoLFPyUUZg2WxEa+yChtTy+hZXrCh9yiqb4259O/2PF8WET9
 +4W6x/IfEUTcvJGpBRRs+S1w1KXTI9fvFLPx9D248AUxOWJ2JmtPtxNft3ZgYEzmhuNU
 lqF5qNUdg2QgLmCdLir3YMMhDwvQksHP3GD+me7B2NGCE8CMp+DCqQO1O2prRQSROiGm
 rUki6YD4Jm31wKQxmX0MOz7e7YneGZ6mZL18uEST3XqZoLr3snboX+uWE6PTI+yR0wQt
 iDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Wm8wUq0a5iz19694eHb2ATNFE27FYGPtcFCbACRkdY=;
 b=q64Jqoa1b/Ygeg1cNgK3Uj/KciHiJ3D1VHLGZX5t1htT7TrtSv17mhOLsHV9C4m2Hv
 2PAyeoVpxnD5eaYfWmFfCLNKV9rQnq6WF5KfDMBvhsp2L5KA4hHrsJ/Qt/tH40/72xrt
 vRkL8ondHeqlSegp8eqevEBCc16rYrr5U7fX9ZXcBpnRUN7X+YJthfsnUAaB3I8/09Zt
 MfGagzoGqNDdJmOSqziR5J7y2CjjshZ3QbukWXllzfXUDevCdI/W88zfcMKEqKuO7/bD
 IsFMiSLxFrjvWQmiP79Y9P4CJ71eRvx2Dr5PfVTctG0TZGfknHcRYDW7M7CJF8CDsbRt
 oBGA==
X-Gm-Message-State: AO0yUKUH6ej9fZgjsDEliEQ4FveP3t8GDQwZhX8PK8h/KDQ83YcGDzMH
 iSHb1mlsF03MyxUGxZcdt0kKPaT1sRDKhMgp
X-Google-Smtp-Source: AK7set/6HfSZRKqu7bsXKj5Uo/X0a8P/b1b09au3cIfbwwM8KhjNBp0R6I06N/VXqLqdvdYiP+KGhg==
X-Received: by 2002:a5d:6a03:0:b0:2c7:84e:1cfa with SMTP id
 m3-20020a5d6a03000000b002c7084e1cfamr16964008wru.40.1677507141024; 
 Mon, 27 Feb 2023 06:12:21 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i12-20020adfefcc000000b002c54f4d0f71sm7140915wrp.38.2023.02.27.06.12.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:12:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 121/126] dump: Replace tswapN() -> cpu_to_dumpN()
Date: Mon, 27 Feb 2023 15:02:08 +0100
Message-Id: <20230227140213.35084-112-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

All uses of tswap in that file are wrong, and should be using
cpu_to_dumpN, which correctly tests the endianness of the output.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230225094903.53167-2-philmd@linaro.org>
---
 dump/dump.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 1362810991..0ab229e5e9 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -907,13 +907,13 @@ static void get_note_sizes(DumpState *s, const void *note,
     if (dump_is_64bit(s)) {
         const Elf64_Nhdr *hdr = note;
         note_head_sz = sizeof(Elf64_Nhdr);
-        name_sz = tswap64(hdr->n_namesz);
-        desc_sz = tswap64(hdr->n_descsz);
+        name_sz = cpu_to_dump64(s, hdr->n_namesz);
+        desc_sz = cpu_to_dump64(s, hdr->n_descsz);
     } else {
         const Elf32_Nhdr *hdr = note;
         note_head_sz = sizeof(Elf32_Nhdr);
-        name_sz = tswap32(hdr->n_namesz);
-        desc_sz = tswap32(hdr->n_descsz);
+        name_sz = cpu_to_dump32(s, hdr->n_namesz);
+        desc_sz = cpu_to_dump32(s, hdr->n_descsz);
     }
 
     if (note_head_size) {
-- 
2.38.1


