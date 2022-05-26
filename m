Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 865E35355D3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 23:47:46 +0200 (CEST)
Received: from localhost ([::1]:54066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLKb-0004zo-I6
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 17:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCP-0001rj-3u; Thu, 26 May 2022 17:39:18 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:34931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCN-00085m-65; Thu, 26 May 2022 17:39:16 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-f16a3e0529so3773631fac.2; 
 Thu, 26 May 2022 14:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=77khqh3eVBXc495ngnvV1+fZAbX8fHobtC8q49sWqn8=;
 b=q3ISWvxKH0L7xpype0jYOu6cZW8DYKF8N3YwflSk+7cEFYdoJ6+zj4mNAjs0BA7GNf
 +398av1x/qDclKhfgHqOm25JjU+4LAy9z+mmiuN+i68oEwDmMh9u+W33LImvqdB/gZiP
 lAXdi2pN8/aJ3cayrMaWiM8QCLr1rljLaWACoo5fXzL8IiK1uzCqHKgn2iPdC1TDryb2
 eZs8PL+UdoP/VnhAkwRYhUWkpBxasDczBI+IsF9GkuvUHdzNNhEI6V+YXDhIoWaHrE19
 300kD1SzDWkCUhgjt9anaCMDSBDnxwPnvCiGvLCzOHphHdkKd5Jgzvhzt0ZQ4NpBiIOj
 ktew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=77khqh3eVBXc495ngnvV1+fZAbX8fHobtC8q49sWqn8=;
 b=wj3+NLC/WjvccffAq210Y65B06wrVl6LxDahv8hvjgrB77We4SA5lhxQVJHpHLuoQX
 /jmi7z+OAoyZL5JCSA2jCW+jcrHXFdTSjM3DWAZyzp8S2s6Dfk3JFz207d+x3dsMoehL
 y21j7C4C6+NI4YIFlvRpUH4kSpCTzl/tl5tByuvQ28PL2ioeyCd9Na3xHfGsmaikCwQN
 5/sbRHQTo85eF1fUOzlPz5Lre3SQRXMJ6gS9Kf20st5a1fXxBcTH1IsCZb1UYlBEF5Os
 IZwkGo6nRQAblX9OBOp7HzAKOaK3bpzQK72jjOuryZSLiz2M8DLjy9Aq2lMSZwQVDfxO
 51Yw==
X-Gm-Message-State: AOAM533V1jtv0U7Y/FK+h0klKRtImzJkRw9dvGCWUicC500djfilMkpM
 eLaYgSjwunvoKw13Zqc4kfW8t4Q/Mjc=
X-Google-Smtp-Source: ABdhPJxHWnIuMQV2gl/e34HuQkAfkzCeI6Sm1DNGva0B/aOREw0W7LtT57T9J8Ec+14duq/0e+uazg==
X-Received: by 2002:a05:6870:17a6:b0:f1:ccf4:ad53 with SMTP id
 r38-20020a05687017a600b000f1ccf4ad53mr2385153oae.48.1653601154172; 
 Thu, 26 May 2022 14:39:14 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:13 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 14/34] target/ppc: use TCG_CALL_NO_RWG in VSX helpers without
 env
Date: Thu, 26 May 2022 18:37:55 -0300
Message-Id: <20220526213815.92701-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Helpers of VSX instructions without cpu_env as an argument do not access
globals.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517123929.284511-5-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index a02c4be906..f82c5bd0db 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -533,10 +533,10 @@ DEF_HELPER_FLAGS_5(XXPERMX, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, tl)
 DEF_HELPER_4(xxinsertw, void, env, vsr, vsr, i32)
 DEF_HELPER_3(xvxsigsp, void, env, vsr, vsr)
 DEF_HELPER_FLAGS_5(XXEVAL, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
-DEF_HELPER_5(XXBLENDVB, void, vsr, vsr, vsr, vsr, i32)
-DEF_HELPER_5(XXBLENDVH, void, vsr, vsr, vsr, vsr, i32)
-DEF_HELPER_5(XXBLENDVW, void, vsr, vsr, vsr, vsr, i32)
-DEF_HELPER_5(XXBLENDVD, void, vsr, vsr, vsr, vsr, i32)
+DEF_HELPER_FLAGS_5(XXBLENDVB, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
+DEF_HELPER_FLAGS_5(XXBLENDVH, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
+DEF_HELPER_FLAGS_5(XXBLENDVW, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
+DEF_HELPER_FLAGS_5(XXBLENDVD, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
 
 DEF_HELPER_2(efscfsi, i32, env, i32)
 DEF_HELPER_2(efscfui, i32, env, i32)
-- 
2.36.1


