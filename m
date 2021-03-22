Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83EE343FA4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:27:04 +0100 (CET)
Received: from localhost ([::1]:44434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIi7-0007dk-QZ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOIfg-0006IT-Lz
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:24:32 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOIff-00058r-1t
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:24:32 -0400
Received: by mail-wm1-x32a.google.com with SMTP id p19so9264965wmq.1
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 04:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ucb/dYvEaXqIZLvuYBePGYwJnrlkCR8qEzyYYafHh4g=;
 b=UvBahEjLPZEia3OE/3CQxpJ6fyt9XCITZ4XOZEZwY+GwG7F29w3k5i1UG3z5L1n6Zq
 anpGy3hzGhcUI0eDuXNIfTL8idYxz+r8MXQ5AlCrTJYLM/6mSeFpye19mQUdbIcqAE8S
 jFATm/ij0x27o3kDCMBw4AqKub+BSGFqQgY42y0KA+XtGP02oFzhTi8uNtrgfYurmXv4
 tYrUdq6T+E1tFmBZgycGHF+Gqypxc6yZqJ0e59jj9SP6yzE/j8QDnQjEyuROgcBZGkLC
 hCF50dF9/UQ3aR0NwdkGX3TKZmX6zfdOnnydvFV2nZGk7jXQyh3z0nfOFEetxTYh+b72
 5LQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ucb/dYvEaXqIZLvuYBePGYwJnrlkCR8qEzyYYafHh4g=;
 b=sn+PJ2PbMZ5a/+JHJr8G9lrRcHWwYJGLj3h5dHhu/motUoNHRPPuFUW4BEctwRXIUA
 eXbZFd/pJd+V5LyfPTMlswuvHh9ETm2fttlzPhJAB/T7B+jdd0NlVvxUFWwt8HQYF2EC
 eSSrcufSM58TscpXvf3HA3+bd6b9dWQXMpL6v0Ta5VhIghy08aiwMBVf0kjxKxqbXGcO
 A6onrYVrS7fDSwfKccp8Y+ltncZyFRF4saRNOVtC9elyTXcODdHYF/ADNK2nYW/l1ps4
 etYGuKyutnNugOXAdPN2ucxevRGhCmEU30+CJtD7PKyIVed5xJrz1MMvNdXv5vYz650I
 sg7A==
X-Gm-Message-State: AOAM533TB5MhJsXa38MZtQOCj0Yk70Hjxl2P0zl/FaXy5mVFCnM6GvvQ
 zGJx9gFI4us93q+QEgBvHvizRTygJqezVg==
X-Google-Smtp-Source: ABdhPJzUbFVNveXj/u8Amfilq/HkVZBjd9yBvviPg7FWD23vRJSY8OxUzNfzk3/PzZPex/dGyAC4tQ==
X-Received: by 2002:a7b:c242:: with SMTP id b2mr16301782wmj.119.1616412269279; 
 Mon, 22 Mar 2021 04:24:29 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o15sm13548396wra.93.2021.03.22.04.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 04:24:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] exec: Build page-vary-common.c with -fno-lto
Date: Mon, 22 Mar 2021 12:24:23 +0100
Message-Id: <20210322112427.4045204-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
While reviewing Richard's original patch, I split it in 3=0D
to make it more digestible to my review taste. I then simply=0D
filled the patch descriptions. Feel free to keep Richard's v1=0D
if this isn't worth it.=0D
=0D
What is still missing is adding the new files to a MAINTAINERS=0D
section.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Supersedes: <20210321211534.2101231-1-richard.henderson@linaro.org>=0D
=0D
Richard Henderson (3):=0D
  exec: Rename exec-vary.c as page-vary.c=0D
  exec: Extract 'page-vary.h' header=0D
  exec: Build page-vary-common.c with -fno-lto=0D
=0D
 configure                |  19 -------=0D
 meson.build              |  18 ++++++-=0D
 include/exec/cpu-all.h   |  15 ++----=0D
 include/exec/page-vary.h |  34 ++++++++++++=0D
 exec-vary.c              | 108 ---------------------------------------=0D
 page-vary-common.c       |  54 ++++++++++++++++++++=0D
 page-vary.c              |  41 +++++++++++++++=0D
 7 files changed, 150 insertions(+), 139 deletions(-)=0D
 create mode 100644 include/exec/page-vary.h=0D
 delete mode 100644 exec-vary.c=0D
 create mode 100644 page-vary-common.c=0D
 create mode 100644 page-vary.c=0D
=0D
-- =0D
2.26.2=0D
=0D

