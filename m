Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742F81A60B1
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Apr 2020 23:31:04 +0200 (CEST)
Received: from localhost ([::1]:37240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jNkBy-00036U-40
	for lists+qemu-devel@lfdr.de; Sun, 12 Apr 2020 17:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42913)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNkAn-0001lG-48
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 17:29:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNkAm-0006h8-3Z
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 17:29:48 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38992)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNkAl-0006gK-UM; Sun, 12 Apr 2020 17:29:48 -0400
Received: by mail-wr1-x441.google.com with SMTP id p10so8423293wrt.6;
 Sun, 12 Apr 2020 14:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T5mHgLfEaaiCDMXdWGGj6PS3hq3rh1VE3urG/NfjmHY=;
 b=ry7qXePkzycErex1S+qfV6gEnHMN9U/xYq6kaN5qXnjPk/2XCl1yEq98xxc3XA4X2k
 aZ2dovBUI565DNkBQ0QqzyxdOySPJp/DzpN506AfQ8owkplDr/KUqGRH/jNnEaLh9t7E
 WhhjMebgeX3pAjmd6h81kDT5KM1uRHsSBAvtj+Huu3cuoPDoFHdKfyjHWPxlJSHdUunj
 apGQbCMpcQb2ZR9MHvq89W8wj5h9FRJR3immaV/LaL+YbZpe+w6RsW+3ISMmBgxr2n+L
 YqEQW/BHXDVTkM9zM86hw3t5u80+5vxuz69Gi4D5D8Z7H2a+0u0tRkZ4khbQgKm/Ceyp
 PHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=T5mHgLfEaaiCDMXdWGGj6PS3hq3rh1VE3urG/NfjmHY=;
 b=Wd+gDMQmL8SHdpBErx+75sOF45qMGDsuF1AxW8oBSgqGwX5+tDwiO07oQo4t6BR6zv
 kC76KQmBeCQlCNVgKcc3cy5Ix4jqVkH2vE+J6uraxD++KM5F2TYYGEDBqxPuhhwQICYF
 leI8srNEBSl4EsTd1rgVVYS91WjtgmX0hKvCKBcFEeFy25bsRtZJxtqFdhFI0Mrd6HHe
 bYqLqkiFyod2RIfH0qdPN6mcZEUYemX0VU2plxjiG2EIY0PG8NMaWlhEuLsF2/2R54SK
 2Bf56VWDBasbIbQLCzZa3l7+gZh3xIn8GbNpHh27HFVSXTNwZGCbGmzkSwiuv2zHkq31
 mTOQ==
X-Gm-Message-State: AGi0PuYvfHNaeI0pIC+n5wIO/n9bFpldUHbATo40pBtC3SUGi1heUqIP
 uRCqZ2jYPvCX9DaeBcqT1PbBK2XDZe8=
X-Google-Smtp-Source: APiQypIl/akK1MjWFM2FmD18Z7pu4x1841MT4AUscJwM3omjpouy5sCrx1nBiGOJH+FvEjiXI9w//A==
X-Received: by 2002:adf:e288:: with SMTP id v8mr15090742wri.141.1586726986002; 
 Sun, 12 Apr 2020 14:29:46 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id r3sm12797798wrm.35.2020.04.12.14.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 14:29:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw: Use qdev gpio rather than qemu_allocate_irqs()
Date: Sun, 12 Apr 2020 23:29:40 +0200
Message-Id: <20200412212943.4117-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Stafford Horne <shorne@gmail.com>, John Snow <jsnow@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use a coccinelle script to convert few qemu_allocate_irqs()
calls to the qdev gpio API.

One memory leak removed in hw/openrisc/pic_cpu.c

Philippe Mathieu-Daudé (3):
  hw/ide/ahci: Use qdev gpio rather than qemu_allocate_irqs()
  hw/mips/mips_int: Use qdev gpio rather than qemu_allocate_irqs()
  hw/openrisc/pic_cpu: Use qdev gpio rather than qemu_allocate_irqs()

 hw/ide/ahci.c         | 6 ++----
 hw/mips/mips_int.c    | 6 ++----
 hw/openrisc/pic_cpu.c | 5 ++---
 3 files changed, 6 insertions(+), 11 deletions(-)

-- 
2.21.1


