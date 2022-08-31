Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF1A5A875B
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 22:13:53 +0200 (CEST)
Received: from localhost ([::1]:50922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTU5v-0000W0-V2
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 16:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSq6-0006ip-Dn; Wed, 31 Aug 2022 14:53:26 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:43680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSq4-0008Fu-VI; Wed, 31 Aug 2022 14:53:26 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-11eb44f520dso22017066fac.10; 
 Wed, 31 Aug 2022 11:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=R+0Y/FjLA6IKdLTWwtExSS/cuczUl8ax2fSs1JvR4jQ=;
 b=hgeaqIdh1AqeS3cWo7mTqyppMUjQCCp+Qfd+nlj4m8F9yOCT8NSHqjYn4w7pbz2OtF
 lgbdRgKAaeJeI5XZNE+57y3lydzoEHiE/5pJ7EdH6UsbTJabtUFJQ/qkyO9DWncp50ZU
 k1iZeNF/tRwlm1VjDREErxdhlK57TLeDDOIYQpMwvhYNk1R3OTJb0Gn6sONDjPZDnWNY
 HeCGg5srPToK+uqrXkmu1mVazeT+lU91FanB2ENsI2X1FccpI7PIFaU5pFa2lTElOKR8
 iO1mHfJHR40Dj7RZ1+3amtcyA6r8iYegXJMD8XHhYbbNsBsSFnhzuHhhPGMbSjJvr16n
 QrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=R+0Y/FjLA6IKdLTWwtExSS/cuczUl8ax2fSs1JvR4jQ=;
 b=unz/buMnc6TLE5vaEFmwF0TXux046Zdv4WLZIdT+LfrXWIoRZZAXFnyuYyW6+DzgHa
 2dvTLMg54EHOZMGBmN2FXVaR8j7gP+2qW5dLIHtXqNOra3RqBGztSbGAX+LOn9YTMi2Q
 ZTeol6S8GaIG6YCBu7xHlfGCfFCYswri4atbDuBaIaV3/RZYykK3SN5WfKmi4pY9FuCg
 JiM0Xq6r+4su8VVAYt9k4GKu1xgglib9BLBR5mPZLz3oYNnVmSaPRupYv09PKOXGPn/R
 IzDjScK5V23Z6J+CusRazQWrDkxYPpx67VwDX5ZUP1b4t+K5GDGrMXoep2192W1/pIJX
 MJrw==
X-Gm-Message-State: ACgBeo395aT5jkYloKlxTWp9NaKEf+zGMLRkNH5UPks11o3OpwDOONU5
 3kcF+fUVbu8L1J7bvV7rZqr9IcB2SXk=
X-Google-Smtp-Source: AA6agR4XJ3uSpuRTJ/RugDlfLC/498kiP/HTMfgTBI6e256/evoCvkMyQCvSbUxnZE7lpeqg++wRPg==
X-Received: by 2002:a05:6870:8092:b0:121:ece2:e41d with SMTP id
 q18-20020a056870809200b00121ece2e41dmr2264043oab.28.1661972003761; 
 Wed, 31 Aug 2022 11:53:23 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:53:23 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 58/60] hw/ppc/Kconfig: Move imply before select
Date: Wed, 31 Aug 2022 15:50:32 -0300
Message-Id: <20220831185034.23240-59-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: BALATON Zoltan <balaton@eik.bme.hu>

In pegasos2 section move imply before select to match other sections.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <4d46dde64c2e5df6db3f92426fb3ae885939c2b0.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 205f9f98d7..3a4418a69e 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -71,6 +71,7 @@ config SAM460EX
 
 config PEGASOS2
     bool
+    imply ATI_VGA
     select MV64361
     select VT82C686
     select IDE_VIA
@@ -78,7 +79,6 @@ config PEGASOS2
     select VOF
 # This should come with VT82C686
     select ACPI_X86
-    imply ATI_VGA
 
 config PREP
     bool
-- 
2.37.2


