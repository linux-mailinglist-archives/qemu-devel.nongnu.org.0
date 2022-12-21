Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1773653289
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 15:41:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p80Go-0006vs-2B; Wed, 21 Dec 2022 09:40:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p80Gg-0006v6-6r
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 09:40:26 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p80Ge-0004u1-Ic
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 09:40:25 -0500
Received: by mail-wr1-x42f.google.com with SMTP id m14so15144341wrh.7
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 06:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3E08cP9uQJJb13y/tK6ptN3WodIQyLPwxmDugVOqWPI=;
 b=sEuYNfm8/SlqxF5//bi/DXEs8e5XgV3tF7jltMyBT+GWf+8uamX6KQaglfQIwPnUn1
 nIg98xOdGTAqNvvl7Dn6ZFu0fOKKSEKKJHjX47YxbkTSxx7EZ3ny1RhDEFQaRhLgES9h
 w9363YAF9H5Z9c+c2+1zV2Goj5NeIHsF6L7pROYTgBm0JB2Rm+IYTyPb8ceyRJrzFeW0
 PlBrIaGiJxiQ36W9ZU2ZnoLk4I79Y/aflJe3CORDvp5tJdzcOFgJNj21jaaGSfjuB78k
 z7G043xHO6F+k7B0cX0z7Ag5suxtN6Yp/Ql/BP1Wwy6/y29F6DZqzfdL+SVp0u/uDbzr
 mlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3E08cP9uQJJb13y/tK6ptN3WodIQyLPwxmDugVOqWPI=;
 b=gXI2z9R2g2+hXxxkWlKIE4gNHGQir75Rlu0vruzz4/znFFNJpT2qyWydtzOuK1f0Xf
 5Xxxm+x3UFh2++GB2Ju3P+Ma3myAbwGvRfwa8Glt+oR2Bv5FZ9JYUTfkmrAjlXQ+X+fL
 gFZ+38eZ1F8nIeTF0mf62SR9lPjGkscmAq+0wAn7y4AxUZS6j8uOjSZ+KPfjRZpaZ76f
 SlnF5yfmhXg95NvGKjS3N4krx5YZUvB22e3qw+Y8k8S2iILUIWly/YouDyS9KgANiCW0
 6tMwGBWfT9cENIWeJakQWGlFypqGoE+Yxjrw2bFMLkBkcKWf6I8Qb3yeKYl7mGXrFZ8g
 E9Hw==
X-Gm-Message-State: AFqh2kq0zp4uwTv5IZEThq4CKa14ULMDXz6HaHK5th6hp7wVo/5GjuhT
 FBxXR6nfnne47nRLnzw89IZVAg==
X-Google-Smtp-Source: AMrXdXseqhP/94THebgGzMjVmmueJpXvxJKZgma/DkeSrH5HPrwv3XvQNhbzkjwnbNwsTptjXleaCQ==
X-Received: by 2002:adf:f1c9:0:b0:242:1d69:1ba1 with SMTP id
 z9-20020adff1c9000000b002421d691ba1mr1478462wro.44.1671633622756; 
 Wed, 21 Dec 2022 06:40:22 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a5d5611000000b002424b695f7esm15406171wrv.46.2022.12.21.06.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 06:40:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2ABB01FFBC;
 Wed, 21 Dec 2022 14:40:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 4/6] tests/tcg: fix unused variable in linux-test
Date: Wed, 21 Dec 2022 14:40:17 +0000
Message-Id: <20221221144019.2149905-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221144019.2149905-1-alex.bennee@linaro.org>
References: <20221221144019.2149905-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

The latest hexagon compiler picks up that we never consume wcount.
Given the name of the #define that rcount checks against is WCOUNT_MAX
I figured the check just got missed.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221221090411.1995037-5-alex.bennee@linaro.org>

diff --git a/tests/tcg/multiarch/linux/linux-test.c b/tests/tcg/multiarch/linux/linux-test.c
index 5a2a4f2258..64f57cb287 100644
--- a/tests/tcg/multiarch/linux/linux-test.c
+++ b/tests/tcg/multiarch/linux/linux-test.c
@@ -354,13 +354,17 @@ static void test_pipe(void)
             if (FD_ISSET(fds[0], &rfds)) {
                 chk_error(read(fds[0], &ch, 1));
                 rcount++;
-                if (rcount >= WCOUNT_MAX)
+                if (rcount >= WCOUNT_MAX) {
                     break;
+                }
             }
             if (FD_ISSET(fds[1], &wfds)) {
                 ch = 'a';
                 chk_error(write(fds[1], &ch, 1));
                 wcount++;
+                if (wcount >= WCOUNT_MAX) {
+                    break;
+                }
             }
         }
     }
-- 
2.34.1


