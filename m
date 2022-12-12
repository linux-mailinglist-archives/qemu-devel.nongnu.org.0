Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDAC64AB1A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 00:06:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4rrb-00073E-GI; Mon, 12 Dec 2022 18:05:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rrW-000719-9O
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:05:30 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rrU-0004An-N2
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:05:30 -0500
Received: by mail-ej1-x634.google.com with SMTP id ud5so32215822ejc.4
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 15:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nPcaRWNFIdHgL4Agw3bLPMXjpJEvtjfKceSBqOCWiZ8=;
 b=HwSBUjSeT9nQP/mcM3BcxsMAWaQMHxeBsm+JoKQb8rZ5IVrW5jEqgwrtbWl+Ab07Xr
 rpUzYycHWYBHbpwZxOR3G5zBzBxt0U8+eLSb/z2nxNxQZsW8izW4jOUmc7tW5N/a1nuM
 mMzfsXIMd0/m6MzjLtOhNRESOC4z0Ro+nisgwPPzh8M4xoPvkjkI9md0TbzjJWqAPH/2
 JiwBZEn7C+NzVMePEK9uHTSwcG2HJtRIa3ORm+eNUnBvWAG+YeAyanCOEcEaNoM5pwlu
 aVvomfvVRapk9lTkzShmcud7545HfzD/Z+xe7pT6kmFyV1cPuFJRRNtMekv1Ytj0y8db
 +/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nPcaRWNFIdHgL4Agw3bLPMXjpJEvtjfKceSBqOCWiZ8=;
 b=CD1aV75eO3M+u1KDtvEhhkz0hG7f8ykA0Tap+IIHTSYMfVDWDNegQvfEBNmtAvlq80
 7NGtOcb3o8R+FLJpQElL+f9Mur8miAClpQpnMaZ2tnHWp+Zyjue2GMNG6e11mqRPJC1w
 DDZuSWIlnk4rrMH6LBDj+3sayThDbgig6TafOcOXpaGDwkvlecbJy2BDK//BTrR0GTkS
 Bks64MbJzL7CGLLpoKGsIV9hBO2spJX38/rq/7ApTNn1UV7PdNA6DQB3OAW8S8W5SQSY
 UVLd7UTAf+/VovVujOGZjoJ659eSjLoIX4iTwkBSlKio45ObkqFQkdXFylQB9OAkzj7B
 83kg==
X-Gm-Message-State: ANoB5pk2YkypbkodTxtJ5yHomcMgELTf1cSQUA+MSl1uXbcArU/IOYUg
 UmRRlZ1hJnBAL1Lm5GO8J5tRjdZ83anwop2ZdE8=
X-Google-Smtp-Source: AA0mqf4uKvLRc6M5gvLunrnDU0+TxFLlznt0Ke/Zn/SxuAYBu+F8T+iQMyiwp2fockb/tTf7I136Jg==
X-Received: by 2002:a17:906:1818:b0:7c1:8ba6:6eaf with SMTP id
 v24-20020a170906181800b007c18ba66eafmr411314eje.5.1670886326426; 
 Mon, 12 Dec 2022 15:05:26 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a170906055100b007806c1474e1sm3717465eja.127.2022.12.12.15.05.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Dec 2022 15:05:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 01/10] hw/virtio: Add missing "hw/core/cpu.h" include
Date: Tue, 13 Dec 2022 00:05:08 +0100
Message-Id: <20221212230517.28872-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212230517.28872-1-philmd@linaro.org>
References: <20221212230517.28872-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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

virtio.c uses target_words_bigendian() which is declared in
"hw/core/cpu.h". Add the missing header to avoid when refactoring:

  hw/virtio/virtio.c:2451:9: error: implicit declaration of function 'target_words_bigendian' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
    if (target_words_bigendian()) {
        ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/virtio/virtio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index eb6347ab5d..5817f4cbc9 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -25,6 +25,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qom/object_interfaces.h"
+#include "hw/core/cpu.h"
 #include "hw/virtio/virtio.h"
 #include "migration/qemu-file-types.h"
 #include "qemu/atomic.h"
-- 
2.38.1


