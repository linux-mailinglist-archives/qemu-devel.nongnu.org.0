Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D9C2FB220
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 07:57:02 +0100 (CET)
Received: from localhost ([::1]:51696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1kwn-00018o-PI
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 01:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1kUT-0005dx-SS; Tue, 19 Jan 2021 01:27:45 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:46264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1kUR-00025k-Vz; Tue, 19 Jan 2021 01:27:45 -0500
Received: by mail-ej1-x630.google.com with SMTP id rv9so8105600ejb.13;
 Mon, 18 Jan 2021 22:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QGEW/zhOCWpBx/ValuvqrDoUReEloE3J1VaEmWJOUPE=;
 b=dUtqZiCpuugJXP+lVz8o5S3DnNQCHOvVd0OE+I6H0e7Qu24JDuw+Qr5EO362RzBBUR
 ULiNIR7wOPxb3dfceqqL97YDlxaI+V2oFW2qtJvd99TOyAJ+90V20GGt8MD8IPzOt8+t
 DlLLd54NxP4/kxpYKNWHc5KPZxIgQnWZf3JojQ4Lle9ov05MBucOIYZ6Ou7pzQWEAc1y
 i+p/JyIa9kCd63QW+CrVDhtkEQkU76Y20isPhcvLN2CwQO8USvP8q7KV7hNHjNcngpEa
 SNxPz23BAY6z8XBn7HoITGjIgurVa2txPWKxF8BJHASf0VRHwrjwQgpGd/TrUr4qQZic
 CbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QGEW/zhOCWpBx/ValuvqrDoUReEloE3J1VaEmWJOUPE=;
 b=G8dhIHMKo8jiNaWMXrfmWZ2cb6svijn4MEzJ33J+YNX0fy5SoQGpFBbjTcHw2zakGO
 vWpnE65CW5VmESWRe9p4ih9eHgY1dvezKHauq1UdgbI+i6gt9HxBKL4qK5WCDB7cD2Q0
 VH0rq75btung/qBIFpD02yTyNjSi+DB5ghRCjsf4qzz/IsmyqoQN3PSmhuXqzAroHGWK
 j9rCwa77FqG8T5yd1IpF9ig6kB0vOlqBRFa25oCGA9QNstr9UjtF/eYA7BYcXESaK/yF
 bK2+2q5TF8dK2cYfLZJ8u8ik3uCYgbz2c6vrC09Exms8Hx53NocQ0qgw01d1SRv/eiVF
 FbCQ==
X-Gm-Message-State: AOAM533ox3mfE/aDYB5L79HHichCZs9THLdnQsyTJMT9CtFjoTkdN6hz
 tL5q6NEW40R6gzxebsmuNyFWGl+6+ic=
X-Google-Smtp-Source: ABdhPJxd1EJzrrB+1loKd/kLbqMd14iHb6TEvtBpcmFb7PTCkkPughfkBUxZaCUTc96lMMhOegNOxw==
X-Received: by 2002:a17:906:3111:: with SMTP id
 17mr1900065ejx.152.1611037661580; 
 Mon, 18 Jan 2021 22:27:41 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z1sm12374201edm.89.2021.01.18.22.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 22:27:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm/m_helper: Silence GCC 10 maybe-uninitialized error
Date: Tue, 19 Jan 2021 07:27:39 +0100
Message-Id: <20210119062739.589049-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building with GCC 10.2 configured with --extra-cflags=-Os, we get:

  target/arm/m_helper.c: In function ‘arm_v7m_cpu_do_interrupt’:
  target/arm/m_helper.c:1811:16: error: ‘restore_s16_s31’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
   1811 |             if (restore_s16_s31) {
        |                ^
  target/arm/m_helper.c:1350:10: note: ‘restore_s16_s31’ was declared here
   1350 |     bool restore_s16_s31;
        |          ^~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

Initialize the 'restore_s16_s31' variable to silence the warning.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/m_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 61760030292..731c435c00b 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -1347,7 +1347,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
     bool exc_secure = false;
     bool return_to_secure;
     bool ftype;
-    bool restore_s16_s31;
+    bool restore_s16_s31 = false;
 
     /*
      * If we're not in Handler mode then jumps to magic exception-exit
-- 
2.26.2


