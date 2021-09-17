Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3D640FDDD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:28:05 +0200 (CEST)
Received: from localhost ([::1]:60726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGia-0000e6-Ck
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeM-0003Tv-2V
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:42 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeJ-0005RF-Aj
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:41 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u15so16075338wru.6
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 09:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lYHDsT18jOZsWv8rLeQ/NbBXoG8vS4UbmHbsvR70ru0=;
 b=clOTxKZBGkpPoWeFfrz6SQNWY67RjGdntFLTxGkMQtx0jAJV6dus/22wHO8lbwKY1K
 csRr0DwvLJ6emnvuc0j8A5iVr4ogPXgoHFqx0m3dZQ8xVZkTqguvQjEE9vSaq00hEeBH
 qZ9ehDxBJXv+UYL8XNkY3d6+PIMd8+WcZW9pHh/YZgLH0vl5g2waVP3QKWf5JPfWP28f
 k/tp44A/snnFtt+/ENnRarhPc45pn73PMJu+VGFDO9/ge+YgM795tMOaIJppaf0hTfMs
 Sz8AqJprza/cm5XyZTciUViYMmUOOOvlD/TLZj2gBYX0RSEznFwASPko/+idER+fou1d
 uA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lYHDsT18jOZsWv8rLeQ/NbBXoG8vS4UbmHbsvR70ru0=;
 b=c9f0ASCZjYvpbzPNfhtrfxHVhZurTQ8gr8ROCX65BkB0UiO6HTvMnZMx7kUNRUnIAs
 uhrNVpMn0pFQ0kpWb+4iT12FTLGzrA1HaBzajyz3OymD65y1QPIk79zOBmou73WB2mug
 9ClDyj3oNHmoaEZvvBDWiOuo4gyTIXRsfJNWovVle20tux6iD+zcIZnDw2y0XEWT7mAC
 IfbD6joVorO5I1HZ4C1PK7CVXIv2xJBBfUXg7j29Umnjl+iTirqQtBlKm1qii2NQWD+I
 UYJb3ZwOkY1TTWoEQmsVfX227OkOXjdZalkRBi3iZr9oJ/hYpkbqXpXT9lwXPnxEoQPm
 w0Xw==
X-Gm-Message-State: AOAM533r3X5+UlSZwlgOp4LVVquH7H5VpaVxy5/LaRUqZYJ/bk5iDfVB
 BWJjTxGKy04In6eqVK8VQx2sog==
X-Google-Smtp-Source: ABdhPJzi4x0zmpH7tZmug7HAPgibM82pfdgz6nG46UF36eBZ7GsCmY3rVZkjMuezai3LUHRv+EO/Bg==
X-Received: by 2002:a05:6000:1379:: with SMTP id
 q25mr13047849wrz.280.1631895817014; 
 Fri, 17 Sep 2021 09:23:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l2sm11364746wmi.1.2021.09.17.09.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 09:23:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 47F131FF98;
 Fri, 17 Sep 2021 17:23:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 01/11] configure: don't override the selected host test
 compiler if defined
Date: Fri, 17 Sep 2021 17:23:22 +0100
Message-Id: <20210917162332.3511179-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210917162332.3511179-1-alex.bennee@linaro.org>
References: <20210917162332.3511179-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are not many cases you would want to do this but one is if you
want to use a test friendly compiler like gcc instead of a system
compiler like clang. Either way we should honour the users choice if
they have made it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Warner Losh <imp@bsdimp.com>
---
 configure | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 1043ccce4f..049c50a933 100755
--- a/configure
+++ b/configure
@@ -1686,8 +1686,11 @@ case "$cpu" in
     # No special flags required for other host CPUs
 esac
 
-eval "cross_cc_${cpu}=\$cc"
-cross_cc_vars="$cross_cc_vars cross_cc_${cpu}"
+if eval test -z "\${cross_cc_$cpu}"; then
+    eval "cross_cc_${cpu}=\$cc"
+    cross_cc_vars="$cross_cc_vars cross_cc_${cpu}"
+fi
+
 QEMU_CFLAGS="$CPU_CFLAGS $QEMU_CFLAGS"
 
 # For user-mode emulation the host arch has to be one we explicitly
-- 
2.30.2


