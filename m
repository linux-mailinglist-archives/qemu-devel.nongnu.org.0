Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4C43B78D5
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:45:38 +0200 (CEST)
Received: from localhost ([::1]:44080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJft-0002Be-S5
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItG-0008FR-J8
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:22 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0000tR-3c
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:22 -0400
Received: by mail-pg1-x52b.google.com with SMTP id t9so19371190pgn.4
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kyxtC+kqjqK4PDBqr8WaoSRRXVEmRAU87eOnEmBs4hM=;
 b=P6kWESdHZEU5CtrWsAUvJSEsiiqpADnXFawTtNgA0w/h0pnWIoAsG67dud7HhLZrEn
 NU/ygbRKUr61y4dbZQi+YS88j2yg8wWJE7OmB1j6lA/PT4qkz/a2+EeefP/q4KovDvp0
 A65QGEulc1BtB0K8/X7k/pOeQ0o9T97kW6mBAXDDVfG+X3ao5gcC6pZRKKjjEc1CCHkk
 W7FlzKwnDrmfRaWVV3UWBbm1QQI9KavSBkwz4ZkA3A77ITYKvS+yu40xvx55hLl1lp1e
 RlU0FMeyxeCrp+PO2uEEqyA/m/74f7okvQw1KHmBquXnoZs73po8AMaJjp4tZpddtj6H
 A0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kyxtC+kqjqK4PDBqr8WaoSRRXVEmRAU87eOnEmBs4hM=;
 b=aYPlpthjERGiPalFFmssxtjZmrxBWPteTGUqtW/Hp53hmNgB+LzBbUGRjSdt2/lZoL
 Lf6MZRnMeqabaeS2n7B/aacSyp3ZPiTrBtC9PhBJEHBrwrms/YjLc+12qCelI/hAppwd
 Wb9HXwRD81F86KebqPtMN7WYJUxtqeXMl01pIx5n4GMBNGFvLcKK9E8/1K78aL9sQnHc
 WV03+Z6tzoaJT5Uq5CNca06THrXrSt5QThc+CMAhenEOKPXkvY+hGsIQ04Q+J5qjWjQA
 sy7/X+iI4z58dXKOHzhbPNIuvDupgKnAwxfUBtDwrF7L+80j095aAhZiXh320iPbV0wP
 mL4A==
X-Gm-Message-State: AOAM531cVOBXYverUr0y8HnHWdhH/WDiz/sS32s6HW7efHt3RVD1al1K
 BinVNLx+6RXV2llQjosyXzhlsF9xR/s2dg==
X-Google-Smtp-Source: ABdhPJwVtVxpkL8twlAKi4PiB4UML96DHESCExsExWHnntQziTLoj+F8ZPO8vLXJhUxjbEWS517uLA==
X-Received: by 2002:a05:6a00:be2:b029:30c:b0e:6cc5 with SMTP id
 x34-20020a056a000be2b029030c0b0e6cc5mr13166161pfu.79.1624992906751; 
 Tue, 29 Jun 2021 11:55:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/63] target/cris: Mark helper_raise_exception noreturn
Date: Tue, 29 Jun 2021 11:54:11 -0700
Message-Id: <20210629185455.3131172-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/cris/helper.h b/target/cris/helper.h
index 20d21c4358..3abf608682 100644
--- a/target/cris/helper.h
+++ b/target/cris/helper.h
@@ -1,4 +1,4 @@
-DEF_HELPER_2(raise_exception, void, env, i32)
+DEF_HELPER_2(raise_exception, noreturn, env, i32)
 DEF_HELPER_2(tlb_flush_pid, void, env, i32)
 DEF_HELPER_2(spc_write, void, env, i32)
 DEF_HELPER_1(rfe, void, env)
-- 
2.25.1


