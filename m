Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1506137B6
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:20:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUZD-0001Vf-WB; Mon, 31 Oct 2022 09:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYj-0007wo-GW
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:39 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYd-0001Fd-KN
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:32 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 b20-20020a05600c4e1400b003cc28585e2fso7993555wmq.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bDnHP6RNJg/cdbD39uW325f5OF55I16EB6PoypSgmcg=;
 b=UEfR5ZoyZR/6oljZ9Tk/EsOnr4Q9LNUp2QCT+OudMEOV94qTOpoXIAw9aBB69LZpNZ
 uuez5ofUEV89Ma7a2O/9/nwWje3thyKoeSDeXdXZM86w9aMjxuZ6+YmrellFBcg8ko7B
 uGEZKPKr97CYNC42jQAEpkwYXikZ71NSc7Wca+ETmecbIwCJxqE/vLf6/FxIZ8ZooK1l
 E8XlE10QC+TDYrdmF2fpO7VWAAjlfkb3ZuI46aqe0COuwnyyd8GAfBAy7kHnKsmWT0Rd
 iVKFpfp6w8u7bA1piM+qcxp9pV90MaGubwSbBMgbzowUpjuZ5PDUPe5BFzTplWOfpKTq
 rdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bDnHP6RNJg/cdbD39uW325f5OF55I16EB6PoypSgmcg=;
 b=a0Ou8/b57Lm7u4JeHFpuJh32kcW6p9J+K2Wz7hyVtP/aP803xK5G640byjia0CJqIK
 XKsFFuXv/pPW5UqLkZ81m5Ga5djhHOKvKsTIrrydH3jXXQmlbH47GvRprEMfIdouJbXa
 dbQCInu7bWiunm46tFXZSzoPLAoJFmjrnPC82aiWyPifSGmUNH16D0lNd54oDbSruoyi
 OLrGUX2LKw6DacGZ72OyGT3C4V47iQHiiOlUfp2VxJIdlBb+K+eqtaeRpb18xxj8jmNU
 73bzG+0mdLLOiA5IKF6YtGZeB3bA3K6JRvennzKxlTVmuYKTzDB7y5iUsyreXW5M3FQt
 s+wA==
X-Gm-Message-State: ACrzQf0NZvo8ldb/KadT9nTuvHWTCcqoAV9BkSu/Q+PVroIk7DtqWu6N
 c3ESgix7iP9yZbMW7551ICLSpw==
X-Google-Smtp-Source: AMsMyM6EHMjjGKo9Ia1Fn7bi6xmHf4gQncnEtwxH/97vP8IYv6GD7JnJH9yCDyp0Jh5wI/VKz/RRyA==
X-Received: by 2002:a05:600c:538a:b0:3c6:c223:7ec5 with SMTP id
 hg10-20020a05600c538a00b003c6c2237ec5mr8202068wmb.37.1667221823692; 
 Mon, 31 Oct 2022 06:10:23 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a5d6e03000000b002365730eae8sm7018050wrz.55.2022.10.31.06.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:10:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3294A1FFC4;
 Mon, 31 Oct 2022 13:10:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 13/31] tcg: Avoid using hardcoded /tmp
Date: Mon, 31 Oct 2022 13:09:52 +0000
Message-Id: <20221031131010.682984-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

Use g_get_tmp_dir() to get the directory to use for temporary files.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221006151927.2079583-3-bmeng.cn@gmail.com>
Message-Id: <20221027183637.2772968-12-alex.bennee@linaro.org>

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 612a12f58f..84921b64f7 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4729,7 +4729,8 @@ static void tcg_register_jit_int(const void *buf_ptr, size_t buf_size,
     /* Enable this block to be able to debug the ELF image file creation.
        One can use readelf, objdump, or other inspection utilities.  */
     {
-        FILE *f = fopen("/tmp/qemu.jit", "w+b");
+        g_autofree char *jit = g_strdup_printf("%s/qemu.jit", g_get_tmp_dir());
+        FILE *f = fopen(jit, "w+b");
         if (f) {
             if (fwrite(img, img_size, 1, f) != img_size) {
                 /* Avoid stupid unused return value warning for fwrite.  */
-- 
2.34.1


