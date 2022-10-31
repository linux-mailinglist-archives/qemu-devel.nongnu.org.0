Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 304F76137D7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:24:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUiG-0004V9-Qa; Mon, 31 Oct 2022 09:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhx-00034X-U9
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:07 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhr-0005SK-Nx
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:05 -0400
Received: by mail-wr1-x42e.google.com with SMTP id o4so15947737wrq.6
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mKTEqJtJjvsi5KAt2A7ZyFQqY7ElpNUOSG6GvGxA/Ho=;
 b=ZUBKT5ACoO4iOvXeofsS5lg3oEQdm9nZLv/7r0WXD81/aPHvpdrM0rqb5fa1vV3DNt
 uh22O/pfu6dH41KRO/OGv+FJwfHHxw04PW6yP7DGeJkyMu9HlrZKcp05iILI99f41bt7
 v8ivf1/k3k6LPlKCx5QpBmVj6FFW/v/eD3p0a116yC/pUrnRdKx/Vu7uWXr5GvCwpR8w
 lLE+1s/+XFM4qyofaKqCNZsexChzngDveYh+iAGQjlRNtkMKirbgHVhOHtayiA+OKeAQ
 cuKfAkWy7SiLkCIdSxkn4n6VWVq+LddMPEqbAm2lbiVo1lj9A27FA4C5uUTXlAg/n1R6
 Z3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mKTEqJtJjvsi5KAt2A7ZyFQqY7ElpNUOSG6GvGxA/Ho=;
 b=1FTYlE1KWmQckDR6rcUQ+qM5VD+eiiWBo2ynZZA5TaxZmPnhvWy/cKqUArjyx3RH2D
 uEbopytgX946fdDM2uG5yRpUaAp7dK3VOMIHL8n/39Cij+T3z4bO+Z0qB/Gyq3+rCOfT
 RnJKRxvIVH5ET1ABE5VW21bFVvpXCkqIVwWGatg7pPD0wHETQIIG7co3cxwfYM26Gy9M
 f+XeCrFCX9ZAZKU4YVJn3DIhDNO4BFBz72/dm86OguFg1Ugu1QPcE6OAiln6Aj+t94HY
 df7qaQgxDV2pavrvXjxftw0b6Fk74lU+kwWpAp0PUCkVVD58kuP+xWX5vhZQJjqArv6u
 d9rg==
X-Gm-Message-State: ACrzQf3wz/tEOzy4UTj1duJRDeXSK7/no7Fz1X79qgCbXrtxyxTGAY1/
 IHueKUorcRTKXmJm2V8vgRUEJg==
X-Google-Smtp-Source: AMsMyM6O/C7wPmVXzFsw2eBTXP8mm+w8/davVoSunkPq1Hqt9HchDwkwnHUUdebo5SnfsMAqWBqCVQ==
X-Received: by 2002:a5d:5f04:0:b0:236:cae9:2991 with SMTP id
 cl4-20020a5d5f04000000b00236cae92991mr3471979wrb.120.1667222398397; 
 Mon, 31 Oct 2022 06:19:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e15-20020adfe7cf000000b0022cc0a2cbecsm7330589wrn.15.2022.10.31.06.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:19:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B8C6A1FFC9;
 Mon, 31 Oct 2022 13:10:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 19/31] tests/avocado: set -machine none for userfwd and vnc
 tests
Date: Mon, 31 Oct 2022 13:09:58 +0000
Message-Id: <20221031131010.682984-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

These are exercising core QEMU features and don't actually run code.
Not specifying a machine will fail when avocado chooses the native
arch binary to run. Be explicit.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221027183637.2772968-19-alex.bennee@linaro.org>

diff --git a/tests/avocado/info_usernet.py b/tests/avocado/info_usernet.py
index b862a47dba..fdc4d90c42 100644
--- a/tests/avocado/info_usernet.py
+++ b/tests/avocado/info_usernet.py
@@ -14,6 +14,9 @@
 
 
 class InfoUsernet(QemuSystemTest):
+    """
+    :avocado: tags=machine:none
+    """
 
     def test_hostfwd(self):
         self.require_netdev('user')
diff --git a/tests/avocado/vnc.py b/tests/avocado/vnc.py
index 187fd3febc..aeeefc70be 100644
--- a/tests/avocado/vnc.py
+++ b/tests/avocado/vnc.py
@@ -53,6 +53,7 @@ def find_free_ports(count: int) -> List[int]:
 class Vnc(QemuSystemTest):
     """
     :avocado: tags=vnc,quick
+    :avocado: tags=machine:none
     """
     def test_no_vnc(self):
         self.vm.add_args('-nodefaults', '-S')
-- 
2.34.1


