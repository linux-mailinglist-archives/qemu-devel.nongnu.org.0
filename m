Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F55A30A692
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:31:47 +0100 (CET)
Received: from localhost ([::1]:56658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6XQo-0007tY-6r
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:31:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6XOJ-0006G9-Jy
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:29:12 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6XOI-0008Bp-04
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:29:11 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d16so16131991wro.11
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 03:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TX4T29tQMNqmDsICQt4DTx558hzr8lARDzNE3099YzQ=;
 b=cmfFtwCA+tgOSGKlnimSvXFLT15H8AxoX9KZP875N9P3SFSZc5jw8QxAHtF0UpmvUp
 i8mAwIklyL85PQE2+TqNbKMxp9S7e/K724ACw4np3/cgi/SLI/BsS1zMw9WR5WjX+/Ok
 RpgyUVbzxhIWeOdfC7lBP+BW38aXonPfyMCw2MLBDvP02Ef6Ha/PE/wKb0Wj9USH976u
 3hO+qiXXjTmtrkTcN6AfzSrqUWoX0uIQP9VpV+e4TmKLu4b6kC8BTgKzr6IVeGdaDKvH
 8L9LqVl3FU/ilIjd41mGqsykj/EcDtipVF4VsJ5uh0sHjamWoKv+CZU+tRMQfUBmuosN
 Fb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=TX4T29tQMNqmDsICQt4DTx558hzr8lARDzNE3099YzQ=;
 b=HCiEofrRLlWM+ap5W5OcFJ0eCWSXORSZxkgfAldlZsTraEph1RWkM/BDwBSpBuTUnT
 lZxr5yYRXXj1cOVVHFlL1QrTNZ1nu4/HKwrvcm8fTEmF738cJN8i+i+0VcZK+w6x16n6
 eTjddWqOb6O/RklkCMex0ldth0wzM/FqgvwZPUOBGjeSHt7feotqsg0YCTkOjg/5Q+qz
 o9MPIwHl5lGsskeXFov3Nd2FLSd+JMSL1KVKwDjWcc9MdssS6yF6/z39Wu5ZdfE/Y6PO
 FEHc/gLTosNrae94k7Rev4GzPUdM/aXEkVR2jVGj6k0bj2SLXFfLoqRbVEMD7j3zvQ1P
 ZIpA==
X-Gm-Message-State: AOAM530bWAR/q/zH/D1f081NK++swSRmibZjdX3zok3hiDy1BirnN8i8
 A4JEblvszfpHd/ESAhEu03c=
X-Google-Smtp-Source: ABdhPJw0nJTtf9Bc1689UuS28OIRlRbCYYGpd67R1WBnjeVFdvngEGU5yH3pxA6EJNWEunMJWx8L4w==
X-Received: by 2002:adf:f452:: with SMTP id f18mr17213716wrp.11.1612178948626; 
 Mon, 01 Feb 2021 03:29:08 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id x81sm21819860wmg.40.2021.02.01.03.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:29:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] hw/xen: Introduce XEN_FV/XEN_PV Kconfig
Date: Mon,  1 Feb 2021 12:28:58 +0100
Message-Id: <20210201112905.545144-1-f4bug@amsat.org>
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
The first patches are probably ready now.=0D
=0D
Since v2:=0D
- Addressed some of Paolo's comments=0D
- More fixes=0D
- XEN_PV still not buildable alone -> postponed=0D
=0D
v2: Considered Paolo's comments from v1=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  meson: Do not build Xen x86_64-softmmu on Aarch64=0D
  hw/xen: Relax dependency on FSDEV_9P=0D
  accel/xen: Incorporate xen-mapcache.c=0D
  hw/i386/xen: Introduce XEN_FV Kconfig=0D
  hw/xen: Make xen_shutdown_fatal_error() available out of X86 HVM=0D
  hw/xen: Make qmp_xen_set_global_dirty_log() available out of X86 HVM=0D
  NOTFORMERGE hw/xen/Kconfig: Introduce XEN_PV config=0D
=0D
 meson.build                           |  8 ++++++--=0D
 accel/xen/trace.h                     |  1 +=0D
 {hw/i386 =3D> accel}/xen/xen-mapcache.c |  0=0D
 hw/i386/xen/xen-hvm.c                 | 24 ------------------------=0D
 hw/xen/xen-legacy-backend.c           |  3 ++-=0D
 hw/xen/xen-migration.c                | 22 ++++++++++++++++++++++=0D
 hw/xen/xen-utils.c                    | 25 +++++++++++++++++++++++++=0D
 accel/Kconfig                         |  2 +-=0D
 accel/xen/meson.build                 |  5 ++++-=0D
 accel/xen/trace-events                | 10 ++++++++++=0D
 hw/Kconfig                            |  1 +=0D
 hw/i386/Kconfig                       |  2 ++=0D
 hw/i386/xen/Kconfig                   |  5 +++++=0D
 hw/i386/xen/meson.build               |  3 +--=0D
 hw/i386/xen/trace-events              |  6 ------=0D
 hw/xen/Kconfig                        |  7 +++++++=0D
 hw/xen/meson.build                    |  4 +++-=0D
 17 files changed, 90 insertions(+), 38 deletions(-)=0D
 create mode 100644 accel/xen/trace.h=0D
 rename {hw/i386 =3D> accel}/xen/xen-mapcache.c (100%)=0D
 create mode 100644 hw/xen/xen-migration.c=0D
 create mode 100644 hw/xen/xen-utils.c=0D
 create mode 100644 accel/xen/trace-events=0D
 create mode 100644 hw/i386/xen/Kconfig=0D
 create mode 100644 hw/xen/Kconfig=0D
=0D
-- =0D
2.26.2=0D
=0D

