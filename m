Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7294079AA
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 18:56:51 +0200 (CEST)
Received: from localhost ([::1]:56668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6J8-0007zY-Rl
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 12:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6H6-0005np-O1
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:54:44 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6H5-00026q-Bk
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:54:44 -0400
Received: by mail-wm1-x330.google.com with SMTP id g74so3416186wmg.5
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A0j1B77tfGu0Cdv5/wUrGVom9bksudE56Q7hy0Jn3v0=;
 b=NKCgKkRIi7mGDr6gVgKLxPRKYGk8LhBuMjNCyzlBva9Qc+lHnNwR53gfdPQcOX4SQP
 YWbaChoTum2QRjR4Figvpp0CzoWYLF7QxHB314bn3xBId6roqPwhbfvf9wkLodm2HGDl
 kOsnXa8Gw+NcTgRZ2FzPxXcLEa+kPU3dC0UDVOmCWTU2HBsBlN3apJfOniX/PFnW4apM
 Clnw3Li1TymT3ugLKt0ERdKIb1qJLfkuDK+0GBllAWz/mMAYpHBt2Oliwe/085SeH+h3
 VPDFfjqmD55gPicIFahn/APe7bnJd7PX6LdwsJGt1QiUdlvBbFR61mO5GilBHaRq8KIf
 qRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A0j1B77tfGu0Cdv5/wUrGVom9bksudE56Q7hy0Jn3v0=;
 b=f7gLZxdVnUcuyqInog2XCH0SSBUu+7ej2lHJYefGOuJaIy13C3347GurmzKzl4ZYtD
 Wj7jaJ9JbUenVAcLFUNIEl+MiT2u3Hr6EG2ptxw/y3DF4fiha22qGYcjVVfjI+RkAM2U
 srEvCpXmvezKPve8QsOUFXQPo5+nU5C4IEoLSjIQVfyXX9P8wuB9A9yT6eWFyAnntIeK
 GLkWVVjkCM3M/jnE75YGK20KUAZqAKMnAUN+L4lMruuH+MJc+Gum9UGY+OgijvRH6V5G
 KQgorVHusEd8p/nSgAncJVd052W7nAd+Lo7sjbHfw6PpAxS/i3XHjhi2ipqeJ9HkTF6Z
 t08Q==
X-Gm-Message-State: AOAM531phY2XkJrNmpdfnMTMGYjlsmH3SPSAwVd23+Q8ModMXKfWPnjS
 GY8uZE1lwmGPBD9PBD8yv6gG583RVfA=
X-Google-Smtp-Source: ABdhPJy90Zb22MfWTczZpMBVCmAjIsqMbVmFaujvtv7oIVOGY31iQ0ixYZ6Dacmw+3O9lyr/ups0jA==
X-Received: by 2002:a05:600c:8a9:: with SMTP id
 l41mr3358748wmp.29.1631379281484; 
 Sat, 11 Sep 2021 09:54:41 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id v28sm2140457wrv.93.2021.09.11.09.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:54:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/24] target/avr: Remove pointless use of CONFIG_USER_ONLY
 definition
Date: Sat, 11 Sep 2021 18:54:11 +0200
Message-Id: <20210911165434.531552-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit f1c671f96cb ("target/avr: Introduce basic CPU class object")
added to target/avr/cpu.h:

  #ifdef CONFIG_USER_ONLY
  #error "AVR 8-bit does not support user mode"
  #endif

Remove the CONFIG_USER_ONLY definition introduced by mistake in
commit 78271684719 ("cpu: tcg_ops: move to tcg-cpu-ops.h, keep a
pointer in CPUClass").

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-By: Warner Losh <imp@bsdimp.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/avr/cpu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index ea14175ca55..5d70e34dd54 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -197,10 +197,7 @@ static const struct TCGCPUOps avr_tcg_ops = {
     .synchronize_from_tb = avr_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = avr_cpu_exec_interrupt,
     .tlb_fill = avr_cpu_tlb_fill,
-
-#ifndef CONFIG_USER_ONLY
     .do_interrupt = avr_cpu_do_interrupt,
-#endif /* !CONFIG_USER_ONLY */
 };
 
 static void avr_cpu_class_init(ObjectClass *oc, void *data)
-- 
2.31.1


