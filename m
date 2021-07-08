Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3294F3C1B1B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 23:40:23 +0200 (CEST)
Received: from localhost ([::1]:48254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1bkq-0001z8-Nc
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 17:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1biZ-0008PQ-UW
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:37:59 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1biX-0008Km-Jc
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:37:59 -0400
Received: by mail-pf1-x430.google.com with SMTP id x3so3178307pfc.11
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 14:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8acp9lcthXMNN4kiCAslGUBMzEhY7HznvfDWQ2lsmRg=;
 b=A5oH8wY3aqfx0jUZQgAiQsKRR/csitDesPgm9N3lNzI9OlrEOLIHuaYlUQ8uiq9QDm
 FW8HkHt9fFKLwbZvjX2QX3zgOx79f5eaM/nwXHJMiVfP/1HvgSdSFaz7X8TN/zXhMxun
 iF8+4Uhh0vS1ujWoFdsFT7nY6lMhkqXTqN1/J2imUXZf2/Bq6ERUuTYS0zUD/3ZAc3Bv
 PaMg3q73UjiY0LjHFMcPYOTLh9s4+6zbBj78/qh1E1YbJQj1s9k2MJjFJ7LXxNm68Tz7
 vGg9Q2/BQQniVR8LKgNYV48qi5dEMPFspL0eE6gXSuZllFFNIX713N4zO6ia9JjQgs0T
 C5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8acp9lcthXMNN4kiCAslGUBMzEhY7HznvfDWQ2lsmRg=;
 b=DAzObjU1OUulnwm1YiVS4DFdoSZOSW1GNN2rcXWrUmnQJQdxLhVGiaYlMXnZXIZmwh
 cfzgy5ushc7zGosib9itE/Lz7JZs/OagoRD0SE+kFYgEDYW1/b8P9HmbHLAiOFvCibd/
 ilq5ZkGJzR8d9Fv1LAVmngnS2dus6viJsLnKcYhllN+VNh1g7httuZ93F40kcqJh38hl
 bKHePfakw/Wy95EIkM+Exsq4dKua00xqlRaPuD8lb+W4JMKuHZ4f36M3ujCWOQhkqjB9
 YkRHmaMrKUS6zPZpDPWNgbC4ojMVBeEroNvezq9nMHJJSh/cHvTvyqyQgBlZunAokShN
 R4FA==
X-Gm-Message-State: AOAM532Z6he7Ni2hyI3hbUCUcoXZGZafbeDiG9pLz2OnOHW60mJ88O5f
 dSzlgemk7j/QPTe4hvU0SGJuGtarM42ZVw==
X-Google-Smtp-Source: ABdhPJyltNi4/81PvD042vRhnyJ/R5rxPIsazLKfeEqwD3KRdLBtaBmoB+M1wUy80cJADynH6Wqe/A==
X-Received: by 2002:a63:1215:: with SMTP id h21mr33540787pgl.173.1625780275774; 
 Thu, 08 Jul 2021 14:37:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id g27sm4322800pgl.19.2021.07.08.14.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 14:37:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/openrisc: Use tcg_constant_*
Date: Thu,  8 Jul 2021 14:37:50 -0700
Message-Id: <20210708213754.830485-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: shorne@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace use of tcg_const_*, which makes a copy into a temp
which must be freed, with direct use of the constant.

r~

Richard Henderson (4):
  target/openrisc: Use tcg_constant_*
  target/openrisc: Use tcg_constant_tl for dc->R0
  target/openrisc: Cache constant 0 in DisasContext
  target/openrisc: Use dc->zero in gen_add, gen_addc

 target/openrisc/translate.c | 68 +++++++++++--------------------------
 1 file changed, 19 insertions(+), 49 deletions(-)

-- 
2.25.1


