Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E0F520646
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 22:59:45 +0200 (CEST)
Received: from localhost ([::1]:33166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noATo-0005Ry-Aa
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 16:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noARm-0003Rd-57
 for qemu-devel@nongnu.org; Mon, 09 May 2022 16:57:38 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noARk-0004zX-Lu
 for qemu-devel@nongnu.org; Mon, 09 May 2022 16:57:37 -0400
Received: by mail-wr1-x42d.google.com with SMTP id b19so21074850wrh.11
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 13:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ogwoFPDgS0zDMP9vVQa4vBHDQ9TY+FVsYNy0YDIOjHE=;
 b=KRuNGjDfzBJTisEK8mlvcdDhyZoXFTst0m/KWqjaKEkKrAkUYRHxyNMfVlIoLNUdai
 PPwsCbgd8pYVhYeL+n5JQReOqUOWCcKzG1PhntKChp4HPLlApzB/osFE4j9EmzAjoHJo
 UCSnRbow0lc/cMSkn4lqY0rVALjZ/gxwU26lWXEO51WjiNHHq2qOwUgjrwJzmk4htPKX
 fAX95jNkED5/I1OhdFrWbNx+cfKTlcK9hSTbfQGXsU6Q08E2CqwFqV1kjjAx7SXeLs7f
 h1GuGtFhgM8yn2K0R1i3YJJirZORXg4wWkk3/D3Fx9IBkCsy8Rg4izNxkEC/NTQlLY9D
 BQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ogwoFPDgS0zDMP9vVQa4vBHDQ9TY+FVsYNy0YDIOjHE=;
 b=BIYARGyZKQ7kV7uZ4eFBAmKEJualHUk7ZK+D7yuK4MSZbOKi2aD06qNh2COcAkccrN
 t+AnZpmTTH5FjNB34UdT/ZeVDbTBZtKyAKrrqF21cfWhogSjJ6YkR7016N9vIffTPBbf
 hWbm8Xd23eSXNlyVKkDLyYNjUev4heQPqPFrB9NIhlLc0utVC8MhHsUh0DgEdeAh3q54
 QHbqLcZUOvtKXwX0sEH+vIt4CtX4+29JTejEpjiEaJfrPEca2SIywdwIgi/DzI3g9yoc
 /BvEk85vf7vzNvZGzrQWRW9Wo5KeJOb5hKL9pFf86ihK0Ka/NpHkN3c8ESoPTaQnvyqu
 Cqhg==
X-Gm-Message-State: AOAM531XcOP2To4M2oaoPC880u6sUCzg5vUV3u/TNAO56fqgX5DYiTaW
 t/HX1GQQZKp/izWmbtca4Mr51pzmjLc=
X-Google-Smtp-Source: ABdhPJypMuBZKL3GGRsrvBKV6oCBZLieVSJx4SNhTpfLB/mYTKY/nCbVTH2Sc1D0YZxvYsNNF5W1Rg==
X-Received: by 2002:a05:6000:1448:b0:20c:7be8:c2e with SMTP id
 v8-20020a056000144800b0020c7be80c2emr15524713wrx.692.1652129855077; 
 Mon, 09 May 2022 13:57:35 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c155300b00394517e7d98sm356633wmg.25.2022.05.09.13.57.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 May 2022 13:57:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 1/3] linux-user/elfload: Remove pointless non-const
 CPUArchState cast
Date: Mon,  9 May 2022 22:57:26 +0200
Message-Id: <20220509205728.51912-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509205728.51912-1-philippe.mathieu.daude@gmail.com>
References: <20220509205728.51912-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

fill_thread_info() takes a pointer to const.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 61063fd974..ada3b587c0 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -3971,7 +3971,7 @@ static int fill_note_info(struct elf_note_info *info,
         if (cpu == thread_cpu) {
             continue;
         }
-        fill_thread_info(info, (CPUArchState *)cpu->env_ptr);
+        fill_thread_info(info, cpu->env_ptr);
     }
     cpu_list_unlock();
 
-- 
2.35.1


