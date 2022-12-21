Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F3D652E35
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 10:06:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7v1b-0000CJ-Vg; Wed, 21 Dec 2022 04:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7v1O-000076-DY
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:04:22 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7v1M-0000ER-OV
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:04:18 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso941706wmo.1
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 01:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7gzfip+VtarrKCNhyN3EQVuk1lZMb8d8K27dCXSbGMI=;
 b=tJtOzEbVXWhuM2xA31Q0yrL5/+ey6fq8UCEPmhFpUF7O99EktAR8MfqFrHvHnHoJvO
 HxkR53wUivHjMZAO0ENoxDPOOluFot9w1o8b8hY5dihSeuZcmEO9THoavQEfD70qcMVP
 roGKbGFII7h8vTqaclM4UrmjAxLTTMD4Df5QpFzxRxH1mnTJYC6PIMz4yb9hVtN75u/k
 XHQDHaV17S/AY97YIIkk60ZZqUBattXfvbzw8htGOzS81l5L1AxTqGFTbx5WdCVTkvOe
 XZrrwTWtODXr6w5vSHF+/djEe2QNGwdQLu7HxDN2as2p/uY3Sg/vr5MCI+9YiBT2FwOO
 CiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7gzfip+VtarrKCNhyN3EQVuk1lZMb8d8K27dCXSbGMI=;
 b=4UlfBrWJ24xvIT7t2A+yqdf/Dfh1gaeY6+0qG401KV6eOpS3xcfOW+GE2aQHyOMHuX
 0Y0QLphhpLN6KTl5BbJwmJmXPPCG8BOaNGxytWsQOKJkrUroWSeXseagKofvacDqz+y5
 YDSqcJnEmkgJEjXZyd7NRxZb++QCM43YEC+6hD9W4D9MikjoWcOoYV7gJ4wXqv6Tolta
 Pbkqr3DQ1CGG78HlVXabWqi7MJGa9zroj4yiC3M7wD1gkWC341FkILFADdgl2OnJGyhQ
 /qk9Phndfv5IQJIVC/n9Z1NmC2BPjRmqxuZfpas6xHr2FQUt/wGn4WtwrvNQuSICINih
 rT6w==
X-Gm-Message-State: AFqh2koRY5yyoVQbo9x6Zexz2VSfNGldidkv+UjMKKacARq8ZDKH5smM
 AtFf3iZ4HrdlMFxFan5Hx23XZA==
X-Google-Smtp-Source: AMrXdXvbnzV551BFmOAN2L92DOVHnTx++LsL/ElhfzzccNgYABfaSJGPGZtX4/eA8wd0R0ZyWpou0A==
X-Received: by 2002:a7b:ce89:0:b0:3d2:3239:2fd7 with SMTP id
 q9-20020a7bce89000000b003d232392fd7mr973437wmj.41.1671613454407; 
 Wed, 21 Dec 2022 01:04:14 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a5d698c000000b00241c6729c2bsm14720103wru.26.2022.12.21.01.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 01:04:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C7201FFBB;
 Wed, 21 Dec 2022 09:04:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, fam@euphon.net,
 berrange@redhat.com, f4bug@amsat.org, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 3/6] configure: repeat ourselves for the benefit of CI
Date: Wed, 21 Dec 2022 09:04:08 +0000
Message-Id: <20221221090411.1995037-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221090411.1995037-1-alex.bennee@linaro.org>
References: <20221221090411.1995037-1-alex.bennee@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Our CI system echos the lines it executes but not the expansions. For
the sake of a line of extra verbosity during the configure phase lets
echo the invocation of script to stdout as well as the log when on CI.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221202174746.1218017-1-alex.bennee@linaro.org>

---
v2
  - only add the extra line on GITLAB_CI
---
 configure | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 7a804fb657..d89e883844 100755
--- a/configure
+++ b/configure
@@ -83,9 +83,10 @@ rm -f config.log
 # Print a helpful header at the top of config.log
 echo "# QEMU configure log $(date)" >> config.log
 printf "# Configured with:" >> config.log
-printf " '%s'" "$0" "$@" >> config.log
-echo >> config.log
-echo "#" >> config.log
+# repeat the invocation to log and stdout for CI
+invoke=$(printf " '%s'" "$0" "$@")
+test -n "$GITLAB_CI" && echo "configuring with: $invoke"
+{ echo "$invoke"; echo; echo "#"; } >> config.log
 
 quote_sh() {
     printf "%s" "$1" | sed "s,','\\\\'',g; s,.*,'&',"
-- 
2.34.1


