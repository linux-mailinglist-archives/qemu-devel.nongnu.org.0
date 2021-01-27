Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6331E306734
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 23:44:38 +0100 (CET)
Received: from localhost ([::1]:57236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4tYC-0007UE-U7
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 17:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4tWg-0006Mn-Ev
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 17:43:02 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4tWe-0001di-J2
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 17:43:02 -0500
Received: by mail-wr1-x42e.google.com with SMTP id c12so3557117wrc.7
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 14:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YSAsU9GO06bYuecxzdycAOIbjovY7eUXigr3IuVNAPg=;
 b=blbIxKoUp8QwBD/hcit2AA1LE7bUtRIEzRHB7lVzpHQinazSfLDoFYEk7oWmvUmdJk
 Z90no4zMDLAjXWV48tKB3ftYTOgioqv/G6XWBY+WheOsQI5kwt9DH76OKTADPRdt801N
 llFlbTjTBcuH66nDp0rXVV+HK2wKK5djSNqc9W9UPsR4WrNdnaKp/VcKrVsWyR9FdaH5
 RxQ4iiTSpzU1F8AoQFpiRqBUutLL6TjEf+DtZew1ykjIVPz+4xOtq4ldfd+48uMDSWFe
 SYpkb+uv3XlPq2XnzyIe+OtXMAlFUmGyPw32k+tDQ2Ip28NtjgZ9qtauoxKmsgiUfwFj
 QxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=YSAsU9GO06bYuecxzdycAOIbjovY7eUXigr3IuVNAPg=;
 b=XuOwl6P8Ce09I5BmG8KjF/cwLjQZIf0M2BGRwh3ZQiQa4AzI/fDL4wUNPHdpkB9IMV
 E07ncA/9E6fu1m9ywDZjjKArH9DafPtoAs8rVKp+gkbB3GqAS4zDqFh1dCA70jBhdgnH
 XeD6WMqopWV3cjWbNqb2NuV8GaheoZPpAPCw8xPM0PodzwnmMN86XfIb/4e7EwlV71FJ
 uBWKTJQ57BgQMl0RTrA0P3KWFJN31k+PxdR5b6c4jxf4nXgGBWYOHzRix2JGwgNfQKSH
 7MHbSmXclWD8s3Gw354QWDoaMznkkQVxXn8/4hyGDfMkfSAC0zxIsjwn02/0czKBaP+r
 uU7g==
X-Gm-Message-State: AOAM532UR9DXR4ziPDP029VQqiKDRPHTLkG/7aVtL6FL4Fzy+82sN41r
 OeVnOt+RjPtv/db1CyTbj4wOhFclm8U=
X-Google-Smtp-Source: ABdhPJxaptjfYxnarflMB2Ii+/HiF5+Aidf42jUgQer6HRrfLZiKE7VlsoFJMVPK1O7AEygXM3xA2Q==
X-Received: by 2002:adf:b1da:: with SMTP id r26mr14043509wra.198.1611787378077; 
 Wed, 27 Jan 2021 14:42:58 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r126sm3906177wma.48.2021.01.27.14.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 14:42:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/tricore: Pass MMUAccessType to
 get_physical_address()
Date: Wed, 27 Jan 2021 23:42:52 +0100
Message-Id: <20210127224255.3505711-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>, David Brenken <david.brenken@efs-auto.org>,
 Andreas Konopik <andreas.konopik@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Taking notes while reviewing commit 671a0a1265a=0D
("use MMUAccessType instead of int in mmu_translate").=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  target/tricore: Replace magic value by MMU_DATA_LOAD definition=0D
  target/tricore: Pass MMUAccessType to get_physical_address()=0D
  target/tricore: Remove unused definitions=0D
=0D
 target/tricore/cpu.h    | 12 ------------=0D
 target/tricore/helper.c |  9 ++++-----=0D
 2 files changed, 4 insertions(+), 17 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

