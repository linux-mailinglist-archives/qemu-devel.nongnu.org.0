Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A766063DA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:09:46 +0200 (CEST)
Received: from localhost ([::1]:38598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXB2-0005m1-NU
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:09:44 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olX3c-0007pp-2h
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYk-0001Kt-7f
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:04 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYi-0000xv-LU
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:01 -0400
Received: by mail-wr1-x429.google.com with SMTP id a10so34045894wrm.12
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eg/e9A93ZkN84ceTSp5S7B+71lTnUk/jXFCDufUb9UM=;
 b=oDxAt+uRSUC0DL3cX5JpY6XOOZ9Qc5NCFb4JGuK+Y/R0AmMpyDXQiN6Xm1+ysKMhEb
 CXB6aQ1yv1ANk85Y/G0rORnu3BpjJLsbIRoPDgqtPLiyAxWhY9tU1rI1jasiTfXsYX6p
 ubHt1ejyWvudXIGIb0UJkrEJINqwyBmDWqMwiiWBS299PyXB9dgoekbNq6CfTvxfQTmL
 0KsvNJLWsQWkOFJ+/wM+34w2QJdDwTX/0QqBFjxUKvJlkOXv4eO7iFoS0oHxaueg6ndb
 cvBZG7v1IYXHIzV3900qWPo3LFtFahTEr1Kt7oAp7Nfb17KXzUn9mrcgeU3SnfAWey2o
 UFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eg/e9A93ZkN84ceTSp5S7B+71lTnUk/jXFCDufUb9UM=;
 b=Xiz8gGDTovRlsxRb/G/M2E3bRlY7NUNXVk9DM7j3S/mSj1U3z0vekCobyvZhRbXmhX
 6AcCiLJEN3SxdBzBoqUVT+KVHt8np1Bk94mdXVdLX0ct+BzHYshY2c8PxsycDRBhTO96
 7O4flt8OT4wg5RsgilpDhodfmQcEu4MPFfzIpF7PBN/1QuIctnuDpS/REyduRgkOK6C2
 uvzE9wNIt2Iob6vZB6byvno87sYT7hlTtLxK2IinX1x7wyh924ICXzzd7y8PT0r2C5nS
 1EbzOJ7LSs+uu6sbD4VGUITyJkZenkNY/RbYb02jArn8tUiEMkVf5TyrtzYRLxgTM19l
 ms4g==
X-Gm-Message-State: ACrzQf3mGyWpsHbVNf3qYrwaiUcu2C1eGjB5MgWdNeRyw/rUztiDQij2
 Don+GxD4Xbdypxp9SQkdW7T5Zao1ydmoaw==
X-Google-Smtp-Source: AMsMyM7HAnzrd9JNR4+TDMhGyKVVEaAT6RyNFrhA8k3qaXHUeWG1jJYsDIGTJmPZtFMZRrUdIzJI2g==
X-Received: by 2002:a5d:5689:0:b0:231:bcaa:3125 with SMTP id
 f9-20020a5d5689000000b00231bcaa3125mr8835423wrv.431.1666268518930; 
 Thu, 20 Oct 2022 05:21:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.21.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:21:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/24] target/arm: Restrict tlb flush from vttbr_write to vmid
 change
Date: Thu, 20 Oct 2022 13:21:30 +0100
Message-Id: <20221020122146.3177980-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Compare only the VMID field when considering whether we need to flush.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20221011031911.2408754-7-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 18c51bb7774..c672903f432 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3815,10 +3815,10 @@ static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * A change in VMID to the stage2 page table (Stage2) invalidates
      * the stage2 and combined stage 1&2 tlbs (EL10_1 and EL10_0).
      */
-    if (raw_read(env, ri) != value) {
+    if (extract64(raw_read(env, ri) ^ value, 48, 16) != 0) {
         tlb_flush_by_mmuidx(cs, alle1_tlbmask(env));
-        raw_write(env, ri, value);
     }
+    raw_write(env, ri, value);
 }
 
 static const ARMCPRegInfo vmsa_pmsa_cp_reginfo[] = {
-- 
2.25.1


