Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29E1612D7F
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:36:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGsp-0005AV-Uo; Sun, 30 Oct 2022 18:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGrL-0002Ej-9m
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:51 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGrJ-00008p-MJ
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:51 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so9795381wme.5
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=edMjqQRIIS2rwohGISueQ/HPPcnwOEJrBZdoj/lca6k=;
 b=bnAb7w1S1F86eJ1BtgA7m6ZPbaclbTyz+JZEilmxkX4/FDFqEtwByVfnxDN7B4RZG8
 ZNlodvqVyD/OIv94H5hXRNAmzg0wDv1Lth6zy0/wbmnk1zEvCgNb0ip8dIu01KSIWTuv
 3Vp9GJItoEaHDXMT0+cQUhKXEfjcC+rZml+XigRF4ZVuqIoG0hb9xutnvz1hzJaJiv0Z
 OHR4sQwk7CP8EJKPF5QWkvte0I4cgZh4HPrBSVaPUcZVLUIcqY00elw3mnr5sK9fX63i
 +UAzIw816YKY4IJZsRsEcslYoJ761yFx/qIlh7OMTqNha43arDXd5mCbfGBDPdgHZf2V
 kKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=edMjqQRIIS2rwohGISueQ/HPPcnwOEJrBZdoj/lca6k=;
 b=2CK/lHTRJpEjN3ZqciM33bQn9OJyI+NrJxO+DyUQPcvNxEm2urlubk+YOmRPVZ23x3
 E6SdvnU7oi0E3fDg3pMkjSNpDtTgbhdOBOSBqksm+Td8h39w39FyxN2kDCI5I99zY67J
 JBky0D87VywEiY3Z+LRmOSqaaQecdIBwo5aIFmk2QYIaSeFInn4kZfyqgUvh3/FC1cJz
 2LZJCyoJxdrhN5rY5waVNsVLYMf5c0O9K0zEI+lf6W8bw7NEGnQQEt4o8aw3qBADEDNW
 kV1NsH5nWidPZQ4Q9Yfsf4fDY32woDKZSPRdvV2KOVx5/HRuaTNTCFFbzpaC21tHj/hW
 Mc6g==
X-Gm-Message-State: ACrzQf2G0kgYWn7Or3vCvlfeoXbCUZEKFywciLgUVtkShZWE2MzkqCpQ
 bRIqKX1xM/eKDMQrQpQTtWRJ6mHBUeIEgQ==
X-Google-Smtp-Source: AMsMyM4OVeKuA7QIpvhChClW/xcpsR4qqkxoXtrxVAbex5jP/3jtxFwdJSMAZWeLpEZqdZ3HMXuk4A==
X-Received: by 2002:a05:600c:468a:b0:3c6:f1ae:3e95 with SMTP id
 p10-20020a05600c468a00b003c6f1ae3e95mr6125971wmo.152.1667169167885; 
 Sun, 30 Oct 2022 15:32:47 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x11-20020adff0cb000000b0023660f6cecfsm5237709wro.80.2022.10.30.15.32.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:32:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 37/55] disas/nanomips: Remove argument passing by ref
Date: Sun, 30 Oct 2022 23:28:23 +0100
Message-Id: <20221030222841.42377-38-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Milica Lazarevic <milica.lazarevic@syrmia.com>

Replaced argument passing by reference with passing by address.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-24-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 8b4bc910a4..9647f1a8e3 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -560,7 +560,7 @@ static uint64 extract_op_code_value(const uint16 *data, int size)
  *      disassembly string  - on error will constain error string
  */
 static int Disassemble(const uint16 *data, char **dis,
-                     TABLE_ENTRY_TYPE & type, const Pool *table,
+                     TABLE_ENTRY_TYPE *type, const Pool *table,
                      int table_size, Dis_info *info)
 {
     for (int i = 0; i < table_size; i++) {
@@ -585,7 +585,7 @@ static int Disassemble(const uint16 *data, char **dis,
                             "disassembler failure - bad table entry");
                         return -6;
                     }
-                    type = table[i].type;
+                    *type = table[i].type;
                     *dis = dis_fn(op_code, info);
                     return table[i].instructions_size;
                 } else {
@@ -21914,7 +21914,7 @@ static int nanomips_dis(char **buf,
     uint16 bits[3] = {one, two, three};
 
     TABLE_ENTRY_TYPE type;
-    int size = Disassemble(bits, buf, type, MAJOR, 2, info);
+    int size = Disassemble(bits, buf, &type, MAJOR, 2, info);
     return size;
 }
 
-- 
2.37.3


