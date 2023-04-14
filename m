Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B406E2294
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:48:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHlz-0001wK-Ag; Fri, 14 Apr 2023 07:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHlw-0001lG-Pa
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:20 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHlu-0001Rw-OX
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:20 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 z11-20020a17090abd8b00b0024721c47ceaso4340979pjr.3
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472356; x=1684064356;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DTq0O++PH6ynPaHP/qug0NmhXPhXzd5Sza9TQ4JGGgg=;
 b=1+HQc+UPuuwpGXAyHdxiA55X9JNf2EsgYmAC9Wn+ZplA2l6YvTydzBHBHX9eJgcviR
 c/2khCP1Hm36XKlbNLyzUWizOZbuIhlioUZFHv6R28rvqZcLmOn2KSHoqH0RprE9FU/B
 APZgmYpqcLC647xS0k6ePJwrNEVhMym26rJBId72kTqcuoh8tQLpM5eV1+ioXwnMyzTr
 NhXC6eLkqoFJ89t9MUbPcaxXnB2IhrkvSVvsoN3uDNz4Rxq7lVcPdpKqdHh29diA7ppq
 wivOHoxMZObNDou0k/vtrFu3Clte9dQSFjMUBmzwG4DMMnA9CUB7VQwZxEqqp5GDmOAQ
 xEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472356; x=1684064356;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DTq0O++PH6ynPaHP/qug0NmhXPhXzd5Sza9TQ4JGGgg=;
 b=SS6hbPl25h+35oglwPX/bN7TR7UqxoOa261Px/OeM2cGDY6MaFvlGQO37JXZybtXd7
 y0NsXlmxvJdVuCSPc6JISNaSLiHsoedfadViSODgQEhhwFeAlHUdvg210c5QxL/RbKGO
 hsD/xuuaXEemVJRf7QuY4fmhMqN/YCQi8XmP0sr2gXk//VA6MLEvsLZVlHfkD7N13fGe
 akhPWMW6PCyXzpyAipN5sl+l8V1qYkScm2K+95nJzFe0m8DcG6f6qTnJsDynfZaI5mcX
 jVLAgnadn4c/jakGCJ7jXoFe6mklFdkEF51+s60iOHZKIKIMlBtw7Zmz/SB3IEhXDnO1
 rtsg==
X-Gm-Message-State: AAQBX9dUpc7JkgFDsCB764NICjnXerXA4UpJWsEfm6sJ2JYVyGEjX8fJ
 ErJJZknSmTHdJoZjxMhVUXmCUw==
X-Google-Smtp-Source: AKy350ap9+1AO8teUv0F3nQ7W8ZTc/3f/koclFJVt+w/hBIodiuoUzSajmU/DetauLYXNCgNzahZIw==
X-Received: by 2002:a17:903:2308:b0:1a2:7462:d674 with SMTP id
 d8-20020a170903230800b001a27462d674mr2721847plh.24.1681472356463; 
 Fri, 14 Apr 2023 04:39:16 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:39:16 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 18/40] igb: Remove goto
Date: Fri, 14 Apr 2023 20:37:15 +0900
Message-Id: <20230414113737.62803-19-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The goto is a bit confusing as it changes the control flow only if L4
protocol is not recognized. It is also different from e1000e, and
noisy when comparing e1000e and igb.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/igb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index ccc5a626b4..cca71611fe 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1297,7 +1297,7 @@ igb_build_rx_metadata(IGBCore *core,
             break;
 
         default:
-            goto func_exit;
+            break;
         }
     } else {
         trace_e1000e_rx_metadata_l4_cso_disabled();
-- 
2.40.0


