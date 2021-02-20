Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F6832022F
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:23:54 +0100 (CET)
Received: from localhost ([::1]:33230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDG3t-0006Zd-1g
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFuN-00014m-8P; Fri, 19 Feb 2021 19:14:03 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFuL-0005cF-L4; Fri, 19 Feb 2021 19:14:02 -0500
Received: by mail-ej1-x62b.google.com with SMTP id bl23so16895479ejb.5;
 Fri, 19 Feb 2021 16:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vPmCWOVmMcnYs3uJ2Qo8t7odEjhCuWrigA7WBPRKGjg=;
 b=UfVfOcPfF6WVwbY0VnsklQoRws/Ik3rKG8o868iTYQo/6hSRTtcbkK49oYjeKFHFTx
 dF05iUI27A9t2w1SRGD8WKR2SMf1LjB8p9fEhNsRNutl7GgAAEAyMTqXCwIGlTfA4mAt
 2b9O/oh2A/+bKMIX0bM7gKq2O+KL9QvLQ9qzqVWQLXXU/UxUmB/iocJjGH9rdbJrbVxD
 uB0u+ZCQf+vTqIKi4J8B9MM3F+H4DO6uPu3qQe2KaefYugGG1KlKMSEU5H42doSdJurs
 LoIUlFhhkqYNYUnpMbw/VBx3+2k8EQT9JBAbJa5OXDe/gHa/UB/KvQcaS3sNugTPeRWE
 yyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vPmCWOVmMcnYs3uJ2Qo8t7odEjhCuWrigA7WBPRKGjg=;
 b=kb0xMa+Ge5nHhLsqzu9ptVhONRyQ84Gk09W9iyLLhZPzb58qseRAnl2sR09WuaWzPX
 bBpIdNFO7OOr8Kco1Ok5OUxqnllnX5ebBcP8XH5CqIGkHvHJaUP6j4r/pDjrFNEDXR8v
 OyN+qhdS9rBvihiG3rvj7IAl1s2Xw9bGsgM2TDlpnFfeuzvpMYI2raZsDWRfAKEGq7rm
 m8SBMQBiPqvCdjKtBDUidgiQ80d0xRf1tFvYJEoppmdjYfG1WxMQMQ4Z/pvC6Qo3dZue
 eB8CM3Lmwgvq88U7yRiVcZQvk1USYA0/9+wtOpgOiFNY1VP0ALvpqftN7qZDoSBX/9y9
 XNnw==
X-Gm-Message-State: AOAM533i4RetsK+eWWKvl1Ow5+PyQrqCrjKfeS4XmmeOs+78BOsAArZX
 WwwFam31VtOq7CQ52NNXXTwnCzGBQx8=
X-Google-Smtp-Source: ABdhPJwZ2UgRcgXgros8aRHO7r+TB+voXjrFB07eFUHMBBRT9BouPGj1hv11p5ozLpZtlvqQ5ivzQg==
X-Received: by 2002:a17:906:69c2:: with SMTP id
 g2mr10688143ejs.249.1613780039841; 
 Fri, 19 Feb 2021 16:13:59 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x17sm6426136edq.42.2021.02.19.16.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 16:13:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/18] hw/sd: ssi-sd: Handle the rest commands with R1b
 response type
Date: Sat, 20 Feb 2021 01:13:00 +0100
Message-Id: <20210220001309.2225022-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220001309.2225022-1-f4bug@amsat.org>
References: <20210220001309.2225022-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Besides CMD12, the following command's reponse type is R1b:

- SET_WRITE_PROT (CMD28)
- CLR_WRITE_PROT (CMD29)
- ERASE (CMD38)

Reuse the same s->stopping to indicate a R1b reponse is needed.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210128063035.15674-10-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/ssi-sd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 907d681d19e..97ee58e20cf 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -194,6 +194,12 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
                 /* CMD13 returns a 2-byte statuse work. Other commands
                    only return the first byte.  */
                 s->arglen = (s->cmd == 13) ? 2 : 1;
+
+                /* handle R1b */
+                if (s->cmd == 28 || s->cmd == 29 || s->cmd == 38) {
+                    s->stopping = 1;
+                }
+
                 cardstatus = ldl_be_p(longresp);
                 status = 0;
                 if (((cardstatus >> 9) & 0xf) < 4)
-- 
2.26.2


