Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DF1300B34
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 19:28:28 +0100 (CET)
Received: from localhost ([::1]:34630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l31AZ-0004P9-FX
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 13:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l311b-0007ay-TU
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:19:12 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l311W-0006sV-Lh
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:19:11 -0500
Received: by mail-wr1-x42d.google.com with SMTP id 6so5973109wri.3
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 10:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dhXKFBqrjyWVwdgcjtJOpFUapsJmdBL8gQLJBNQUd1s=;
 b=aAvto5t5U16jgRTJfZnjrjLXu1/YMAbmGEWoJXj5635Ujan8CoGOFHSZ9iu+iIY1OJ
 R98BJsjD5cyRjuWRoOT8GVNBuZ7ONh7LRqSDi79ep04Hcds/duTBK9ON31toovq6ya6b
 5AhLu8aMCB3vCl7oTvnQqA71x3VcJJgsVg24tgirLIvCVULqP0Ev2ErBNywMz94jCvIZ
 om83F9jdiSPMv/f/xwOXSgR3TL/okeE2wc7SeDFY4gftXQyrYqg5Wqj5ut5BGHqldvft
 /hmgRAHh4LNqlHCgd2tTcYa8R6z+p6Cs/Mm6bHAHvREapzM4mX2xYpGWZ9nfeZBNnYwn
 vRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dhXKFBqrjyWVwdgcjtJOpFUapsJmdBL8gQLJBNQUd1s=;
 b=gwVbesfTVwgHvU6pUURyeTNQcm0ohihiG4M+TFNWB+SdK+4pvKtBwobNJPHh8kBJ5V
 RbVlrwUlS7wKr3/K6tIorrKgYy4efxmlZJvud4pkUlqxm0zksETWrwvVlUTIvWnpqtn8
 e1Gl6zzYzExvFP/DlyUTuA/nvq+e0aa+O57hQ1MSsbBEpNRWU2D9/1saKJtLzCMw1j3R
 UXn6DBZGdT8UUI9u/f5vykKX0SUkB/YLMd4qdCtjNBGpDbSvMXLXJ+pmQ3AXP+rmPWw0
 L63e9QT8Y1cW88ABRgwvh6Ox5UCp7jB9iBC0oS9AI1lnyZ4N1g+CFcD3nclmarlDZBuC
 5UrA==
X-Gm-Message-State: AOAM531RL2TT/mixVFmvbRsNzgYo/aNu5BBRPJzsVU0YBOwwNd8BK6Zz
 S34znEf1Xdexj4rwpQLwSmw1oA==
X-Google-Smtp-Source: ABdhPJysBxdKrhvOYPbUKgxdbckr6v9DX0ZoWHaY4wrULpjfRXZ2Xbm9ZjdwWmhKDcOvxg9uE0W4Ow==
X-Received: by 2002:adf:dccb:: with SMTP id x11mr2174415wrm.234.1611339545293; 
 Fri, 22 Jan 2021 10:19:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p17sm12237800wmg.46.2021.01.22.10.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 10:18:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5C7A61FF96;
 Fri, 22 Jan 2021 18:18:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] configure: bump the minimum gdb version for check-tcg
 to 9.1
Date: Fri, 22 Jan 2021 18:18:54 +0000
Message-Id: <20210122181854.23105-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122181854.23105-1-alex.bennee@linaro.org>
References: <20210122181854.23105-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Luis Machado <luis.machado@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For SVE, currently the bulk of the GDB TCG tests, we need at least GDB
9.1 to support the "ieee_half" data type we report. This only affects
when GDB tests are run; users can still use lower versions of gdb as
long as they aren't talking to an SVE enabled model. The work around
is to either get a newer gdb or disable SVE for their CPU model.

Reported-by: Claudio Fontana <cfontana@suse.de>
Cc: Luis Machado <luis.machado@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index dd99939b34..0cf9718d4f 100755
--- a/configure
+++ b/configure
@@ -6169,7 +6169,7 @@ fi
 
 if test -n "$gdb_bin"; then
     gdb_version=$($gdb_bin --version | head -n 1)
-    if version_ge ${gdb_version##* } 8.3.1; then
+    if version_ge ${gdb_version##* } 9.1; then
         echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
     fi
 fi
-- 
2.20.1


