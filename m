Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9747D511041
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 06:42:29 +0200 (CEST)
Received: from localhost ([::1]:52344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njZVU-00047W-Lv
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 00:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njZSx-0001IP-1C
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 00:39:51 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:42522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njZSt-0007SJ-0R
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 00:39:49 -0400
Received: by mail-pg1-x52a.google.com with SMTP id bg9so532474pgb.9
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 21:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g1WB0RTRAo0nXyQSrlhIlewb+RTtC6M6f1BSHd8CFHI=;
 b=X9K3SldPigsK7ip1iVtWsq8GXBdpiwx9rXu8Es1/Ocyupu/vnU7PNQaJ3NTgTK0Vac
 voLioW8w7N0KWim6EwW97joVrPe9/kRV3YUgmqMYhcKkOQqHLFGt8tvgGqEo79K4cQSA
 05Rwhde7aMxItXccFeETKeRTDZof0kJQ8y/7v7Jh5evORJe88NZoa9k4d++OBcR2hqo1
 UH9Lp16BYrglmi88PvkLlln2325fdujVhXoAgFK8kq5d+GkiIAW5jhQ5GloaC6IMvpCE
 Ht9rDrbbGzGLND2dpynFfyvdXLbZaU5alht5Iqr4WNsw8XCFf1Fsm0YgQyzB0PzzgwEa
 Xehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g1WB0RTRAo0nXyQSrlhIlewb+RTtC6M6f1BSHd8CFHI=;
 b=gPtxJ00diR25cz7T7hbCFAmKD3/FkOfTtWc+9BmpolO7NTsUXwnO41MMWWSkA559UV
 IT7Hml33xPMOWsPfm3g3UQ56VsxRCnDhuKeecEDu1DUDcX0Tn6FohlL7Pxrgy780IFBs
 pM2msvjq49XWkoodqa7zTrLSXMIP97eAcArxURDT2E80UJujDOgcLqo0ntV8yTbgOxg0
 +yoIKkxIuZmZib7bD28FWHU/TYvdwtJgTlhQKlEM7k0cIApv4girzZ1adqIptR7ABi17
 aKJq1TPdl67o8f7q7NAIMSbNHZS7gyBsqmyZ77fgF4vjT2UAiVlzv4w6Sl4X/jvSAAyX
 J+EA==
X-Gm-Message-State: AOAM532LQ1gBn4h5T/94L5G5yzBlbeyMEkzn4iCzYQSNdGTc79YVtrMb
 RPmaq5DDjSPEkQ00HdDx4DHiY3JIzkM11w==
X-Google-Smtp-Source: ABdhPJxaivn0h02l9eDk3gn/139F9lqpzsmFeAhV0m4THXt6M6UJ8Kj6eA+07PKZ3gH2qgk+bL/Hcw==
X-Received: by 2002:a65:6a4c:0:b0:39c:f169:b54a with SMTP id
 o12-20020a656a4c000000b0039cf169b54amr22626718pgu.384.1651034385363; 
 Tue, 26 Apr 2022 21:39:45 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f16-20020aa78b10000000b0050a81508653sm16875632pfd.198.2022.04.26.21.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 21:39:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/6] target/s390x: Fix the accumulation of ccm in op_icm
Date: Tue, 26 Apr 2022 21:39:38 -0700
Message-Id: <20220427043942.294654-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220427043942.294654-1-richard.henderson@linaro.org>
References: <20220427043942.294654-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity rightly reports that 0xff << pos can overflow.
This would affect the ICMH instruction.

Fixes: Coverity CID 1487161
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220401193659.332079-1-richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index ae70368966..8f092dab95 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2622,7 +2622,7 @@ static DisasJumpType op_icm(DisasContext *s, DisasOps *o)
                 tcg_gen_qemu_ld8u(tmp, o->in2, get_mem_index(s));
                 tcg_gen_addi_i64(o->in2, o->in2, 1);
                 tcg_gen_deposit_i64(o->out, o->out, tmp, pos, 8);
-                ccm |= 0xff << pos;
+                ccm |= 0xffull << pos;
             }
             m3 = (m3 << 1) & 0xf;
             pos -= 8;
-- 
2.34.1


