Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE455A4539
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 10:36:39 +0200 (CEST)
Received: from localhost ([::1]:33572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSaG6-00006k-0Q
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 04:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oSaBL-0006tv-9A
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 04:31:43 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oSaBG-0006Hz-B5
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 04:31:42 -0400
Received: by mail-pf1-x42b.google.com with SMTP id y127so7495413pfy.5
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 01:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=aV1H1alMpHZz4igJZf2gkfCM21hjR//eo307mJ9E1EI=;
 b=g3gxGQZQmTB2/6837knOSXjb/xI+/5YxWjsRFaoqtIHQyNVY1iDqUO6oESJJ3/2v2q
 Fw2TlrG7c6ZolGkzh45ciJCVAAhU2BC3JysY7mQyGXzflHhFDQF6qdo9ETqyP55FRvLP
 Jy80VFk8nuPco8pCaR40cvxADxQvyYpNNPhaLEwNE+nXUmqg6hns1OfayfVnJrhC65xa
 gQdfpn5ppTna9bkFLnTv8EnCb0LNvY9l1imqdITto06Aqj23SuMUexB1sUf3zSjS7hT2
 mgjZVUgmoZaLGDDF4lInhS0w8POMjbm0B1OGByheMqs+inMbkhTJ+wsSOLMrQoDk7ARC
 HBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=aV1H1alMpHZz4igJZf2gkfCM21hjR//eo307mJ9E1EI=;
 b=0c8OMpvB1oa1ZTClY9nNoqCmuiGNC2gSFVbSy0lOtI8TL2mxpgmUz5L5jUatd5le83
 qerBGv/OfQzwCW1GFone0XyZH3yN88As1A5+kP319LnqnYPPvGDc8h8eXXp1gYEpDjk6
 t/JbFUUgWuH6GdUvUMj6GMtoxIgpisjaHyPedu1n+U05aZyDUr6YhNbiRSzi7w86KaDq
 zvFA5Mzou42mNm1uKl310nUAzREK01bSfC844paD7xWUhINhIVjJFHiYxaDv8xJqBL/B
 B585m7HPb44o7FcrNlzSPZj45bAr6j3abzZSVF/QVWUuQA/nJbtADcjpuGj8lsH8iy+Q
 SfUA==
X-Gm-Message-State: ACgBeo2gzaOfhL9iOQ6AtF+4fr8RnuxUMn5htZetEEVgz8wVvAZYTekY
 3gvEGthPuV2ireQRJUQSljA=
X-Google-Smtp-Source: AA6agR5rhgC0nt7Q8D+UWmL9vBE/+3yVlDzEM73ftQ+Lefr3GbxIU8bnC8LDDt/p70ewKRlCkOZMpw==
X-Received: by 2002:a05:6a00:23c1:b0:536:463e:e53b with SMTP id
 g1-20020a056a0023c100b00536463ee53bmr15374622pfc.43.1661761895863; 
 Mon, 29 Aug 2022 01:31:35 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a62860f000000b005361f6a0573sm6592880pfd.44.2022.08.29.01.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 01:31:34 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
X-Google-Original-From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] MAINTAINERS: Update Akihiko Odaki's email address
Date: Mon, 29 Aug 2022 17:31:20 +0900
Message-Id: <20220829083120.143415-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

I am now employed by Daynix. Although my role as a reviewer of
macOS-related change is not very relevant to the employment, I decided
to use the company email address to avoid confusions from different
addresses.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ce4227ff6..fd9bd1dca5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2451,7 +2451,7 @@ Core Audio framework backend
 M: Gerd Hoffmann <kraxel@redhat.com>
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Christian Schoenebeck <qemu_oss@crudebyte.com>
-R: Akihiko Odaki <akihiko.odaki@gmail.com>
+R: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Odd Fixes
 F: audio/coreaudio.c
 
@@ -2730,7 +2730,7 @@ F: util/drm.c
 Cocoa graphics
 M: Peter Maydell <peter.maydell@linaro.org>
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
-R: Akihiko Odaki <akihiko.odaki@gmail.com>
+R: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Odd Fixes
 F: ui/cocoa.m
 
-- 
2.37.2


