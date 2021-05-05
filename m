Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBFC374A10
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:22:13 +0200 (CEST)
Received: from localhost ([::1]:41534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leOyC-00034n-6Z
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOof-0001gS-De
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOod-0004tX-MW
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PcGiW0X9vtq9AeHwSO5/7tvJlwWuqUWixK9RiaVNbNo=;
 b=NYwdd3zc0GaXlXSFXAUO5NI1GZxWe29SkA4X4nDehVZsLGDTQ8oHhhrncB+8Jr18V1p7mx
 xGEgcJUuwgjXMFUmvewogEBo8csyekm/k1C9SPt4X8SVBKcZcghnV4Vqd6+get+zcs5NMb
 Gn2ypCzONARq1q7JakeO3BAweb84IFg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-L69LrrspPHSLUgzypnL9Xw-1; Wed, 05 May 2021 17:12:17 -0400
X-MC-Unique: L69LrrspPHSLUgzypnL9Xw-1
Received: by mail-wr1-f70.google.com with SMTP id
 n10-20020adfb74a0000b029010e1a98fb84so1238700wre.0
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PcGiW0X9vtq9AeHwSO5/7tvJlwWuqUWixK9RiaVNbNo=;
 b=n+lLJnNtEqTWWsDERGbybKNtkUuFZXZ1PWD4wm/nL15jRBko0uwd8VuyTQvVABRMhj
 Zh8uuoJeFIp/8MX8trbxo/o4FLlxETjbaYiZpzOnqBKgoVT3QOXGPGpX6Na0tmWAIJdu
 SMr7/prQwNSfT3iMwz2+NqyFwRdtnE3UTbL72LRuaqfvadQ/tZXJUjsQaiXv9qZEdi5E
 DtohgpEwLTeUF/aQKd62pTld2Q951DgQI6DV5zEIiqU4z+EGeEThaIbxJnr37pLoZ/Ln
 g1IXJHpGOT7ZPyTeRdfJgA0yJlAvopxQSc+Is1iRQYaZtPsotVdUwLYuoPqu6EDmFuaI
 EyiA==
X-Gm-Message-State: AOAM53073BdyWE4LnS4E8Xk1k4UhXvNl7qvQIBMV5tDXjT/vnpG5Scvn
 LSMDPlCR79ln9zEs154yc7UEIt3uZnH+/V0vR1foOiUaU87lFZ/9ODbxgkmAymwX0dSbWNuD+dq
 /YM9HzKyXWBpHv4ck83Z7QhFkthgYKO4JV3EHFL5ae+CvZAjN1EfyNb7BJxhc4t+M
X-Received: by 2002:adf:ce12:: with SMTP id p18mr1088944wrn.228.1620249136185; 
 Wed, 05 May 2021 14:12:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywBh5xeB7vHSsLYKX/GGT+xyMQjiQ5BIO2GwRPm7/QvGb4CvRhfISGZeqUJcRkdxtoUmmV7g==
X-Received: by 2002:adf:ce12:: with SMTP id p18mr1088923wrn.228.1620249135989; 
 Wed, 05 May 2021 14:12:15 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id k11sm6860115wmj.1.2021.05.05.14.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:12:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/23] ui/spice-display: Avoid dynamic stack allocation
Date: Wed,  5 May 2021 23:10:41 +0200
Message-Id: <20210505211047.1496765-18-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505211047.1496765-1-philmd@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 ui/spice-display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/spice-display.c b/ui/spice-display.c
index d22781a23d0..61c4259363b 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -188,7 +188,7 @@ static void qemu_spice_create_update(SimpleSpiceDisplay *ssd)
 {
     static const int blksize = 32;
     int blocks = DIV_ROUND_UP(surface_width(ssd->ds), blksize);
-    int dirty_top[blocks];
+    g_autofree int *dirty_top = g_new(int, blocks);
     int y, yoff1, yoff2, x, xoff, blk, bw;
     int bpp = surface_bytes_per_pixel(ssd->ds);
     uint8_t *guest, *mirror;
-- 
2.26.3


