Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DD36098AD
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 05:21:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhYx-0000fX-94
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5g-0007MT-Jp; Sat, 22 Oct 2022 11:07:12 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5f-0002Fy-3X; Sat, 22 Oct 2022 11:07:12 -0400
Received: by mail-ed1-x531.google.com with SMTP id q19so16093520edd.10;
 Sat, 22 Oct 2022 08:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NZKRgAly64s5gxOr4kU+aTrMtQMjyImVG/Fq6IP+aSk=;
 b=bbGnFLtwQOSi8VA0MOsSt6pfQSADgZI4Kj11jpUGaCJol0UWbUXbZgMmspHDEo6ho6
 SYW74IVNw6/HgsBnnmEvT4sZ3dN58+PQEj5IAIgKbdvQYeT0NBlariwvSuJ/SYzda9o8
 DdzThI2ZwhW73nlk5MSZn8E7m0c92GW89sSDNnngW+MtlfcSh/Pgr9HJyZwHX/sUfhuO
 eMKHP2ev2FmwNJU+wCz/IoySgxp3LsqmfslM+DkjSfFjTS1GhBaHOUuveo4JTjOuP4Pt
 3BYV9LTFMlfOe0lzmdmWEeRM2ijYHfLbBXuFHfxZHPbGk8wd3LyfapOHiWLz3kGr4pps
 Cf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NZKRgAly64s5gxOr4kU+aTrMtQMjyImVG/Fq6IP+aSk=;
 b=MYH4EZqwwFUjPiu9Uk5xccl0PN+edyA0A/oj4zNxZOXXPRe7fFggi3zeWlLNmuoBll
 WCTUgR/MwqpvKVkExx0qpeX/NNUttyRBET79LOEwHJ6HezGZqs72zrrITRQ3ksWn+R5E
 GEA8f7UJdWfmGh5SjDd7N/YlCcxIpYUAq7keGJI98sXokAVKiTqUF+ttL3Gxy9ibLeOM
 JtW0jzdW5hOHMDXXzgqUqaoQSYnHgq0eV7O0T6+fZDwI+qu7bwEIK8ooGWcOLPMUjicy
 Us8Y11/UnAcJLCDCmZEjju+Ff6+SGi396xCYlQAHgkoQ2Fs0v3Zp9IsGpONFQLoQnR7m
 /y+g==
X-Gm-Message-State: ACrzQf38XaIxRcsQ6TdZkTVvw4y/mZ5IykrkMVowuYOC6tTODDoKbc0L
 2iE3zylRBXjIq62Dq7+dP2sgjwHkfabPkw==
X-Google-Smtp-Source: AMsMyM60KuhdCu8+Q8BeMvEuHhHAjuLVN2VSeTe6WbVRFhRlo8jaNuGMRZjxqKyxhQkYbPPM7PntJg==
X-Received: by 2002:a17:906:7621:b0:750:c4a3:8fcd with SMTP id
 c1-20020a170906762100b00750c4a38fcdmr21279445ejn.180.1666451229851; 
 Sat, 22 Oct 2022 08:07:09 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:07:08 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 31/43] hw/isa/piix4: Remove unused code
Date: Sat, 22 Oct 2022 17:04:56 +0200
Message-Id: <20221022150508.26830-32-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Malta board, which is the only user of PIIX4, doesn't connect to the
exported interrupt lines.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 57b0b98bef..d65f486008 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -182,12 +182,6 @@ static void piix4_request_i8259_irq(void *opaque, int irq, int level)
     qemu_set_irq(s->cpu_intr, level);
 }
 
-static void piix4_set_i8259_irq(void *opaque, int irq, int level)
-{
-    PIIX4State *s = opaque;
-    qemu_set_irq(s->isa[irq], level);
-}
-
 static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned int len)
 {
@@ -231,8 +225,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    qdev_init_gpio_in_named(DEVICE(dev), piix4_set_i8259_irq,
-                            "isa", ISA_NUM_IRQS);
     qdev_init_gpio_out_named(DEVICE(dev), &s->cpu_intr,
                              "intr", 1);
 
-- 
2.38.1


