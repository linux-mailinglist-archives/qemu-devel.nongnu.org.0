Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30C33F6CC5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 02:53:05 +0200 (CEST)
Received: from localhost ([::1]:41890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIhA8-0000X6-Ss
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 20:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIh6G-0001cV-2Z; Tue, 24 Aug 2021 20:49:05 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:33675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIh6E-0006xi-1P; Tue, 24 Aug 2021 20:49:03 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id a5so4710809qvq.0;
 Tue, 24 Aug 2021 17:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T5goQIXIwtMNfeSBsrGH+6jpx4dotCpOid1Vqn34LKQ=;
 b=VwEmMuiFb1OkzCaVA/XUPkwP+hoCyTkDcgYR9CoMsJmW/SKIpuykowCy5csG5Wmgxp
 m7I9942rbkT2S2ctxClqkBQaaiKvh4eP3NP0n8l8KYbiPHT7ZJNkEl6mDvImFvs7p0DB
 oKtSpgqGLFQqQgGgW8yApqggFu5rhtBbM3A7vNiJDm7Jr/UEtosxtBg6qjwDZRQh+npN
 yIuuaUCZT72CoKRscD0BLS5CUiBIQIdHiS/zvYUDOmsnV19Pccf61K3cEUreLE5QseY9
 /EHXn5UVBjVlQhbdiLAYw33qZLOQr3sS9Mbmx0VFzYie1wHue9f3ol/aG2/OlGQJrq9M
 qgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T5goQIXIwtMNfeSBsrGH+6jpx4dotCpOid1Vqn34LKQ=;
 b=lEcfT0OyzhFSVYSDiUWx8eAx+QYut+xFF/JoHBvvUY9wHo9DgdLIp0cjjyRgDviwne
 MjILUSgSk6Tbau8o3d5szLFbhMNfqrDmUE107epqG3KXG17NP9cb95u0XzTC0/rSiNuR
 Sk3ZdN+U11ewpVEuvRVky919ehkxaWuG+95PPZJPoMqueobKsM4NRScvRoAn7TbbAPTf
 aVVgU0EZqecrJBapgTe4UWunRxbw+GzDPjWYwIjkuaLQDggGnC7B9cq8GasF3yiCicLd
 FfGHnRAyXi8yC1bM4WcKXcdznnDsjZhSQLifZQ8OQ0BSZaSPt5Wvn28Ggkd6vdLS5/VW
 iHNA==
X-Gm-Message-State: AOAM531KKxF0H8jQEvTiKIQhMHOkdZNwQ/U8Q/dW4X0XsogH4tDvvz07
 Ln2KZWMkG8UWkCb4HijlD0Owj7AZx0M=
X-Google-Smtp-Source: ABdhPJxgsdt9tFc7VwON4QYimYAOqG3u9NYsn54BLIGmXHDiBY8e4njL4YTj/jXXYFDwiei6E5w9nA==
X-Received: by 2002:a0c:e5ce:: with SMTP id u14mr17902818qvm.15.1629852540579; 
 Tue, 24 Aug 2021 17:49:00 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id x10sm1515266qto.41.2021.08.24.17.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 17:49:00 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 2/7] spapr.c: handle dev->id in
 spapr_memory_unplug_rollback()
Date: Tue, 24 Aug 2021 21:48:30 -0300
Message-Id: <20210825004835.472919-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825004835.472919-1-danielhb413@gmail.com>
References: <20210825004835.472919-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: armbru@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As done in hw/acpi/memory_hotplug.c, pass an empty string if dev->id
is NULL to qapi_event_send_mem_unplug_error() to avoid relying on
a behavior that can be changed in the future.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 81699d4f8b..4f1ee90e9e 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3690,7 +3690,7 @@ void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev)
      */
     qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
                                  "for device %s", dev->id);
-    qapi_event_send_mem_unplug_error(dev->id, qapi_error);
+    qapi_event_send_mem_unplug_error(dev->id ? : "", qapi_error);
 }
 
 /* Callback to be called during DRC release. */
-- 
2.31.1


