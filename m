Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35A36F9000
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 09:28:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvCGq-0006P7-3m; Sat, 06 May 2023 03:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pvCGn-0006Ob-JP
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:23:53 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pvCGl-0005Hn-PG
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:23:53 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6439d505274so1140729b3a.0
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 00:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683357830; x=1685949830;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/WokxXHt0BNFkLgriOzep0+cuXckGZifEKUUbbCRfMY=;
 b=PrS/DwQuJOyjwgXR7Kw1QiwPvPP+sSx0SGXI8NWxKj54BEvVNMSDFDJWfbjDW4XPQh
 JbKoBXKIo8Y2OOB+zY0d7DeZsHSenuW+p+CJYC20gdArBS3yAxWvasRHKRAMgC8TAMRy
 +WTZ45+A/xOIcLg7fOvKmAieb5PLpQ+j+M3k83nooOV0m8rq2ik4Vf6lb+DFhHXVNqzr
 Pxl8+KZgLXaVpU2UnNhad0Dp3snxz9mCJYZko/oZwmHmAiK0lnG27zTRG4I31tfq6fCm
 yI+al6cPYo/FThxuhPpzcPu3o2ejZYIGlC5oR2+LBVO1OsXek/BsxL9r9m4KNnQeqTfR
 PBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357830; x=1685949830;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/WokxXHt0BNFkLgriOzep0+cuXckGZifEKUUbbCRfMY=;
 b=jutjcGf8JG+sKCl0DP5kinqXIdb9nXOEa9N/EZbT25sypyLJf0uMxbNgBh05Sx8b0q
 qSz4aRoUS7ajub+m3Ei65OTIq3YYSWrsRxFJvvo4BXFvCixZCDUENdGEbwk5l9iAf4q+
 B7+b7CTfgMd9umlo3dEMvbD/8Nvgi4pYkwwJsomoilCXtEETdb2i9oLrvFivMlFhQHLb
 XcSfxHpI0tr5v6am2IMkePnNvPHdmqdQIAozSoEqXqYguoCnDeAAgSSCztYa2vilzLbd
 3ItKxTvSp1KcyOw58jIBNe1gG19/4AZge8yMMSAfvXMJAi97DqfELAQgVoN3tCoApuZK
 H38g==
X-Gm-Message-State: AC+VfDxJE2gwMDSqMtDyipEhRKE7ctFjq0bzRmXtnCEfQtYX4b2o/Xo1
 97D45pF2oIhdFCsJbsK0Qtt8r9cTFRuQNqSZanM=
X-Google-Smtp-Source: ACHHUZ7q7ZrToFQcgUdxOboqY//AFCo/ArYjM/bRkwhzR9+UEGWY9MuZg//WAwG5bLieCLdqz+b2qw==
X-Received: by 2002:a05:6a20:4415:b0:f3:2885:d3b7 with SMTP id
 ce21-20020a056a20441500b000f32885d3b7mr5047327pzb.60.1683357829962; 
 Sat, 06 May 2023 00:23:49 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a655943000000b00528b78ddbcesm2524751pgu.70.2023.05.06.00.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:23:49 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2] MAINTAINERS: Update Akihiko Odaki's email address
Date: Sat,  6 May 2023 16:23:33 +0900
Message-Id: <20230506072333.32510-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Akihiko Odaki <akihiko.odaki@gmail.com>

I am now employed by Daynix. Although my role as a reviewer of
macOS-related change is not very relevant to the employment, I decided
to use the company email address to avoid confusions from different
addresses.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
V1 -> V2: This patch got missed so I rebased it and am resubmitting.

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55102f4761..2b89e5dd00 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2566,7 +2566,7 @@ Core Audio framework backend
 M: Gerd Hoffmann <kraxel@redhat.com>
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Christian Schoenebeck <qemu_oss@crudebyte.com>
-R: Akihiko Odaki <akihiko.odaki@gmail.com>
+R: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Odd Fixes
 F: audio/coreaudio.c
 
@@ -2850,7 +2850,7 @@ F: docs/devel/ui.rst
 Cocoa graphics
 M: Peter Maydell <peter.maydell@linaro.org>
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
-R: Akihiko Odaki <akihiko.odaki@gmail.com>
+R: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Odd Fixes
 F: ui/cocoa.m
 
-- 
2.40.1


