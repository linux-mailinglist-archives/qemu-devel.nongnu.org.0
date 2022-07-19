Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5668C57A029
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:55:29 +0200 (CEST)
Received: from localhost ([::1]:38616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDnhA-0003ly-FV
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDnav-00008p-Ft
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:49:01 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDnar-0001vy-Ng
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:49:01 -0400
Received: by mail-wr1-x434.google.com with SMTP id z12so21696554wrq.7
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 06:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FllSCVLoep8lA6JkfG8iV3FNWrJASTbVenINWIRkquM=;
 b=Q4NfbkJK/mLbW/OR/F/SPxVZ8DvS+EKCNIJ6PWDvRw2xNhOs/MRchZlaJ5OYo+gDh/
 k9inR96U9VtQpQfTtZRyCRKErLV3THCdFsHo7RBVFEuPPXoMgy7MYsz7VJ5agmX3qNAY
 /+vXR1XxztO/h/uot7LeL7Jvyad1dckxYKq2PlUldE1fYV592Z80gb/NTKHrQR6krsGG
 AfJ97hdeCHADmwRceAQDINEXL0PNMeML31X1tfEEqKm4BIIfOTHqQraMOAR0cHpZU3kf
 CYUDJW9IuHV1nF33DzQSHJp7doNpqGlhnc9kaIMro3IEAduoru1P9jimMoPzNl3SACUS
 fwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FllSCVLoep8lA6JkfG8iV3FNWrJASTbVenINWIRkquM=;
 b=Z02cF180SyhIKjSoge2srziml+7GpbP2Ool4vxwX7ZdQsw7BEL+GBJoDO6ivfIwLLU
 lebyFRWvEeKlBIH8iLawk9WOvBYnJNKevOR8Q3MthYrbTZDKPX1D7sMpklXxS05wiQQc
 xE1a44sHccsDUUbcBJ6l8Pj77PrF10OZXK5uQgpjI9dxyE5OvsZmgdtvmjYx/2/Vu70G
 396hFXDzWd6w1/EnPXJRmD/pgINBmUAjKFoUUcEeavxIdn4m6Q91hWg+lRLcS7uGbTs8
 RU5cUxJhXxSgXrhR6MJ5jUyyTdeNUgyHePCskagNzY+jL26KXDg5nWZFxgNS/stjEIN0
 prGQ==
X-Gm-Message-State: AJIora9tmN8tGfnCSIdekqtphwkgHmwgG8nhLvgBoexG9n2RcsiA+JOy
 mYHVpnrQuxocI9A638pC99BcdiiPEHHVWw==
X-Google-Smtp-Source: AGRyM1vMMJucTO56qSwUAfN1x/DGf8SV1RXzVLA/D7Srt5tcRAgjYX5K3H7RIa0os0BWhZ08c8Ywhg==
X-Received: by 2002:a05:6000:184c:b0:21d:beaf:c2d2 with SMTP id
 c12-20020a056000184c00b0021dbeafc2d2mr24896897wri.562.1658238535803; 
 Tue, 19 Jul 2022 06:48:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a1c4305000000b003a2d6c623f3sm21942829wma.19.2022.07.19.06.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 06:48:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Mark Kanda <mark.kanda@oracle.com>
Subject: [PATCH] accel/kvm: Avoid Coverity warning in query_stats()
Date: Tue, 19 Jul 2022 14:48:53 +0100
Message-Id: <20220719134853.327059-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Coverity complains that there is a codepath in the query_stats()
function where it can leak the memory pointed to by stats_list.  This
can only happen if the caller passes something other than
STATS_TARGET_VM or STATS_TARGET_VCPU as the 'target', which no
callsite does.  Enforce this assumption using g_assert_not_reached(),
so that if we have a future bug we hit the assert rather than
silently leaking memory.

Resolves: Coverity CID 1490140
Fixes: cc01a3f4cadd91e6 ("kvm: Support for querying fd-based stats")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/kvm/kvm-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index ed8b6b896ed..eb7fceb3362 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3980,7 +3980,7 @@ static void query_stats(StatsResultList **result, StatsTarget target,
                         stats_list);
         break;
     default:
-        break;
+        g_assert_not_reached();
     }
 }
 
-- 
2.25.1


