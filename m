Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDD95A30AD
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 22:57:06 +0200 (CEST)
Received: from localhost ([::1]:52244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRgO1-0005TA-Do
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 16:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRgMO-0002gX-AY
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:55:24 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRgMM-00033C-KV
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:55:23 -0400
Received: by mail-pl1-x629.google.com with SMTP id x23so2572831pll.7
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 13:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=3MpH6rvj4gF1XwgHxAVlc+ezcD4pwMOUg9Ok9REg8dY=;
 b=PAixZQjlcqjAIalnd+pknHiH7+JVqVYtBpXfQq+W/R/Ua+ikAAOyVLHkmklFCUGUak
 WAguzPA9GZ+xPsuRU5aOA3/YhB1J+SIAHjch+ySA4rsePbqgF3TvFkbiYJ7oJ3NmHSlu
 MWKhDP58fLta2209Xb8f2RUXwNQF099SflopJhwEEfZgDJdogIV2oj50HuNFrOceHCZ0
 INONVzZDudwQ/C2kjMT2KBgWufIDhL2lBpZLLAeOf0hBE3fZjofaYsw/VbWDvfBRDS7h
 r8sLiWwtXjPcH1gZTSrRNKKpCAPyxCh3uatBCIIZSW4Y+k78vWePsiunvjGMjunQC+4i
 40Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=3MpH6rvj4gF1XwgHxAVlc+ezcD4pwMOUg9Ok9REg8dY=;
 b=yq/fX9mO7RHQF9Xo8bIXmHcnayC6+lFoH1yPbRm1L2+/YgT7H4rHdDKEsXywsjh0EK
 S2nIC1IESPO5hm5vLT3mzhAS0gBhNg9CK1esFRTSpn6yDrd7Nj+S6LI59unZi7jHoSDM
 iYjCwycZQTpw/4VYlEq+iNo0MKpZORnF5+eYH9GjGIKXeDyhOcE6gYIlYL6N7ost7wP8
 ozEcMwdRiQQ5XDEuUy677dNwx79rXAJURYb8riKashNFCrTObfYeKAKkoYdfsSgRhWD8
 258abG7l5g53ubXu7ujQ6k8eSmBoX0IcUhW0ATf99a3jDDBn7mRUMoRNJ9Q9INQzQnk0
 x5Iw==
X-Gm-Message-State: ACgBeo3x+ijWoVEvZ3PaDVhEA6c7Z+SmswBsHE6acl+eQRg64wsFHXmz
 ML/ZEQrb5WpWchohDWKFTkfOUB5Q/8rMiw==
X-Google-Smtp-Source: AA6agR4YTCqBjUg1rrUUcJ1L6YnXQFZmG2WHkTYI9mUUXpAv3pOWLW4g18fx1Rg2sVG1eqGGe4LkXg==
X-Received: by 2002:a17:902:e80a:b0:172:ff23:fab3 with SMTP id
 u10-20020a170902e80a00b00172ff23fab3mr5436272plg.171.1661547320631; 
 Fri, 26 Aug 2022 13:55:20 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a170902650b00b00172a567d910sm2009900plk.289.2022.08.26.13.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 13:55:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mrolnik@gmail.com
Subject: [PATCH 0/3] target/avr: Fix skips vs interrupts
Date: Fri, 26 Aug 2022 13:55:15 -0700
Message-Id: <20220826205518.2339352-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Fixes https://gitlab.com/qemu-project/qemu/-/issues/1118

r~

Richard Henderson (3):
  target/avr: Call avr_cpu_do_interrupt directly
  target/avr: Only execute one interrupt at a time
  target/avr: Disable interrupts when env->skip set

 target/avr/helper.c    | 23 ++++++++++++++---------
 target/avr/translate.c | 26 ++++++++++++++++++++++----
 2 files changed, 36 insertions(+), 13 deletions(-)

-- 
2.34.1


