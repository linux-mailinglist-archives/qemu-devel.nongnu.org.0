Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8AD6017FD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:48:05 +0200 (CEST)
Received: from localhost ([::1]:37788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okW5k-0003oK-Fs
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfx-0002jp-0D; Mon, 17 Oct 2022 15:21:26 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:37636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfv-0002yO-0a; Mon, 17 Oct 2022 15:21:24 -0400
Received: by mail-oi1-x236.google.com with SMTP id j188so13231355oih.4;
 Mon, 17 Oct 2022 12:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=skOEsAeg6KP2CmeD6Dnh5EmKq4YUbFtPTmqJLa/W+oA=;
 b=JPpPFhEyQx2TgcotGwcol1YvRFYXc96HuEFQSsDxTdSQKQ0v+YOP77v+2q9s/kaRY1
 nOZQVzUTIcxU43cy3bx+Tzm4VKQorZfoFkJJ3JhLnyWHggmvxbhaFbpd+qaTeOXPmm2y
 sqgSQc9p90wVoBzgcpzS4bNYhYZvLMyaO0AOiQv5k3CuYxrnQlE7YI/CiR9FvWgVb0wP
 JXe57lauzdTpI7EkYav9KmzrS48q44X1+k2824jHU0lnsUmwLKH/wWuIfPIn6WcpPkSd
 AorA0rHOJRWni8Us+2MOTG8/iJjoA8P9Oq3bhukruWSeB5mcU4mrFVng2hwA6budnpNW
 fGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=skOEsAeg6KP2CmeD6Dnh5EmKq4YUbFtPTmqJLa/W+oA=;
 b=O8VcM1kth2h6Bfi1UVf+AzUrCc+SgvbDU2sj/30Azz4UaISqKhNPIuUzS+9INX/25N
 ZgcCN7jdp8pDr3CTYQLzsU1Fog+Ob6ARfjpILf4UWUHylQmTpyAzBfq1dgqbwuvYwKhP
 mFa8tyFZqSYyqHhQjZWVRlS48vmIFiyXSPEONqysr4WtLJm2rCAgqwwvi1gVUFiw9vyD
 yPw4IYqJx6be0KEH/sBQK8wfsGP5BS7FkIUBX+UsPYUTojJpOb2PlFLPe6h5ykXBeKfr
 BYely3WIVk+9MdC4LgF2UDKKPwEXGVAkFP5Mbc3r1SvxIDJXoHR7FXbFdaEj2fKGWbRT
 3yEg==
X-Gm-Message-State: ACrzQf21sXlGpWnCq1/75oJDIxJYtsX1rX0vcBYzo1T2ty/f66o6//y5
 uY5CBy3D85+NHWHaA5ENFkFdPWtMGUA=
X-Google-Smtp-Source: AMsMyM6wmNFayiT8Q9xHVTClJU/5nHhxHmepjahYoSkxnz68450FfvQFPzHcRyg+abBDI2BKhJxtwQ==
X-Received: by 2002:a05:6808:b18:b0:354:48e9:ef25 with SMTP id
 s24-20020a0568080b1800b0035448e9ef25mr14278243oij.86.1666034481015; 
 Mon, 17 Oct 2022 12:21:21 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:20 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 24/38] hw/ppc/mpc8544ds: Rename wrongly named method
Date: Mon, 17 Oct 2022 16:19:55 -0300
Message-Id: <20221017192009.92404-25-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20221003203142.24355-6-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/mpc8544ds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/mpc8544ds.c b/hw/ppc/mpc8544ds.c
index 81177505f0..8e674ad195 100644
--- a/hw/ppc/mpc8544ds.c
+++ b/hw/ppc/mpc8544ds.c
@@ -36,7 +36,7 @@ static void mpc8544ds_init(MachineState *machine)
     ppce500_init(machine);
 }
 
-static void e500plat_machine_class_init(ObjectClass *oc, void *data)
+static void mpc8544ds_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     PPCE500MachineClass *pmc = PPCE500_MACHINE_CLASS(oc);
@@ -63,7 +63,7 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
 static const TypeInfo mpc8544ds_info = {
     .name          = TYPE_MPC8544DS_MACHINE,
     .parent        = TYPE_PPCE500_MACHINE,
-    .class_init    = e500plat_machine_class_init,
+    .class_init    = mpc8544ds_machine_class_init,
 };
 
 static void mpc8544ds_register_types(void)
-- 
2.37.3


