Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9DB38F244
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:29:55 +0200 (CEST)
Received: from localhost ([::1]:58396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEOn-0000gN-VV
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeW-00056y-IH
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:42:11 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:36584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeJ-0004PZ-Oj
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:42:03 -0400
Received: by mail-ed1-x530.google.com with SMTP id df21so32753567edb.3
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PRKAqQVQk6atOGbruXu4fzvA7uFctSe6m5tKH4EPE8E=;
 b=Nj39wwUBKfMBIanByECbgcdw187Y+VRABHLd9fIp9tPBXARJaKUGhROSlUTZOntP2B
 FGD3g0n0dZKC2I9NUty4WfnAHyGzL+alECUfL7CLJ5/YaHlGK9xfQtDyVjwwd39Xxex6
 oJRPZyKUQC1ZNX/jLGQtoiLkXWxxuwu97vg4/MD4qfsnq/6O221eVgUDK38rUGGBgkaT
 MYyBIvisV4KkoaGEZ/YlSUrRko7jHS4nw7poytr9ecaOqmMisQimjsIz/PCtGvJVAn2x
 jENP7Q0ovCrzfblcvVXzTouoGsyKrGTYY8ekwiI7yyBM1UKvpiHq8464cMXYVCjkLTbz
 TSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PRKAqQVQk6atOGbruXu4fzvA7uFctSe6m5tKH4EPE8E=;
 b=sbhW1m53174lljQ2wactINlCEmBWxYsLtH493fWp1TeRytPK2rQQPlKzF91CZi1Z45
 6m42ruWyKBge9ByrqHTlH+8Zs8yvKBdzwtrMYc6Pkfn7HeE/zaEn/+JA61SJ62jPpRWB
 zsWsSnWpl+Qr3NBQNXO81RcJuWtyFyNcOmtIyHXOo6SIj65x2xZT/aPeWFTXGVY6BBq5
 iT7AgcN2nOwDUPMfbvtFl66VfRi2czcpMCu8ZTTb9t1rx/J2UDQY40/GfnNLy2Z2KqcX
 iZVH76CYT+1Pp+1SRsnl5yu/ttp/cU8mOnQ3mYBVrKVfhSqFsUQKH4VBCBn0d1+SKxz6
 GhbA==
X-Gm-Message-State: AOAM533SeqZXcH487xjN8B9+YNoMm3eWoAR6dg7Vcag2LyPBwxRjTAKw
 L+ii/a5ZwCzaqdTQ0ykLtwQa+KP9MMHsWw==
X-Google-Smtp-Source: ABdhPJwlSB7JR8b/mCXF6zkLIUvx/nYcd+n+cC7Orqvx36SPlrHhPL2fpXP2rEFN9nn6SWtQ1AWf5Q==
X-Received: by 2002:a05:6402:951:: with SMTP id
 h17mr26957486edz.212.1621874510439; 
 Mon, 24 May 2021 09:41:50 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/28] configure: Avoid error messages about missing
 *-config-*.h files
Date: Mon, 24 May 2021 18:41:29 +0200
Message-Id: <20210524164131.383778-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

When compiling with --disable-system there is a harmless yet still
annoying error message at the end of the "configure" step:

 sed: can't read *-config-devices.h: No such file or directory

When only building the tools or docs, without any emulator at all,
there is even an additional message about missing *-config-target.h
files.

Fix it by checking whether any of these files are available before
using them.

Fixes: e0447a834d ("configure: Poison all current target-specific #defines")
Reported-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210519113840.298174-1-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index cca532bb0c..90c0807347 100755
--- a/configure
+++ b/configure
@@ -6503,10 +6503,14 @@ fi
 
 # Create list of config switches that should be poisoned in common code...
 # but filter out CONFIG_TCG and CONFIG_USER_ONLY which are special.
-sed -n -e '/CONFIG_TCG/d' -e '/CONFIG_USER_ONLY/d' \
-    -e '/^#define / { s///; s/ .*//; s/^/#pragma GCC poison /p; }' \
-    *-config-devices.h *-config-target.h | \
-    sort -u > config-poison.h
+target_configs_h=$(ls *-config-devices.h *-config-target.h 2>/dev/null)
+if test -n "$target_configs_h" ; then
+    sed -n -e '/CONFIG_TCG/d' -e '/CONFIG_USER_ONLY/d' \
+        -e '/^#define / { s///; s/ .*//; s/^/#pragma GCC poison /p; }' \
+        $target_configs_h | sort -u > config-poison.h
+else
+    :> config-poison.h
+fi
 
 # Save the configure command line for later reuse.
 cat <<EOD >config.status
-- 
2.31.1



