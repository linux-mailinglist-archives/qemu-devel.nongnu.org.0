Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1175990B6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 00:49:06 +0200 (CEST)
Received: from localhost ([::1]:55078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOoK0-0005RN-QW
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 18:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oOoGO-0002Hn-Ju; Thu, 18 Aug 2022 18:45:20 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:46698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oOoGN-0000Ei-2L; Thu, 18 Aug 2022 18:45:20 -0400
Received: by mail-oi1-x233.google.com with SMTP id o184so3032636oif.13;
 Thu, 18 Aug 2022 15:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=zzlCeCU/zowkGrfibYxcToqI0D34SaRqFRvig5/qF7Y=;
 b=WtieHsdRLekQhipkWINnj1htaHvi75c1N3D+CbuH+uVjMlqlHGrBcZBEVb2j/vD3r0
 xCngIAhRreI1CMElJMf5LuOv/lGUDeKCZWxSDh7GKvSelJl9G5ZhVPwIPs3CbyLh94Ah
 ki/ZUH8xqv6VDCjpP/TCODGY4Hh4k1HNPnYXib0B5COC2tuvkdU2NNA9IksTSOKEIm4+
 vFTmluyaXToH4kxtp5UzDEvR+nvxi3DL30a9MLgHCLEoK5dNjATbvwATmiMTi/W+Bjye
 1ytEowuwmSuLlCf4AZ4P0gcvVcfVDpyNPIQJWxfu7z5BR/zJKNoeLg16+tx0gJ5ZB4gi
 ozRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=zzlCeCU/zowkGrfibYxcToqI0D34SaRqFRvig5/qF7Y=;
 b=Yljz8XqfAR0M7iq2h84d0hJ/w+ybcPRCgb/DO34yp/FOAC4RsPjZEojz+0Mcpz4PgS
 kIdqmbONnymk6+HdCPrJK96iZN4OU2su0H1OPWEnVCZxddPYwleiW4qtVLXwbEp0kOCm
 D7Q7knpDJ+7cXUjCuuxBU5g2TxPiZHGyvyhsE7BgWxJygvuAm4xipyhAh45pK2X+KmPM
 HogM1z6cldgm+h6LgYpOIWhFLU0PhjN8sQkbPeWnyGDX1TWFK2vcas2ddcuG4DhDW7Hz
 6bF74IW5sIvBehL9t2RzD+sNZja/XwQT8P5goKfxeqrdziTJc8eeKPBqFWWOx4d9ly4u
 h9ew==
X-Gm-Message-State: ACgBeo14kcbsvtXC5lqZx1qf9+Qvqg/9UvaX8wrI1hWvd28CXGc0dYmD
 8kkppshQOQKLFfirQcj+5fxoQTe80zHS9w==
X-Google-Smtp-Source: AA6agR4viHDSzSUGphUwq6QK+Grj6wCO/lHGjUhzN4RPlrK02ozKjj78DhJNyHau92ZTpK2rxqS+AQ==
X-Received: by 2002:a54:4496:0:b0:343:2d07:fe01 with SMTP id
 v22-20020a544496000000b003432d07fe01mr4378657oiv.226.1660862717098; 
 Thu, 18 Aug 2022 15:45:17 -0700 (PDT)
Received: from balboa.ibmuc.com ([189.110.115.28])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a9d460e000000b006370c0e5be0sm739134ote.48.2022.08.18.15.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 15:45:16 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 0/2] ppc/pnv: fix root port QOM parenting
Date: Thu, 18 Aug 2022 19:45:09 -0300
Message-Id: <20220818224511.373255-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
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

Hi,

These are a couple of patches that got separated from the main series it
belonged to [1] that got already queued for 7.2. Patch 1 is new, patch
2 is a new version of patch 11 of [1].

The patches are based on ppc-7.2 [2].

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01847.html
[2] https://gitlab.com/danielhb/qemu/-/tree/ppc-7.2


Daniel Henrique Barboza (2):
  ppc/pnv: consolidate pnv_parent_*_fixup() helpers
  ppc/pnv: fix QOM parenting of user creatable root ports

 hw/pci-host/pnv_phb.c | 81 +++++++++++++++++++++++++------------------
 1 file changed, 47 insertions(+), 34 deletions(-)

-- 
2.37.2


