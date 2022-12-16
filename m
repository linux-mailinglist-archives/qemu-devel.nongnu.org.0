Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8386864F410
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:25:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Iqs-0000e0-S9; Fri, 16 Dec 2022 17:06:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iqa-0000X6-9F
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:06:28 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IqX-0005kT-RX
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:06:27 -0500
Received: by mail-ej1-x632.google.com with SMTP id x22so9214817ejs.11
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qRl0NH1dSa5ezBWLNBBiop31vMlIv2LnSrGHXpwTSes=;
 b=BPWMBNrCxEqKXqHbAwUyvnZOXnk6iVhxS5JrSeVM1xqvsGTyjbjBmW+fhvK8bW4WV2
 ZVtIa/iQdove3R6oh25YI61MauXGG2PgXZmvnR/4DEP2l21hjSPR7KzRryJm1O0kH5ig
 qkGkMz3ptMAR8b1eSqT8k1ZXZvSJYm8fbYoIjXy2IUKvugFPjD0TBC+qLi7qzfUjRgWd
 /TwkA4t+RW1G3/ftVG4RnMl19sjdUOAV9MSbA4r2o1zaCYPwXnOrKQv1ppcG/0Tfxt9Z
 WivV81t/PPRgWMvnFHgJMbZe2kagx3oMNU9v5LtKlgFghhEhn4CcVERngoHUILld0zlk
 9X6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qRl0NH1dSa5ezBWLNBBiop31vMlIv2LnSrGHXpwTSes=;
 b=wP1LB7+i3fT13dhj/JkeyaokFSoXBFfM6EsA9xdLmiTZRI9YACL4asm47YHkKtzTkt
 xnXDoTe1J8YrGXlcwk0OLtt4v1b59gPpR0OGRgMWEv9wbEesTrIc9veHCZ6gBSRA0iZ3
 8Eih1jL84Ms6q4cvFy9eImN/hU/wPL/vRplbkPwwuGrvsHtcPCkqFw9KvdZo3wSdlqc4
 QDqHnXIgTVXUezfMZGUDKQxovM8I5wS/GFF6T5EGRdoVEzhaOUjtcF0jgcWEcRThgnkG
 KOyKAK3etcVgCtOGw1whzulP/VjjhLJTGIo8OtnIgiIUhzZuFVUkNv2ESWQRq8dy/eVM
 KHqg==
X-Gm-Message-State: AFqh2krOJo1emC0OyOjt1NSXfNGDP7JF4CwcWi6masNA6H0+kkIMbGBJ
 f2vrsW2dIhNUwFbcFyw9V+EKg+vlrfxVL1fvQEA=
X-Google-Smtp-Source: AMrXdXutRLmdPKrKMpaQ0Y+b9MZx7EX/ATWP8xzzY+7ya7Ot7smT7XkDPLndy0vD8ElHkvPbI8PSnA==
X-Received: by 2002:a17:906:8d86:b0:7cd:ffd:51f2 with SMTP id
 ry6-20020a1709068d8600b007cd0ffd51f2mr11198643ejc.57.1671228384400; 
 Fri, 16 Dec 2022 14:06:24 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 lb2-20020a170907784200b0078db5bddd9csm1289247ejc.22.2022.12.16.14.06.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:06:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Greg Kurz <groug@kaod.org>,
 qemu-riscv@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/10] target/ppc/helper: Include missing "cpu.h" header
Date: Fri, 16 Dec 2022 23:05:35 +0100
Message-Id: <20221216220539.7065-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220539.7065-1-philmd@linaro.org>
References: <20221216220539.7065-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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

'dh_ctype_*' are defined as 'ppc_avr_t/ppc_vsr_t/ppc_acc_t',
themselves declared in "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/helper.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 8dd22a35e4..a02db8d893 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -1,3 +1,5 @@
+#include "cpu.h"
+
 DEF_HELPER_FLAGS_3(raise_exception_err, TCG_CALL_NO_WG, noreturn, env, i32, i32)
 DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)
 DEF_HELPER_FLAGS_4(tw, TCG_CALL_NO_WG, void, env, tl, tl, i32)
-- 
2.38.1


