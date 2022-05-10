Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399055209D3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 02:08:01 +0200 (CEST)
Received: from localhost ([::1]:53818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noDPz-0007xj-UA
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 20:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noDMe-00062k-2y
 for qemu-devel@nongnu.org; Mon, 09 May 2022 20:04:32 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noDMc-0005Am-CE
 for qemu-devel@nongnu.org; Mon, 09 May 2022 20:04:31 -0400
Received: by mail-pl1-x634.google.com with SMTP id q18so2387265pln.12
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 17:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gZeXlhv89ff/tRX5QIcImqsHuRO/df9gxiVoF59awRE=;
 b=w5XniPeJBC9xMEEReH7QGgF2tOAlbhvzRlgzc0hJL2JcL9enRL8hBnZ+QdQf4p0jUy
 1KDSsB2QLc4ukFNuTWHCXrwTA6cfDNo2ca4BW6EMzj+/W/Ea+aZfmwtXK26CkpPhRS4Q
 6bGWBq+nFcAH+DdOuasXy2LloCX7VCMEAJ+FyMaL3NxZ+FUZu/FR/X2eFvMQ0KoNbu0D
 zrzFBARt7wtC6tclqV182Txxw4OpgqrqMletx9MPUeH1TH7gM4Y2kAaAZ+U7MsjxeBgh
 Cac1Nj/6L51AFuu1XFT8kEXQeyT1vf9rcVmgpYsLtXPGK/Daq6oiW9s4zn9Ik5LTE5F0
 gBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gZeXlhv89ff/tRX5QIcImqsHuRO/df9gxiVoF59awRE=;
 b=1HQa4sMNHfVzU0oOZudp/YV09pLk1wkodSPTdLACmPBWdKGo7ye5iPPZrRr1IuSYce
 adou8FWWQ7MsMeLZNCO8HavW9MzcyO2ijFm1M/jqYAPkkcYfoMFVOC1BaLwfGngt8HR0
 3CoQQUd66kcVNX6thO6QFQEuxeJACw9MKEAgGuTEfW5/LtFdjBJ7Up6OMwok+RiSIpPx
 t7Pvouov8mz51dbyBbqTNlWTzghXAN0GU7ZatckZjN/4A1jlEzHQuSRXKCiEe5TzHWfF
 u5BibX+oMtlbKtX5+f2ShAqv9xZ4hY4Dk3X7rpLMBnI7oe1UuAVjte3W8ymuTwJn7UBy
 51BA==
X-Gm-Message-State: AOAM531l73W6sy/uXPH/bmaSPPIW+uklLAU1s+4b01kLWaSRogJH/VA5
 +aQ3TQ2j4pQGwBPKEh7mzTyl6Fst+Lej1g==
X-Google-Smtp-Source: ABdhPJy1/40CvqWxPTSuMpop66u12qt49zKs5BbaIQRL1mfQRqu0qMPMge62ep7kwTpZxlUF9jkiAg==
X-Received: by 2002:a17:902:f542:b0:15e:b6d2:88d9 with SMTP id
 h2-20020a170902f54200b0015eb6d288d9mr18087519plf.128.1652141068617; 
 Mon, 09 May 2022 17:04:28 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x71-20020a63864a000000b003c15f7f2914sm8983691pgd.24.2022.05.09.17.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 17:04:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/2] target/arm: SME prep patches
Date: Mon,  9 May 2022 17:04:24 -0700
Message-Id: <20220510000426.45797-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Add HCRX_EL2 with no supported bits, and bit definitions for CPACR*.
Just trying to keep the queue smaller.


r~


Richard Henderson (2):
  target/arm: Enable FEAT_HCX for -cpu max
  target/arm: Use FIELD definitions for CPACR, CPTR_ELx

 target/arm/cpu.h    |  64 ++++++++++++++++++++++++---
 hw/arm/boot.c       |   2 +-
 target/arm/cpu.c    |  11 +++--
 target/arm/cpu64.c  |   1 +
 target/arm/helper.c | 104 ++++++++++++++++++++++++++++++++------------
 5 files changed, 146 insertions(+), 36 deletions(-)

-- 
2.34.1


