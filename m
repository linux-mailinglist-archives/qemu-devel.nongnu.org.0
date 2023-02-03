Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B3068A136
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:09:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO0VM-00077r-FR; Fri, 03 Feb 2023 13:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0VI-00076Z-BZ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:09:40 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0VG-0008Dg-E0
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:09:40 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so4518582wms.2
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 10:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oxYMqvC2WwLHgUmtCJqkqqMYVUSw0aYIth92XOROakI=;
 b=AIxg0fdTM3g4GbWU+rbgaYy6MBg9x/HWSj4LwdVg6hkUN5Tk8cpDNIHMsJ18d+0rA5
 DZprUxgdCUagbFoOEvwxiWh4gPNFsTDESYZ9/5V1kPRoFjLJ+CRsD+L+9tAMz0G80nif
 aG05M+Mk0aCLYSRRcxHNwiBuwhQuNeCzLnyVtzd9I5/fxQyS8hz4sSQ/xi8pW034Bi8m
 m31tIvor7j/KEwDqTUa6CvgSRnLo6eUVoo1h6oLhWVIJDcO3jEJu39wDJIg/dXWrMQzd
 +6EdkUOPcV/dhI/KhSZ+XDs5MPeB16cwsQ4su1HiebHuaA0DShpYCQt4AJzHIJb8cpfI
 uDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oxYMqvC2WwLHgUmtCJqkqqMYVUSw0aYIth92XOROakI=;
 b=0KmboyBoa9ABtBcJ8dog+4qk064b2TDcH8o4rEGNdsNnqdiej6hZ1L8U8SJXyaDYgw
 p6Z4ZOlMeN+aQ5eUEFIP2gnvswliUY7YmCv8LG5fk08HL8W/F1TUrfkcEGeV4SjfPcat
 CxSHGqRGsHzZgdm/CP9f0ETvcsmpf8GmrrsdeCsme+bxAdKUhltjaqcLdcFdBWHkAaDx
 gpWXmyKrsOE/vM3YGWAizGVyBn+Ny669/9u8ErrPEooaUYSZnU7kI6mh20AXaWp9Kn6/
 tHOBotEvGL1wLaFIh+D2BCTwu1eSfttXjO/7S8OZWyrLUAPgHrHZOGqKnYFBCaokx0Pe
 JhAA==
X-Gm-Message-State: AO0yUKWdKYnWc358z1IIiL+y726aW4Th09E6uXSZTxdbh4fAaBing1f8
 PIWZLngKvInCy8RVHBjlJ1n0qgPVCvyBu7xB
X-Google-Smtp-Source: AK7set/HzvxW38kLKRm6c4jTcXPZmY7rV4SL9JPmN4sj6lYhb7wohqxpgA0BQZC3w9AYtMoUaSA6bw==
X-Received: by 2002:a05:600c:225a:b0:3df:12ac:7cc9 with SMTP id
 a26-20020a05600c225a00b003df12ac7cc9mr9619906wmm.15.1675447776870; 
 Fri, 03 Feb 2023 10:09:36 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c2ac800b003ddc781b1d4sm3126424wme.33.2023.02.03.10.09.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:09:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 04/19] hw/audio: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:08:59 +0100
Message-Id: <20230203180914.49112-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/audio/pcspk.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/audio/pcspk.h b/include/hw/audio/pcspk.h
index 9506179587..e18ca08fa0 100644
--- a/include/hw/audio/pcspk.h
+++ b/include/hw/audio/pcspk.h
@@ -33,7 +33,7 @@
 
 static inline void pcspk_init(ISADevice *isadev, ISABus *bus, ISADevice *pit)
 {
-    object_property_set_link(OBJECT(isadev), "pit", OBJECT(pit), NULL);
+    qdev_prop_set_link(DEVICE(isadev), "pit", OBJECT(pit));
     isa_realize_and_unref(isadev, bus, &error_fatal);
 }
 
-- 
2.38.1


