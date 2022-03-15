Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1244D9BBF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:04:33 +0100 (CET)
Received: from localhost ([::1]:38962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6qm-0004Y1-ES
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:04:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6gu-00040L-RI
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:54:23 -0400
Received: from [2607:f8b0:4864:20::632] (port=37830
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6gq-0007f0-1G
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:54:20 -0400
Received: by mail-pl1-x632.google.com with SMTP id n2so16157021plf.4
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yM0ExPfucPGnLuN+qCSdAMHJpYVpYrGUNOCDjIec9GA=;
 b=ns36NBSr73mbBczDik/pnN5pzAd6VZXPcxNTUzlMy/CN/Iwe9hZSZdMMeKDlu3owJ6
 KgnN0WVqKWbwY6bzAPultyMLIqCCDPp9oq7Zz3k/fMY7PChF/jedha+NAD3luGULJHjj
 kGWSr4Efa64iHyt/H5GtVsOITwmz/9uv9r3FY0jYlrRNzxhnb0WuUzfagNpy3b0zCgtA
 FDzj7d3jLlTY36+pSsJdCTjfcmqiZXVftO9bOoKNUlJ/VE4YvROeeD+QTTAuqJyjXCD4
 A9QSu8q7V120CdAHe9MTnnk102MCPysd/lcS/+adSDD9cOMmCU1V8q/JSPewZovmZocZ
 /hkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yM0ExPfucPGnLuN+qCSdAMHJpYVpYrGUNOCDjIec9GA=;
 b=CB+lXNZ9jk8nBBmYk4O/iTUoALPLoicwSMHDdGhe8fOekTA7FlnJYouqaIqOmMRxT5
 7S8bLEYF9CPDhfIB2CZQGs7nLnIMhfAEmqV2V8WOxxPhzpmsCuQrz1m10dwnqJc4d5Oo
 Q21Y1HhZkR5n5b6M1AzZd5RrpcpZYuqEHHXJ6TINWqQdukhZnyh2l4LBFJ8U9uj4G7rN
 9uqm9TuJUWSHZ5jYlgHjqCschpxcDS8KlPB2OKQqpokMEsopmADvqWvm0KG2WAcmwEvs
 Flea8AWCnbgTkPm4qgkF2LvIZrQ0lZ7DnXYjwlhqt34RQNTFSAh81GNyLqPqueljBF78
 t4gg==
X-Gm-Message-State: AOAM533WkdyD3WaiMPapSPHKHEAgVu/GP8jJAQSrafc5o+mYeC7x+cSn
 gUBHohK/Nps4N2ou+1Yp4yzO9YIZStg=
X-Google-Smtp-Source: ABdhPJxYQ8/2z5Ukr9MSx+b4zLFYWav5xMm2S1Tmihab+anbQ7IYdmk4zAj5h3HDkXsuEk/P6bemEQ==
X-Received: by 2002:a17:902:ed82:b0:153:85d5:7dff with SMTP id
 e2-20020a170902ed8200b0015385d57dffmr6720630plj.79.1647348854623; 
 Tue, 15 Mar 2022 05:54:14 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a056a00148600b004f9f9b9092fsm3261440pfu.113.2022.03.15.05.54.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:54:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/21] tests/fp/berkeley-testfloat-3: Ignore ignored #pragma
 directives
Date: Tue, 15 Mar 2022 13:53:31 +0100
Message-Id: <20220315125350.82452-3-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Roman Bolshakov <roman@roolebo.dev>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Since we already use -Wno-unknown-pragmas, we can also use
-Wno-ignored-pragmas. This silences hundred of warnings using
clang 13 on macOS Monterey:

  [409/771] Compiling C object tests/fp/libtestfloat.a.p/berkeley-testfloat-3_source_test_az_f128_rx.c.o
  ../tests/fp/berkeley-testfloat-3/source/test_az_f128_rx.c:49:14: warning: '#pragma FENV_ACCESS' is not supported on this target - ignored [-Wignored-pragmas]
  #pragma STDC FENV_ACCESS ON
               ^
  1 warning generated.

Having:

  $ cc -v
  Apple clang version 13.0.0 (clang-1300.0.29.30)

Reported-by: Roman Bolshakov <roman@roolebo.dev>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/fp/meson.build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/fp/meson.build b/tests/fp/meson.build
index 59776a00a7..8bd0979f67 100644
--- a/tests/fp/meson.build
+++ b/tests/fp/meson.build
@@ -37,6 +37,11 @@ tfcflags = [
   '-Wno-error',
 ]
 
+if cc.get_id() == 'clang'
+  # Clang does not support '#pragma STDC FENV_ACCESS'
+  tfcflags += [ '-Wno-ignored-pragmas' ]
+endif
+
 tfgencases = [
   tfdir / 'genCases_ui32.c',
   tfdir / 'genCases_ui64.c',
-- 
2.34.1


