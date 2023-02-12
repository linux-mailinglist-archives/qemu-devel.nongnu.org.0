Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78858693A91
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:49:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRL8Y-0001QG-PG; Sun, 12 Feb 2023 17:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRL8X-0001Q0-9u
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:47:57 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRL8V-0003KT-Pl
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:47:57 -0500
Received: by mail-wr1-x430.google.com with SMTP id by3so9129073wrb.10
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=md/V7qS9+MXg+4Y+2ycjl2bad9V4Bp92Z+1RWOwRBno=;
 b=OmzXMfDgenPT28XW7WDtCqaEJT9TIi+Yf3WHmkumz2tKR51kiVSQJwICEJK9FTEI+J
 wOu2GaoZjIu6LXvRWAckPelm4z6jGGTDcNzYpVVEfrUJfiDLT3JhBsBhcvuidoqzv0vN
 25P9jsAudYtqqGlgn/bBNj86Hlm9FcKvXPpNnWG13aW1W8ytgOyEkmU84tzesRvYHonn
 3WVzOE/tTmg9yAwEMjeqSFInNh81twqd7qP8rLFugpRSpyflb5GqY8xLs8+qxq55XYz7
 f/42x7sWFUSrcTBk+DUvn3q15wM1tN8YAJRO0wVz01XU6Y4iukyez39BcSgd9LRcyFP7
 g3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=md/V7qS9+MXg+4Y+2ycjl2bad9V4Bp92Z+1RWOwRBno=;
 b=7VbtpfzXEFRxabOiDu7rmiBtKaq2LyG7W70zhz0P9UcneeqC9cAxtXhU38LCdq+08g
 Y5SWIj6fS3qwmGQSWUseMMWJFAIiuljIlSdh0eoUTpkBN7Y5M7KFbVVap6SXVMHxhklH
 okJZy0nfH/7pmO2ejAgyZhOaR0T/dW49DVlQ+cNOP13QHveY7G+CO10jyBu/FGHOxcbr
 E2sn11oz1Cn6IFUiRgdWzEWh7GucKbP9fRftfWMbKLrUnKuf7qWXfow4L7cX8SaRe105
 hBLHDnB6Mn18dlYtisynkrIUfbdAfe2Mhl+7/dMw1VOtHVHm9D2wptkLlMIn3exbdKPL
 Ujlg==
X-Gm-Message-State: AO0yUKXiGPth9TIJwnoRgdjC3jEHNqVmijoKRr3x+3MMnKkc+l3Jw7ds
 8t6XLpC6zfZEyFnnSM43tgI7nL+KXpffjMVX
X-Google-Smtp-Source: AK7set//ZNA0TxtkLxn0IHD8mNGt/VNW4eJrjqM+1zUqqia65OSCN0HhqQLAYGEWRUrwCGiwaXCPDw==
X-Received: by 2002:a5d:4090:0:b0:2c5:5933:1752 with SMTP id
 o16-20020a5d4090000000b002c559331752mr897799wrp.52.1676242074157; 
 Sun, 12 Feb 2023 14:47:54 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a5d4d85000000b002c54b0e1405sm6624600wru.88.2023.02.12.14.47.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:47:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 4/4] qdev-monitor: Use qdev_get_parent_bus() in bus_print_dev()
Date: Sun, 12 Feb 2023 23:47:30 +0100
Message-Id: <20230212224730.51438-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212224730.51438-1-philmd@linaro.org>
References: <20230212224730.51438-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

No need to pass 'dev' and 'dev->parent_bus' when we can
retrieve 'parent_bus' with qdev_get_parent_bus().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 softmmu/qdev-monitor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 820e7f52ad..12e4899f0d 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -770,9 +770,9 @@ static void qdev_print_props(Monitor *mon, DeviceState *dev, Property *props,
     }
 }
 
-static void bus_print_dev(BusState *bus, Monitor *mon, DeviceState *dev, int indent)
+static void bus_print_dev(Monitor *mon, DeviceState *dev, int indent)
 {
-    BusClass *bc = BUS_GET_CLASS(bus);
+    BusClass *bc = BUS_GET_CLASS(qdev_get_parent_bus(dev));
 
     if (bc->print_dev) {
         bc->print_dev(mon, dev, indent);
@@ -811,7 +811,7 @@ static void qdev_print(Monitor *mon, DeviceState *dev, int indent)
         qdev_print_props(mon, dev, DEVICE_CLASS(class)->props_, indent);
         class = object_class_get_parent(class);
     } while (class != object_class_by_name(TYPE_DEVICE));
-    bus_print_dev(dev->parent_bus, mon, dev, indent);
+    bus_print_dev(mon, dev, indent);
     QLIST_FOREACH(child, &dev->child_bus, sibling) {
         qbus_print(mon, child, indent);
     }
-- 
2.38.1


