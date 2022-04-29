Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDF3514CC2
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:26:31 +0200 (CEST)
Received: from localhost ([::1]:43230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkRZm-0003FT-9b
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRS0-0005l5-0b
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:30 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:44808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRx-0004Zx-Jl
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:26 -0400
Received: by mail-ed1-x530.google.com with SMTP id e23so9226900eda.11
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 07:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PlV/EK5UsYBfqg6xjcxWdCbe+/9xSJ7+ICIhFQH4VjY=;
 b=IFpRS5aIUkqeHGYK/R/8+MKQ2GMw3iVWetzPCpEUjxireXsVTiKakYl7YwFzvhfNKq
 P0LY0MnvifqKPT9e3gSL+dPZ7TFMaMVDe0xWjxeVN+cedr02nAbLAbP4rKurDuQyzqzP
 vbH47F7kKTiwA2l8V9gSinLRzjOKuxmek1hMgqOoFdGbt8H7Uf6Ql40r/O9s7IuVlR+/
 m45Vqy+v1gH8M3q8KVfn42gLHDRW+gPXceoew8UkIHo93S846E0TMm0qt1XhEMWOJKuH
 zM/oLy/ueb6BzQbzNlNpBsThWK6A7lRG8DVieLNjouJussXo+DDpnQOCjgz02m0i+GjJ
 f7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PlV/EK5UsYBfqg6xjcxWdCbe+/9xSJ7+ICIhFQH4VjY=;
 b=2aemTXLlN4yyZyixI27bzvvhDw5mD7911c2dlbi23kIKtfRpByOqHNJwuwEKdsc8XU
 BZ57m/BW1T2IhrY/5J3pKUSqRVs3HlLr6LujLg5QZmLLFfItdL7uypA3JyEqID2sWOTR
 N4dGS9ITI8SLhT1oUehVPcDsfd1WzWmp0so/7H3+055ed2Sb1eY10bEIgRYpBDIBQdtR
 XvUc6i+hfHtF9WwPCj4C5DuNjllmzYROjzBjLqv3nhore2IXjDMB6NqRaLFM+sKooreO
 nBVjKfT5AaK+jod9KcpoJw3dgc4DexCySloG5OlcgEv9YEDE3nTXsffgMIrvXJ0fYRk9
 EH8g==
X-Gm-Message-State: AOAM530NupRI9TqoZTzW8MH72TQDfOhue6zoed52Q9vGXz7INKpQX9W4
 OUPKRX5cpM8D9Ro2bYLNF9OzQm5qhimfHg==
X-Google-Smtp-Source: ABdhPJxsKHaxo5pnuBduWL99H/4HpgIIouSuB1BsrHskkknNKvo8ClnupyFptZGYzexSMjTyw8FlNg==
X-Received: by 2002:a05:6402:f07:b0:426:12ba:9b7c with SMTP id
 i7-20020a0564020f0700b0042612ba9b7cmr15615608eda.0.1651241904258; 
 Fri, 29 Apr 2022 07:18:24 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b006f3ef214e27sm692298ejc.141.2022.04.29.07.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 07:18:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 10/12] pc-bios/optionrom: compile with -Wno-array-bounds
Date: Fri, 29 Apr 2022 16:18:11 +0200
Message-Id: <20220429141813.328975-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429141813.328975-1-pbonzini@redhat.com>
References: <20220429141813.328975-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoids the following bogus warning:

pvh_main.c: In function ‘pvh_load_kernel’:
pvh_main.c:101:42: warning: array subscript 0 is outside array bounds of ‘uint16_t[0]’ {aka ‘short unsigned int[]’} [-Warray-bounds]
  101 |         uint32_t ebda_paddr = ((uint32_t)*((uint16_t *)EBDA_BASE_ADDR)) << 4;
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/optionrom/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 8de5a9461c..2494ad9c25 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -26,6 +26,7 @@ override CFLAGS += $(call cc-option, -fno-pie)
 override CFLAGS += -ffreestanding -I$(TOPSRC_DIR)/include
 override CFLAGS += $(call cc-option, -fno-stack-protector)
 override CFLAGS += $(call cc-option, -m16)
+override CFLAGS += $(call cc-option, -Wno-array-bounds)
 
 ifeq ($(filter -m16, $(CFLAGS)),)
 # Attempt to work around compilers that lack -m16 (GCC <= 4.8, clang <= ??)
-- 
2.35.1



