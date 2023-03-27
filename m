Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C83CF6CB088
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 23:20:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pguEg-00044u-27; Mon, 27 Mar 2023 17:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEc-000433-Id
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:34 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEY-0005vY-Fj
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:33 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 r7-20020a17090b050700b002404be7920aso9130837pjz.5
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 14:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679951909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d+avOkff6EBvJ8K9x1TsSkw5p9567zBA1o+YX6GdDwE=;
 b=TCzfkKKs10VF3min8GWMfhC1dbK/MvRK57QxVGTJFEDSxd5JdNRX5DoRmEUQYyCV24
 nbDUcPn1jmaDiqTyEd6QC4C6akTJd7s7juXn2UaPZazniydFDM1YKpCfHIePJvc/ljLN
 l0XSfJFHFUVhba+XBmkHB9YlR2AOfHLnF5axMQ6uAvwdbjIFv3Ude9hkyORWnao8qSCw
 8zSsRK121GyM+/jpQx+++Bc+e+5nGjNzNXpmy0bsFgX+6+Uuc9uTAQnnktI93XJr0K93
 vn3GnPMtakYuJOEE6X9aC5dCYnfeP9kiFAqbbiyzB274joMWaU1a6AELES+A09vwvPg3
 Nukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679951909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d+avOkff6EBvJ8K9x1TsSkw5p9567zBA1o+YX6GdDwE=;
 b=pBinLOhmG146CnL111v5tRqCK4s+gn4BDpMqVSoFySOhrRwi1YQe/YV8qCWJFNU/il
 4KJ2ZGxx8346C9RTteAVgEOSYBa5yogT3WnaQmech0bpG2+fumNc0Q5l6/TulwtnOosJ
 gJ4j4SZmAREBdBKNglImWYc+t1nLId+oKQleZQXeNSMEhsP8YRsipKWgyAVwWBwD/8XS
 bHVneYc5bK5I1zfO1L5mFA+Ih07E0SRMDZexuhVRMdAmJ1Dlzpc5xHNFl7JIAItu3pIo
 UIYNINQUExuO91SCq63UXIO9GtC6TLjFcpzmvc9BvMf4dA4wLQB9YXcNJ58UFZLSzv90
 E5xQ==
X-Gm-Message-State: AAQBX9e5S/x9fOcT8HEy+bqdBrZoJP+xOQUqz1LC2R6RL/Sn2w973ZDQ
 SudbiuvII0yS5u5Zu9POTRttvykp34BEKbdIX+8=
X-Google-Smtp-Source: AKy350b0r/bif50qj/QOMup/qrUxUFGkk8wGgY2hs/JLkKeJ2auIv+iR8A/iW4/Cy2kMPxdAsBk3qA==
X-Received: by 2002:a17:90b:1e01:b0:23f:b35b:7789 with SMTP id
 pg1-20020a17090b1e0100b0023fb35b7789mr14505680pjb.28.1679951908770; 
 Mon, 27 Mar 2023 14:18:28 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a17090a6f0200b0023440af7aafsm7902708pjk.9.2023.03.27.14.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 14:18:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH for-8.0 v2 03/12] linux-user: Diagnose misaligned -R size
Date: Mon, 27 Mar 2023 14:18:15 -0700
Message-Id: <20230327211824.1785547-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327211824.1785547-1-richard.henderson@linaro.org>
References: <20230327211824.1785547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We have been enforcing host page alignment for the non-R
fallback of MAX_RESERVED_VA, but failing to enforce for -R.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/main.c b/linux-user/main.c
index 4b18461969..39d9bd4d7a 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -793,6 +793,12 @@ int main(int argc, char **argv, char **envp)
      */
     max_reserved_va = MAX_RESERVED_VA(cpu);
     if (reserved_va != 0) {
+        if (reserved_va % qemu_host_page_size) {
+            char *s = size_to_str(qemu_host_page_size);
+            fprintf(stderr, "Reserved virtual address not aligned mod %s\n", s);
+            g_free(s);
+            exit(EXIT_FAILURE);
+        }
         if (max_reserved_va && reserved_va > max_reserved_va) {
             fprintf(stderr, "Reserved virtual address too big\n");
             exit(EXIT_FAILURE);
-- 
2.34.1


