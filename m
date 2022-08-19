Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0409A599ECC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 17:52:18 +0200 (CEST)
Received: from localhost ([::1]:49952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4IC-0000f1-Eg
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 11:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP46F-0005nH-OX
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:57 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP46B-000664-FA
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:54 -0400
Received: by mail-wr1-x434.google.com with SMTP id r16so5620057wrm.6
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 08:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=DXJfK+guYihDgdmOYphJLRS8QCxqYa74HNzsTOAa8r0=;
 b=DyUMAANVNV/3+DdidR8URZyYe0tIx8aH5CKHdP8p6kD0wpb7Cuz/rmOyAtO1g5O9YI
 Vq/I96D+7FSyHJTK1yFKfHu1AmDHQyI2h6J4IGqtuoczYzXIOwaB+h7iPGNY00hum/j4
 kGvrW4Jet4v97jVQpQHEKMWq7WgxiAgI083TyN0R8N7NDEWvK7+CMDadnZrm3TTNZbir
 kNrh1wIfEDT72O3Q5Bjtkkww7RQG+puWm926PM2FDHV04nR45tlBUaK8jGucP/HY2d76
 4E2b3rrGtKw/jLdD2It8iVbwXYML4XZRDptsBBMsk4kwiISLpfeRbha8kmbkZdL2k8rJ
 yJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=DXJfK+guYihDgdmOYphJLRS8QCxqYa74HNzsTOAa8r0=;
 b=w2lAE55BMKcmOelL+T1dQuoXuY0GVOhYt9iPSIT80C7H7SxT1RZLHasjLE8z99MFEt
 k5kuQpq9W3YkaaktYKbMtTiQSjrvQ/QsuwncSH+GUm/XeYPerfIWBH7lnWO050y/811Z
 vL5fskjaXyHUYqRRZN6QzX5Qg555Bbh/uEGd8xb5YzEh3Msh2LeAym0OpT9hm29cGATX
 vNnlISK40LMnA8NeZDYUhnGBJJ0qFfF1Pv6I0o3HO8Q4nmRyZ5P+JdXBbOBUebr6oveT
 LcuEoIJDOWnxN+UUVfwBuk26UqRZZsFeIkqa32L3kNLi1P2e3fIOaBMvI2aLUbce5+EM
 aPvg==
X-Gm-Message-State: ACgBeo25XQCDcCiX1aeCzOnFCuGFjpw7vUZBl2XC81J2MQdLYbv4IoD6
 TYtHOhF9Zr8WhXfKptwiurWbsbQ/WvAf+g==
X-Google-Smtp-Source: AA6agR57dyP1dzfOanR3Hupj+a3l3YMUK6P8LV81vQ26+VowFrOhQJ3xKpBuNcL5p3eKBDo4EJg8kA==
X-Received: by 2002:a05:6000:15c3:b0:220:676e:c825 with SMTP id
 y3-20020a05600015c300b00220676ec825mr4565743wry.512.1660923587985; 
 Fri, 19 Aug 2022 08:39:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b003a54109a6a0sm5558396wmb.3.2022.08.19.08.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:39:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 10/11] ui/curses: Avoid dynamic stack allocation
Date: Fri, 19 Aug 2022 16:39:30 +0100
Message-Id: <20220819153931.3147384-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819153931.3147384-1-peter.maydell@linaro.org>
References: <20220819153931.3147384-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 ui/curses.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/curses.c b/ui/curses.c
index 861d63244c7..de962faa7cd 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -69,7 +69,7 @@ static void curses_update(DisplayChangeListener *dcl,
                           int x, int y, int w, int h)
 {
     console_ch_t *line;
-    cchar_t curses_line[width];
+    g_autofree cchar_t *curses_line = g_new(cchar_t, width);
     wchar_t wch[CCHARW_MAX];
     attr_t attrs;
     short colors;
-- 
2.25.1


