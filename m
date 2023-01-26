Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CA867C9FC
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:32:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0UG-0005NR-RN; Thu, 26 Jan 2023 06:32:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0U6-0004XD-C0
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:32:04 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0U2-0007n1-H2
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:32:01 -0500
Received: by mail-wr1-x435.google.com with SMTP id m14so994588wrg.13
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jTUlBPS+ypvgj+Fr1uUg74hvNf7AayGAJIZigzJMmFc=;
 b=YDd4nJmhodBtrQkwNZmG6FALc+gVwWZ6eqQwsJqz9bmYEEoR5P9BcdT+aKlDlM/bPw
 EK3e91/AJyf/emtaJHZ+SrOH38Zwxzlc8eXw8LwTynnYUe8F4cSr5LD7YQtNlE3iyyMd
 i6Gt3Hc7+i7oELp62ZndjrAVzh2J9E2f0yKfoJY0Te/ORgXyPGL6M8S1ze2c0imzODPA
 zkoYWYT37i2vU021t44ZG8hX09NFhuv7fDwxXzdRCJKrFHMCHd1bOrAcEyAj/nDxIG1c
 w2L7z36r4H1+ytsIIGomMXX0ZmwKEp7EDLfyasxz0BjghHea/YbgSslgMQKX2iG5NPVg
 u4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jTUlBPS+ypvgj+Fr1uUg74hvNf7AayGAJIZigzJMmFc=;
 b=7DXYOb0Dcfu9s+9btwkr0mtHWo/krZtvofwgFV9Pe+b4P9D7ZPkSMrasS9/ej4qcop
 T6kjTHkKpyQFYO8BG901ivfG3tulFhpNxN5uvPhsl5lmJObiSA+Ymlp1RGZJyOH7Y7TJ
 ZgTzrJxaX5h/j/uJok795ATk8KiTCKNiFzbP1SLTTyYA6WWqgwAfRiii/KrE2kxtNTbn
 fWxohrDuapm6/UIWIc8U7dN1xvn/nDFKdr3KqMk7HRADnZ27Vz3ZBMUMEVH5E5I0/NIL
 eWI9nQDBx5bnkfHpLc+76iZHzw2WdmBVOuZFrZEDH1H7StDCy1v/eeM4XQROZNncmy8k
 t0gg==
X-Gm-Message-State: AO0yUKUAxpx2mjEgHGxHAKc8EJisLKnL6ANnjvyeysXnBkrXaTXfr2kO
 LkYsaNfRe/wsQLH9HbMt3rPeeA==
X-Google-Smtp-Source: AK7set+Y5XDe4VuBg1hS+tBuQZ7s9rUJi7rYylPbvLWWMCXKndoD6iFsdx76G6Prt2yWBAa1AMpkzg==
X-Received: by 2002:adf:e48c:0:b0:2bf:ae16:817c with SMTP id
 i12-20020adfe48c000000b002bfae16817cmr8787820wrm.29.1674732717120; 
 Thu, 26 Jan 2023 03:31:57 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a056000100400b00286ad197346sm1027375wrx.70.2023.01.26.03.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:31:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9880F1FFCB;
 Thu, 26 Jan 2023 11:22:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Emilio Cota <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 27/35] util/qht: add missing atomic_set(hashes[i])
Date: Thu, 26 Jan 2023 11:22:42 +0000
Message-Id: <20230126112250.2584701-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

From: Emilio Cota <cota@braap.org>

We forgot to add this one in "a890643958 util/qht: atomically set b->hashes".

Detected with tsan.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio Cota <cota@braap.org>
Message-Id: <20230111151628.320011-3-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230124180127.1881110-28-alex.bennee@linaro.org>

diff --git a/util/qht.c b/util/qht.c
index 065fc501f4..15866299e6 100644
--- a/util/qht.c
+++ b/util/qht.c
@@ -688,7 +688,7 @@ static inline void qht_bucket_remove_entry(struct qht_bucket *orig, int pos)
     int i;
 
     if (qht_entry_is_last(orig, pos)) {
-        orig->hashes[pos] = 0;
+        qatomic_set(&orig->hashes[pos], 0);
         qatomic_set(&orig->pointers[pos], NULL);
         return;
     }
-- 
2.34.1


