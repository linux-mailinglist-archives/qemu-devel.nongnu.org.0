Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBD447B46A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 21:36:05 +0100 (CET)
Received: from localhost ([::1]:35000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPO8-0003at-TP
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 15:36:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDj-0001jT-C7
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:20 -0500
Received: from [2607:f8b0:4864:20::102b] (port=53228
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDe-00070x-S2
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:19 -0500
Received: by mail-pj1-x102b.google.com with SMTP id co15so10443330pjb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 12:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s/pA8V+yNrBMZnuZyz1KWKoRUi8x+EMLOwcwdtIndmA=;
 b=rzNwS6j4lpysmyIaAFcsaQzVY4vbOsbolvBTijrKAOXllyMIsL6x4UhQtN4+lEzjOu
 mMecqXu1Ncv7dvHmiMchJVRgK0GJT7xhOjIlcVcA/AQ+H04K++YyakvQkYhNGu3fyYIn
 b3dDJsD0V/pzIfWEPSPeMtQFPAhxJEiWg4Kf6WunQv4w+bl4UsZww1jQIDuw8PuDJ40z
 UgtuNI67ooYxi9YPclfQWPgg/1aCp+Ru9OQchwB478uSPpRqD6k2FrjLGaX3XHU3os5I
 pPBhfhwXa4OYTF3WiDj0k/3jM7/NLggzzLbICwSa3I+soxVEQsHKppG9ujwJNPa7FU8w
 DOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s/pA8V+yNrBMZnuZyz1KWKoRUi8x+EMLOwcwdtIndmA=;
 b=ZHu1nM98n/Xb1Y/KW2dVpzICnRIQ49kEAClIbFSh+J4FnU7myaFUsm/TZfAGRVnETg
 ICAvx80KJ7py5JS4PhH+ic8YtPQGUCT+wq6Img4SzvQJ9elNmoaWrZiYpWvpQPlzKibx
 jtLLL4KPHTH9A4arQ3XLDjhzscRg9Eo+IcRF4798z7lD8Xu4KUZiECSd/qCpl8T7i5Vi
 UFmxotTRZHqQJUl7RLUlxNsHwt7fITTikNchSyNhVYdCeHJBFXL71tK2aBJwPxKVSLhR
 NZKPKz+TAESSYqX8fot9rDJwieUm3tfmCTG2RtEAqf6aGqvIRbbGbeMtDizs3y2IPlmv
 +MVw==
X-Gm-Message-State: AOAM532+pTwrQHRIdant8uoRqWwtZC+Ebe02uWjpE36aD0YQw/lkoiKf
 Hy2N0wvPeK7Dr6PqIhdLHsC3RUvHMwFExQ==
X-Google-Smtp-Source: ABdhPJzKrepErEK1V2QmNwh+Ba/G/+etGpIXnA0IDMJeG30KnfJaibJy8MjffPRoBNJMEufMGuePOg==
X-Received: by 2002:a17:90b:1b43:: with SMTP id
 nv3mr785498pjb.93.1640031913471; 
 Mon, 20 Dec 2021 12:25:13 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q19sm233118pjd.21.2021.12.20.12.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 12:25:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/15] linux-user: Move thunk.c from top-level
Date: Mon, 20 Dec 2021 12:24:58 -0800
Message-Id: <20211220202500.111897-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220202500.111897-1-richard.henderson@linaro.org>
References: <20211220202500.111897-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
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
index 4e0a8033f7..eebeaab9ce 100644
--- a/meson.build
+++ b/meson.build
@@ -2633,7 +2633,6 @@ subdir('linux-user')
 
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
 
-linux_user_ss.add(files('thunk.c'))
 specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
 
 common_user_ss = common_user_ss.apply(config_all, strict: false)
diff --git a/thunk.c b/linux-user/thunk.c
similarity index 100%
rename from thunk.c
rename to linux-user/thunk.c
diff --git a/MAINTAINERS b/MAINTAINERS
index be8fc57538..1de6ce6e44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3077,7 +3077,6 @@ Usermode Emulation
 Overall usermode emulation
 M: Riku Voipio <riku.voipio@iki.fi>
 S: Maintained
-F: thunk.c
 F: accel/tcg/user-exec*.c
 F: include/user/
 F: common-user/
diff --git a/linux-user/meson.build b/linux-user/meson.build
index eef1dd68bd..ca8b86f209 100644
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


