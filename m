Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF2B3C15F0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:27:42 +0200 (CEST)
Received: from localhost ([::1]:43928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VwD-0006FY-5U
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmw-0000Km-8E
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:06 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmt-0008BS-7X
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:05 -0400
Received: by mail-ej1-x635.google.com with SMTP id c17so10204374ejk.13
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OFJUTV+92CDcZh6QQOAoXMbdHCOixFygGquQlFU36YM=;
 b=G7YwMwYjYSG/ZSq1tm8Ll5kJbCm7DBewHv0NlN+WS9Qif/TRCEhgCPg5WVTWT5F6GO
 eHyX4C8OzzML3NJDCIVzc5jXrSlucWBfBtO/45KwYw2TWwn9XWWNQfNmT1fjSbOpA6kQ
 8yqkc85dPqi/JabbuFWkrYOQtrhd9w7gVXRFN+pc3MUkPHaIRC5qqQ/S6W2sNPnHVrei
 6U/ork1gX+MttMA3FsWm8vWgC/iPzKDLWLH9LpiNE7hR77Kqjq6NdcbR+O3PUEiP4eD8
 WzotOC7SKzDifJtonatwPT8p3aGJC09Xiysr8BGkglrqql33cstc0Wx/pf4mj6E/spPB
 Z03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OFJUTV+92CDcZh6QQOAoXMbdHCOixFygGquQlFU36YM=;
 b=UqXeOTJbbuDQ8NL/AAXpH3P1O3shnWGZ3nXVhmo8FNGR2BaUIaoTIzgAiiPgdl0nLw
 eMr9RTRLCD/1FQ14OzUR7jYF/K8HnY3EgwmxeOr3ShNImp7jLeWGgghzabdPUPut4OV3
 lUYsI1Z3gWKzNurYIFXMWLH+RtgRZJKfn34wdCAWNcaYjMcB7gacp00r69JNOSACRSaY
 OFUZOtfNbXCv6LV6VQhd1iux4L3LBlrOMY44pm5iA2zVkHHskN54ntmJfWltTlNs2oR4
 D+G163bHaAhbGoDua9MzAtwBHEdNXLbagLVPCNbY3pwq6WF1ehhfgXTwSGsZWmmFcTzU
 EGDg==
X-Gm-Message-State: AOAM531x/knKsM5ARkOclawrMRS12ggriv0WV6YtzDZ/CY+vCKFjTrz+
 zQ6P9bCdNUNghLIDYq00NotFrCRa+Ww=
X-Google-Smtp-Source: ABdhPJyzSFTNqa1dKYhj7Ts7M5c9XndxZ78zIdqiYNBqzipLIgt+6gcvzEkDYPbX3eAg0IQr92qu+A==
X-Received: by 2002:a17:906:58cc:: with SMTP id
 e12mr31437972ejs.279.1625757479817; 
 Thu, 08 Jul 2021 08:17:59 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:17:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/48] modules: add ccid module annotations
Date: Thu,  8 Jul 2021 17:17:14 +0200
Message-Id: <20210708151748.408754-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-11-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/usb/ccid-card-emulated.c | 1 +
 hw/usb/ccid-card-passthru.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index 5c76bed77a..6c8c0355e0 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -612,6 +612,7 @@ static const TypeInfo emulated_card_info = {
     .instance_size = sizeof(EmulatedState),
     .class_init    = emulated_class_initfn,
 };
+module_obj(TYPE_EMULATED_CCID);
 
 static void ccid_card_emulated_register_types(void)
 {
diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index 7212d0d7fb..fa3040fb71 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -414,6 +414,7 @@ static const TypeInfo passthru_card_info = {
     .instance_size = sizeof(PassthruState),
     .class_init    = passthru_class_initfn,
 };
+module_obj(TYPE_CCID_PASSTHRU);
 
 static void ccid_card_passthru_register_types(void)
 {
-- 
2.31.1



