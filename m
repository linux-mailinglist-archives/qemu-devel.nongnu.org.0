Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C730F374A18
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:24:46 +0200 (CEST)
Received: from localhost ([::1]:50110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leP0f-0006Zi-SA
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOor-0001ou-QH
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOok-0004xr-Li
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oW5QmBlxBqqDs5oSoQXSMxZQROwxDbKkCtS/0EJBiMo=;
 b=C8k7+DIToTGurgy+SkLCs95S6H/W0dooZPew5fxJwSfbwHW74DGcbIkHY9xpU4Nzc7yAr6
 ui1he0n9i9SzGOQ3trxmAEoZEObxKxhr7cHctvYKl3XdTIzd2SU1+Qovb5ffyU7OoV//SG
 wZoNZgAUjJUfHpDfJw1MguneswzX5oU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66--fkQ6WMyOQ6dtOqAIcQqcA-1; Wed, 05 May 2021 17:12:22 -0400
X-MC-Unique: -fkQ6WMyOQ6dtOqAIcQqcA-1
Received: by mail-wr1-f71.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso1210311wrh.12
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oW5QmBlxBqqDs5oSoQXSMxZQROwxDbKkCtS/0EJBiMo=;
 b=idFHnfxzuZfti8/6W4yiGYeHI54CpUVLyHQS0UDswcxCHgPtxM8lj2TDosVAr8JmKP
 e/BhTk8CsVomzOIM2fJNVYdoxoXyRct5KrQtQcj5506v0L95hqCZihLcEw6YCf5NgdKu
 04EN0yKfCjfPZLTLw/62Pnxq1oBPW2z/ZoQaYeJOQXQCG0BMIwdD085fg44ovrZ3NXio
 7m2bn9sUco3teGezb4l4+ArbCpG/w5pAHDrfgDSj9AbB/vlZmxzD4gSZrSp7GAnx5MRS
 rmJ1SoCUwKCXxEX3JIoJm25mrT0b1+RubJTQgJjFpt/LMCYUoLv6RwG37ojpqHc5CSbu
 xOMw==
X-Gm-Message-State: AOAM532m0Dh3uE10jk0tYqM12sAfZg4A+J+mllX6g4XWeqPpa0GO5RCj
 xKhXqKCgFzhjSP6d7V/qBUP9iRaV9DzbH8Y8aipEpVVXZKZytibBllbHkHZuPSol+uvn8qSk4+C
 RH8N0P7iBRRf+6C2RxVvFLMOMl6HLWbCiSMguAVpGsc48saHRWVNiUibjNMMaWk1X
X-Received: by 2002:a05:600c:4ecd:: with SMTP id
 g13mr592615wmq.173.1620249141152; 
 Wed, 05 May 2021 14:12:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCmwCC0zD2jn7wQAdZyHRrtQRvCZX4zdE25lUjd9tnpTZWp89G9DSliz8fdw77Tu2zsRyi6w==
X-Received: by 2002:a05:600c:4ecd:: with SMTP id
 g13mr592598wmq.173.1620249140919; 
 Wed, 05 May 2021 14:12:20 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id q12sm6055450wmj.7.2021.05.05.14.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:12:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/23] ui/vnc-enc-hextile: Use definitions to avoid dynamic
 stack allocation
Date: Wed,  5 May 2021 23:10:42 +0200
Message-Id: <20210505211047.1496765-19-philmd@redhat.com>
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

We know 'pf.bytes_per_pixel' will be at most 'VNC_SERVER_FB_BYTES'
(which is actually 4 bytes for 32bpp). Instead of having the compiler
use variable-length array, use this 'small' maximum length and
autofree to allocate the buffer on the heap.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 ui/vnc-enc-hextile-template.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ui/vnc-enc-hextile-template.h b/ui/vnc-enc-hextile-template.h
index 0c56262afff..85e67bd9d88 100644
--- a/ui/vnc-enc-hextile-template.h
+++ b/ui/vnc-enc-hextile-template.h
@@ -25,10 +25,11 @@ static void CONCAT(send_hextile_tile_, NAME)(VncState *vs,
     int bg_count = 0;
     int fg_count = 0;
     int flags = 0;
-    uint8_t data[(vs->client_pf.bytes_per_pixel + 2) * 16 * 16];
+    g_autofree uint8_t *data = g_malloc((VNC_SERVER_FB_BYTES + 2) * 16 * 16);
     int n_data = 0;
     int n_subtiles = 0;
 
+    assert(vs->client_pf.bytes_per_pixel <= VNC_SERVER_FB_BYTES);
     for (j = 0; j < h; j++) {
         for (i = 0; i < w; i++) {
             switch (n_colors) {
-- 
2.26.3


