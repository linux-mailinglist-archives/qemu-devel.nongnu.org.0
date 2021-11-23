Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516FA45AA85
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:48:45 +0100 (CET)
Received: from localhost ([::1]:34736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpZuO-0001fx-Ev
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:48:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkR-0004hK-2N
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:27 -0500
Received: from [2a00:1450:4864:20::430] (port=36659
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkP-00051u-8u
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:26 -0500
Received: by mail-wr1-x430.google.com with SMTP id s13so40365720wrb.3
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6aHmyZ7eJwkq/2psQWocUvvFYakpSRUqI65Q0Y59+TI=;
 b=dZhBlAawkXkgXXD395K+QuA5+9d5iEj29M5ZPzzlvUG3qXljziLfLlzY/Y/6ms4wRR
 GkA2IoUlDHyRkoWou89dvLlkpe1eQZrY/1ptmh6BgqAZi69u/Rjpz+14y0x+irW9N1WE
 O/g6u26AMlflKYUovY6+kLkPgq3saawfGej/9KNNd30P5FlAU8vSQ7+NI/LclBibt5IN
 339stuXQNZc4XnzHkW0BdgNMJSJKeLyiSGDLdPFpAZRZSDEC2uCtERWE+WOQGZfQpwTZ
 twm/pCMYGqbpRV6sQH+xQW3E/arqndWbAOLSN6rDfBMGQ2LdMgXks/DHe8QpRTMUz/CZ
 n4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6aHmyZ7eJwkq/2psQWocUvvFYakpSRUqI65Q0Y59+TI=;
 b=sBG+wDTk1qBw7rHdurht3EkMshHmhKduUbsE2s/sdUVX0ftqTx0SbFEiF3QH2wnTts
 dBT3YbHESXWqZ2C959ZVdXy5cdrY5HTeqydmgGRtNL+Mtt4teHS6FTSEzi9e/cBxUzon
 x2LcO/CsJH+G/UVUumenAMP2FpCh/+Qlaj/J0rWmWZvvE1woXzzirb9oLOKWh8tj4yc6
 5WXZJ+NvgcTm2HLCAN74iI6PsOZc4OBFXq+SqCokbaIXxywD9Hvnr6J9nME3sHtAjBdw
 U4JXsobi23hVvGEJaJ8KGAGZrYFtuQtzwRrp9hvj2s3cuo2izLkjsMX1OsXAPdz+cWr0
 6CQg==
X-Gm-Message-State: AOAM532+GQfiz4fORjyV2RZHQmC+WmmdZoCbfSTLemW20SC7CoMC3e9C
 +6qQXiX5ujiYn4kF7K9AlGXKHGTFwUH5fikPCRE=
X-Google-Smtp-Source: ABdhPJxN65ygsPn8JqwpMwKs5S7Io9R+CbA4tc/bPQIKFJvGscnkJfDAAPX7XcabxXvmLOyct6ZX2w==
X-Received: by 2002:a05:6000:4b:: with SMTP id
 k11mr9108420wrx.86.1637689103821; 
 Tue, 23 Nov 2021 09:38:23 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id n13sm13054883wrt.44.2021.11.23.09.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:38:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 14/16] linux-user: Move thunk.c from top-level
Date: Tue, 23 Nov 2021 18:37:57 +0100
Message-Id: <20211123173759.1383510-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123173759.1383510-1-richard.henderson@linaro.org>
References: <20211123173759.1383510-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So far, linux-user is the only user of these functions.
Clean up the build machinery by restricting it to linux-user.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                   | 1 -
 thunk.c => linux-user/thunk.c | 0
 MAINTAINERS                   | 1 -
 linux-user/meson.build        | 1 +
 4 files changed, 1 insertion(+), 2 deletions(-)
 rename thunk.c => linux-user/thunk.c (100%)

diff --git a/meson.build b/meson.build
index d5ac65b877..cd97b154bd 100644
--- a/meson.build
+++ b/meson.build
@@ -2621,7 +2621,6 @@ subdir('linux-user')
 
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
 
-linux_user_ss.add(files('thunk.c'))
 specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
 
 common_user_ss = common_user_ss.apply(config_all, strict: false)
diff --git a/thunk.c b/linux-user/thunk.c
similarity index 100%
rename from thunk.c
rename to linux-user/thunk.c
diff --git a/MAINTAINERS b/MAINTAINERS
index e3a12857f9..d3c045ff86 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3076,7 +3076,6 @@ Usermode Emulation
 Overall usermode emulation
 M: Riku Voipio <riku.voipio@iki.fi>
 S: Maintained
-F: thunk.c
 F: accel/tcg/user-exec*.c
 F: include/user/
 F: common-user/
diff --git a/linux-user/meson.build b/linux-user/meson.build
index bf9d945504..fcf7d40f23 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -15,6 +15,7 @@ linux_user_ss.add(files(
   'signal.c',
   'strace.c',
   'syscall.c',
+  'thunk.c',
   'uaccess.c',
   'uname.c',
 ))
-- 
2.25.1


