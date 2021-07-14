Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00A23C925C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 22:44:43 +0200 (CEST)
Received: from localhost ([::1]:49994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3lkI-0008QR-Tk
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 16:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3liq-0006Vb-R1
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 16:43:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3lio-0006O4-4s
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 16:43:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626295389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bMRFKA8nRr9EQGBt/bDh0F7NGfU+wtqPAFh18CPbfz4=;
 b=SndxMBELqDtDSglbmPj5vzHLDzm2pnHArL7kbwzsFI1SIuRQVZoxIGxJBlnAtUIL3SPJyh
 2/g6CAajNVE+hCDoXE33J5mcct5IS9Zq5bNarFrMbQJh2vwMJGmNhXylnChR3E1DApqU7S
 eYmtDfNKv38zuiGGo8e0u9gv9xpTP8w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-S82lcJ4IOZa0M5kCCaQBlw-1; Wed, 14 Jul 2021 16:42:53 -0400
X-MC-Unique: S82lcJ4IOZa0M5kCCaQBlw-1
Received: by mail-wr1-f72.google.com with SMTP id
 p4-20020a5d63840000b0290126f2836a61so2179626wru.6
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 13:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=672XMMl73AtcBS8euF2S4HC9AYruDiPUJdVVL4EpAOU=;
 b=iLImc8/wT5f7dS9g6V8Fwnc/aho1gWmByb7TZSGecqOOjaO5NvCTaLZhWXX7nzA5lS
 FPxT4pZbeuMn3l/l7+k6pm+rHPnKnK1flZAY7K7Ap3TrhO5R/nijGUHSn+ct+z1SUA8p
 OXh0TGH0+1JxxZbGnRUZG/fbWi6/4Ztufe0zMPwVg8MKzujmIxZmLdkDQNbtRCTVw6lY
 Vz6V2ptS/SmYiDXe/88NEbqNRS/6lfA0qbfIRxfrrtQkJ5jiVHZL3NZKN/UFxnK977Q7
 bV9y336YbWr6h1jzK23rC0HZZsQdU7l8WcH1ZrqoZxXKuFLFlCqDqIswBJhYED2+qUcT
 +5Bw==
X-Gm-Message-State: AOAM533ABvSylQnMbLaepWW36hqlJ22gVj7F41pdyWiCZbkHQAZs8g8Q
 lPyBotpMaOL6HjhIia6bMWfL4qTg8Ff/wY7L0lqBq2vqjHUBOEGAbKbsgFezMWtzaYE7+OyVFyJ
 xcsiqtasW0OoVf0t5ZQ+dIfwyRR4+hNUDqcIuAo0CViBp9gKkoWiX97x5Pdh7hn+J
X-Received: by 2002:a05:600c:a04:: with SMTP id z4mr57769wmp.103.1626295371533; 
 Wed, 14 Jul 2021 13:42:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/Ymuf3+IMEVJuxtI8AUoaEP3tKDAJSlDZ+jqSs0Gevzg1OyWew4TS1bAZAebXkgAQ/tIcqA==
X-Received: by 2002:a05:600c:a04:: with SMTP id z4mr57754wmp.103.1626295371305; 
 Wed, 14 Jul 2021 13:42:51 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id k20sm4249529wrd.70.2021.07.14.13.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 13:42:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] OVMF patches for 2021-07-14
Date: Wed, 14 Jul 2021 22:42:37 +0200
Message-Id: <20210714204238.3145092-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit a9649a719a44894b81f38dc1c5c1888ee684acef=
:=0D
=0D
  Merge remote-tracking branch 'remotes/cleber-gitlab/tags/python-next-pull=
-request' into staging (2021-07-14 18:09:09 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/fw-edk2-20210714=0D
=0D
for you to fetch changes up to 2669350db2c3df33f4e68c518e9f31f91502a83d:=0D
=0D
  MAINTAINERS: remove Laszlo Ersek's entries (2021-07-14 22:28:59 +0200)=0D
=0D
----------------------------------------------------------------=0D
Patches related to EDK2/OVMF=0D
=0D
- MAINTAINERS: remove Laszlo Ersek's entries=0D
- Introduce X86_FW_OVMF Kconfig symbol=0D
- pc_system_ovmf_table_find: Assert that flash was parsed, document=0D
- gitlab-ci: Fix the jobs building EDK2 blobs=0D
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
Philippe Mathieu-Daud=C3=A9 (2):=0D
  gitlab-ci: Extract EDK2 job rules to reusable section=0D
  hw/i386: Introduce X86_FW_OVMF Kconfig symbol=0D
=0D
 include/hw/i386/pc.h          |   1 +=0D
 hw/i386/pc_sysfw.c            | 107 ------------------------=0D
 hw/i386/pc_sysfw_ovmf-stubs.c |  26 ++++++=0D
 hw/i386/pc_sysfw_ovmf.c       | 151 ++++++++++++++++++++++++++++++++++=0D
 .gitlab-ci.d/edk2.yml         |  27 +++---=0D
 MAINTAINERS                   |   4 +-=0D
 hw/i386/Kconfig               |   4 +=0D
 hw/i386/meson.build           |   2 +=0D
 8 files changed, 201 insertions(+), 121 deletions(-)=0D
 create mode 100644 hw/i386/pc_sysfw_ovmf-stubs.c=0D
 create mode 100644 hw/i386/pc_sysfw_ovmf.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


