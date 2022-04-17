Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3192150485F
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 18:52:51 +0200 (CEST)
Received: from localhost ([::1]:58922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng88n-0006mk-Qk
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 12:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng87a-0005j6-QD
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 12:51:34 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:35420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng87Z-00046G-5b
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 12:51:34 -0400
Received: by mail-pl1-x62e.google.com with SMTP id b7so1030123plh.2
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 09:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ei6KwopjAVMae2CIOzAJ5BdMpM6XfK5gYxy0XYg5C1k=;
 b=oG1/sL0Qms8Ep6mKe4lHtSQbsAwRcsfw/b6kJub8g2jU7Hso710ngO2+1SP6y7vheV
 lDHHcCicgDEoEJTcdIsw0RdsGgVopEKYigV165KGip8xXCsqp2ooXneZ0Xtubg7im7z6
 jQEXeZOvWM2gF/g71Klzi+7Tjfr8OlO8Z8eJY1rE7b/dfc9+Klp+7+ckOKJJSA9jO0rt
 BC0IG2s5ztWMUW7D89BxGYrvc5e3mDxLxNWcvB32ak76Jq23Jj03bMuAWPN0TzriTLeT
 DhhdU5454sB0UQPFCY2SVs8CS2Bu9XgGj9j8IRGXHcFzM2e32TkssRNzlb9qaSB93PKo
 i/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ei6KwopjAVMae2CIOzAJ5BdMpM6XfK5gYxy0XYg5C1k=;
 b=iiCf4Gq0kaoNB/1mZitsAhku0jKbKw3RJ7FhPltHgJwxMsDshDKbIGuvj2/A5qZv5V
 ZalCKR5nr0/JP+EdX6jFYt6IX8XhaAjLn/0F3MAgy4A0OYKle/4TvE6E1JccY4MnwgRR
 SaPktSkO4R0y7K7eudm8CaTs4KIKsIG5FKZL1gLZI5w8atZGrlSWx6CUKQTI1p87GBFh
 wYgwJW/1tBoBOUMkX6O3TmF6YkVGPgW8NUeWkY6PAHiL7iCBytQI510xGFIZvNv/CTmy
 iXavgY4nbuZqNGg2DVvAUhPDGw6XfkOZ29hBKaCp7Kwi9beBeRdwgHpjMVmogqtsM931
 5ohw==
X-Gm-Message-State: AOAM532WASGSrs6TKieJwiacG6foAeAw3XIAzq0l1UgxAwXqTIOnaAp8
 FrbDOwVK5ZMEkRSYqqXIACylHtR1gjEEdw==
X-Google-Smtp-Source: ABdhPJy/+y/ngEQvzeb8GyuRoLNIgty2QDSi5EiK0xF5k9cA+TcyYYC3ADfjVpkR/bsEr80/fwOu8A==
X-Received: by 2002:a17:902:c7cb:b0:158:3ea4:48b4 with SMTP id
 r11-20020a170902c7cb00b001583ea448b4mr7713504pla.90.1650214291598; 
 Sun, 17 Apr 2022 09:51:31 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 f3-20020a17090aa78300b001ca7dfab2e4sm10395396pjq.25.2022.04.17.09.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 09:51:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/rx: Track PSW.U in tb->flags
Date: Sun, 17 Apr 2022 09:51:26 -0700
Message-Id: <20220417165130.695085-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: i@yvt.jp, ysato@users.sourceforge.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a follow up to Kawada-san's patch for the problem
of a missed update to the stack pointer in CLRPSW/SETPSW.
This fixes the problem without movcond by tracking the
current state of PSW.U within the TB.


r~


Richard Henderson (4):
  target/rx: Put tb_flags into DisasContext
  target/rx: Store PSW.U in tb->flags
  target/rx: Move DISAS_UPDATE check for write to PSW
  target/rx: Swap stack pointers on clrpsw/setpsw instruction

 target/rx/cpu.h       |  1 +
 target/rx/translate.c | 67 +++++++++++++++++++++++--------------------
 2 files changed, 37 insertions(+), 31 deletions(-)

-- 
2.25.1


