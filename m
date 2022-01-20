Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF7C49573D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 01:16:38 +0100 (CET)
Received: from localhost ([::1]:46214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAhbZ-0004V0-4V
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 19:16:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nAdj5-0002jO-Vn
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 15:08:08 -0500
Received: from [2607:f8b0:4864:20::72f] (port=33344
 helo=mail-qk1-x72f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nAdj4-0006bX-DB
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 15:08:07 -0500
Received: by mail-qk1-x72f.google.com with SMTP id a21so7529863qkn.0
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 12:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BBmkG1+ALI+HGh7UCtwJ4kgr5/kyVhEtbj+USaz0SuM=;
 b=l2yk5rbaD9JSrEDGdLMYoLtVQqcwvWs7mz6vdJQxNdb9rtS2gYZ2Y260zzsaaxbcmT
 04jrAOybW+0YOmi98LveaNz6rWy3wt63Fw+Q+JfF3S8WS0/PGj+CeZhqMvPSu3vD5FCr
 JeKjUgZ8hnHLUMrSQ+XzNUWel42tqtc6KVAti7hS6fKUin+P/devlHLR38D9jQeuCKx0
 dPVKPlNiHI9ViwCOrxbS2pEslo/Pss6123u4uFIndCNM5ZL0ucntbAmzvRDIhc0qlbIy
 7Rjm6bc5u2jx03zP3nHrIkDSE9XaBQ89yN02QMr9c6lnIiz+UXPs0UR6gqiuXNJk2E1P
 QJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BBmkG1+ALI+HGh7UCtwJ4kgr5/kyVhEtbj+USaz0SuM=;
 b=cILokn7J2KkDLQY7GunF6sgRtxPvZs1b9zv16x7Fn9Fa6kmPa2Y4W8Tq3vIZUgXZme
 tYUQEOLjbuTe9EPLwGmDEzTzsUQbTm0zKxFHDK3tGBYqXvE0CpeJ3fhSa1td0uq/XFbm
 j0dlWNccxMWwFZl7ko3CqJfCLZyWyqGCxRFkas7tNEPMG1tV+AUv9LyFlOSaAVUip9sy
 TNzaC5NxMkB7gjZ3B5MSvbCK1P+Y3Vp9+z/I+gdioSS5atDLxZiYC2cfosRKQ9iq18nq
 vbFGXogIFB1uKrtO9rAksPyiwAfy3kmGWjHKgu6BYLxLfIy4NVhryaC7kVowkvGrH4D2
 yR+Q==
X-Gm-Message-State: AOAM532a8DilBABNZg4N2YkDHpFsBCoG5S5YvMIbPpywduuV5+uVbXLa
 do1LOc3yPsCMReJafmJLl1nP3zdxFlfYJQ==
X-Google-Smtp-Source: ABdhPJx8d+qSmPitzqOpMpA6QVvX0HrRMabC+MCDOTlgnQvaQ1b6gC5YowJTlKeENKZLBMMhRB18oA==
X-Received: by 2002:a05:620a:458e:: with SMTP id
 bp14mr437581qkb.130.1642709285329; 
 Thu, 20 Jan 2022 12:08:05 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id a136sm1834160qkc.56.2022.01.20.12.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 12:08:04 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC 1/5] target/riscv: Add the privileged spec version 1.12.0
Date: Thu, 20 Jan 2022 12:07:31 -0800
Message-Id: <20220120200735.2739543-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220120200735.2739543-1-atishp@rivosinc.com>
References: <20220120200735.2739543-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=atishp@rivosinc.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Anup Patel <anup@brainfault.org>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the definition for ratified privileged specification version v1.12

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4d630867650a..671f65100b1a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -82,6 +82,7 @@ enum {
 
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
+#define PRIV_VERSION_1_12_0 0x00011200
 
 #define VEXT_VERSION_1_00_0 0x00010000
 
-- 
2.30.2


