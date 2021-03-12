Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22AD339817
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 21:16:54 +0100 (CET)
Received: from localhost ([::1]:59512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKoDO-0006xo-1S
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 15:16:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lKo4u-0007xq-87; Fri, 12 Mar 2021 15:08:08 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:45925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lKo4s-0005fU-O7; Fri, 12 Mar 2021 15:08:07 -0500
Received: by mail-qt1-x82c.google.com with SMTP id u7so4789326qtq.12;
 Fri, 12 Mar 2021 12:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h4euZu88pDlQtkYGkvefUZ+xefeYqAFQh4NY7T6v41s=;
 b=sEXivPAcl1QSD7o2FO9BcXM+S9cj65JbWMeUgGSYryZCKEXRP8Q6jR60gmATflQ4OL
 CpApPDGfCXkIuLYe03GGApU+s8Kw4ukBfdLvj/x2eBgxGE6SweX36jSZYosyWQo4JLe7
 rRHyDWlLXKPtJAEoaCPgEEaFOjOjpM79PUUgSartIT77uWqVoHYFgp47wak43XoL6lGO
 rl9HXdynCZXCxFI7t67i+kRqJtaEs4CGHIypfkxEr0GPV95uqZ99f9+7WRtESCTIN3H6
 o0W58vVUfpRpz4L7O4rzCnezWu6adY/VmEVHDOew3/Gdmvlb/lWYOx9un/nhT0R7UV/U
 mjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h4euZu88pDlQtkYGkvefUZ+xefeYqAFQh4NY7T6v41s=;
 b=i96+SJNYSEMaIO0ouxkZ7QQhLSEOluZUfWD9LB5rj2+KgT6AsK/8JZ0gq40w+1zqbE
 StSRjHSfc9X9IlLMZMCbG9C5jU0aZbFhYvB3x6IsaFEyd/YGFQIs4hATllWNEntJZuN3
 Kex+Vxp8mJbNcW/Iwvz6toyVTs2S3dPSqREqbRfRapbV4bOxKBlOEUy/eAEmbqr8eCtf
 hkhWNOBz3/3pHDbgsnb8z09DDJb0LAqquidLzm+jCIY0KfljTNIRkZIzU3kNx13aqdHR
 rj6eqE1PwV/o0Yjmd5bgiN7AjZuoQoMpvaO1fULku1PoEbKS4jE2ltbat7gGbfdYY9Ab
 jk5g==
X-Gm-Message-State: AOAM531Zy3wtsHd0xFO95AF1ApAfgg54dcfNz5saI1Y6m9LTlYwNSp26
 dy6NUxvoc7bCsUwn3XUnhT0++QEI5Hc=
X-Google-Smtp-Source: ABdhPJxZs01HVwY431kn4/7Y1SyGC3WWz01VUiKTojG3bQKs75G+uUzDM4KcKVUWPTrZhxOo96zGaw==
X-Received: by 2002:aed:2f65:: with SMTP id l92mr1224927qtd.193.1615579685302; 
 Fri, 12 Mar 2021 12:08:05 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:cc80:21a:fa87:b9b8:5376])
 by smtp.gmail.com with ESMTPSA id j24sm5074126qka.67.2021.03.12.12.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 12:08:05 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] spapr.c: use DEVICE_UNPLUG_ERROR event in
 spapr_memory_unplug_rollback()
Date: Fri, 12 Mar 2021 17:07:40 -0300
Message-Id: <20210312200740.815014-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312200740.815014-1-danielhb413@gmail.com>
References: <20210312200740.815014-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82c.google.com
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

Other device types in the pseries machine will use DEVICE_UNPLUG_ERROR
to report hotunplug errors. Use it to report the memory hotunplug error
in spapr_memory_unplug_rollback() as well.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index d56418ca29..697664e72f 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3624,7 +3624,7 @@ void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev)
      */
     qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
                                  "for device %s", dev->id);
-    qapi_event_send_mem_unplug_error(dev->id, qapi_error);
+    qapi_event_send_device_unplug_error(dev->id, qapi_error);
 }
 
 /* Callback to be called during DRC release. */
-- 
2.29.2


