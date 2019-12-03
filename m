Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6321A10F559
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 04:03:22 +0100 (CET)
Received: from localhost ([::1]:47708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibyTB-0000ju-Cc
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 22:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33253)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ibxxM-0003Qv-Hu
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 21:30:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ibxxL-0000GY-1y
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 21:30:28 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:45826)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ibxxK-0000Cv-IA
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 21:30:26 -0500
Received: by mail-pl1-x641.google.com with SMTP id w7so992214plz.12
 for <qemu-devel@nongnu.org>; Mon, 02 Dec 2019 18:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3c60ktEl3s3vBDW/ij/gteS+EMK9NFSQnhLEWy6Sa+A=;
 b=xwJSYtg7ghWqJkUl99jAmmryJoYfdZDMdlUz/3qeJx0rvBwCJIezVRtf3TAhcE5grw
 byA75eLZqwV4RJoybbrMHvt0jw4QyjDuFTHnwQxe3yAgJtcvTtImif/vKXrc2bmuldi2
 DXJkC1yIvdoA/TmWte8yvREsLr2FoH1F9+Mt8KLKHp36qti8WD3zPhQhxOM6EAQ46tGy
 gs6S3LCrCyDn8ofw6XP/RixLXmoQS7J09SufysSjYOLei1gm4v2sNvFRmAY31ZfHQTYo
 V5ZKMKN96KFH/yGcaKEAkL+GWC6xFH5MpFzh5mnY84QNG/jSbtUYeqty6txAPM+K6hqI
 k4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3c60ktEl3s3vBDW/ij/gteS+EMK9NFSQnhLEWy6Sa+A=;
 b=jv5BECKcrYtiuT46FFqwlBR5kNsP7vp6GIQBke5nLR3fn0TGIOPx73atcGE0II5PDs
 wUqbTpS0WcT07x3pmPb6RwuO7CaxV6pQ3gacy56gPadco+sNUJNVfTjB41TYyxt/uUsI
 ByQ5ONcYGaVzL3SzQ8igmE37hSjkJG3SDFpaZO8mdCQGxS2hMZMxtnWtNedaCvFs+vjq
 MMlqQ8VmFWu4+1DANMVJ1ZqZo6yScyNdyw3WFBGP9QfsGXQlrDT45ldaUFcbydPRK9HB
 glfxmiolDxu6j3BQvulY1yiuzBJVCic+RYv/jLcDAEUtQHRkiOHLrmWdn526GdRZBlf5
 KaDA==
X-Gm-Message-State: APjAAAUm9ZYvI3b1icMJ/v42qTFK2WkN3BWaIknLz+WrbXAgZSB4wwWq
 1r/gsU5Mu5sy6j/wZSwesAiAV2kJYEI=
X-Google-Smtp-Source: APXvYqx0LOqQ2MZTM78Jrt45jxrxec+CwkT+OWAs6/Ni1vs+uqHQSV8JcrO537uQnFMbwudkLH08YA==
X-Received: by 2002:a17:90a:ff04:: with SMTP id
 ce4mr2849310pjb.133.1575340225196; 
 Mon, 02 Dec 2019 18:30:25 -0800 (PST)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id q22sm873695pfg.170.2019.12.02.18.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 18:30:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 36/40] target/arm: Enable ARMv8.1-VHE in -cpu max
Date: Mon,  2 Dec 2019 18:29:33 -0800
Message-Id: <20191203022937.1474-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203022937.1474-1-richard.henderson@linaro.org>
References: <20191203022937.1474-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index a39d6fcea3..009411813f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -670,6 +670,7 @@ static void aarch64_max_initfn(Object *obj)
         t = cpu->isar.id_aa64mmfr1;
         t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1); /* HPD */
         t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
+        t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);
         cpu->isar.id_aa64mmfr1 = t;
 
         /* Replicate the same data to the 32-bit id registers.  */
-- 
2.17.1


