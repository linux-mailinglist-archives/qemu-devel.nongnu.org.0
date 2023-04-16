Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B206E3CB2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 00:57:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poBHc-00050B-FO; Sun, 16 Apr 2023 18:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mateusz.p.albecki@gmail.com>)
 id 1poAsG-0002UX-Fi
 for qemu-devel@nongnu.org; Sun, 16 Apr 2023 18:29:32 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mateusz.p.albecki@gmail.com>)
 id 1poAsF-0000kQ-0D
 for qemu-devel@nongnu.org; Sun, 16 Apr 2023 18:29:32 -0400
Received: by mail-ej1-x634.google.com with SMTP id xi5so59489514ejb.13
 for <qemu-devel@nongnu.org>; Sun, 16 Apr 2023 15:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681684168; x=1684276168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Kohpt8IVB+4XJGjqGF4d0L+c/v34ONKM4tNCYPjcUE=;
 b=KIa3kzlPWwLc3UQffHE0NAM/ARCo8cXDalwxjf2XsvzUwsXZMV2ZA1YlBr3bbMrWZv
 Ow24v0u+qrffjGiYTl9jiOHV/54bSqd+LQ8YMKH8Fj+6/ERNQm4h+DbKj8N+x4Fa83mJ
 DSj8iLD1ZkHkxE2gVPdAbGyYm8FL25aHU1OVTQ6uNp/qMDiV8yf10nsxO5DQnA8gvohg
 lElnh8gxnSQMqojrEVTpb6IUdzyLXXW6maTjFGc0n0b1KrqpV4+W9eUGvcEimNow3Tfm
 /MavrIq8nKOzp0GyOLMvrmQKjIojvMp+FFqJbfGLAXPL4kYSrImBvGxnIovpF/PvNuZs
 0TPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681684168; x=1684276168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Kohpt8IVB+4XJGjqGF4d0L+c/v34ONKM4tNCYPjcUE=;
 b=LYTRQhO0ucuL5TdXpalDebo+XhYqJZm5EAo+o6LMCBXeaVoERMH/E0RBuVlCeGzR1E
 tuDQPTKROMgJ3IA2tt5H0pnJqSmPwBxWOImp6unDioJQSEJ3OLB/BDjcZwtWPfUnNneg
 ZcJswCWglw9HkIeJ1TcZ7f6JzGBMFgyHoQ9gRQ4Nj2xzlXP/6k0jfl2YJaXnGp3hssCN
 Db82rj/pI3DPrc0PhxeV7CSZuhyieHr+7/h6vwLIu0C3Xod76I2or/n0kJuwnwU4b4L8
 97wa1fn7RARvbbksJHcq1dRrNxF6gYXStY1n9LaWCWMCbgnByvqfr9AuqBvY8lcqvG26
 Spjw==
X-Gm-Message-State: AAQBX9cgWF/8frliS7WjQGDCgbma48NG7AObJuN4tB/ngwyo4huYFMgv
 uIkJJuSJVC2/R8GsvlPlUPixDyDWRB6l1A==
X-Google-Smtp-Source: AKy350ZAA9qbz294tvYQXx3gAtCPz3qxFiSk6YChD/CUIBXqW3sd7Oj4188l9+F8P7wmJriZC6PUAg==
X-Received: by 2002:a17:906:c098:b0:94e:5679:d950 with SMTP id
 f24-20020a170906c09800b0094e5679d950mr4657581ejz.72.1681684168607; 
 Sun, 16 Apr 2023 15:29:28 -0700 (PDT)
Received: from localhost.localdomain (87-205-52-253.adsl.inetia.pl.
 [87.205.52.253]) by smtp.gmail.com with ESMTPSA id
 gl17-20020a170906e0d100b0094f09cd4658sm3119143ejb.71.2023.04.16.15.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 15:29:27 -0700 (PDT)
From: Mateusz Albecki <mateusz.p.albecki@gmail.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com, Mateusz Albecki <mateusz.albecki@outlook.com>,
 Mateusz Albecki <mateusz.p.albecki@gmail.com>
Subject: [PATCH 1/1] hw/ide/core.c: fix handling of unsupported commands
Date: Mon, 17 Apr 2023 00:28:38 +0200
Message-Id: <20230416222838.36642-2-mateusz.p.albecki@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416222838.36642-1-mateusz.p.albecki@gmail.com>
References: <20230416222838.36642-1-mateusz.p.albecki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=mateusz.p.albecki@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 16 Apr 2023 18:55:34 -0400
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

From: Mateusz Albecki <mateusz.albecki@outlook.com>

Current code will not call ide_cmd_done when aborting the unsupported
command which will lead to the command timeout on the driver side instead
of getting a D2H FIS with ABRT indication. This can lead to problems on the
driver side as the spec mandates that device should return a D2H FIS with
ABRT bit set in ERR register(from SATA 3.1 section 16.3.3.8.6)

Signed-off-by: Mateusz Albecki <mateusz.p.albecki@gmail.com>
---
 hw/ide/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 45d14a25e9..d7027bbd4d 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -2146,6 +2146,7 @@ void ide_bus_exec_cmd(IDEBus *bus, uint32_t val)
 
     if (!ide_cmd_permitted(s, val)) {
         ide_abort_command(s);
+        ide_cmd_done(s);
         ide_bus_set_irq(s->bus);
         return;
     }
-- 
2.40.0


