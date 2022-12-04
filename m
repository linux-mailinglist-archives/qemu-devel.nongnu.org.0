Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3492641A4B
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 02:53:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1eAI-0001Yw-JZ; Sat, 03 Dec 2022 20:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p1eAG-0001YC-D1
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 20:51:32 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p1eAA-0006nt-TY
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 20:51:32 -0500
Received: by mail-oi1-x235.google.com with SMTP id v82so9287909oib.4
 for <qemu-devel@nongnu.org>; Sat, 03 Dec 2022 17:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qRDYrNC6ncCIQaccXMpu7DJfjjb+N50VX4ZID09pXFQ=;
 b=yP+hhmKfKzOfcAbQtSxJkFavl7xJG1bFWicDT1MDlAtBYo+R94iX7MIP86vMa/rFWj
 T8wnNsBKRjLVIOTXJgOBHSBDAOF2YvHf3OPqtdFSkUlHmaR6frZJm0VvRtglg57el2fM
 3aXqkgUma0T5feuPhJFrqq5D4Vkck4dgQ1kkWEuWjYCtLFj8BVgYb2LM+j8VIe8+/gMW
 azzc3RHCNMmSTTdjPsdYKsoQUITHmaf6c1zfGqa9NcUvoAMMlTSaxfOoUSthNjVYfHro
 VAhksNkIwm/c+MdI3qWe7GUnWZ3r8oCslAIc9XOvU7ngiE8AaSZK5pt35fy4TVMfXLwO
 momA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qRDYrNC6ncCIQaccXMpu7DJfjjb+N50VX4ZID09pXFQ=;
 b=bivICtceaEBldzxKFxFRD8L/4bG5rgXa4wnfgoPMYCkxVUUbAHDPYKoQhbcyfVFfcX
 qeMuKySNr81/LrGXJkSpzfMChqjZCZcrbgC2WUGSVGYAqhKfCkMtajlMFndXEoZrZrnM
 1WaaycQYoFGQYhVscQMltB2kksQVIOCdxNii+tCozFDGnbaBzXb3h5WNxPyVfnW8yyns
 Uvru0L7DrCyAEJXxkUeLal6J9IgZbLYh+z5UG0gQwewgzNJaRLG4voCsU4DLy4YJ7EGJ
 GGyiZL4OIvxhISIC6wD6BMhYnubM2vbMVbZLkRYvoOQ/tdQs40Hgyokpo+0wBLZqJqB+
 Wo6Q==
X-Gm-Message-State: ANoB5pms6SxyIj1KohUSAgTAYXqytkxSaM0GOlURn2p02whBPFAloms1
 5pWtH8IfNa6yBuLk07r2bI6KvYtK7iPPkx7t6zI=
X-Google-Smtp-Source: AA0mqf5Z8Vd5Rrkn9eTcuY2yAEIURN+c7MnJBaG/qbR0TDs8xoDKXEA+T9ubFeT66dOg398j4NGoXQ==
X-Received: by 2002:a54:4388:0:b0:35a:7db1:8d13 with SMTP id
 u8-20020a544388000000b0035a7db18d13mr28923003oiv.202.1670118685546; 
 Sat, 03 Dec 2022 17:51:25 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:6b63:a06c:99b3:833])
 by smtp.gmail.com with ESMTPSA id
 e16-20020aca2310000000b003436fa2c23bsm4964215oie.7.2022.12.03.17.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 17:51:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	tstellar@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2 0/2] Use a more portable way to enable target specific
 functions
Date: Sat,  3 Dec 2022 19:51:21 -0600
Message-Id: <20221204015123.362726-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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

This is a revision of Tom Stellard's patch from last month
which also removes the use of the #pragma.

Also, tweak --enable/disable-avx512f.


r~


Richard Henderson (2):
  util/bufferiszero: Use __attribute__((target)) for avx2/avx512
  meson: Set avx512f option to auto

 meson.build         |  8 ++------
 util/bufferiszero.c | 41 ++++++-----------------------------------
 meson_options.txt   |  2 +-
 3 files changed, 9 insertions(+), 42 deletions(-)

-- 
2.34.1


