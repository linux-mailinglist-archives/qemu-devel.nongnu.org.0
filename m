Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA7346AD19
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 23:48:18 +0100 (CET)
Received: from localhost ([::1]:38334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muMmP-0003Op-6g
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 17:48:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muMjo-0000c5-Or
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 17:45:36 -0500
Received: from [2a00:1450:4864:20::42a] (port=33296
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muMjm-00076B-Sq
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 17:45:36 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d24so25642255wra.0
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 14:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iUXc46blWnienzWp+4ws5HULQnB4RM6tJHZ6Y3VAhBo=;
 b=UzJZIgZDMBnoh9PeX7gCS9Ps1IQ5REKlf8B6dKNSKKzi3d3KQQkCTAzoTBhXi3Drfq
 0UBZA21PXz76p6zxegWmHVhEeM2YKJZHeDTQUImkVOiTU4VbKpe1v/arTuf6t8IkJr+o
 AhJgvW6CCWwuvUY1ESz+JaF7xGixoN9eDzJ7JN1HS7dTYYDw6UzLDdyDP/td1XfI2FD8
 cuIielwI39YsexwjOi0qrEkPEJPhbim8MNObqpoS8z4p1SYKRkwxgfs1WIQK75/a0CyP
 5Oz5tAC7T8RcToot5pqmD9Z66UkuYfJEHi0Ub6dzOUo7bF3PQsTcUiQYrdWL7PQZw0EH
 ig8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=iUXc46blWnienzWp+4ws5HULQnB4RM6tJHZ6Y3VAhBo=;
 b=eZTJicz14DDCOBFYWfVYRIqxKvnzve62pPtBnUTJexSplu9cb6uD9Q9diphY/9L0aA
 TXkedy1el2OuX8RNsVlQAoHFA6Q9yM73sTEvPU4Mvt7dHzEG5Q6ohGlmtaHr+gbu+8Tv
 +JDxYFnJdEdnz2hS+E7MmUdOZnKHedZBAEzyIJ3+JWt6xKIOZ4z9smvqVDjXSJlX3DI2
 9pGWpKUnSrvWyBALYAq0HU5BYj4LElVosZ8bNXa/OrU6alQn+FfpXeex8BWSEjhJz8T2
 HHEF4Hf6wU/EnnofEI0VWJoaVHFe0bP03etpcShBmqB498bJqWOxv8/JjN5oW+aF/16r
 67yw==
X-Gm-Message-State: AOAM533vL8Rd1gMoG8ljNCPZBW4TBjMdArRE5MrE4J5BvWL9KiHjU97e
 xLyfow7dR7JAJbQmiYZzoTBLmXW18OY=
X-Google-Smtp-Source: ABdhPJwgU5vUcYbwlhJwVBJzBHE7KAHpKr9AjrWT7JILhx6cekC0tp8NZGAms7Du/LPCPg+1K9tWJg==
X-Received: by 2002:a05:6000:1010:: with SMTP id
 a16mr47143823wrx.155.1638830731526; 
 Mon, 06 Dec 2021 14:45:31 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id g19sm691644wmg.12.2021.12.06.14.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 14:45:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] hw/display: QOM'ify vga_mmio_init() as TYPE_VGA_MMIO
Date: Mon,  6 Dec 2021 23:45:24 +0100
Message-Id: <20211206224528.563588-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the open-coded vga_mmio_init() to a sysbus device.=0D
=0D
Since v1:=0D
- Addressed Zolton and Thomas comments, added their R-b tags=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  hw/display: Rename VGA_ISA_MM -> VGA_MMIO=0D
  hw/display/vga-mmio: Inline vga_mm_init()=0D
  hw/display/vga-mmio: QOM'ify vga_mmio_init() as TYPE_VGA_MMIO=0D
  hw/mips/jazz: Inline vga_mmio_init() and remove it=0D
=0D
 configs/devices/mips-softmmu/common.mak |   2 +-=0D
 include/hw/display/vga.h                |   6 +-=0D
 hw/display/vga-isa-mm.c                 | 114 -------------------=0D
 hw/display/vga-mmio.c                   | 139 ++++++++++++++++++++++++=0D
 hw/mips/jazz.c                          |   9 +-=0D
 hw/display/Kconfig                      |   2 +-=0D
 hw/display/meson.build                  |   2 +-=0D
 hw/mips/Kconfig                         |   2 +-=0D
 8 files changed, 152 insertions(+), 124 deletions(-)=0D
 delete mode 100644 hw/display/vga-isa-mm.c=0D
 create mode 100644 hw/display/vga-mmio.c=0D
=0D
-- =0D
2.33.1=0D
=0D

