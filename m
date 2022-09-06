Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCD45AE60F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:58:14 +0200 (CEST)
Received: from localhost ([::1]:43080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWHV-0002rv-6e
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWm-0000Gt-Ir
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:58 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWk-0003Yc-UX
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:56 -0400
Received: by mail-wr1-x433.google.com with SMTP id bp20so14180015wrb.9
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=sStumSItgDeXZaFuVPIAQyYganzdZgHWxSiIZOoEM0E=;
 b=Fwy0ioLKe6rJKVIj1oG3x2siEffFxo9xVtQJxk6s6wW++Xcq/HD+O0HM2pVam04/Po
 kNYva3iAhePF0ksvC62ysvy/5FmDGw/VcSlHfZbMMAAYI1aZ9mZjGPq0zklaWtflY85I
 HnLr8JsZqcCByb/lqEVNqNDqgBkUAhMXLtYvhY/59zioTbeQZrjyB6ZD7d9qIspQoBJi
 DrtnQjXpPpMHkLaMzOA27P/W9Rc98pHbb5P8fhfk5FYlPtCaaCHybnY3POlI0CHaDahk
 Hrk90xkSIjGcr8rTCvPLl3/2C9m8Y9Zy/gCckRsiZF0SS3pDGwp5BmzIHQoTScwj3CoR
 x3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sStumSItgDeXZaFuVPIAQyYganzdZgHWxSiIZOoEM0E=;
 b=yiHPfJJlvX91tU4WUpx5ii2bc3BK5p6w1+cUOjxZubrUODZR0qmlmr+QFBZ9Ib+MXa
 wYCzhvNIot/5b+XXW2qR+WFjcnYpeuuk5Sh/K3/U9ipKg0Zv5K3AbLPPeVadMfoEQpKi
 sp2BJzBY1G8SwL06kCPbp6YIxY6SuuXt5XN8AY5iWzubqOgejOmUmOW70VdX0oeJJaqk
 GnIPnAcvYddBdRtmdF2np2cL87Vbf7Sh9147aPTuGp5upXm2lFD9eVzNi4sfvnJueLMZ
 AknlKXFbk/nNMQLjpcCYvM1zjU02A1lk2cJ4N0Wk6AyFZHv8XDd4EC5fXOzrZyD9z0TN
 zAxA==
X-Gm-Message-State: ACgBeo08yiCbPvL//C4zlaQyzx4opO7PM5cECSs85B4a4M61E+qiYw6P
 ldWMVj3akrHUWrgv5DgBBsv2GVDn2l31GUUI
X-Google-Smtp-Source: AA6agR5jDmuTZQi1nI04a8aXVqs39ZSL8O7XQt93XW3x2O9qs+EP5PZidtspS4fwkQ8w7Tmkfw2J2w==
X-Received: by 2002:a5d:59a6:0:b0:228:ac72:3c27 with SMTP id
 p6-20020a5d59a6000000b00228ac723c27mr4337975wrr.73.1662458994244; 
 Tue, 06 Sep 2022 03:09:54 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 21/23] target/i386: Use gen_jmp_rel for DISAS_TOO_MANY
Date: Tue,  6 Sep 2022 11:09:30 +0100
Message-Id: <20220906100932.343523-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With gen_jmp_rel, we may chain between two translation blocks
which may only be separated because of TB size limits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 7a9e533c6e..97a5f7e432 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -8740,6 +8740,9 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     case DISAS_NORETURN:
         break;
     case DISAS_TOO_MANY:
+        gen_update_cc_op(dc);
+        gen_jmp_rel(dc, MO_32, 0, 0);
+        break;
     case DISAS_EOB_NEXT:
         gen_update_cc_op(dc);
         gen_update_eip_cur(dc);
-- 
2.34.1


