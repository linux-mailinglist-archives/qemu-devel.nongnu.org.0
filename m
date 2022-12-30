Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992486593A0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:11:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2rF-00034O-BJ; Thu, 29 Dec 2022 19:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rD-00033g-SV
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:43 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rC-0002hk-6a
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:43 -0500
Received: by mail-pj1-x1034.google.com with SMTP id n12so7889704pjp.1
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0A7BGyHqAN6alhYKfJ9E1yLwyik0pT3tSjb2m0LkGsk=;
 b=VI7UhUvEZDHWqYD5ERMz9FgVAKOPMz7RTN3SpfU7hq9yxsPA2L9AjwJ1OLssbcJ6dz
 GvSsQGdeKs+HnBop3EDFvtmKhlgthEn2cnMLl7s9KYxYM8tkeRdIotLiMseNaCBUPw3Y
 xlZfHHJ5wRhkbLBTMadikHFljKlCwfUZwQKyh5Hlj7mdVKdVnx5ZpF9o8Zhif+2p2REZ
 whGaYynLOQshrugchZbk0yhIckWr66EewmXAWNs3qx16/+q5y1CyEF8rwaitLUMPzs/+
 EEAegjWNsDmuwnFkaRYXxk2siIndV2uke8VwBXCp8RR52gC1ySEsFM/gMhVb04qQZHl1
 t7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0A7BGyHqAN6alhYKfJ9E1yLwyik0pT3tSjb2m0LkGsk=;
 b=DmBBlCPJnTK2wHBZbr9KSdhQWO0pYMeQat+uI/fEobGksFt/VZKoER+iOUp45nGLiE
 9G4jtQOrtVMwvu0IYfnOojOaNmBDRsy8Zya/S78kaeKg+QfZsYH2ITevHJoRSXz5Z//H
 qtB4sj5obfrV7bt4weUh9WzuTKvrVVnCX8PMjdpcO7+EPiy6czh+xI8JZN5vm5iOf0Zs
 dRwTlC/bhVBrw638rKxZPbCYCL31X7iYBpIuovoHax2fmt3Dh3x+RgKyt5VyKMxRBxkH
 RchXoWjuRGTmcBhzdrgqeoyZwDrFF9Q/kbh2RXCoCh4ldJMsXI2T+wwl70+A57kBYewA
 MErA==
X-Gm-Message-State: AFqh2kr0yMdPHngWsPlbZGchTHWczd1rTzGBEP5sZZHa59FvKqhYif2g
 A4Bh7D1oM+QQcXjvrK6fvvsRMkWJ7ixFUW2B
X-Google-Smtp-Source: AMrXdXt1V6rJAzK65jVteq4WAwlBkRgyYNYce3vs+Flk482MHRLptJ0qOSeYjE86ww49skxuTDYqiA==
X-Received: by 2002:a05:6a20:e613:b0:ad:aaac:d3fe with SMTP id
 my19-20020a056a20e61300b000adaaacd3femr31399933pzb.47.1672358561413; 
 Thu, 29 Dec 2022 16:02:41 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 20/47] accel/tcg: Set cflags_next_tb in cpu_common_initfn
Date: Thu, 29 Dec 2022 16:01:54 -0800
Message-Id: <20221230000221.2764875-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

While we initialize this value in cpu_common_reset, that
isn't called during startup, so set it as well in init.
This fixes -singlestep versus the very first TB.

Fixes: 04f5b647ed07 ("accel/tcg: Handle -singlestep in curr_cflags")
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/cpu-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 78b5f350a0..b177e761f0 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -235,6 +235,7 @@ static void cpu_common_initfn(Object *obj)
     /* the default value is changed by qemu_init_vcpu() for softmmu */
     cpu->nr_cores = 1;
     cpu->nr_threads = 1;
+    cpu->cflags_next_tb = -1;
 
     qemu_mutex_init(&cpu->work_mutex);
     QSIMPLEQ_INIT(&cpu->work_list);
-- 
2.34.1


