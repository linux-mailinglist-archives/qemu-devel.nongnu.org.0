Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B23A25C1D5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 15:46:32 +0200 (CEST)
Received: from localhost ([::1]:51848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDpZP-0001C4-4s
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 09:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDpYE-0008K7-Ps
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 09:45:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDpYD-0001BD-8p
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 09:45:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599140716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnJGsFmE0lHc/vacaNXhWmico4HRbt/COcagt38PJC8=;
 b=ZvjaqcJbQ90ZEHy82JiSez2r3a83b1/ay+oq0QvlgYK/FbTbrHg0A3/jTWa2gPNdVT7w/v
 wkcfZsNufPrQxr+e9+cfymxWSQwcAMur1i7n4wPEJu7JjxbxbTopsxMJ7xxuPnquJGDOVA
 3lFy9p7uCuUDc5j0NvR1e0LiCtohQcw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-qmwgOZ2jM9Gk9znvFWbkQg-1; Thu, 03 Sep 2020 09:45:14 -0400
X-MC-Unique: qmwgOZ2jM9Gk9znvFWbkQg-1
Received: by mail-wr1-f70.google.com with SMTP id b8so1110643wrr.2
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 06:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xnJGsFmE0lHc/vacaNXhWmico4HRbt/COcagt38PJC8=;
 b=QXMvktCenDGx5WJt1ooXnmcM39T7hXqt1D0HyimpD/Jji9gq0CUNPlDnpDVu2LP55n
 a8ER4TOQYRRuFCUoRKyemzpHyyR3+37ZeCf72urfJggn/97vwYUwftQ53hJQN3A7RWbk
 ZQy6qQl//XWxMSZ13TJT8EdhrRa1RwDZEruX088NP5BIATD75ilq6rxlbYNf7LM4Ofc6
 Y79Ts0Zl4I3OaeHCIDzzkYPcMZSYiVjvOkfRAClJKm0XEamCjPl4Kl1sulVx8jH94TeD
 0uLc63RcOQYFlANycX4FLCB+KwhLQhvwc6pkfRAMIgCd/x6PzVu4IvHjOFAeAwDFNgaj
 PtwA==
X-Gm-Message-State: AOAM5309nbVKiRqXcD2XKcxvsIb7oHsA/MMPgJg/eCnRgspG+DA2MhO1
 wZ73ABIaxTnDcjpVSfJIm6sjtgwfn8474rrCrG2jeZOrj48ONPwejv/tdtZ529WNgKZRIldz48U
 2SjKb1sdJRXlJaEE=
X-Received: by 2002:a5d:68d1:: with SMTP id p17mr2498267wrw.378.1599140713414; 
 Thu, 03 Sep 2020 06:45:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkd59juEn6Zi7SDnJ4jjLVol29LXybzqo3sRN18mbzyAzNizyapEc+rY3LZwa19TcFn2OUmA==
X-Received: by 2002:a5d:68d1:: with SMTP id p17mr2498250wrw.378.1599140713266; 
 Thu, 03 Sep 2020 06:45:13 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id l10sm4408149wru.59.2020.09.03.06.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 06:45:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/timer/hpet: Remove dead code
Date: Thu,  3 Sep 2020 15:45:05 +0200
Message-Id: <20200903134506.440082-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200903134506.440082-1-philmd@redhat.com>
References: <20200903134506.440082-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:47:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code was never compiled/used, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/timer/hpet.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 380acfa7c8a..b683f64f1d3 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -416,20 +416,6 @@ static void hpet_del_timer(HPETTimer *t)
     update_irq(t, 0);
 }
 
-#ifdef HPET_DEBUG
-static uint32_t hpet_ram_readb(void *opaque, hwaddr addr)
-{
-    printf("qemu: hpet_read b at %" PRIx64 "\n", addr);
-    return 0;
-}
-
-static uint32_t hpet_ram_readw(void *opaque, hwaddr addr)
-{
-    printf("qemu: hpet_read w at %" PRIx64 "\n", addr);
-    return 0;
-}
-#endif
-
 static uint64_t hpet_ram_read(void *opaque, hwaddr addr,
                               unsigned size)
 {
-- 
2.26.2


