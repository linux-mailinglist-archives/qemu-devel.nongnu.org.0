Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2414696D0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 14:21:58 +0100 (CET)
Received: from localhost ([::1]:34480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muDwL-0000bn-P8
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 08:21:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1muDe8-0000FB-6w; Mon, 06 Dec 2021 08:03:08 -0500
Received: from [2607:f8b0:4864:20::a33] (port=45960
 helo=mail-vk1-xa33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1muDe6-0003Py-Ce; Mon, 06 Dec 2021 08:03:07 -0500
Received: by mail-vk1-xa33.google.com with SMTP id m19so6679624vko.12;
 Mon, 06 Dec 2021 05:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=epht/YBP+GUagq7x2E+mDlGdPt8tiIuMAeXausa4bCI=;
 b=KYEIdG8TXvTi4Dgt99Jdf8Nwio84iUEijbw+1gVbp6x2PFiy+yE7l0XqAh9qVoL9eM
 1T3TsfNK6tzoXJ2DPc/5BIdMWyxVuk9/4+p+mwomezrM6oJJIthC+6It7EiOzhrDFjYG
 7GKZIR3faqBqfAa3iVDXKu2DB3jGJXb6YIhaLj8UxuLTypckv2VYy4FzXWznds0GjCV3
 GKJYPAK0q7dmH0af2QdgiRFePZ3dnWmhDKYD+OwFkx7Zj+kiUSg7SHbOQtUnxGVdY6wv
 ZIsGzm3ywQfkJNjIL/ogRrKlGhvmvpomxesc369JqddImTkaqvPJq+PFhJ+hqHoe7GnN
 HlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=epht/YBP+GUagq7x2E+mDlGdPt8tiIuMAeXausa4bCI=;
 b=5xPbmZE5BXF7NLUu6rFX4H/bKCkKctvEBwQ3NA3XMwZO+iuNYnJx+6tEN/tiRRydxU
 Qy7kBI714pJP+tj82Dh0tlJSABa0dnILhvzz2cU96QRuxkUA9ojELGoPagJyl1qdjMqD
 syGxoXGKIgmB+HKT9HbhUp0nOrFGy4gKQCRMjN6TH8VTNsgLJcmAbPuoxUQ76scBUAtv
 2VPCi4c6+mbuFVlTYIkTYvTYqo8JPb1kDI5f7UQoyCHV92ChgrTA7u4fU614CyI6gSUx
 JZoc76cFOk+uyWvitZxuMVy0+eaXN4/OK1e376JGj2VlAc8zfcRkX7fv21QYvXz3PeBF
 r78w==
X-Gm-Message-State: AOAM530LB6LbKAYn+PW/qHFCa6OPBhw7NpAbwh3blGJ/RxHYfo/cS9bI
 ELmgIfRfPWXW5U4mmkZ2txaUyHFJXE4=
X-Google-Smtp-Source: ABdhPJxh05cOsankazze55hngE3yAD0EYclAtMfTnlRnbE9GccNPXBJBAgvStlY5JglgVhKOO0Zv7g==
X-Received: by 2002:a1f:3807:: with SMTP id f7mr41523230vka.28.1638795784905; 
 Mon, 06 Dec 2021 05:03:04 -0800 (PST)
Received: from rekt.ibmuc.com ([177.103.2.88])
 by smtp.gmail.com with ESMTPSA id s10sm4170577vkf.9.2021.12.06.05.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 05:03:04 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] ppc/pnv.c: fix "system-id" FDT when -uuid is set
Date: Mon,  6 Dec 2021 10:02:53 -0300
Message-Id: <20211206130253.630655-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setting -uuid in the pnv machine does not work:

./qemu-system-ppc64 -machine powernv8,accel=tcg  -uuid 7ff61ca1-a4a0-4bc1-944c-abd114a35e80
qemu-system-ppc64: error creating device tree: (fdt_property_string(fdt, "system-id", buf)): FDT_ERR_BADSTATE

This happens because we're using "fdt_property_string" to retrieve a
"system-id" attribute that does not exist, instead of using
fdt_setprop_string() to create a "system-id" attribute with the uuid
provided via command line.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---

changes from v1:
- fixed typo in commit title


 hw/ppc/pnv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 32ab8071a4..9e532caa9f 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -552,7 +552,7 @@ static void *pnv_dt_create(MachineState *machine)
     buf =  qemu_uuid_unparse_strdup(&qemu_uuid);
     _FDT((fdt_setprop_string(fdt, 0, "vm,uuid", buf)));
     if (qemu_uuid_set) {
-        _FDT((fdt_property_string(fdt, "system-id", buf)));
+        _FDT((fdt_setprop_string(fdt, 0, "system-id", buf)));
     }
     g_free(buf);
 
-- 
2.31.1


