Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 872216A0F0C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:05:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVFx4-0004GC-PL; Thu, 23 Feb 2023 13:04:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVFx3-0004Fv-2d
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:04:17 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVFx1-0003hv-Hd
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:04:16 -0500
Received: by mail-wr1-x434.google.com with SMTP id bo30so10814679wrb.0
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 10:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RqknXLQ56BoJfpg5ngtAVTn9ZgC/zF4CIHZowCwiyrQ=;
 b=hcWHVbpT0hxEL6bJq3Ek8MgQEtwa9dRsI4cqBhrsPtGJ+ni3OwkUU1YuDnVwuI//Qu
 FB5870Gxnc4+uLiIM1ZFuR7YQJQCoLvuA82Ri5YsVeHQmff2juUJ7wi3t0oK5cbesCnT
 htH4vOAPgx6g88CARWVFYdISDtnRWp9VNKEOOvHv9Wg3jH4xl6HU+iwUjTRJHL6ktOZO
 QM31S/NWLLRIAZEShXzVMPVhWdO6szbf06ABfZLmvVEI66mTyOi5MB0VbaYts7g7B3js
 RmMLyYRoHhOol8NYTkoM96Iun41/psgFp6uU2y+Um5n+IlOouzcdAhynllhbPhkRlvnj
 PkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RqknXLQ56BoJfpg5ngtAVTn9ZgC/zF4CIHZowCwiyrQ=;
 b=oG1M8yT6LcxIvOiMqhWe4fB31hkpQtS0z/FKjbKvEGlTIrvwcVooF2kMhUXmzhE1wj
 UcHhpBOeB/1ATl5/zW4dMI9ETL7nitibKZ5OCL1t6pqhrCe9ujk4M3DCudh4uPXY/SRa
 QRPu4OcYBOVu5OWU66/amCu5SKumxgGDCjEZTMvUZbedGjC3V7cVQVsqRgY04+VfvKfo
 djUKXPGMYCpWS2DBZAh4I6zRcts5ZsgRYfFa+6a8Bj3hXkfw8R2fnhJI0lRkpt+WcwKA
 KvH4Ur5Za6PcBOi/vkuDJx23dI9Fz23w9C9+clRLQ/DTFGU0ZspZQRqTEYHnv+Xm3dhG
 /sDw==
X-Gm-Message-State: AO0yUKUFpbWgfX0kJniYDfly2JcpiqCe3V+B0RqgQwuzT3qgUXfndVhc
 7PAofi2H9zTqAx3/DvxXnYcYUtgIm1jlSWyS
X-Google-Smtp-Source: AK7set8KodLZ2hjAjem+jNrRyMUBf4byJu+y3ZOkPu5XMZ+jes28l40AOav0mxSO5zike2NzLTpCqA==
X-Received: by 2002:adf:e8cf:0:b0:2c7:836:2d48 with SMTP id
 k15-20020adfe8cf000000b002c708362d48mr7194651wrn.27.1677175454069; 
 Thu, 23 Feb 2023 10:04:14 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a18-20020adffad2000000b002c56013c07fsm10283863wrs.109.2023.02.23.10.04.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 10:04:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 1/3] target/s390x: Replace TCGv by TCGv_i64 in op_mov2e()
Date: Thu, 23 Feb 2023 19:04:03 +0100
Message-Id: <20230223180405.31836-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230223180405.31836-1-philmd@linaro.org>
References: <20230223180405.31836-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

Although TCGv is defined as TCGv_i64 on s390x,
make it clear tcg_temp_new_i64() returns a TCGv_i64.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index ac5bd98f04..610b5df84f 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -3350,7 +3350,7 @@ static DisasJumpType op_mov2(DisasContext *s, DisasOps *o)
 static DisasJumpType op_mov2e(DisasContext *s, DisasOps *o)
 {
     int b2 = get_field(s, b2);
-    TCGv ar1 = tcg_temp_new_i64();
+    TCGv_i64 ar1 = tcg_temp_new_i64();
 
     o->out = o->in2;
     o->g_out = o->g_in2;
-- 
2.38.1


