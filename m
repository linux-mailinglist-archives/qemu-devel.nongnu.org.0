Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DE1326036
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 10:39:50 +0100 (CET)
Received: from localhost ([::1]:47590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFZbA-00044B-4u
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 04:39:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZT5-0004Eb-HD
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:31:27 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZT3-0002rV-Jl
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:31:27 -0500
Received: by mail-ej1-x62a.google.com with SMTP id b21so2653203eja.4
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 01:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=moYUnA443ZNCun6tItxZiGo6Z2/jYTaF1F6gDoL/yFY=;
 b=m8kEeZyH1/ttQHawE+V8SJvmt3u0ifi2WvOkUuygkvaDMnxJEmIT0sQ5T/A27jjVfE
 FgRTieBFLf2WuNaL3Ilz4opn8QR2fiqjktoicjCCRC9nCKfBsZmXAk0kmn98zx34V0Sn
 5ORuTl41Xw9daq8O4m+nCLNP0OQhGvLpsOAeQC42csvJeegNSUpTKT/PTJkU79DwpNed
 V4hkxv7NsurEAhlpZe3HXMHn+nqFIiIlSlhIFyX0tbJhWN8jv8bL9Vuw9JJIImStoIir
 fImf5DORj6mqpY0METexuywPnCWwJSoqRkdhNE0Ebb9ExOufsfoltJDuhiI3bPTolu+7
 lfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=moYUnA443ZNCun6tItxZiGo6Z2/jYTaF1F6gDoL/yFY=;
 b=FQhSJ8A9iJcNgYUcHNJioyynioidKy6Hx3OaDlPm1PJX35/aPnbB9jky/46avs/y5E
 PbMdOb4uF8xEZHKbaDaBkCvVH8xEH78fRKRAkt12jwiTgSK0c9kUxNcM3theT9EwTj4o
 vESxLdlUrl24ICBwSPBQSMA7Rb83YTyKEpkUdTi1pNb9cWASTrt2ZFryLlgj5I29Op7D
 LywSuBSF05lzFi1PbVqQDbimLkVhGuJy+JZvxVnhYLYSU3wpcaOSvU2UdW+G6fDlWkfe
 qMVKDGfs4OVz+TtEwGpALoBDM1UhM+mzd0iCTRoZvgjt8s3blMBCSYhWR0oNdnXKDhDi
 +9Qg==
X-Gm-Message-State: AOAM530CjVeDkU87r1p6n1MvRfC/4WG1ZZDHWw3hcPktwx8pN2P7trJI
 5g8o2E9iSVTGlSDcyjnBaa+FjjTQsT4=
X-Google-Smtp-Source: ABdhPJyoYR4Dm2NCorYfG3FbMXZoDABq0gAF51rg1CvPjfHCyatB7HvC/VguTyd4hfNX4N6EoZUBSA==
X-Received: by 2002:a17:907:728b:: with SMTP id
 dt11mr2278663ejc.321.1614331884051; 
 Fri, 26 Feb 2021 01:31:24 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m26sm4861255eja.6.2021.02.26.01.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 01:31:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/13] target/mips/meson: Restrict mips-semi.c to TCG
Date: Fri, 26 Feb 2021 10:30:59 +0100
Message-Id: <20210226093111.3865906-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226093111.3865906-1-f4bug@amsat.org>
References: <20210226093111.3865906-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/meson.build b/target/mips/meson.build
index 75c16524606..53580633ce0 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -31,10 +31,10 @@
   'addr.c',
   'cp0_timer.c',
   'machine.c',
-  'mips-semi.c',
 ))
 mips_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
   'cp0_helper.c',
+  'mips-semi.c',
 ))
 
 mips_ss.add_all(when: 'CONFIG_TCG', if_true: [mips_tcg_ss])
-- 
2.26.2


