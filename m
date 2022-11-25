Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383F16387E1
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 11:51:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyWHb-0004ya-6t; Fri, 25 Nov 2022 05:50:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyWHY-0004yB-Rl
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 05:50:08 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyWHX-0004aL-7R
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 05:50:08 -0500
Received: by mail-pg1-x52e.google.com with SMTP id s196so3660083pgs.3
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 02:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q6Gvq2gAiT68ZCAp1/KdoTRz/X2igHEIB7J2KA7Fe24=;
 b=WVtqocBNZFqk5/do8KpUY6t5kwt6C5bDV31rqp7IY+zjlt/WxJEMvxbZFi6oqd2nj0
 oj0U57ZEeIzkG9OzZ+jWP0IAnq9+pZatnod4nZBZu99obqWtOyqLpDJBr/CK1XQVMXbP
 0yTIxXwsImCyyDfvsEQ+kpRT4sFdyP0PfRPKNP1to2jH8XTkihw7PqcWqlCnEDpQxxx4
 k+T3eWuunYENBjTdFzNxlOeXnSSLuNVCzcQ5phQMcM5LUYwnp4240T8djCuNDIbBTHXG
 vtVJLC9Rit2mv7ewNcet8PRKbtL9IdhD/piArTDs7IQeAwLEyS0u09s4ETJVv4n43CW3
 MGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q6Gvq2gAiT68ZCAp1/KdoTRz/X2igHEIB7J2KA7Fe24=;
 b=srsxgJyJSPMjEEESdf/1JohpPEAVaGXUt+uNqlfGM8rQjSme16Ac2gmerKYbiHH5Va
 UArgNS23FfnDKFUWFjd+RnVEvXQcDDB6enJQrHBHhXz6g6X4qiOA0ON5sA1s9p3aOUEl
 teSdpyMQcdpAypwZXz6HBZhz5XH1GX5ED74twvsiIYSrxzUjS5JJk+cPaExZsG8cvFPu
 W6se6h1tKVQl82ITvxhEg/0ILWxzBIFf97IsGerD0VMIPoZDb8MrjpzKR03PJmfxWq3Y
 CiIgE82PWfc+yp2R3evaDctnAkO5/j9G9nfMJDR63kaWofdQp/mMBQbbdmTk8RHyx6Tm
 QmTw==
X-Gm-Message-State: ANoB5pnHzO5cyG23mutXDvHNwRlSvr8k01j0J7VKffkNPsu9gElhXRc8
 vVYyk4shrL8KBlPK88EJg6rtn3sAPIk=
X-Google-Smtp-Source: AA0mqf54nHYKYbYhtvsldOJSpE0IZ7actmE1gFlYREBGDJde6b5ekSM5jz7g7V8IChsFPDqRu18h4w==
X-Received: by 2002:a63:fc1b:0:b0:46f:fea7:4816 with SMTP id
 j27-20020a63fc1b000000b0046ffea74816mr15401947pgi.532.1669373405684; 
 Fri, 25 Nov 2022 02:50:05 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a170902da8700b00188f7ad561asm3055966plx.249.2022.11.25.02.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 02:50:05 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 4/4] tests/qtest: Enable qtest build on Windows
Date: Fri, 25 Nov 2022 18:49:51 +0800
Message-Id: <20221125104951.3169611-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125104951.3169611-1-bmeng.cn@gmail.com>
References: <20221125104951.3169611-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

Now that we have fixed various test case issues as seen when running
on Windows, let's enable the qtest build on Windows.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---

 tests/qtest/meson.build | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c07a5b1a5f..f0ebb5fac6 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -1,9 +1,3 @@
-# All QTests for now are POSIX-only, but the dependencies are
-# really in libqtest, not in the testcases themselves.
-if not config_host.has_key('CONFIG_POSIX')
-  subdir_done()
-endif
-
 slow_qtests = {
   'ahci-test' : 60,
   'bios-tables-test' : 120,
-- 
2.34.1


