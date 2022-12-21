Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43A465328C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 15:41:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p80Gm-0006vL-3d; Wed, 21 Dec 2022 09:40:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p80Ge-0006ty-Pb
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 09:40:24 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p80Gc-0004tF-Mf
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 09:40:24 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 r126-20020a1c4484000000b003d6b8e8e07fso1514209wma.0
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 06:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=87B4xJDM8OIXYXegfKHvBAcAzKRV4DRuOlrFU4smc8k=;
 b=KVJJbDMUk974i5fqeyEKzAZsPR3EuJkfWeJirG45Vx11ut83jWjVbRfJDInvgXGjM3
 DnFEZf0WU58WhpVItKFLjcutpbk2WxqUI6c/YERfSg82dJvM4pfYabxM6Gv63MsVLVdI
 kHxcV1BiOqvsZpM/fKjI8264GXXP5/lYxWRqnWKr7r8gk6uzcm2rEJ8HZLA8rBlqEeSu
 bdZ5oXauKutzthV+daifBTcoKlVmn5xnLe5+2yZRcySo8MUQTSeqf7h/gn4ajKR0eJnQ
 waQlasqlpLUX6KfhsaBR3sMdhCLFj+N8qZ9tYuvGRvMaqyOpyvbdeEt5/Zz/FhY8aKcJ
 zCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=87B4xJDM8OIXYXegfKHvBAcAzKRV4DRuOlrFU4smc8k=;
 b=njqe/UZ10+K8OQnrmVXM/vNmUGD6oqIKaI4X78xf0nqDrAjlwFWphomLoqav1bJ5xr
 dVM/xMyL9QUcPw0r0EKuFSfLmMuSzGZZVeIkeaIObO+6MqDWcYXPhpvnzhP8E6QTpb4j
 w932WyNYuEgGmPX9yuPx67KSNEYpiG5aa/oJWvVOdDyxQtnmPdp78+/ItOFnXmPdaIl5
 wCdjTZ7gBLal+PpTI6roAUlqCxnq+gKttugkOOQLhDKATuHKRR44lBYSgHZOV2cbbp27
 WKkGZbmjnh02V2LvI7oypQ9SFoTZEPgys64FNh+Xv+LuZFGzaNbCzgi30oAifZ3NoNSn
 shfA==
X-Gm-Message-State: AFqh2koL4ywFiZqcOEYtIpBIbT5dfJAFtcdiDIzgWsgivjU28RDhGwPy
 mGezcNQuzBsPSpou+tZKt+l5CA==
X-Google-Smtp-Source: AMrXdXu/3oiZX8dEYn/wqsQRMxaL/drHniKnLRt/LVZA9ZDqHTkwsH91zabpxStfVkLbZyDzNIEdQA==
X-Received: by 2002:a05:600c:34d1:b0:3d7:72e3:f437 with SMTP id
 d17-20020a05600c34d100b003d772e3f437mr1845751wmq.21.1671633621093; 
 Wed, 21 Dec 2022 06:40:21 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a05600c461800b003cfd0bd8c0asm2315210wmo.30.2022.12.21.06.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 06:40:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D788B1FFB8;
 Wed, 21 Dec 2022 14:40:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 1/6] configure: Fix check-tcg not executing any tests
Date: Wed, 21 Dec 2022 14:40:14 +0000
Message-Id: <20221221144019.2149905-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221144019.2149905-1-alex.bennee@linaro.org>
References: <20221221144019.2149905-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>

After configuring with --target-list=hexagon-linux-user
running `make check-tcg` just prints the following:

```
make: Nothing to be done for 'check-tcg'
```

In the probe_target_compiler function, the 'break'
command is used incorrectly. There are no lexically
enclosing loops associated with that break command which
is an unspecfied behaviour in the POSIX standard.

The dash shell implementation aborts the currently executing
loop, in this case, causing the rest of the logic for the loop
in line 2490 to be skipped, which means no Makefiles are
generated for the tcg target tests.

Fixes: c3b570b5a9a24d25 (configure: don't enable
cross compilers unless in target_list)

Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Link: https://patchew.org/QEMU/20221207082309.9966-1-quic._5Fmthiyaga@quicinc.com/
Message-Id: <20221207082309.9966-1-quic_mthiyaga@quicinc.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221221090411.1995037-2-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 26c7bc5154..7a804fb657 100755
--- a/configure
+++ b/configure
@@ -1881,9 +1881,7 @@ probe_target_compiler() {
   # We shall skip configuring the target compiler if the user didn't
   # bother enabling an appropriate guest. This avoids building
   # extraneous firmware images and tests.
-  if test "${target_list#*$1}" != "$1"; then
-      break;
-  else
+  if test "${target_list#*$1}" = "$1"; then
       return 1
   fi
 
-- 
2.34.1


