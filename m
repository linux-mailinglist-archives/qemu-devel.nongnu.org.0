Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FB15E6B58
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:58:23 +0200 (CEST)
Received: from localhost ([::1]:46634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obROw-0008RV-Qm
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBG-0002Dd-J6
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:11 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB8-0005Nu-PL
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:02 -0400
Received: by mail-wr1-x431.google.com with SMTP id cc5so16440659wrb.6
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=Iq7GHbEjHTo1LvtpoRoRhaQR0OgzbS3qn4RhqhBWZ9U=;
 b=w6gCJm0194grWynBYVtJVt/SgDR7NgGKmdUt9BJULpIxFDmW10NFCo+Oxds4k/1c7M
 EgoqM65Ss2VWt5PP4SeLNgpY2G89p+yNbuZ1QTbO71gvoCP9uz1uFOeIIF3m4B6velyE
 EKzAy3fkw6ApalH3oZSrkavyD9USFEK632RB2ZqIVpkSgEd0IgGXc+XMlTDCWywy8f+y
 VK0ctLEKVRGmGuuF9W2WJqc0+nel0K3Gga4s+0peU7t9rRdG0Dn/n1Bcfdrv53ByBrw2
 XgkZ9hYdzDp3MC2ee+DppKekf+9mOIVY+lz3F47U3rmJp1M8NiYEv6ibTnYOPkDHGrN5
 cO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Iq7GHbEjHTo1LvtpoRoRhaQR0OgzbS3qn4RhqhBWZ9U=;
 b=qcqZHSb7kcyGU5AdCdBISk9TVT2CmdEn0S8cD79E/znhITDiqxMjB+q6K+aZ7RDE9M
 0abu6wSLyoj+ZVkyenCN9byLs3LWRL3Ftfi5QxfASq5u/AGZLRNvL4c6hIr8ZLMbLp6e
 L8o2rRWt3qGZJVRS7YRq4stqbSJZoFSvlQLylX/ul0jSa1QITQCGzJ0tQWxyVnKVrtCJ
 j472Hl0UlJ2NZIs6ZPwqdzmePEhyWxFEeZ7ojaNl/zyinYLui9M10C55fy4U7arobJQg
 tCRvHRffGenG/gDirXvwIMR0l9t4ZVTl7hSD8N4NULuAh3iS1VczR0CzaAMA/xg78pfh
 C4iw==
X-Gm-Message-State: ACrzQf34FhTs/Ix8ZqMZ+xofelX4rLnXrxNKSMgdFxDXkZ1r0vAiyoDP
 QMICAnuK7zYeGwtWNJwAhfCBHgo5eukwqA==
X-Google-Smtp-Source: AMsMyM6NoUjfR54+LHFrrL+JRbf8BgpGL2mSFTX7Evq66e9ijv7agr0OHrD6WjcIedZneDrHiI1ddQ==
X-Received: by 2002:adf:f2cf:0:b0:22b:e4d:62cc with SMTP id
 d15-20020adff2cf000000b0022b0e4d62ccmr2586707wrp.27.1663864554244; 
 Thu, 22 Sep 2022 09:35:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/39] chardev/baum: Avoid dynamic stack allocation
Date: Thu, 22 Sep 2022 17:35:21 +0100
Message-Id: <20220922163536.1096175-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220819153931.3147384-4-peter.maydell@linaro.org
---
 chardev/baum.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/chardev/baum.c b/chardev/baum.c
index 6a210ffd815..0a0d12661a4 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -299,7 +299,8 @@ static void baum_chr_accept_input(struct Chardev *chr)
 static void baum_write_packet(BaumChardev *baum, const uint8_t *buf, int len)
 {
     Chardev *chr = CHARDEV(baum);
-    uint8_t io_buf[1 + 2 * len], *cur = io_buf;
+    g_autofree uint8_t *io_buf = g_malloc(1 + 2 * len);
+    uint8_t *cur = io_buf;
     int room;
     *cur++ = ESC;
     while (len--)
-- 
2.25.1


