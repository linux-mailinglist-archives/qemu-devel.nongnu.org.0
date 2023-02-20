Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E667269D048
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:07:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7jj-0001lK-9Q; Mon, 20 Feb 2023 10:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7jh-0001l7-T7
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:05:49 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7jg-0008Pc-EF
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:05:49 -0500
Received: by mail-wr1-x434.google.com with SMTP id c5so2230800wrr.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJz+z2UXP9NxFKN85KXZvfj6u/KvvDw8qw3Z2QL+l+I=;
 b=mMMpzKV20DvNI1a+ue0uObqkkE1zAFwtyqVEDHQ8AHLGErcvNa3Os8lAL3aCZRJWln
 2KSmeW9ijG9Y+hz+C/0C0wdvCXGR6aHSQVhOZduWVyyoj5zQzP5zGG5Waiorrw/DCV1o
 O6+fT6QGkWKIg4RZ66pIlRXhbBRJeU95YG0KtTs0OHWYRskTViwuFGBzRwZJxIBuJa6p
 StX9kpXU58hlgp12BoTOK7EJJKUuHa0yKU/nyHM+8ZEZWXDJu6AUu1cDBn2MzDN3mJwr
 7QQTR9ix9pebdWMyPjbrVntfYxUdqje4Guw1Ex0AfS1RELLdk6EsGhGj8p12fVRABFTl
 FxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tJz+z2UXP9NxFKN85KXZvfj6u/KvvDw8qw3Z2QL+l+I=;
 b=79fO5GLV7e1L5QoYGY8oa8t4oZpH8XM984CoeWQWahTmUuqZAceFISeskbQlk46vZE
 UKvRERnTDhd5PvtgWSBY664J1rW3h/iAKZxDy67oyGL+kLEgtKB16CHdesGN6G0gYihF
 /dOCL8nSj7UXzxav1rCDFhI0a0x8LJ0grllUYtakMpG2MWWkzRfkzhPiutDGEvJbpCGQ
 Ni29yvAO3NPmEVnk2NmlB5JR73XSnw0sO+r3b7hTbZl4ua12VqcEn21FuqVy4htSkG0f
 PhPysa/jSpTUfLb5YE0jxE/CSnEiNO0Ii2dbcmXH6+9tSZuFGdlzRpgMmNpW0CQhmsIh
 qFCA==
X-Gm-Message-State: AO0yUKW0tkt6lKoe7svJLpu/kNfRBjVxW4l1XD45yZUIXhsg4pAx8XM0
 f2Vu/JMxQU+LPh8IRZeAj4OjetTcLynOCwXw
X-Google-Smtp-Source: AK7set+WzoYHRkfC+EtMMFfvWQRjVs4gxX47NIOqH0Wu/fRz4inJtbd3dWhDi4MVJval4oDbELx4Rg==
X-Received: by 2002:adf:eac6:0:b0:2c5:53e6:9aba with SMTP id
 o6-20020adfeac6000000b002c553e69abamr1578216wrn.5.1676905547616; 
 Mon, 20 Feb 2023 07:05:47 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a16-20020adffb90000000b002c54c92e125sm829142wrr.46.2023.02.20.07.05.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 07:05:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/9] hw/usb/hcd-xhci-nec: Declare QOM macros for NEC_XHCI
Date: Mon, 20 Feb 2023 16:05:12 +0100
Message-Id: <20230220150515.32549-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220150515.32549-1-philmd@linaro.org>
References: <20230220150515.32549-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

NEC_XHCI is a QOM object type. Declare its macros /
typedefs using OBJECT_DECLARE_SIMPLE_TYPE().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-xhci-nec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/usb/hcd-xhci-nec.c b/hw/usb/hcd-xhci-nec.c
index 13c9ac5dbd..d732be0ef9 100644
--- a/hw/usb/hcd-xhci-nec.c
+++ b/hw/usb/hcd-xhci-nec.c
@@ -27,14 +27,16 @@
 
 #include "hcd-xhci-pci.h"
 
-typedef struct XHCINecState {
+OBJECT_DECLARE_SIMPLE_TYPE(XHCINecState, NEC_XHCI)
+
+struct XHCINecState {
     /*< private >*/
     XHCIPciState parent_obj;
     /*< public >*/
     uint32_t flags;
     uint32_t intrs;
     uint32_t slots;
-} XHCINecState;
+};
 
 static Property nec_xhci_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO("msi", XHCIPciState, msi, ON_OFF_AUTO_AUTO),
-- 
2.38.1


