Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4084D4B5A3C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 19:50:27 +0100 (CET)
Received: from localhost ([::1]:33606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgQb-0000GP-UW
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 13:50:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg9H-00086m-Sm
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:32:31 -0500
Received: from [2607:f8b0:4864:20::62c] (port=33459
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg9D-0002b9-OJ
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:32:28 -0500
Received: by mail-pl1-x62c.google.com with SMTP id l9so9616205plg.0
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 10:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aNzApqEkzW+75FX1gSqkKeS+X5vqpG5E4mcrukO7clU=;
 b=kMV9OHx6GC9DgspqX9veMZb/3ZiRya07o+rW/ZrGIfmT0fT89XdOLPqk/r1CmyNEac
 kYLf1JlxNd1EuzxR/zH7TVmqlNe8mGdN/C2Hwfrkm+ofpkH98ycucFxmAASjE9vTkCUc
 GVPgdi3wl788npKtxKVoxOIOSfzVWZFYl5oV/FacXBUjcRSrS93nYegls/E84endS9/+
 d0mol55Cl9f7O/hv+pEi8BEMAq4TC3emauqo2N9YFmB09z9jPxe6vR0Is7JA3xzxRlno
 3CHQbEzDeirQE6rLMEuIhqsDXozn2aic1F13Z8aRBKwEjWb5ncc9+8CoKyWkxJZAmvpc
 lxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aNzApqEkzW+75FX1gSqkKeS+X5vqpG5E4mcrukO7clU=;
 b=R+TtFaUoPrP+0HTQJq/lmksenfT4/QfoYZayauM54EmgvFoyuixBQGnEiCGSxEWnQ3
 R5XNeTIC5/MojTnwDL2N7Sy/KAX3XxNR1cVOfzGhsqdS759DmdjkIi0iPmizMp5tXyCS
 4SXYX+pedptCDDFhRaFueKc1RZL2hggP5spaHKD/3+QIi/XB9+opG4TmDof6jFf16uoo
 RBxDroopElPIlnJyOUYkmTcDqxESuMtifB5EuqN3ZpHSwEJYJIrNhMN0beNZ5mzLNJtz
 pi64YWR4t0QB4wH08Sg6QETRnc1va0OmadOamLATyJuNkT5EaltxOfrwIXAgBdaZpOMc
 yCbA==
X-Gm-Message-State: AOAM5336CREjmUiAJ8NnEFeMBGW9DuCsbBnoa++YvnOwFCeQ6t+SWUFN
 IHMk1r7SamtbL5jyFj39kAqvFoXPv30=
X-Google-Smtp-Source: ABdhPJxhQSoXk2ktbV5YASNFgSurPKtPsEmEomc8I46HOx4pmLtEKZ3MFY0+9EfcHHMV/ZghFARJPw==
X-Received: by 2002:a17:902:f291:: with SMTP id
 k17mr295058plc.45.1644863545037; 
 Mon, 14 Feb 2022 10:32:25 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id nu15sm5971005pjb.28.2022.02.14.10.32.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:32:24 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 04/14] exec/cpu_ldst: Include 'cpu.h' to get target_ulong
 definition
Date: Mon, 14 Feb 2022 19:31:34 +0100
Message-Id: <20220214183144.27402-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214183144.27402-1-f4bug@amsat.org>
References: <20220214183144.27402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/cpu_ldst.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index da987fe8ad..6adacf8928 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -64,6 +64,7 @@
 
 #include "exec/memopidx.h"
 #include "qemu/int128.h"
+#include "cpu.h"
 
 #if defined(CONFIG_USER_ONLY)
 /* sparc32plus has 64bit long but 32bit space address
-- 
2.34.1


