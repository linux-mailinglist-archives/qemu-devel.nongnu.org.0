Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D6E374A33
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:33:12 +0200 (CEST)
Received: from localhost ([::1]:49086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leP8p-00017A-E6
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOoL-0001Dl-U4
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOoJ-0004hD-L7
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DfUDaI+/f3cLjeF1lXLCmZjtS2bI+iFNO52XEDHDQcY=;
 b=N/ICO9F64DtQdtnbBGzATH0sIUitsj+SLmx7BQEqnAAhiOSD6rN+3UCeQQXAqLokJRHKqL
 ghjFQOrA8VpVtNPSTJjKpTe0lb8nLiIfDfZoQOShIwKpzVH4aoO4M16qybzZLezOPQ6XWA
 QwovLQz7RkKOneSFgPY9H/g/c9UR0vQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-MYHAxYNoN22RQi-duA7GqA-1; Wed, 05 May 2021 17:11:57 -0400
X-MC-Unique: MYHAxYNoN22RQi-duA7GqA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so1191235wre.22
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DfUDaI+/f3cLjeF1lXLCmZjtS2bI+iFNO52XEDHDQcY=;
 b=kTJzfVkaaujNMnBdlRbChb6y+5/Pchj/M3TGzK7l/EKF3ZWBI/Cf7RX7Cv4qzCYPtU
 QBzpN4Yi87u4rAJSUiWMUzzpjZmZbqx0KUiQZXCElx0J8xgy2n6QtvFluFLmSBQZA/tV
 G4UggsCDfIWR36P1pg1dST2VKD8G0gCsNYWCMYqXvkRs19gE7wrLQYTHgQC1sgfBQhmO
 331r1nWssQM52icU1lS44LL4B+QLCsU/lQ7Obr1ki5NUQec2lJuGC0bZWtbarx229pLs
 Nk3AqPYs3spv8weIVHZFdecnmlm3zZsq1voGipfO2HltaU1fqXFnhmIidV3hv1O4Xsvs
 pKtQ==
X-Gm-Message-State: AOAM532a8v2T5+P4ALhJPoBTI8jzcHFilIum0rxUI6Ai6O91plX89zi6
 bZ17ifnShWBO0RpwpPf+gFbaZep20wPbo6iFG5fRAH6g01UbFR+98DgRhqHgSCXsqKNxZAP0UaI
 Ky0LcZtffXttgby4yw8uQDezWqazFtZS1rwHIvXWSALvew++ulz/eFPd86hJz9IaP
X-Received: by 2002:a05:600c:4105:: with SMTP id
 j5mr11852484wmi.141.1620249116186; 
 Wed, 05 May 2021 14:11:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyG5noAegUY6P5TQU7a34yqqqkqt19xtSf03Oa1j5D6n+YP5pon+6ohzY+LLzQLvfzWE/3n8w==
X-Received: by 2002:a05:600c:4105:: with SMTP id
 j5mr11852465wmi.141.1620249115963; 
 Wed, 05 May 2021 14:11:55 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id j18sm528387wmq.27.2021.05.05.14.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:11:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/23] hw/usb/hcd-xhci: Avoid dynamic stack allocation
Date: Wed,  5 May 2021 23:10:37 +0200
Message-Id: <20210505211047.1496765-14-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
 hw/usb/hcd-xhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 7acfb8137bc..59a267e3c8b 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -2387,7 +2387,7 @@ static void xhci_detach_slot(XHCIState *xhci, USBPort *uport)
 static TRBCCode xhci_get_port_bandwidth(XHCIState *xhci, uint64_t pctx)
 {
     dma_addr_t ctx;
-    uint8_t bw_ctx[xhci->numports+1];
+    g_autofree uint8_t *bw_ctx = g_malloc(xhci->numports + 1);
 
     DPRINTF("xhci_get_port_bandwidth()\n");
 
-- 
2.26.3


