Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6339B4C574A
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 19:10:03 +0100 (CET)
Received: from localhost ([::1]:33086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO1W5-0000UH-PK
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 13:10:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1Tk-0005aP-4y
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:36 -0500
Received: from [2a00:1450:4864:20::32d] (port=52807
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1Th-0004O0-Dk
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:35 -0500
Received: by mail-wm1-x32d.google.com with SMTP id r10so3443651wma.2
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 10:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=69r6sZ1kkJxMt2KyUKfuRJlv9++qvw2nUkFmKqMYjMg=;
 b=WsTKdajfOhq4U6yLNqqzb0iBTrwBXx+hEJbZ/T5ChdoXFlSY1tSdDXJkFHLwc7I3ba
 293F0R2eHc+VYyDiN3VGzB5TOjk7tg4YJUyact6G0lWyyKqhwdT4PQFUuZLCa53CEaz8
 wmgbmx1BCNXEj9Ix0jyXxlIgedMpk3u/coIdcHyi0Tx8CWYWREmvLGB5vUKv5qxZQwW5
 to1fcPagap5TDkBYFTTyvHyp/Bk8oLt6BKfourzCzcnwwplD8kBoP7vK/fgbYH+JvbUS
 W9wxEOmreG0CImCH0m2RU1JOh70i+wU/IUbH4ipUpZqCsphvMbER4kIZxhlJYPpCRicR
 QSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=69r6sZ1kkJxMt2KyUKfuRJlv9++qvw2nUkFmKqMYjMg=;
 b=j5MvmalOVu+pMVkHKXDVn2fdxoxhJXYd9VWqLB7cL4vF/y7XuKD2uDc7nxd7UQuZst
 z4FUaMjhIF5WOv77NjNVp/YNs0VUg+ixSkQt1llAjx621D9Ms7eYTVKd0BO+jJ71m3JI
 TksCJ5stY8VVghQ4dogwLQgqOke4/NK26JmRMVUfDgVPopxN8eJ9qGbKpwT5JBeVX13Y
 Y1ms8g3/8S5Bq7R9m4pRlJnUTCp/bBLIa1/rjyf6hmIZjiug19HJ0U1V/WQzQopIcu8v
 cNxiuor8HUYSXuFHc8kSurxc7ImndvaKaZFVlnd1EiCSztN0N1RMuHGz2nkUo9IwRmNj
 nyMw==
X-Gm-Message-State: AOAM5329qisAcCc5eSGd/J/yXLIVQH3Dv5WGjqqNXxZ65jKHDFXsLniq
 jOIYRHGD1HYuS5oZRlIFm6O8UAdux8shcQ==
X-Google-Smtp-Source: ABdhPJy6YU8cSa39V8tY4/Snf6+1HXvDBWfj/fgQPzSM2ItY8rmsfd825tDyQSnRcHJj19YXqWUtlQ==
X-Received: by 2002:a7b:cb83:0:b0:37e:bc50:3c6b with SMTP id
 m3-20020a7bcb83000000b0037ebc503c6bmr7385511wmi.67.1645898850756; 
 Sat, 26 Feb 2022 10:07:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adfe64f000000b001e60965a5d4sm5622409wrn.44.2022.02.26.10.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 10:07:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] meson.build: Don't misdetect posix_memalign() on Windows
Date: Sat, 26 Feb 2022 18:07:19 +0000
Message-Id: <20220226180723.1706285-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220226180723.1706285-1-peter.maydell@linaro.org>
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we incorrectly think that posix_memalign() exists on
Windows.  This is because of a combination of:

 * the msys2/mingw toolchain/libc claim to have a
   __builtin_posix_memalign when there isn't a builtin of that name
 * meson will assume that if you have a __builtin_foo that
   counts for has_function('foo')

Specifying a specific include file via prefix: causes meson to not
treat builtins as sufficient and actually look for the function
itself; see this meson pull request which added that as the official
way to get the right answer:
  https://github.com/mesonbuild/meson/pull/1150

Currently this misdectection doesn't cause problems because we only
use CONFIG_POSIX_MEMALIGN in oslib-posix.c; however that will change
in a following commit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 8df40bfac4d..e08de177c87 100644
--- a/meson.build
+++ b/meson.build
@@ -1606,7 +1606,9 @@ config_host_data.set('CONFIG_CLOCK_ADJTIME', cc.has_function('clock_adjtime'))
 config_host_data.set('CONFIG_DUP3', cc.has_function('dup3'))
 config_host_data.set('CONFIG_FALLOCATE', cc.has_function('fallocate'))
 config_host_data.set('CONFIG_POSIX_FALLOCATE', cc.has_function('posix_fallocate'))
-config_host_data.set('CONFIG_POSIX_MEMALIGN', cc.has_function('posix_memalign'))
+# Note that we need to specify prefix: here to avoid incorrectly
+# thinking that Windows has posix_memalign()
+config_host_data.set('CONFIG_POSIX_MEMALIGN', cc.has_function('posix_memalign', prefix: '#include <stdlib.h>'))
 config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 config_host_data.set('CONFIG_SEM_TIMEDWAIT', cc.has_function('sem_timedwait', dependencies: threads))
-- 
2.25.1


