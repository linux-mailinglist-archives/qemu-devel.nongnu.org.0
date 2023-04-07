Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C17C6DB3AB
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 20:53:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkrBm-00052O-8G; Fri, 07 Apr 2023 14:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkrBj-00051z-83
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 14:51:55 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkrBg-00086z-RH
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 14:51:54 -0400
Received: by mail-pj1-x1035.google.com with SMTP id g3so307248pja.2
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 11:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680893510;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ctvi0OiUA+9muAeMdyeGMqilYQVzWS8HEQhZJMbM06g=;
 b=xQjopHrgV5HZa4kw7VDbwmgRPOgbPebpzrbDR287+B99ohLZ1A5XGwaxLPQNm+sobS
 fNKTF1MINKBOX2org0Vk86kGfKmX9xKE2RJtS0HEr4cN7HlHBNDzFaiySGpiv1GK++OU
 fMPgHr0F3kkG2BdqXR53dG44vf6Eg5dsK6VCgd1o2wWvoRpKhM05B2P8uigVp5FUZrJF
 fpxdAa7WHN2NdKalQmlmzR1+RkZ+bKSZoPcZAnBnZe+FKpa5HzQ32F5/vyyXO9CtpnH5
 ortPtmgiLMykJ5k6agXGpT77p37/OWcRrSvZZEkJ1TuLEHGZhqAniHwiZIjKmuVZ4AyX
 UPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680893510;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ctvi0OiUA+9muAeMdyeGMqilYQVzWS8HEQhZJMbM06g=;
 b=Bk74NgOIPGdfCgnnL57WrClEKjltSnSAoFzlvEVtSPx911UvF78SvvP0SFEBZn1Z+U
 Zc8v3hTcmAPzDLS5mQokXt9gNIiNcUSBl3zgXYS1dZh6zQxo54dbAd2S4oRVr8EA6iEH
 gBNlntbPlN/rwzkPYSCFf50CXIkTDNJorNmw0KjVk2SRs0xN+sFN62C/Kh2yksDd9MfQ
 JzPIZKbcSa5DeeGlpvbNU+uE5AfeGko5tm1ySiMgXjPUy5RSSH6kUQgXCQQ6W8XmyTL6
 HAqEoBc2/+vPpIhS99PrUc6dFDFfOWMOb7ynQ4NwJ38rfLjqoTjRTONFQT1mj/bjVPmD
 qGhw==
X-Gm-Message-State: AAQBX9fGP3NGiKWM9WG/xCeYA/s/b3We5W4GFmsEtojDqLSUR12goqOW
 t0ZMcqZ2O+1i1ae1kz5NnTv3Ob+JmMGqrHvRQv4=
X-Google-Smtp-Source: AKy350Z46xbzT7spWkwLx2eNDo2jPLFxrVs41SEmaAciBgdYH9sMBrawgy9DA4thJKUpwaGtfgz52A==
X-Received: by 2002:a17:90a:1952:b0:23d:31c3:c98d with SMTP id
 18-20020a17090a195200b0023d31c3c98dmr3552561pjh.15.1680893510219; 
 Fri, 07 Apr 2023 11:51:50 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a1709028d8400b0019c13d032d8sm3205796plo.253.2023.04.07.11.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 11:51:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH for-8.0? 0/2] target/arm: BTI guarded bit fixes
Date: Fri,  7 Apr 2023 11:51:47 -0700
Message-Id: <20230407185149.3253946-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

As reported by Coverity and triaged by Peter.


r~

Richard Henderson (2):
  target/arm: PTE bit GP only applies to stage1
  target/arm: Copy guarded bit in combine_cacheattrs

 target/arm/ptw.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.34.1


