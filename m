Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20B32F37C1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:57:03 +0100 (CET)
Received: from localhost ([::1]:40366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNug-0000v6-OY
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG7-0003dR-54
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:07 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:47012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG2-0004sK-4U
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:06 -0500
Received: by mail-ed1-x532.google.com with SMTP id v26so3125859eds.13
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u8LZoZ4qXz31cUfEnKnGe7T0fQ7CqFYfht5PRmZkIbM=;
 b=Q+7Pi6EQN3xSBXwV1Qj2+qGsPQDa2a6KJJT7Bw/LG++cVzvhBk4hD5ZlAno4iz7W4z
 JiQ22bfZbdUgGUujls1RTQyot9sUSRZE9PFs0DyV6eovIh9AZiWoMP/hT2XzKz3dtqDT
 0Itvtg3wFIYzj2Bcgdp6x9o9EXTfA7SkTgiKuRDiUdDl638BmS2WEVJ2jXUkrK1/6FUv
 Z3Qa6GyXR7LldnOlhNF/ygCCKpQkXAmMU98Mcn/53WYlPSP+lWShGHYVx9v+0IUQ6LUr
 y9tCTc+cXF6hD0UYDnTSIvB4i6qRCZTr0FTKsdjv8u15cxzSIqpWMO5ip5UIhuTI2A9v
 KKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=u8LZoZ4qXz31cUfEnKnGe7T0fQ7CqFYfht5PRmZkIbM=;
 b=QzkslIWnjifsHAtgkxt7ZPi5Vhxksk4jly9pg/fzwNVH8WRZr8isn/sHvRzk+Wmopf
 hL3I3NjijoTo0p7Xtvd94faZoRIzl1RvZsrEAlfKTVf/tLbw6MyGX1cMVYIueCYnciDa
 ltUn5Q65TbqnqUFJEtv5e5SWDnL5KwmfXrHkk+4yiFP9pGn6Cq9/qKoWE65Zls/CNELi
 qpkPoRzZ8zKXRMrBtE5S7D4LSWr/iz0EKnV58IllLstsxOpjTdfcCXvaOM2fkysGihPG
 8rq9gY/RmdYmslzexdUh+LmTk50TvchC0qA9/MOdzMD58yn4/VAyn8stwD4xRxGQGh8o
 PlPA==
X-Gm-Message-State: AOAM533hH6xwFS9m4VKm02UTczNIFszKpBlwN125Qp5SeAZ9EjJwDrW6
 D7XQ+ucDUV24N24/ZLqSQUGJlREzD8ic9A==
X-Google-Smtp-Source: ABdhPJwjL3DW4VJ2m8hgXqawMsfnBP/mSeyIFNbYP/8LcAbVqs4aPUqSCc8F2wPZMIm2QtBBDvP6Zw==
X-Received: by 2002:a50:eb44:: with SMTP id z4mr109529edp.167.1610471699381;
 Tue, 12 Jan 2021 09:14:59 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:14:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/20] meson: fix Cocoa option in summary
Date: Tue, 12 Jan 2021 18:14:38 +0100
Message-Id: <20210112171450.791427-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=83=C2=A9?= <philmd@redhat.com>,
 Chris Hofstaedtler <chris@hofstaedtler.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chris Hofstaedtler <chris@hofstaedtler.name>

Cocoa support was always shown as "no", even it if was enabled.

Fixes: b4e312e953b ("configure: move cocoa option to Meson")
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-DaudÃ© <philmd@redhat.com>
Signed-off-by: Chris Hofstaedtler <chris@hofstaedtler.name>
Message-Id: <20201230221623.60423-1-chris@hofstaedtler.name>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index e4db67ccf2..bd4ff3118b 100644
--- a/meson.build
+++ b/meson.build
@@ -2330,7 +2330,7 @@ summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
 summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
 summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
 if targetos == 'darwin'
-  summary_info += {'Cocoa support': config_host.has_key('CONFIG_COCOA')}
+  summary_info += {'Cocoa support':   cocoa.found()}
 endif
 # TODO: add back version
 summary_info += {'SDL support':       sdl.found()}
-- 
2.29.2



