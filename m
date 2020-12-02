Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1008A2CC5C0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 19:48:21 +0100 (CET)
Received: from localhost ([::1]:50218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkXAq-00016h-2t
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 13:48:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX7F-0004zo-PS
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:44:40 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:39228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX7D-0002bV-UA
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:44:37 -0500
Received: by mail-ed1-x543.google.com with SMTP id c7so5085376edv.6
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 10:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b+Fxow+oEWbA9tjXcJhsn1mux7Y5BxnpxnFopCv/eKM=;
 b=cSkNktiztvfwPcj9TDhtlpU0QAlBiEme6zG8hSJcre7bL/ueRjM25Ez9ZSMsY/dFRv
 2eD864BfOuCJXrIj8nWLQUsg1zQKecHrC5QwDVcrSPmkDFOqN3YLVJnmlIk0U7xSc6aM
 aRNISKDggqfYo8TUHXgY4EvUeUw3hFs1H2D9OdMsWI9I7e7x29y72rBUR7uKysbY1JUr
 S37URkEsXMr48P1xKmcrAlDlL55Ap0jN+6ZlPl+N7vDWZq8nZXo1lSVWntkRePN9180X
 E9is08RpfODNm40dc1a1EMQ3z8hRzd0JlgWhO6sV0WMQONg4tlQCEq4hqJMlR8Dn359B
 Iq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=b+Fxow+oEWbA9tjXcJhsn1mux7Y5BxnpxnFopCv/eKM=;
 b=dj2DAMprcKhfb676BEl/Tt0hEYJq/6GJi2V3l0mrZvUgRyBjgO0gDesFm7rE48lt+7
 D+a8LN86K3HZ5UcqvyH82sg6A49yRVEFU+12TEv79jlUUYOXApal0SdOyIxeVLLigB16
 82qDQyBlfrs8/RmMCV9WWicu0pI4dFFeIqc35YET3yX+GdGoTgDaZM+MBkjroD2N3THA
 zM/yWUgDeyP3qNMJ/aRQnH+4WW6VGfIU11P6LbmK+WGMGK8HXa5JzI762W9RL/OhXxvh
 AUqW5T63+w8RxAEq4hQVi7xQfTjqpJT9jTVTFT2N2RuN4Dvq5Y4ZFddrYJMl92W/7PH8
 xbUA==
X-Gm-Message-State: AOAM533zYNu+Yb/5h7sn3cSZozjCTPUl6MCtS+PyG57jlNvHpNxq+wAy
 MJDw0iBHqUQeH0/KFKP2fH2wOJa7F68=
X-Google-Smtp-Source: ABdhPJzyBCo/fleK9MKte6zyYGXYyVa/HiaUOmGcqj9QDuopKYgN6NjtRhKkEgMnlAYPgNx6fS7OEA==
X-Received: by 2002:aa7:dccd:: with SMTP id w13mr1277839edu.385.1606934674152; 
 Wed, 02 Dec 2020 10:44:34 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id e20sm538625edu.25.2020.12.02.10.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 10:44:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] target/mips: Use CP0_Config3 to set MIPS_HFLAG_MSA
Date: Wed,  2 Dec 2020 19:44:09 +0100
Message-Id: <20201202184415.1434484-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201202184415.1434484-1-f4bug@amsat.org>
References: <20201202184415.1434484-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x543.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MSA presence is expressed by the MSAP bit of CP0_Config3.
We don't need to check anything else.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index f882ac1580c..95cbd314018 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -433,7 +433,7 @@ static inline void compute_hflags(CPUMIPSState *env)
             env->hflags |= MIPS_HFLAG_COP1X;
         }
     }
-    if (env->insn_flags & ASE_MSA) {
+    if (ase_msa_available(env)) {
         if (env->CP0_Config5 & (1 << CP0C5_MSAEn)) {
             env->hflags |= MIPS_HFLAG_MSA;
         }
-- 
2.26.2


