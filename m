Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC445F444E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:36:52 +0200 (CEST)
Received: from localhost ([::1]:55900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofi6N-0005RS-TX
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYZ-0008G7-54
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:56 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:50838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYU-0007Ox-HW
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:52 -0400
Received: by mail-wm1-x32b.google.com with SMTP id ay36so8840340wmb.0
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=V3TPcbWgxCzQgcPt3UvvKQcfOOtiTYQ3Us+plm0utfM=;
 b=eQ+DubxCcYI3klK13zPB9TcwdkQC6Cfq8z7iUQ3ZfvRhTvcNCBYThX/Hav8xc+KAE1
 H3Q3lczbQHjeaG+icQ4exK+d7H+sRGWcZshAyKOq5erAuCgkJwEcM3zt4sAkIGMNEDgt
 Po0TmTeEoNtcAnH7SkGc7T8mAz3qsYJ/4LvqmKnV6iZIgjyR7HQ+Locud7baST8n301B
 E+i3yPkBzrKi2AJKtNxlEi6hzSFLIwIZ8gkqYE6FAhpuMgnosOrqy1Q/QYFQXgtlDYtd
 jUWsaCMsdx2SUaCDFcpIMEIVPYF1xjTWnIZINzM9htzJ/18h3GfeTqKZx+Ssa3bUB1RW
 RQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=V3TPcbWgxCzQgcPt3UvvKQcfOOtiTYQ3Us+plm0utfM=;
 b=v9gmP0khRutyBRFW3AeJQLSYBLgqjA01Sc2tFg1WkVjPhz/H42FXH0kYyW/41q0l/p
 QQhwyCatN+yV3LzhEQx/Mq+opjPgOxL4P0m3HK+CB9vUNoqWHKQoys+UaKzgkYb18q7T
 4mtwG1nmdcIF/CgO5b6tK1gYvDViuMUjQxuUyCXE+J2JG7k/e3RLc2xUU4H7QT0Vllx4
 LjzlcnPZ1Ip377BkHXsP7KVcW8YFNPbwQDgXZzSIHOIxHmsurmxVeycFw99oOsVFMwjs
 X+X2tl6NVDIZqApTHX0P07pub6gNtogg3EZrvRjeYM6dtuhzz55kGAjgex7+jhU6/i6T
 u91g==
X-Gm-Message-State: ACrzQf1k0zVid9XUEvZQf6jqyItmltFrKya/ABAg84pVjkmrIdAmPI9t
 wVr0t8MAYymxDYMViu8gwnGTAg==
X-Google-Smtp-Source: AMsMyM4itvnHn8rz5hju4hIfKjXM70Fbd0++W/TOMl+8J4w6+zuAKcfqDBFo0WlCgiE7JyAQiVf0nA==
X-Received: by 2002:a05:600c:2191:b0:3b4:868a:aad3 with SMTP id
 e17-20020a05600c219100b003b4868aaad3mr10195546wme.112.1664888504289; 
 Tue, 04 Oct 2022 06:01:44 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c459100b003b6b3202e22sm13060293wmo.33.2022.10.04.06.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:01:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CF5001FFBD;
 Tue,  4 Oct 2022 14:01:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 05/54] configure: move detected gdb to TCG's config-host.mak
Date: Tue,  4 Oct 2022 14:00:49 +0100
Message-Id: <20221004130138.2299307-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When tests/tcg gained it's own config-host.mak we forgot to move the
GDB detection.

Fixes: 544f4a2578 (tests/tcg: isolate from QEMU's config-host.mak)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220929114231.583801-6-alex.bennee@linaro.org>

diff --git a/configure b/configure
index dc53e4df03..52ae4adffc 100755
--- a/configure
+++ b/configure
@@ -2453,6 +2453,8 @@ if test -n "$gdb_bin"; then
     gdb_version=$($gdb_bin --version | head -n 1)
     if version_ge ${gdb_version##* } 9.1; then
         echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+    else
+        gdb_bin=""
     fi
 fi
 
@@ -2537,6 +2539,11 @@ echo "# Automatically generated by configure - do not modify" > $config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
 echo "HOST_CC=$host_cc" >> $config_host_mak
 
+# versioned checked in the main config_host.mak above
+if test -n "$gdb_bin"; then
+    echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+fi
+
 tcg_tests_targets=
 for target in $target_list; do
   arch=${target%%-*}
-- 
2.34.1


