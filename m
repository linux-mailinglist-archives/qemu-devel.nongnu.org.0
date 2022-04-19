Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F51C5064D4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:47:40 +0200 (CEST)
Received: from localhost ([::1]:38616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngheF-0004g7-9o
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggm3-0001BN-Ig
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:46 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggm1-0004SF-Eu
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:38 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso809271wma.0
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TvxQtTWLzyHP2NIr5QzKllEiV4ajbHEFOoL4RvQX0FA=;
 b=HVRtozMOBZPROVwcJdlzjl62dxzIdHSBTzS0UBHX5N5OsWme+oHkRtUcOgN49o2HVm
 l/XyPt39uIbkljfhUbP9+8cMWhI40uOI4rUwCbWgbJZ0o8iDYlqwMIHgoG4AlkALvR2g
 Rn2CodZP8RoemKM87iC0/LxlpqyJ/rhJxQNRmWe+4ny2kIXtiSQ38upa+G2KN41y+EhG
 9Lp2S7aieKSd4dMZu7TF9vei5uXorg9Q/Pkt8YNZKF9ZWv1zxxJWXzUOgvgamefCQgzX
 UKlWgwkOSN7bX91FZ46PNVixr1vReXiGX6CuRQfOmbh0SkivpUJjzcJSM8EaEWYSS2LT
 dyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TvxQtTWLzyHP2NIr5QzKllEiV4ajbHEFOoL4RvQX0FA=;
 b=gR9RSxVoYSKWCwqHC8hMAWXH52OHjuwA1BYulX67jGU9tl55TpzFVYjzPmGYlQnZZp
 QQqxH3V1YaR+99jT8/gyOXumHQWuWnFd766LTDg9KkVUH50JnjM+52UkTPsFeiEV7p3q
 eLB7MosRAGAQBo0r7qQlk/YjmrO6ThR/xQ6wYa5+6J7nitNw2F0YfS5rO/iCwaQdFVY5
 NQeF9sRV+U107dKL0M382JZTGltJ9tEQC8yAdzRR/XzECK2vqG+4WbLJ97MynyNe8pBi
 hVQDA2qV3amY4JJCcDiAQ8GzKw5MXCFQabLK+dUClm9pX2/vQ+iLYsIjvsS0xxu81Zd3
 v6bw==
X-Gm-Message-State: AOAM531NNaNFc6N49MTehZLU7852VbgPov3eWoEVYj54LqL7pMl0spox
 rZwdlR/DbZJG3r4HnC3U1ivsrS5mZ6OATw==
X-Google-Smtp-Source: ABdhPJwXgHfSU7RoesSH8IJtyPzfljfGTDZWylvK4v1kM0O43W5sryIM53hdCaqRdXfpWxTjEKJ1eA==
X-Received: by 2002:a05:600c:1910:b0:392:9143:27d3 with SMTP id
 j16-20020a05600c191000b00392914327d3mr10577486wmq.206.1650347495004; 
 Mon, 18 Apr 2022 22:51:35 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/53] include: move page_size_init() to include/hw/core/cpu.h
Date: Tue, 19 Apr 2022 07:50:48 +0200
Message-Id: <20220419055109.142788-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-28-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/hw/core/cpu.h | 2 ++
 include/qemu-common.h | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 13adb251b2..466bed6047 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1035,6 +1035,8 @@ void cpu_exec_unrealizefn(CPUState *cpu);
  */
 bool target_words_bigendian(void);
 
+void page_size_init(void);
+
 #ifdef NEED_CPU_H
 
 #ifdef CONFIG_SOFTMMU
diff --git a/include/qemu-common.h b/include/qemu-common.h
index a271cac66a..65483f70d4 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -24,6 +24,4 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-void page_size_init(void);
-
 #endif
-- 
2.35.1



