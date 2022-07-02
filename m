Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C05A563EBC
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 08:06:06 +0200 (CEST)
Received: from localhost ([::1]:60060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7WGb-00055W-1Y
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 02:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7WDH-0002p9-Jo
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:02:39 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:45055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7WDF-0004r5-VH
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:02:39 -0400
Received: by mail-pl1-x635.google.com with SMTP id l6so4168395plg.11
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 23:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K0uIazHRS1f7SkTQq4OPXeFrQwjuyA9Hc75UgP0uPks=;
 b=EOdB5tL7gWbbU/3ymmy7bAERjKGwLxW/rOkLAFmRUDuiraHBRiDRQCykzCQbp/Y2xo
 9l2k79Cxl/BQLNYba5nNJmneyftRVC4CDGTlxQEJ1zhsgHBtfogkfdbnBPypH70xVefo
 RJZrmNoYWSEaFH2V57N3HFwY8X23LCa1L+Stiu8puONXkbWDl5zuzSPJDPfyNFMhYrY5
 Zm0uV4QcfEULLQrzn4DlddTziJ1WCBnSwNTXYr4+lXZ80JdI1AzxALKnzbQWAD/Ykoac
 bOzau4/tk+/cpL+Vc8ldK4mOPNx0cdX7BVl7TzZB5LAqjhVRZuiOWCPqATMx55xw8eMq
 p2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K0uIazHRS1f7SkTQq4OPXeFrQwjuyA9Hc75UgP0uPks=;
 b=kyoLTKEZKNErQcQ52UWpaoJ5y9Z3fSwvEvoIpb6haCKva9fahBT/DvdMU24FgPYyAx
 dRpEVOkEix88+pwN3B4XnIX0/cBy0zDOW8IPnrSWw5cMLY9/Q1f/Zs5B8futGjZ2Aan/
 LyysgEoxH0V/TnGTSM6PvTna0OgIX821c5X2ghlBsO3eZl9m793VxFP2XCmTJHxJCTfr
 eDw1F4aSDbOpTYw+jFzdgJbAMETCWEei0k5T/Wfba6/Drac76f2rbCfZvoX3JoyI2gk0
 gqL2/t6TU346/VPmjSAYSPwtPoSFudllDfIxu1D6ojK8DhJoOe4MYIyoELiPOqaSmQNy
 5BVg==
X-Gm-Message-State: AJIora862qGFkkpGXGVohq7qg3m34nUkAvbQobEb7IUK6gXfZy6MQLR3
 9y2a4EtAIzO5s/T4C3fA7i/u5vDDe1vYdbsL
X-Google-Smtp-Source: AGRyM1vND8rhQfG78uOYw7UzZg9WeAwpfAL3b3BRNJXHKHL2bV0W2phlj4bMDZtlsg7IJR0G6j/9xQ==
X-Received: by 2002:a17:90b:4f8d:b0:1ec:af3b:d813 with SMTP id
 qe13-20020a17090b4f8d00b001ecaf3bd813mr23065481pjb.2.1656741754850; 
 Fri, 01 Jul 2022 23:02:34 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z2-20020a17090a66c200b001ece55b938asm5232178pjl.32.2022.07.01.23.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 23:02:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: svens@linux.ibm.com,
	qemu-s390x@nongnu.org
Subject: [PATCH v2 0/4] target/s390x: Exit tb after executing ex_value
Date: Sat,  2 Jul 2022 11:32:24 +0530
Message-Id: <20220702060228.420454-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Ok, version 1 didn't work, so once more with feeling.
Can you give it a try, Sven?


r~


Richard Henderson (4):
  target/s390x: Remove DISAS_GOTO_TB
  target/s390x: Remove DISAS_PC_STALE
  target/s390x: Remove DISAS_PC_STALE_NOCHAIN
  target/s390x: Exit tb after executing ex_value

 target/s390x/tcg/translate.c | 42 +++++++++++++++---------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

-- 
2.34.1


