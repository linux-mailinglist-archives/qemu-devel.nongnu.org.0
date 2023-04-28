Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B76F6F198A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 15:31:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psOAU-0007ej-Lf; Fri, 28 Apr 2023 09:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nks.gnu@gmail.com>)
 id 1psO2v-0005gZ-MN; Fri, 28 Apr 2023 09:21:58 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nks.gnu@gmail.com>)
 id 1psO2s-0001KY-UI; Fri, 28 Apr 2023 09:21:57 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4edcdfa8638so10868330e87.2; 
 Fri, 28 Apr 2023 06:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682688112; x=1685280112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:dkim-signature:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iosrL7RM+4s2zf1aJyD4eY/xy8aHDtISoN2vGP0fAmk=;
 b=Gb9PhSYk7PGDMZcW2H1SYERh4kPfNMZYYeTlTdrY2LchF2OPAr3+qRD5PCmDa7OAe/
 DnCy21qz+hARQA+0ml+g/JhAG6T0S2jweW1Aka5GWAON8GRe4pPpYKP44ygWqChAMALa
 5kB60po3SrkSDxRHuxn3aK0NQ006t6SrwXGSHfODFbWWBd5T9aD5IoEXaVuouAV3Yxxk
 npOIfUqXwdqte8XwrNy7eR9JoX51z7w+qDwi0u03fX5v1TatkQwPNmaZKF9FXcEhL4yE
 ojgM906kh94wMrp5Ss1pkQnEm84O8MbZ9NGTqwiQVLsdTE/LJ6Vh9G8eUT3Im+qPq6k2
 Srgg==
X-Gm-Message-State: AC+VfDxCQWDOxO8izwIxYlZjffBsa8E92m9NJ92ynrWuzTxsfnoRuh/b
 gl6bDEzpM0msVIsBE2HGwKBR5/Lx9j+uuw==
X-Google-Smtp-Source: ACHHUZ4WKbdU+iq1jG7JnwcgwiWeDjT4J8VxijQF15g1iK980kHYN3V0LGwLWakmz1LhOdfmOfJ1bA==
X-Received: by 2002:ac2:44ca:0:b0:4eb:3cac:23b8 with SMTP id
 d10-20020ac244ca000000b004eb3cac23b8mr1480715lfm.18.1682688112081; 
 Fri, 28 Apr 2023 06:21:52 -0700 (PDT)
Received: from flawful.org (c-fcf6e255.011-101-6d6c6d3.bbcust.telenor.se.
 [85.226.246.252]) by smtp.gmail.com with ESMTPSA id
 l11-20020ac2554b000000b004f01149c884sm491621lfk.114.2023.04.28.06.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 06:21:51 -0700 (PDT)
Received: by flawful.org (Postfix, from userid 112)
 id 64621D0E; Fri, 28 Apr 2023 15:21:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flawful.org; s=mail;
 t=1682688110; bh=sSRbqvPGZL+FkiJYhqjdZ3E5N4PVeQOriC0g8BU33y4=;
 h=From:To:Cc:Subject:Date:From;
 b=NIq7ea9IaXbIQZmtFGvFTJV73778qz3wdzpgrgkI8ldxKCQIQ/h+zWh+vOr4D0aHN
 NtTSmMoeZldA7Zqk1Gxh+Qc0dRWzeqd4jmFvi/vBgwiug2Ygjxq8poOJNlDcmGweys
 I/ZydzKyjugpwFpy3Rw8winZQKpd6+xKg6YdRxXg=
Received: from x1-carbon.lan (OpenWrt.lan [192.168.1.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by flawful.org (Postfix) with ESMTPSA id A7E92294;
 Fri, 28 Apr 2023 15:21:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flawful.org; s=mail;
 t=1682688099; bh=sSRbqvPGZL+FkiJYhqjdZ3E5N4PVeQOriC0g8BU33y4=;
 h=From:To:Cc:Subject:Date:From;
 b=XMSeOire54f1eQKEEnywItE5Pqb4O77ZWVQqrV8WwkQnUKZq/foeO/dDJmc0t6zza
 dC0t18/c7ipsTQBiA8EpwtNttOlb+hcRIZinri0ZD4SXcmSdXz+Vr+RH9qp4mOI/EF
 kRkyDx3ZpQP9k77oFa/nAJgK8o46Bk/upKCZmupI=
From: Niklas Cassel <nks@flawful.org>
To: John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH 0/9] misc AHCI cleanups
Date: Fri, 28 Apr 2023 15:21:15 +0200
Message-Id: <20230428132124.670840-1-nks@flawful.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=nks.gnu@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 28 Apr 2023 09:29:45 -0400
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

From: Niklas Cassel <niklas.cassel@wdc.com>

Hello John,

Here comes some misc AHCI cleanups.

Most are related to error handling.

Please review.

(I'm also working on a second series which will add support for
READ LOG EXT and READ LOG DMA EXT, but I will send that one out
once it is ready.)


Kind regards,
Niklas


Niklas Cassel (9):
  hw/ide/ahci: remove stray backslash
  hw/ide/core: set ERR_STAT in unsupported command completion
  hw/ide/ahci: write D2H FIS on when processing NCQ command
  hw/ide/ahci: simplify and document PxCI handling
  hw/ide/ahci: PxCI should not get cleared when ERR_STAT is set
  hw/ide/ahci: PxSACT and PxCI is cleared when PxCMD.ST is cleared
  hw/ide/ahci: trigger either error IRQ or regular IRQ, not both
  hw/ide/ahci: fix ahci_write_fis_sdb()
  hw/ide/ahci: fix broken SError handling

 hw/ide/ahci.c | 111 +++++++++++++++++++++++++++++++++++---------------
 hw/ide/core.c |   2 +-
 2 files changed, 80 insertions(+), 33 deletions(-)

-- 
2.40.0


