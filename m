Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09294322953
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:14:14 +0100 (CET)
Received: from localhost ([::1]:45602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVds-0001IR-W8
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:14:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEVch-0000qP-Cj
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:12:59 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEVcf-0006of-Oh
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:12:59 -0500
Received: by mail-wm1-x336.google.com with SMTP id v21so2028866wml.4
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 03:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zlnhHPNoHK/TPGzx+mxefO0fQLeVbOd8bAxIazxlA5I=;
 b=H/xnpfASYkJtVNp2JEnNBRxjCzizNkD0jeiLzx5Eu8TJoSGqewGZH3d8DZ0oyq7gRG
 KDYEn/PDMn+LQmuC6yZwdjf5xoa/scVVGMasdLvc8UoVbPpS0d0y0Lfr23kT6tVacQJf
 1yoEyX+Q6qs89UsGdH1Wom4l1KN8wHzYqGA3dk9VTbGDEBiTVIrak4T1Z4GwO0Ml96RV
 3/ocXeopAaJMdZ5+tQPdkv60C87qTHkVZXsQWy7Y5VwTIqCE9AivIhjdaUxdIjpoWxiF
 aYz0WfbA5U8E3qhEUFz8vX2jbm7sf/Cmgx8fxWTU/HBg09tgzWM3l5Paq44IxzRjfutx
 EK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zlnhHPNoHK/TPGzx+mxefO0fQLeVbOd8bAxIazxlA5I=;
 b=GHmR9lawhiorpOHCBZfn2g0A0fmhtXDWjGOACrFjs6YtrOcgYAcfJj1fkEn6drm94Y
 mOAU8ayPsaMYPxJKx/7T5xgWHpw1qd+gWBMAYep567dgl31jErk3EqpTBoyVirezTEXJ
 4GzpWyXvQe0dii1+nklXaFndNuax39O/eJswGJcMtgHAuVw3msJV4g+JAd81xf77Bey0
 HjMtmV6dTgD7BDcHTihE91n3z4TPGw4wXska3PjpQcRr25DFfuBkUD9aHrGKAE38mq66
 D/dYqm+VnHwSaGIbgaOYr/W6TDEbEnrOuGF5XK8d7nMBvfXd0XutaldzngwhxLkcl4fW
 INBg==
X-Gm-Message-State: AOAM533eBmWulg++eqG8RPArO8euKrmuYIISQrY6N5hlpWdGQpfjSEmS
 Ghnum4xHqyYx1fTZe+pvrfO+IvcsVJc=
X-Google-Smtp-Source: ABdhPJwF+VYWY+yOxGNHpi84JAS0QAyFVLjphFqOl/UcPwZxJLnZLIHRy2+5CkJbjJj3ICyvBkvgUQ==
X-Received: by 2002:a05:600c:24b:: with SMTP id
 11mr13196371wmj.129.1614078775753; 
 Tue, 23 Feb 2021 03:12:55 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c3sm31611085wrr.29.2021.02.23.03.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 03:12:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/hexagon/opcodes: Add missing varargs cleanup
Date: Tue, 23 Feb 2021 12:12:53 +0100
Message-Id: <20210223111253.2831285-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a trivial incorrect usage of variable argument macros detected
by Coverity (missing_va_end: va_end was not called for ap).

Fixes: Coverity CID 1446720 (VARARGS)
Fixes: e3c00c2ed75 ("Hexagon (target/hexagon) opcode data structures")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hexagon/opcodes.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/hexagon/opcodes.c b/target/hexagon/opcodes.c
index 4eef5fc40f6..35d790cdd5b 100644
--- a/target/hexagon/opcodes.c
+++ b/target/hexagon/opcodes.c
@@ -82,6 +82,7 @@ static void init_attribs(int tag, ...)
     while ((attr = va_arg(ap, int)) != 0) {
         set_bit(attr, opcode_attribs[tag]);
     }
+    va_end(ap);
 }
 
 const OpcodeEncoding opcode_encodings[] = {
-- 
2.26.2


