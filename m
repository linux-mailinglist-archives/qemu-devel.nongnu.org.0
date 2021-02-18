Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D8831EB22
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 15:53:38 +0100 (CET)
Received: from localhost ([::1]:41538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCkgT-00082p-F6
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 09:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCkeG-0006m7-14
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:51:20 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCkeD-0005Uj-Gm
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:51:19 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r21so3267923wrr.9
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 06:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QTodkFf88sKDMlyPTmb2BjxRp4Hqj4PPL/AmLWO0MfE=;
 b=U6bDR8r4YemuD4prxd6emKwMdU8ZKREh1OE0N+dXw2mp9Ty97RY0zWa8sToRrl3BEJ
 GwoLKRuguNI0sqlnnWXLKO7teG6FooOsTWI5IghZNuLCguHB/3Sk/dEYfOW/WFVYGb5i
 aLlVaWrZH7X15yZTYNgf9jwUiHzoKZ6+d4zwRddCz+cz9jFzxsYu5viD6584W3Enfw97
 qPEvWHFjqmLh6Ob62XfeDI/eXlNRql6/Pf3TPMbo4PpF1gFnbL7nlO4eMfHK/LW1td22
 pINPkt0BbmeoRyGKGYjK2nvy0u3t4G0z00R/RRNEbgypNhTArl+JIJXa2JSvlDFrLANr
 gfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QTodkFf88sKDMlyPTmb2BjxRp4Hqj4PPL/AmLWO0MfE=;
 b=YdUGgpHuWcRU7LhJrOT+TfqUcphs7zNF9//fj6dgnYZuLx2TSf24HeBYV4rQ7KyKnz
 uXlSwTNRYwg/JzLHJFfg0HhSRdSzaVsLezH6ykpUPy72+Ybd5DMwsvSxqDrqGkvLa6K7
 9aZABeNzGvuSY+e9Nhp26UZqfauIPPrhzSmn8zm6f8Rwz4/UlPyNRvuR6w7hYIwSN/jX
 YT+uFPwC7bLb6VNbh+I93u6olmhbP1rsKweQq/7f2XicqfFtZiY1itqSvmyFFz1Chfe2
 Pu60nEvEWKctdvw7TBAtVMxf6MfmXkPjU/hNi8SeYKajZfuk2BFJk0pIQ4f3XeQja5xc
 6U9g==
X-Gm-Message-State: AOAM530JP0ClcqUVo9Rm8hZvfsM+5l3FKAqL5D3DbhaTN3I8OKLfb3PQ
 dWCBveTgg7xYzUe5h9N1nQMfDos/etk=
X-Google-Smtp-Source: ABdhPJwipLmY3yxuqtdiTKcIUz28UX181VD/JPhjxkFV5Yz/QtIiiej6ASXcovcuoLkkfwRYcTNKDA==
X-Received: by 2002:adf:fad2:: with SMTP id a18mr4687139wrs.147.1613659873992; 
 Thu, 18 Feb 2021 06:51:13 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x18sm8905181wrs.16.2021.02.18.06.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 06:51:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] target/sh4: Pass MMUAccessType to
 get_physical_address()
Date: Thu, 18 Feb 2021 15:51:06 +0100
Message-Id: <20210218145111.1591763-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joe Komlodi <komlodi@xilinx.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Taking notes while reviewing commit 671a0a1265a=0D
("use MMUAccessType instead of int in mmu_translate").=0D
=0D
Since v1:=0D
- Do not provide unuseful MMU index argument (Richard)=0D
=0D
Missing review: patch 3 (Remove unused 'int access_type' argument)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  target/sh4: Fix code style for checkpatch.pl=0D
  target/sh4: Replace magic value by MMUAccessType definitions=0D
  target/sh4: Remove unused 'int access_type' argument=0D
  target/sh4: Let get_physical_address() use MMUAccessType access_type=0D
  target/sh4: Remove unused definitions=0D
=0D
 target/sh4/cpu.h    |  11 -----=0D
 target/sh4/helper.c | 101 ++++++++++++++++++++++----------------------=0D
 2 files changed, 50 insertions(+), 62 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

