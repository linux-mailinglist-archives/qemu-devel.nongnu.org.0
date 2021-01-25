Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DFB30285F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 18:03:03 +0100 (CET)
Received: from localhost ([::1]:59582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l45GX-0004JK-US
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 12:03:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l45CE-0002eN-DA; Mon, 25 Jan 2021 11:58:34 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l45CC-00054f-QM; Mon, 25 Jan 2021 11:58:34 -0500
Received: by mail-ej1-x62c.google.com with SMTP id gx5so19042621ejb.7;
 Mon, 25 Jan 2021 08:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nMqS6fgq0aMybkb/jEclhCDkmWMsNO0UTDT7wVdLOEI=;
 b=mnmBp7moCrQp1flJPBsAnoAvYA08LuoRW4RKC5BiZLSh+WdqNHWKyxqtevg7ViHgap
 K1yLHpqbSrEKpegCmjYV1j85Q6emU+H2z0ht9y9iwaBO0szWPGRnsLyfVRFtc1yyTmcw
 50RJxt1+jbtaHTzENVYjp959AWW06RH46vogo8wME4+hlO+OUz79570ikW6mJQ+hkfjf
 T0eIDuCUs9KTpE/zG5Bn5qXRojGVDClihmm7k4TYlppB7o4Xr1Bt5qOvqBwfMWsQiKEU
 s+VxWAjnbypOt5FBqJYqJk9m3zYyAhqHTVXOl/YDm4NTsFsb6dO3ebCyDGk9KMdqkzhr
 2jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=nMqS6fgq0aMybkb/jEclhCDkmWMsNO0UTDT7wVdLOEI=;
 b=FyDFn173TtqlKC8+awav5CMtjYdu1rIexS+bky8jGzVDYeo4aT5SCJ25J/QcRNL9Bl
 z6WddivP4PHN7mdsBpbj8Lw0S68Swq6RJidrWQPJ1SmR3obWUEYkOjbq5H/5UNbPF1Fl
 NPum7ccTwAxsM3KYyLAQae0l932t02FXSZTkOp5klrcUycrYTi72s6oC2SJZvitTdvH/
 iw5mjXGRLXTjk5EsFxTIr4t1i9wKupA2j6CMoV3XYXq5Kb07lgzwz+S2IElPuymPlfEL
 7VFRLjzsZ+3R2lrYCSCzhW6C+wk+lt4C5Y47ywbBwyVxsccSOo6BpnElR2O1TG6m6MoX
 KNTg==
X-Gm-Message-State: AOAM533UOV19/YnTPG9+A61dif/Tug04Wg6T/tq9/Yw0CHIl5U93U/MW
 Wd9c/0UwuMU1eVZsNY31/gOt3HgAGDQ=
X-Google-Smtp-Source: ABdhPJxrTF7rSBIwcHwftHtE6fM3EryH+r05717UKaYKXbdDiOKHMJSEgrIwkUi+j2gRwzeEE+zIJw==
X-Received: by 2002:a17:906:5043:: with SMTP id
 e3mr988131ejk.260.1611593909412; 
 Mon, 25 Jan 2021 08:58:29 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id f22sm8633672eje.34.2021.01.25.08.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 08:58:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] configure: Only build s390-ccw BIOS when system emulation
 is built
Date: Mon, 25 Jan 2021 17:58:26 +0100
Message-Id: <20210125165826.2894021-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is pointless to build the s390-ccw BIOS when only user-mode
emulation is built. Only build it when s390 system mode emulation
is selected.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Restrict to s390x host (thuth)
v2: Restrict to s390x-softmmu target (thuth)
---
 configure | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index dcc5ea7d630..4751d3e352d 100755
--- a/configure
+++ b/configure
@@ -5372,8 +5372,14 @@ if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
     done
 fi
 
+s390_ccw_bios=no
+# Only build s390-ccw bios if we're targetting s390x system emulation
+case $target_list in
+  *"s390x-softmmu"*) s390_ccw_bios=yes
+  ;;
+esac
 # Only build s390-ccw bios if we're on s390x and the compiler has -march=z900
-if test "$cpu" = "s390x" ; then
+if test "$cpu" = "s390x" && test "$s390_ccw_bios" = yes; then
   write_c_skeleton
   if compile_prog "-march=z900" ""; then
     roms="$roms s390-ccw"
-- 
2.26.2


