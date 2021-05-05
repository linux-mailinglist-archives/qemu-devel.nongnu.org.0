Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E954374AC2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:44:22 +0200 (CEST)
Received: from localhost ([::1]:53238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lePJd-0006Dh-Hg
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOp1-0001si-1W
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOop-0004zb-1S
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SmRPmb4hC8Fjru663xDAXcQsgbJqooC87XEyEFNRFMQ=;
 b=DPUFwytlwfCMIc1U/amfSlIuPRZyMUS81zNqjuEmB5nNGhVk5XIaPx3NHlTX+gMamzIQ+Y
 L0B7B7UMKEe27WPxJLct/ZIgaSBfNiw9A6+xctrnZWQ27E5+AnF78/AFVtGRxalpKV58tE
 ziWOaXzOXRIjLa3CYkocjH0a+KgLQLg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-bJZB6QdxNjGj-_2FkA6fxA-1; Wed, 05 May 2021 17:12:27 -0400
X-MC-Unique: bJZB6QdxNjGj-_2FkA6fxA-1
Received: by mail-wm1-f69.google.com with SMTP id
 7-20020a05600c2307b02901432673350dso704352wmo.9
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SmRPmb4hC8Fjru663xDAXcQsgbJqooC87XEyEFNRFMQ=;
 b=ILEHwa1NtqoEKME9orYQKbiBuJ+3JelxSNHC0gxgr3doFzmmfp6be+KOB6r6bxeoL9
 WRS4Xt/l9NqBQ6QYFo8gxal6Qx6Pp+YrmuzFO2W+V5MEgYb8EcEvhKhWtgiprbgCV16b
 wbWfrJ4RysYYAdmCQO18uHlnA6Nf5wDC0V9xf7MBLwDqRNYQPVLRSSk3GgsME+0+TwXz
 6nMVAVHpaGNFpfYwrYqPB6f3eXHAjHlgmEiJYoJcbjnDpBdCMv4Eo6SKF+LG/ivwil4+
 zDpJiPP6aGqXvvrjxntjvOfC1Wt9GS4tCjVP+aZndpwftcmbDNPWwXg6HzhcXg+sXlms
 f82w==
X-Gm-Message-State: AOAM533DQU9zOj4o4JyK4GrSnDUewT/0n6ae65cLu02jLf7ZozPT+vds
 Y7Vqo2k97Aj8AIUGXTabiyka1Ln6pFGP9q4TWXgBBCrvQGWbgqVhhXDxDvEwV2J0kfCdq8iTpSN
 mEPK3I3ab7cyic8cmEiW4/NVYqa2EBISiY2U+3g3/v7jWzISdCmm/kPSEtKtcgyjL
X-Received: by 2002:adf:fe02:: with SMTP id n2mr1006757wrr.355.1620249145983; 
 Wed, 05 May 2021 14:12:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGaMig5BIWWmqxPYj38JqUy41lSxrODNKmbDkEja4RdDilHYo76RG1j5RpQhtiMnidhMw+WQ==
X-Received: by 2002:adf:fe02:: with SMTP id n2mr1006739wrr.355.1620249145792; 
 Wed, 05 May 2021 14:12:25 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id i13sm728316wrs.12.2021.05.05.14.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:12:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/23] ui/vnc-enc-tight: Avoid dynamic stack allocation
Date: Wed,  5 May 2021 23:10:43 +0200
Message-Id: <20210505211047.1496765-20-philmd@redhat.com>
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
 ui/vnc-enc-tight.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
index cebd35841a9..ff6027cf8d4 100644
--- a/ui/vnc-enc-tight.c
+++ b/ui/vnc-enc-tight.c
@@ -1097,13 +1097,13 @@ static int send_palette_rect(VncState *vs, int x, int y,
     switch (vs->client_pf.bytes_per_pixel) {
     case 4:
     {
-        size_t old_offset, offset;
-        uint32_t header[palette_size(palette)];
+        size_t old_offset, offset, palette_sz = palette_size(palette);
+        g_autofree uint32_t *header = g_new(uint32_t, palette_sz);
         struct palette_cb_priv priv = { vs, (uint8_t *)header };
 
         old_offset = vs->output.offset;
         palette_iter(palette, write_palette, &priv);
-        vnc_write(vs, header, sizeof(header));
+        vnc_write(vs, header, palette_sz * sizeof(uint32_t));
 
         if (vs->tight->pixel24) {
             tight_pack24(vs, vs->output.buffer + old_offset, colors, &offset);
@@ -1115,11 +1115,12 @@ static int send_palette_rect(VncState *vs, int x, int y,
     }
     case 2:
     {
-        uint16_t header[palette_size(palette)];
+        size_t palette_sz = palette_size(palette);
+        g_autofree uint16_t *header = g_new(uint16_t, palette_sz);
         struct palette_cb_priv priv = { vs, (uint8_t *)header };
 
         palette_iter(palette, write_palette, &priv);
-        vnc_write(vs, header, sizeof(header));
+        vnc_write(vs, header, palette_sz * sizeof(uint16_t));
         tight_encode_indexed_rect16(vs->tight->tight.buffer, w * h, palette);
         break;
     }
-- 
2.26.3


