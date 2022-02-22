Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC2F4C0243
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:47:35 +0100 (CET)
Received: from localhost ([::1]:45018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMb8I-0001A7-4s
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:47:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawA-0003KC-IQ
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:04 -0500
Received: from [2a00:1450:4864:20::52c] (port=42684
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMaw8-0006qd-CX
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:02 -0500
Received: by mail-ed1-x52c.google.com with SMTP id i11so37726597eda.9
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v+v6TfEZmb9wwuiX3YkPxG5IdVxlkTReFcgd8M252ME=;
 b=Osg8/QJBtE8CqZXdEDhq3Zkh60kO1DwG+Ns0KrWkUV+I3eLmcDI5+4NRj8646VW4hU
 XHlybaRxnDQcJZ9myulfx9BXlKqGEtNiKZafxao4KzuoytmJ7tuovuSLTymxdrAaMAs0
 snEmL4LWz9JhAyYLDkg8rM3fsJkhenf22j/VIHbBLAwrNMj38SQUNi+B8M6ZWwR2OAV3
 xOiGYyL8YSDbeGbNwbc3LiRBvHX3d19Xuunz/JVx4X2WFppifVzt6/VxzB9VW9pzF0pC
 3IAMbNQ/OgtmM8QIRB/S75PSwVhwllAkTgLd0R8iLu0b3chFsgwww+mLTaDfZqKv9Gm9
 olgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v+v6TfEZmb9wwuiX3YkPxG5IdVxlkTReFcgd8M252ME=;
 b=RcvbliJk8JHCW3ddEJYIhGjxoaUKKGPb4oLv1rSAAk4pOJYXvzNOVoNWOFwPB8qwXW
 yLqvQORU9EfK5ddRnvzannT+DzEaUTLLuw7DsSz67WjGws65k6gdMEj1Le+4if0ZOff6
 yQ+6naABYzfQ3WRg9xicl8vK8wheIT+h3WE8HAty9wbDLWSmgCq22uQOn8KE4FV9tzjj
 snPXRz29+dtKGgOC+LFtOKpN7PkC/jY32teYv9I4T7LN6uSCvTcG1Saf9er24fGebs7m
 FFXzYE6hcZEYKAlAwUv5WuHxWPw+o2jaJByko0VbyJ0vfMEt5D9smkBxFY28pste0M4s
 o7yA==
X-Gm-Message-State: AOAM533uFrcVppY43CBZCdeL3SlBJXAE3jG9wJKID6udQJ3G62kBca6w
 WDsfR3qg0PO28z2nKSbq6H6WZ3ctsbA=
X-Google-Smtp-Source: ABdhPJyLYnGVJ9A4g8pzIRy7jKasvB1Iygd9w4UjRwl0dB3+0s1GWzoxl2wTMQp6KeEmqt8fVU3VQw==
X-Received: by 2002:a05:6402:144b:b0:410:b990:a68a with SMTP id
 d11-20020a056402144b00b00410b990a68amr28012976edx.25.1645558499105; 
 Tue, 22 Feb 2022 11:34:59 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:34:58 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/22] hw/audio/cs4231a: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 20:34:31 +0100
Message-Id: <20220222193446.156717-8-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bernhard Beschow <shentey@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/audio/cs4231a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/cs4231a.c b/hw/audio/cs4231a.c
index 7d60ce6f0e..0723e39430 100644
--- a/hw/audio/cs4231a.c
+++ b/hw/audio/cs4231a.c
@@ -677,7 +677,7 @@ static void cs4231a_realizefn (DeviceState *dev, Error **errp)
         return;
     }
 
-    isa_init_irq(d, &s->pic, s->irq);
+    s->pic = isa_get_irq(d, s->irq);
     k = ISADMA_GET_CLASS(s->isa_dma);
     k->register_channel(s->isa_dma, s->dma, cs_dma_read, s);
 
-- 
2.35.1


