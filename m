Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27ED440B49
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:35:56 +0200 (CEST)
Received: from localhost ([::1]:55498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgtCu-0001ND-2G
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1y-0001cf-M5
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:35 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:39635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1w-0002HQ-NK
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:34 -0400
Received: by mail-pf1-x42a.google.com with SMTP id b1so8794644pfm.6
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7lLZzifCuDAFtBOJRXRut8iWPXEYL/L2LC9pwY/6QWY=;
 b=Itrf786Df6Agb72fWZWnk/m+KefxTuJPOUBT8RW1lRCyl20UWkKICiWMh44fXOTrhk
 NO2usgJdvrqhKCB4cVzwSiYZQgdJcoqZK6lWTf/Kq85m9YJF5jv7BRUz4SxUTpBLwSzu
 BwS+Mk4Mk4ziBrzQ/K4VMtL9mBMzJb5V41RpVDSuyJ0IrstGzsPJKkBnH2bbZLIlQH3J
 hU3QtMVTVuEurQclXOf2PgWiaR2VDpu1rXqxDyMIwpLNp+QOITXGijBQZ04uinaZTaLY
 QXZONcIcn5Dd9MKCsptK3ckMhs9aF5oY4pWwd224rIi97oAcRg6fscLknphN7rQ6BTYN
 t41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7lLZzifCuDAFtBOJRXRut8iWPXEYL/L2LC9pwY/6QWY=;
 b=Pq0c0rkYoAMKRHffKJoRHKC1gTRCCPFJmHZi+nWnoeAaqGu5OBqkqYsxSdr6Y1q6ri
 2g6ldKIMNc0DIDapYVpARwUMO+GN5ztQfJK4h1I08RxHoGrKKp1AxixYa+tBTQu6sp0m
 br0Efl8fDEvwpFmQSXf74kKz9RkYI6PmXPZQplbN4PQxG6DTKsmFDuSW2IOnBwyTQPgm
 2b9cuCJnwP0t81+0OqJTfnrRJ6Z7LrmYftLeFxc8lt4c/pGN9eEcfd4hxUmJ7AQS/ChY
 d5IIaZcEkyPhfuvEBvLu/lcrhPNRH3L3XQrfIBTpABqLQdSpNDwjQPz1aND5t45To7zN
 jUDA==
X-Gm-Message-State: AOAM532qsBAuCHQwbCn/ThO1rgiNj1tuMiRb0zCSWVclBvG/3R0OMqzV
 BJPxfZkexK5fkMZ8D1doQdAIjqGDcqQYeQ==
X-Google-Smtp-Source: ABdhPJwGiRpaAhQejq2ZTtemk+eZAe4tVLC9VzPnGp5X8kJzWMSFvPPnwld9ij1WHq9rjVzTkM1TkA==
X-Received: by 2002:a63:7706:: with SMTP id s6mr13798640pgc.184.1635614431488; 
 Sat, 30 Oct 2021 10:20:31 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 60/66] linux-user: Handle BUS_ADRALN in host_signal_handler
Date: Sat, 30 Oct 2021 10:16:29 -0700
Message-Id: <20211030171635.1689530-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Handle BUS_ADRALN via cpu_loop_exit_sigbus, but allow other SIGBUS
si_codes to continue into the host-to-guest signal conversion code.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/signal.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index df2c8678d0..81c45bfce9 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -860,6 +860,9 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
             cpu_loop_exit_sigsegv(cpu, guest_addr, access_type, maperr, pc);
         } else {
             sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
+            if (info->si_code == BUS_ADRALN) {
+                cpu_loop_exit_sigbus(cpu, guest_addr, access_type, pc);
+            }
         }
 
         sync_sig = true;
-- 
2.25.1


