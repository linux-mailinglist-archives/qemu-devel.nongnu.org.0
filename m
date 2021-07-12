Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B18313C5EB3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:02:10 +0200 (CEST)
Received: from localhost ([::1]:39552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xRg-0007pd-NN
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2xMY-0008NB-2i
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:56:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2xMV-00027o-AT
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626101805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W+e0XJ0oEw2bJ8pOHQqkdmyft1aozhnyJZBeyHRH7bw=;
 b=QNiSDjGVk+IJ2elMDQTxjyyh286YHIMusUdeKBoyrIg8en1w2Sft7gXRGPg6NTGjIfP4Z8
 TKTe9sKUcvtgjrUpDAOd3K38a2rWdmG0+9SCg3WqgkMubZUCu9v/SRWhsHchnhk1yB3rZl
 5J3k8oYhsnz7mGWhBcZ27OCd4scxlzE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-Qg-BN3P9OvSFq_3CYlJqaw-1; Mon, 12 Jul 2021 10:56:41 -0400
X-MC-Unique: Qg-BN3P9OvSFq_3CYlJqaw-1
Received: by mail-wm1-f71.google.com with SMTP id
 n5-20020a05600c3b85b02902152e9caa1dso5831693wms.3
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 07:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HFx3rRHShDbvIh3zSIjgKB6WKGglofJu29Qis39+3IQ=;
 b=MYQiWrYNDpwSwznEJwxPeBMRv/To4J7ZnG6Ils4d7KEBu8nrIsFiAJ8hDLlq570689
 TCE1CYUzaEfx142xcotqkWu4VzlLXJZPO2EE+P1ZwTQD/seUPyVR/5i1GWfcjtBuVrbO
 QLE+HNaJpImUWPmVbtfi0RYwH/N/rHPdDKT/kGuRnsR5rUmc6dW8eOBi+j5R/TsQW9uO
 0gEC9BWKJnZ4imlE8Jqqhbu/XvyXyNG8TXP7+vJA85TS95XekXKqAsrHr7XF6fOcQoxr
 +agYIxg88jHAQJiFs8teU/5phcP2jVie3v88vdsAYkwB+/r6HPaZ8wLNAUvPE425uz1c
 lh2w==
X-Gm-Message-State: AOAM531NEyr8uEfh2OzJCXhEIQhzwrp7E112Qf7FkVSCogAF3lVEgXRe
 0qP7IijKONzeX2ZGghQM+PNBbiIJ6nypT2VthP9LSycG2tAd6R5c+TdpzOUy9yJDqDplAM7qAqV
 QlZyaCI3g/qWLKIp7VrPYmxexRrQIWylDjDqO8v9/UYZOjzpYKN43ttghwU7D+wsm
X-Received: by 2002:a1c:6a0d:: with SMTP id f13mr14668643wmc.6.1626101800292; 
 Mon, 12 Jul 2021 07:56:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwlzoevXV0JJtUcyqi3kSOyKshDeKbtDizqVS5SV5rVs8Z8Y0CyUhGazWcQw1rlz8BDNa6qw==
X-Received: by 2002:a1c:6a0d:: with SMTP id f13mr14668624wmc.6.1626101800024; 
 Mon, 12 Jul 2021 07:56:40 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id b20sm13388347wmj.7.2021.07.12.07.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 07:56:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] OVMF patches for 2021-07-12
Date: Mon, 12 Jul 2021 16:56:26 +0200
Message-Id: <20210712145630.2857814-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Dov Murik <dovmurik@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit bd38ae26cea0d1d6a97f930248df149204c210a2=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210710' =
into staging (2021-07-12 11:02:39 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/fw-edk2-20210712=0D
=0D
for you to fetch changes up to d1e79210457323b225c369fa00e97577e0d0da95:=0D
=0D
  MAINTAINERS: remove Laszlo Ersek's entries (2021-07-12 16:55:23 +0200)=0D
=0D
----------------------------------------------------------------=0D
Patches related to EDK2/OVMF=0D
=0D
- MAINTAINERS: remove Laszlo Ersek's entries=0D
- Introduce X86_FW_OVMF Kconfig symbol=0D
- pc_system_ovmf_table_find: Assert that flash was parsed, document=0D
=0D
----------------------------------------------------------------=0D
=0D
Dov Murik (2):=0D
  hw/i386/pc: pc_system_ovmf_table_find: Assert that flash was parsed=0D
  hw/i386/pc: Document pc_system_ovmf_table_find=0D
=0D
Laszlo Ersek (1):=0D
  MAINTAINERS: remove Laszlo Ersek's entries=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  hw/i386: Introduce X86_FW_OVMF Kconfig symbol=0D
=0D
 include/hw/i386/pc.h          |   1 +=0D
 hw/i386/pc_sysfw.c            | 107 ------------------------=0D
 hw/i386/pc_sysfw_ovmf-stubs.c |  26 ++++++=0D
 hw/i386/pc_sysfw_ovmf.c       | 151 ++++++++++++++++++++++++++++++++++=0D
 MAINTAINERS                   |   4 +-=0D
 hw/i386/Kconfig               |   4 +=0D
 hw/i386/meson.build           |   2 +=0D
 7 files changed, 185 insertions(+), 110 deletions(-)=0D
 create mode 100644 hw/i386/pc_sysfw_ovmf-stubs.c=0D
 create mode 100644 hw/i386/pc_sysfw_ovmf.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


