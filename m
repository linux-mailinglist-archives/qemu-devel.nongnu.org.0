Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ADA320239
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:28:20 +0100 (CET)
Received: from localhost ([::1]:48240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDG8B-0004Me-UL
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:28:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFuc-0001gl-O0; Fri, 19 Feb 2021 19:14:18 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:38053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFub-0005kM-4A; Fri, 19 Feb 2021 19:14:18 -0500
Received: by mail-ej1-x633.google.com with SMTP id bl23so16896498ejb.5;
 Fri, 19 Feb 2021 16:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WfAeaZD4Lxq8Mt+nPn3DFWL5VGya9TqmT4FCeMLnel4=;
 b=IDcT8I0iJh/mbv5qDAO3Mz4jsG1rn7uJMLtl3YPUcVvKyNyRubNoMCzVLrKOwt9hcl
 +OcraU3bS3oDTZeUnkRLjHshDvQ0Pa09R2SwtkujTqsxSkA+NsBRHbkBSGanlyLVYbA6
 lszzuVpFDjUHmzHDTOe+7x9imO6FUGePqDGznXwvLSOF8t4LQxlgPiMjET/md2ccmvSp
 v0gv2p7Z4NL2KqnGjdJRzHuL/ErZ4Qo5zB1RZv5ANg4pLe6icAUK7/ZY727IX4Hg7EbI
 xOcFj457cgv+gpaZ7XGoTSIZHd1xhsANFWEk8vib4OOZsCUyxwRc/9hksS76pHN91KEw
 X14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WfAeaZD4Lxq8Mt+nPn3DFWL5VGya9TqmT4FCeMLnel4=;
 b=ZWW3XAksSokOOalMrCcWKYkwxZzC8Nv7qNzs7SgJJOcWcQ2N3McfL0PnB3VvKmggOm
 QKeoDZMoQuOlGNUSHE8E4zMPfxQM9NXgRNYhnPZETFEML4sFE86McrnTS86Jwlzz8YlU
 jX4TY/LFqnWZTmR8gtWKPcc2HFyZ8++QTThYQOBbLiMTBJSEX72kiqrdk3tlZI9Gk60t
 n9zAzBJUOD7UGTQc74gVFx1ACrhOoVKCa5fGtmx5JTBWGVERSRIc6pKqgvHmqvVduO4N
 Iy18iWS7nowxZHsBv4yojNUZ9MKPD1Pr4FOBDxGFs6oQhEk55vEXIPj/G27XocGdbK+J
 nTtg==
X-Gm-Message-State: AOAM532o1GWwdk7F1n5mPzCxZAT5XrkoEu3mN3E5tiaHnkIWq2Gvl6Vg
 AsItvPGG98SgyJlu6mJtR8cieCrjzbU=
X-Google-Smtp-Source: ABdhPJx1kQErFR7zoVMKjsSLXbdAEUhFxXcpmrhMjtMuNVgIwkNm5fXiPzoM9lfe0HbnhqOy6vfAhw==
X-Received: by 2002:a17:906:a4c:: with SMTP id
 x12mr10736604ejf.159.1613780055202; 
 Fri, 19 Feb 2021 16:14:15 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id bm2sm5377644ejb.87.2021.02.19.16.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 16:14:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/18] hw/sd: sd: Fix CMD30 response type
Date: Sat, 20 Feb 2021 01:13:03 +0100
Message-Id: <20210220001309.2225022-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220001309.2225022-1-f4bug@amsat.org>
References: <20210220001309.2225022-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
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

Per the "Physical Layer Specification Version 8.00", table 4-26
(SD mode) and table 7-3 (SPI mode) command descriptions, CMD30
response type is R1, not R1b.

Fixes: a1bb27b1e98a ("SD card emulation initial implementation")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210216150225.27996-4-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index dd1ce0bdae4..47ac0c51a8e 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1340,7 +1340,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
             *(uint32_t *) sd->data = sd_wpbits(sd, req.arg);
             sd->data_start = addr;
             sd->data_offset = 0;
-            return sd_r1b;
+            return sd_r1;
 
         default:
             break;
-- 
2.26.2


