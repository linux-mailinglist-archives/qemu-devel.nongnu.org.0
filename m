Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 975D7515FB9
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 19:59:45 +0200 (CEST)
Received: from localhost ([::1]:46254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkrNg-0004hB-N7
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 13:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrIA-0004kO-10
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:54:02 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:43928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrI7-000844-OB
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:54:01 -0400
Received: by mail-pl1-x62e.google.com with SMTP id i17so434870pla.10
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b3iKWHzTXF26kftXX52UeTKWTAF+8KLyV5YA/7fyWe0=;
 b=FjXovBdjtruO2XddN/uaxyu1fJ4eckADA6GwcSC6yErZjllLehfpdI7/g9/+gWzFU4
 Lgq/MEN1QQnV10hlszrF/GnhOKmlRuHMi4UWIEc9WQWNRLj9WHaRrzJPVgGKxGbripj9
 +NS/4C7OVEPLJ4jmq2Fd2+lmD6hjGvWxsHORbxLZ0lsUITkMsrd5bkFGcw0cjYvBxgg/
 bwNgL5EfeBfx9An0drtZeZgMz144E3SFokM79CpkV9VoOXzoP+C/znS+FprsU2vrnSW9
 gIp3XrmO2n8NUON4eZVyYLOg8/ALkRfZTyGZ+BL+W8wT9opreG5cNxtMMzt2Cj3T0umS
 Ba4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b3iKWHzTXF26kftXX52UeTKWTAF+8KLyV5YA/7fyWe0=;
 b=BguLcB56SEJ5tKhUxjF3tTUcpE08zkLr8KTJpei1lEMF07ge9Ho1CM7MoNISvMA97o
 duIdMKeWpqPicexz2FyEqquMTxQnAjdG1gn0b00FvBhOWIHl8FcqNKGvy4aR1LxD/TCi
 ujVQk6DOoxLbuZjbGktAO9Q3nVEVtR8e5N4b55WFENWfKkhdRi/WJbIewUCnii9RPY9y
 OcLT5ahB9tULd2EMyvlYq6f2SuZ6VNm8yk6Inzaijl7FV+WEX3+gQetWCKjL2vC0atyy
 oBIPl+2gpJAGKbL+iF0gN5+IpAr1vrstK/13PaN1/aUmD29Jq/36OSRF0sIpEf255Om7
 Pb9Q==
X-Gm-Message-State: AOAM5331EI7wYAs3bZC+uNkWPGLHlwbh7fBePwzTMp9K/WSjPnZuamph
 v10I51IBJ09b4X3zm6EiPRZW7tSOD8d27Q==
X-Google-Smtp-Source: ABdhPJz3OgKJd80FN3nZZrfL01RapOK+J+5YHMDMibJrGogWhNA/WWrSgzxn2SB4QKyHi7bWZHt1yQ==
X-Received: by 2002:a17:902:f792:b0:153:1566:18 with SMTP id
 q18-20020a170902f79200b0015315660018mr4672101pln.115.1651341237678; 
 Sat, 30 Apr 2022 10:53:57 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 5-20020a170902c20500b0015e8d4eb282sm1740910pll.204.2022.04.30.10.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:53:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/17] linux-user/strace: Fix print_syscall_err
Date: Sat, 30 Apr 2022 10:53:40 -0700
Message-Id: <20220430175342.370628-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430175342.370628-1-richard.henderson@linaro.org>
References: <20220430175342.370628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Errors are not all negative numbers, but only the top 4k.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/strace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 2cdbf030ba..dc4f810bd3 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -684,12 +684,12 @@ print_ipc(void *cpu_env, const struct syscallname *name,
  */
 
 static bool
-print_syscall_err(abi_long ret)
+print_syscall_err(abi_ulong ret)
 {
     const char *errstr;
 
     qemu_log(" = ");
-    if (ret < 0) {
+    if (ret > (abi_ulong)-4096) {
         errstr = target_strerror(-ret);
         if (errstr) {
             qemu_log("-1 errno=%d (%s)", (int)-ret, errstr);
-- 
2.34.1


