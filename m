Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA0D5067BD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:35:56 +0200 (CEST)
Received: from localhost ([::1]:59456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkH5-0004DH-EV
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngk1Y-0007R5-K2
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:19:52 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngk1R-0001PO-Ur
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:19:51 -0400
Received: by mail-ej1-x62c.google.com with SMTP id g18so31563252ejc.10
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nhb9rVKteQQXfF9Rk3qVvt+rp0GSZP29awSEF2oCmWk=;
 b=mW69551ZATFh26+F+MXLbK9o+YpkKpGi3vGIX+yMnnIZELXcEe38lqdtBT17vg/VZ5
 7Sy0zggetwROUbeyiqatYYKsGKjVCqAmQ41KAyS9dxtv+d05SOCFAMfbREhzJnY8HpQK
 iKuoMDeHTvvsjotbl0pQSFYJlJbu1CIpodZKNiwrsqSxymVd5/hQ40ypDQPHMW5zFpVQ
 HxMeLXjVC8p69lPAO03GHicXBXxQagQu58TYR7bZk46dS8kqQqdRZF2fKDljD5owfeYK
 al/uJfQHZGQ7Zsb51AKBJYoJKZCrEy39vomGr1X6fnBeXihk4zbzGYVO7As+2gONLQmt
 8jSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nhb9rVKteQQXfF9Rk3qVvt+rp0GSZP29awSEF2oCmWk=;
 b=pT0QELZUuJcFplWbmxuQ/+54ODWWv5jlDi/cznLk323458OojIf9iJAstyzAb1ZKAv
 c4GkXCDsigCgdhAuviXsgoDImnjBqpPC9ndR5LvgEqBg3y3X0yMYwZir8PFDjTB4VB+B
 WgGn0PTDqvWukH2+d6KW9PiF+dhhHwaEiGemqLrHs6Wjw9KMXdgsLYUyqtHyC/Je4fUd
 51F2AKfUCW/t+ZIqrgRoHuGfk0TtpiPbAxnj3yUv+dHwAYRCAPHFA1jbTY7bWGGD9VMO
 tlLlp33mZe8VHMP+Iz4vLqB/IYjCDg9TuZU1g/qdFgfHEOJBvVQyz6CySZMU8z0Hoywz
 rSrA==
X-Gm-Message-State: AOAM5310PC1qBTJ+hpCgKw8MgxCpFcOfIrnkGAwe2SP79ViVfhKbSQmy
 rn0LPvYk6u52fKWppW0OJgNWhQ==
X-Google-Smtp-Source: ABdhPJyFBFehtVYQWo8IGbrXZj8f+QLFp1u/D0l/JhDAA+TViJzh24POig2l5D7Nuu81ge3oCHhdsA==
X-Received: by 2002:a17:907:d90:b0:6eb:557e:91e6 with SMTP id
 go16-20020a1709070d9000b006eb557e91e6mr12423053ejc.376.1650359984487; 
 Tue, 19 Apr 2022 02:19:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a170906700a00b006efdb748e8dsm591744ejj.88.2022.04.19.02.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:19:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 157EF1FFCC;
 Tue, 19 Apr 2022 10:10:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 20/25] tests/tcg: fix non-static build
Date: Tue, 19 Apr 2022 10:10:15 +0100
Message-Id: <20220419091020.3008144-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

If linking with -static fails at configure time, -static should not be used
at build time either. Do not include BUILD_STATIC in $config_target_mak.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-18-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/configure.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 75603fee6d..691d90abac 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -261,7 +261,6 @@ for target in $target_list; do
                   if do_compiler "$target_compiler" $target_compiler_cflags \
                                  -o $TMPE $TMPC ; then
                       got_cross_cc=yes
-                      echo "BUILD_STATIC=y" >> $config_target_mak
                       echo "CC=$target_compiler" >> $config_target_mak
                   fi
               else
-- 
2.30.2


