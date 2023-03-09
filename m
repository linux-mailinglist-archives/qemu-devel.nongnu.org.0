Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8C36B2E7A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:19:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMgU-0006ew-Fa; Thu, 09 Mar 2023 15:16:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMgM-0006Kp-3a
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:16:10 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMgK-0002ry-8y
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:16:09 -0500
Received: by mail-pl1-x632.google.com with SMTP id v11so3219434plz.8
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392966;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JraMLeaPMLQRcKl9Do+VNypjEWdAy8TVwPuBk6+dsXM=;
 b=lovcS5X7skl1ZcPxi94EOocrXjRb9n8psRu94VZ7xeqiAvJx+otVXA8/Gk8uKt/i6M
 7ZKGXT0sloCuZ6lGE92jWl8QiSHWyQ+YsQGPMeQQtO7deXxy/FJD5GqOCCH8kBggXuEk
 X6GxYJyAObqS+BNcybkhiAHRJi9coGdN+Q5dOHIZcgTxn2tn1hFZMSUf0peFTMEXEfvV
 SYVBk+vUAREhrPE/WFUFDtvTHPmQQjR+DpfAVH0DEnD5qgYKdPXe4KfxL/v0bZPIDc4w
 i4ROQKsw4YEFW+STyv5ZW6mTvvAG6lmzaPUibbxeLkoCMzvyqVbjBCc5574ihfPY61N0
 Qb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392966;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JraMLeaPMLQRcKl9Do+VNypjEWdAy8TVwPuBk6+dsXM=;
 b=SS8zRqCo87MwAH2cvXZyxoeeAoEs4GPOvUYRD/R3MffH/QDKLZ5ZwSK6A09EsxYnw0
 wOE6hniM97KrikrsxiOXIT0YePj77cY0ANo6XtASpfSXlQSKo43GPswr0qe7ZGpD3iNX
 TzxWdoY0GwaLbJfyoGgRLoHHzl7Jdrh5m/09mO3JzlMQXHBuje4NfFCq0r3aB2rE/kmo
 ugdypOQ7x7HCpBhOKHEanW+1eAB0L7jx+9rD3y4IhCEA1LY0QOWIF5mj7xLaguELeU/7
 3vPJjdMxohKbC902+dTrRhuhI0GSyx5Oxw6PmAqGkiB60YnDju8N11+2RPyGCIANbKwt
 cwkQ==
X-Gm-Message-State: AO0yUKWh1YZQoWFyixfk5fNZve/Xofo1PYmcatdt4fhRVPLQP17prwNO
 TZexUs9O5RXH0hwASqEqYseB6h5SK+7kUn0Q31Y=
X-Google-Smtp-Source: AK7set9KXZ2Z9lG7W/oe3sYHehZNhxFmvS7ZW9xGGCjXswDS2FlNQood43qM1ze9d3lwJVTnJewXAw==
X-Received: by 2002:a17:90b:3a92:b0:233:b5c2:7d17 with SMTP id
 om18-20020a17090b3a9200b00233b5c27d17mr23399319pjb.23.1678392965714; 
 Thu, 09 Mar 2023 12:16:05 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a17090a1b8400b0023377b98c7csm304094pjc.38.2023.03.09.12.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:16:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v2 0/2] target/m68k: Reject immediate as destination
Date: Thu,  9 Mar 2023 12:16:02 -0800
Message-Id: <20230309201604.3885359-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

The translate.c fix is extracted from a larger patch set.
I then add a test case and fix cpu_loop to raise the proper signal.


r~


Richard Henderson (2):
  target/m68k: Reject immediate as destination in gen_ea_mode
  linux-user/m68k: Handle EXCP_ADDRESS in cpu_loop

 linux-user/m68k/cpu_loop.c     |  5 ++++-
 target/m68k/translate.c        |  4 ++++
 tests/tcg/m68k/excp-address.c  | 32 ++++++++++++++++++++++++++++++++
 tests/tcg/m68k/Makefile.target |  1 +
 4 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/m68k/excp-address.c

-- 
2.34.1


