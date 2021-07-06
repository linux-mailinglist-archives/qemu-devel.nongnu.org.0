Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDE43BC5CF
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:54:13 +0200 (CEST)
Received: from localhost ([::1]:60896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0d64-00066W-EW
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0cjh-0003uM-F7
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:31:05 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:38479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0cjZ-0006aA-QK
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:31:05 -0400
Received: by mail-ej1-x62d.google.com with SMTP id gb6so15381234ejc.5
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 21:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xnkkDUpzTO0JIXtxBRx+M5l5ZPEf1x/7YAm1wa0JBe4=;
 b=gtqwGflgO1QqjNRPw6ZxyPzJsVSJ0xW7xeeX2W3NWubIGAEdGsgcDiOaF0un1GvKY2
 DO2PTqHpT7lvVYzclvewR90VrgT9d+B7fKxQ13ndtlkC4D09JSKB3Mm7pQ1VFYPFMv6q
 ezKq8TY6+613L3jlGC/ABddXwXfMLhCcC6oz0PegrMR/DXw8hWgiUqmGXbARKAj5D9i8
 Xpl1PEJfWtHEuOJv7TegYt59L3r352A5gfIcqlesDN2BDu0BXs2JhFnFFLNX+yBtiNfj
 pJwtRyv+qp1yUA3uDeMpU3Qw/vTNMxy0EmMMxe3zg2aJ5ut2CTGv49KuxbUrgSxMZkFj
 urmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xnkkDUpzTO0JIXtxBRx+M5l5ZPEf1x/7YAm1wa0JBe4=;
 b=pwnSvEF4cAq00Jfo6KVsc9kscmMBe+muSStMa1gMh2h9Ojr4LvvtMre2tmw76QKuFO
 R2AYdV1LK2W221OFIhmVfWAR/KiK+sHtlUtXdshKK3ajp8DzjRQZk5psvZ0rH1dl+zNd
 2lbKORX9uSDTTeZMcuD7UIfpq4LDnkhUrURTcFpOaBHex9XpgLAjR0fi5L64h8NlUU+y
 BbXLwOjngCwF09STj4E4/4FdQMnk1t30YZx2uaoDCMWsFCln0aBaPPzv38C9AfgsbI/f
 G+ydhNncElUO8h//JonX8h81LGdqA3ew69c1d5MtF5ctP7WU07Gi2qVwcVWOq7azG/XX
 INSg==
X-Gm-Message-State: AOAM532y4TBhGgSQRPuFogJQlTumA+AW/60YflE4julB1y4oGfAFhpBq
 I7dwyJ6H82x0+oBupY2awGMGL2WtHmE=
X-Google-Smtp-Source: ABdhPJwjVbWOsE2+TquEDdoyq1DIR4xRzITR5yV5g6rtRkfUU6YYZaatqZ8svJPFo3q5hWji3piCXw==
X-Received: by 2002:a17:906:d8cf:: with SMTP id
 re15mr16568041ejb.410.1625545855226; 
 Mon, 05 Jul 2021 21:30:55 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id x16sm2529992ejj.74.2021.07.05.21.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 21:30:54 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] roms/u-boot: Bump ppce500 u-boot to v2021.07 to add eTSEC
 support
Date: Tue,  6 Jul 2021 12:31:23 +0800
Message-Id: <20210706043124.1871866-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the QEMU shipped u-boot.e500 image built from U-Boot mainline
v2021.07 release, which added eTSEC support to the QEMU ppce500 target,
via the following U-Boot series:

  http://patchwork.ozlabs.org/project/uboot/list/?series=233875&state=*

The cross-compilation toolchain used to build the U-Boot image is:
https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/10.1.0/x86_64-gcc-10.1.0-nolibc-powerpc-linux.tar.xz

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

Please pull the full contents (the u-boot.e500 binary) from
https://github.com/lbmeng/qemu, branch qemu-ppc.

 pc-bios/u-boot.e500 | Bin 406920 -> 421720 bytes
 roms/u-boot         |   2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/u-boot.e500 b/pc-bios/u-boot.e500
index d2e29f81d6..8e635c8a5c 100644
Binary files a/pc-bios/u-boot.e500 and b/pc-bios/u-boot.e500 differ
diff --git a/roms/u-boot b/roms/u-boot
index b46dd116ce..840658b093 160000
--- a/roms/u-boot
+++ b/roms/u-boot
@@ -1 +1 @@
-Subproject commit b46dd116ce03e235f2a7d4843c6278e1da44b5e1
+Subproject commit 840658b093976390e9537724f802281c9c8439f5
-- 
2.25.1


