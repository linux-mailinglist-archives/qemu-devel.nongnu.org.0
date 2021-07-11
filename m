Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685283C3F73
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:17:45 +0200 (CEST)
Received: from localhost ([::1]:49104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gpc-0000WJ-DS
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gjL-00079k-Uw
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:11:15 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gjK-0007Hk-8F
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:11:15 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 k31-20020a05600c1c9fb029021727d66d33so8609909wms.0
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9b99qKkXqy4QpriYCi8x0HuIidGuJL8c4prBnCRgJws=;
 b=lQOS89ovG4IC82kq80G3tHBqOIahtLrTUN7pt9z+nih0+FpwqWbv6ut6BWDSS7PCAB
 TiMxnWb/7zzpMI/woeulirTZOlcO4CKloIFlVud+HnTqbJ1my3NR3Eaoo1tugOnYCLel
 KeWjCAbaPfktZsgcMYqcuxlGXwRodw9Qg8gt6AoMoofsssBP/3QUKweqBfLnikI0NWdP
 scXeE1Kl6ajufsi7ZAEbXdMLCthGYY0YEfrZOoul60EsdHYu4O1SC2lD+5tXgY5JTU4w
 UJnuxTVdzOOe4EHUqgxyhuHh3Pr8B5bAIlX4+6i/qYlT17eb6mMgJdggCB6URUpbelJg
 7hnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9b99qKkXqy4QpriYCi8x0HuIidGuJL8c4prBnCRgJws=;
 b=WKi5vs7gAw1Op9/tWrETDtPAIJtxpTCynSDBA6NzL5h8gjlA1juU8lMByKRDVk8H9L
 mj6pcg6bf6buYXmVxu+ZvgG7QocUlK85LWryRVez3CPhc5HH4TuCxSp6ql3dQYLh3ZTK
 tYiRVn4cKZOIOsaFPKXc4CwaKZVPjhJywXPF+UGfflgGcNSRZAWZViLj2DTGs0r/Foul
 SzJX8qTKYDD0kqbS8n35UmwV47x4AsENaJxGsdi+LTtNS/9RdcnRhVJztVRjdetW27Rk
 3UM8wKmN8UlTzZBKsAw7tDw06LUQoEuKSoldO2NwDLmNPOZGBczThXWyDZ5TamqbqGzw
 Kh4A==
X-Gm-Message-State: AOAM533XYoo1VeQRlaDtac0MObmkCjLLmSn27u/R+OJvxSb9tfcCG2J6
 JBABN31dAxIu4by9ZQBhsIqJguR1g75nWEml
X-Google-Smtp-Source: ABdhPJxnfZSy4hBwqrJmhtGA+aFtv96ZDZrCJiAn/XlE5OyXiL4weD1PG9qmQEyD9YyzwMgNwe1Uyw==
X-Received: by 2002:a7b:ce82:: with SMTP id q2mr10613546wmj.60.1626037872104; 
 Sun, 11 Jul 2021 14:11:12 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id b12sm12305034wrx.60.2021.07.11.14.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:11:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] hw/sd/sdcard: When card is in wrong state,
 log which state it is
Date: Sun, 11 Jul 2021 23:10:54 +0200
Message-Id: <20210711211057.2714586-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711211057.2714586-1-f4bug@amsat.org>
References: <20210711211057.2714586-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We report the card is in an inconsistent state, but don't precise
in which state it is. Add this information, as it is useful when
debugging problems.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210624142209.1193073-2-f4bug@amsat.org>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/sd/sd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 282d39a7042..d8fdf84f4db 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1504,7 +1504,8 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         return sd_illegal;
     }
 
-    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state\n", req.cmd);
+    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s\n",
+                  req.cmd, sd_state_name(sd->state));
     return sd_illegal;
 }
 
-- 
2.31.1


