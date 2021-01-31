Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBE8309CA5
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 15:21:00 +0100 (CET)
Received: from localhost ([::1]:35326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Db1-0002Px-Ru
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 09:20:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6DYO-0000yM-Ej
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 09:18:19 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6DYM-0007bR-Q5
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 09:18:16 -0500
Received: by mail-wr1-x429.google.com with SMTP id 6so13741200wri.3
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 06:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GIWi9Z1K5+Z4chfPUGDZEKduFG1scZeAuKlobFer7yw=;
 b=B3upva1lQImpCXKT2vTlYyyQV8k8gXmcJgk/jifDewGX/O23kvIvcIOPz7kKVJpR7x
 920BievNMu18AleB7g5GsHYC0g5DBU4l5S2ZDO2XGLKtNJ9FjP5t20fxa8amDbIKAD+y
 rWqUvmQ7huoVpAJashDPVCjB0LF+Uvwx6wZ0orEInCJ2PyIjQQbf4kjfq+5gZtEAXkL5
 iXlwIJZ+/DMrY0N9ZXeGqKOD9AYd9gv/eOCHfRwSnj/6wWE/FpvSS5wNnzbIMV4cS7aZ
 c0CnB3Tk7I07XXMYMlsU+HFTuNEAh6HlYVV5CTer4bxYg4+9VTJMk4MRJOylgmuToHdI
 mneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GIWi9Z1K5+Z4chfPUGDZEKduFG1scZeAuKlobFer7yw=;
 b=ExfSSDeU5Dptj44Al7cOItTdLoJgiRj7awbr9X8E2lTz8A8D50l+NwV53KDQqGVPLB
 ono+nbESxr6aZvqiRnf6V2r5Jy+SZPeGRd1dyRVi+HKSm8KIZBcP6apnGdvrr3GGn6bk
 z+4M9F1oAGmf2k/1dvfrhm7u5zsTQzj/5MnyNrSJftJBje8okOXCxv025qNAokPIdc3y
 jyOojkYPNBpyxunpL7ATriVLJFa91y+siI3seVKTYE90lS/y0jvxthtkCCoz1yr0maSH
 cd1D9pHfrl5JmB1U3Tin8aVzC3vfs9jrKlmfsK26Nbz2oTJPKFJnbg/hVzHm3nHNkf2m
 qOKQ==
X-Gm-Message-State: AOAM533OIMqidZsWcPqe6tUuAF2QHWirOp4070sM3/7lPnlYwIhT2gNp
 oRKatlWgmIJESGzjna59IE4=
X-Google-Smtp-Source: ABdhPJwFOGm4rX1EnPajx3ScVugKdJeHifUetp3ME+GKNn1wQu8EPRfmaBqHqyu/OY0jZxvGzPiGYQ==
X-Received: by 2002:adf:f747:: with SMTP id z7mr13664612wrp.384.1612102693419; 
 Sun, 31 Jan 2021 06:18:13 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id r1sm22987356wrl.95.2021.01.31.06.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 06:18:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] hw/xen: Introduce XEN_FV/XEN_PV Kconfig
Date: Sun, 31 Jan 2021 15:18:06 +0100
Message-Id: <20210131141810.293186-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sort the Xen buildsys glue a bit.=0D
=0D
v2: Considered Paolo's comments from v1=0D
=0D
Supersedes: <20210129194415.3925153-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  meson: Do not build Xen x86_64-softmmu on Aarch64=0D
  hw/i386/xen: Introduce XEN_FV Kconfig=0D
  hw/xen/Kconfig: Introduce XEN_PV config=0D
  hw/xen: Have Xen machines select 9pfs=0D
=0D
 meson.build             | 5 +++--=0D
 accel/Kconfig           | 1 -=0D
 hw/Kconfig              | 1 +=0D
 hw/i386/Kconfig         | 2 ++=0D
 hw/i386/xen/Kconfig     | 6 ++++++=0D
 hw/i386/xen/meson.build | 2 +-=0D
 hw/xen/Kconfig          | 8 ++++++++=0D
 7 files changed, 21 insertions(+), 4 deletions(-)=0D
 create mode 100644 hw/i386/xen/Kconfig=0D
 create mode 100644 hw/xen/Kconfig=0D
=0D
-- =0D
2.26.2=0D
=0D

