Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652D7610155
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:15:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7t4-0005ff-57; Thu, 27 Oct 2022 14:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7sD-0005Sj-F8
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:45:04 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7s9-0004kJ-Bs
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:45:00 -0400
Received: by mail-wr1-x433.google.com with SMTP id w14so3703680wru.8
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eDFljKF/otcR+25TigkQADh5RjLJttaZLv8a2KQTsBc=;
 b=BgykwncweUWzTciqoE2BYbbm3ULs7XYJJRbtYBFHndFjCF9cW7wnEmT1PivtLRtfx1
 wrd1Y+IrcW18Y/BOs0lUnBlNWh8+Z2DYVWdceAutXPxqxw+TLC9RKf4yDj+u/zusu5Qx
 fYxUNamJFFhZnFtjmKP37vV+/5fN9q5wcmR4HvhPXFbqcGv7/sI05k+KgYJKpOALDf1f
 OH3eJmhiD4ZivchKgPtfRXn03iSxGDbmUvHXAOM5vk1eHxr46mTNxrWbwvzxxAs+vtg1
 MEPAyow4NhUdmp5bBwMAaD52f1GosikKNxNBflCd0i1qWbTS241bcu3UgarjQeP/vchf
 0WBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eDFljKF/otcR+25TigkQADh5RjLJttaZLv8a2KQTsBc=;
 b=rvFDOCZr3LjiFeMUmzxSQHAw992XbALEcLMnnKlwPO7B7E+sKpdX+ch0Bcwips7Ydk
 dtXgtp32R028J1HB7VPhqiZTTeWo+PzBNNsNQy2+DHVjNTKHzOumqJzDQpv2KPO4niGM
 hMQQANKQVnLKjkJox9vXXDDaGum/vwTPCzZqaDnKz876snr8xIa+FZqdfwZ+MXk6mPXp
 rZqOWyiojFxK2tYMbwNwZaNlJMEJi8UUjM9oaKgfEcZu6ODZHlT2CQ8Yz1peCEMtMZdK
 d7sLWgqaq+lkPKMcWYtqSbHLeEFaEFKWxza6iGdUpH62J+71bKh2zDdcVh/Z5QEb8chj
 vMUw==
X-Gm-Message-State: ACrzQf3JeWR6FUwRPJLwQDuwTWoxvz655gP+X31vi20yXI7X7Q8pcedV
 Ob3P5cZT8lRJ67aqwgOvahk8Ng==
X-Google-Smtp-Source: AMsMyM5B5PTsFoGIKYT/SCLnj5+8vbDnx6EIpHQpHkAbXkLtFUmdB8Gzt5Nek9WW1XA4h5wp+PaqRg==
X-Received: by 2002:a05:6000:50a:b0:225:210c:a7e4 with SMTP id
 a10-20020a056000050a00b00225210ca7e4mr32693167wrf.704.1666896295947; 
 Thu, 27 Oct 2022 11:44:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bp23-20020a5d5a97000000b00236740c6e6fsm1861067wrb.100.2022.10.27.11.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:44:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BF7971FFD0;
 Thu, 27 Oct 2022 19:36:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 26/30] tests/tcg: include CONFIG_PLUGIN in config-host.mak
Date: Thu, 27 Oct 2022 19:36:32 +0100
Message-Id: <20221027183637.2772968-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20221013131304.623740-1-pbonzini@redhat.com>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

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


