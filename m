Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DB5613810
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:30:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUrU-0003dw-8Y; Mon, 31 Oct 2022 09:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUrS-0003aN-Ij
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:29:54 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUrR-0000qH-1t
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:29:54 -0400
Received: by mail-wr1-x430.google.com with SMTP id j15so15992702wrq.3
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uw9FgH/8Yr/0vBRC68ZiUMTaAo2A59rV6wgtMRPFk1k=;
 b=BTtHkEaNG1mQj75Kqg+vuoE7jN+uMTJhMp5355CJQ+XOnnyG/A1K1WFXS6Qiug5yNW
 kr2flXZjllEmt2GZ6clEu7/8b30HsTKzLQXC/t8+loql61r1PDm4mJjGn2qF29Q2cuT+
 qCh3dKM8mgGfi+5Ke8N6/tKbSfvtozs/WWayt7ussmoUrIgzpiky8/gFFzn2QalrOaYS
 hLDzw5q8gzIriMAy3zxLldIOpONGqIGHo06XNE08IjusyOcJedy030IZ8jUraRfvnjv9
 uFKSnyQNZl4SBv5yv/1p1pqubeeGNpMoGENA1fFcRWTlJ3v+AHnzY4In4rFPJGcsYKHo
 cBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uw9FgH/8Yr/0vBRC68ZiUMTaAo2A59rV6wgtMRPFk1k=;
 b=EgU4arEZo1wfcd3wH/uAvNTs0bA1cWgsfdbTm7mVPAnrLAF5FvfzVuadRanpkV83j5
 X2vEncw3AWW/t0qFmngLPn3NSG1ARiAYEsP2Rcr1Nx009BnW9XnnS9CJxy8Y9AjPw5Nn
 JaB4pHmC7m92CKNqIezUazdrUsTLd+nsE/J17UG+Wp6Qgc4Md9Sb+Cb83sJ5xe2IcrqZ
 DRT82f7SXpT3ilzltWm11336V5EJ1hF4GHf6XJdc0hvNj4KvMmP/gnECFn/2HSpMXRPA
 37StOdZXc4kRN6q9zFw+ns7sfdBlpQBbRMnizfYaL1lluAlv8cJn8HG0bf78T3FYaWXd
 t6Eg==
X-Gm-Message-State: ACrzQf1WuspKjNae3CQjLTi5zEB8+UU6Cj3ZFzfwFULxfzlT+JzNxktM
 3FtOEzvh9kTSjM1orPhfdd5YVQ==
X-Google-Smtp-Source: AMsMyM5VxgDZcisLfNpkaRdTX7A1XKpLqyCqugDQ4R8BAHYYmkiraWa80cMPvl5vUYzOgWysTcSS3Q==
X-Received: by 2002:a5d:45ce:0:b0:236:78cb:b6e4 with SMTP id
 b14-20020a5d45ce000000b0023678cbb6e4mr7856303wrs.225.1667222991705; 
 Mon, 31 Oct 2022 06:29:51 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c468b00b003cf75213bb9sm1804582wmo.8.2022.10.31.06.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:29:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 82E4B1FFD0;
 Mon, 31 Oct 2022 13:10:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 27/31] tests/tcg: include CONFIG_PLUGIN in config-host.mak
Date: Mon, 31 Oct 2022 13:10:06 +0000
Message-Id: <20221031131010.682984-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20221013131304.623740-1-pbonzini@redhat.com>
Message-Id: <20221027183637.2772968-27-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 8c2c4c1a04..4275f5419f 100755
--- a/configure
+++ b/configure
@@ -2486,6 +2486,9 @@ echo "HOST_CC=$host_cc" >> $config_host_mak
 if test -n "$gdb_bin"; then
     echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
 fi
+if test "$plugins" = "yes" ; then
+    echo "CONFIG_PLUGIN=y" >> $config_host_mak
+fi
 
 tcg_tests_targets=
 for target in $target_list; do
-- 
2.34.1


