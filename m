Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FE741FBF8
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 14:56:14 +0200 (CEST)
Received: from localhost ([::1]:59084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWeYm-0003Kh-HM
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 08:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeW9-0000Uk-Kk
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:53:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeW5-0000YF-VL
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lMvHpMAjutaC0QtIwPFKH+NgyKrgDajvg8NW2cMoBlQ=;
 b=FDJBmimYWv0hN65kIkkzVIW1wtWyggC0lL0LnzK/VpfD4zs82rdaLhDgUJZS3RM+kbKIp3
 AliqvYxbfv4+umQyahT6OSunnTGgJO2Ms7BQsRTf50LRe3ROvO2D6YwmfKZy6cHUGFGgG1
 tE4pqOuIUz/IgxU0fouigA8rmm8pjcg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-E1X4TRDfNcS3ufm2ez6GNA-1; Sat, 02 Oct 2021 08:53:21 -0400
X-MC-Unique: E1X4TRDfNcS3ufm2ez6GNA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j21-20020a05600c1c1500b0030ccce95837so3788683wms.3
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ib9ELo2khl9yldyMRwflp0UN303ciEAFS7yOmdsrtJM=;
 b=QyrrMgGnol9x4wa+PEoM+H+g5jKf0X96YV46TZP+GV1llzHZBYWLX99k2+QyNPVFMb
 31Hex3XLWMnaL/yOYAvox1udIoxGTfcEvTKmDmA8YPAgwqhNN8bPSUvn3dUzESgK4L36
 Omf4a3XayTaroxtLt8NhJIjoJMVzb6lVLHgIqmNyC+fj8FJinr/EBlapPR0ufjrXgXCN
 Yl9bTqktTzGCKTAMCBjh5Xid5Nf7qKxo0XSFWZ6D55ALBLJ4ZMTr1+n0ACQKWBD8UR70
 WWZBA8GIsEWrMSuTWpYLhyByKdNuloDbdM72GznE9uqJtzB+G54/oSPYixgQGYb55IIY
 MXfA==
X-Gm-Message-State: AOAM533ZGhqKRvCZVeZiOneIJ9S7ntfM+I2WAvMSXb85WzSy3NLRekyy
 BtIi9adU9oloIIz50dCYBbnoQP2SrlVWGnQcTGkGxGcbiwKBDlDiEDN+PlBh1cBaD44W12GLqnd
 uTCePbeVMUbknf4+nE5HsOD0XP7SFhgWtllz8fhze1dj0nv1jqEnQjagmXFZ7aaYV
X-Received: by 2002:adf:8bcf:: with SMTP id w15mr3445882wra.144.1633179199723; 
 Sat, 02 Oct 2021 05:53:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmJJVJtij1cYhaOoS1a2n3oM4h81AupX1+DD9gs6imh/k3aWK6DwR8Pisb94OyZBbpntRePg==
X-Received: by 2002:adf:8bcf:: with SMTP id w15mr3445845wra.144.1633179199336; 
 Sat, 02 Oct 2021 05:53:19 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 i2sm8378777wrq.78.2021.10.02.05.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:53:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/22] target/i386/sev: Housekeeping SEV + measured Linux
 SEV guest
Date: Sat,  2 Oct 2021 14:52:55 +0200
Message-Id: <20211002125317.3418648-1-philmd@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
While testing James & Dov patch:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg810571.html=0D
I wasted some time trying to figure out how OVMF was supposed to=0D
behave until realizing the binary I was using was built without SEV=0D
support... Then wrote this series to help other developers to not=0D
hit the same problem.=0D
=0D
Since v2:=0D
- Rebased on top of SGX=0D
- Addressed review comments from Markus / David=0D
- Included/rebased 'Measured Linux SEV guest' from Dov [1]=0D
- Added orphean MAINTAINERS section=0D
=0D
[1] https://lore.kernel.org/qemu-devel/20210825073538.959525-1-dovmurik@lin=
ux.ibm.com/=0D
=0D
Supersedes: <20210616204328.2611406-1-philmd@redhat.com>=0D
=0D
Dov Murik (2):=0D
  sev/i386: Introduce sev_add_kernel_loader_hashes for measured linux=0D
    boot=0D
  x86/sev: generate SEV kernel loader hashes in x86_load_linux=0D
=0D
Dr. David Alan Gilbert (1):=0D
  target/i386/sev: sev_get_attestation_report use g_autofree=0D
=0D
Philippe Mathieu-Daud=C3=A9 (19):=0D
  qapi/misc-target: Wrap long 'SEV Attestation Report' long lines=0D
  qapi/misc-target: Group SEV QAPI definitions=0D
  target/i386/kvm: Introduce i386_softmmu_kvm Meson source set=0D
  target/i386/kvm: Restrict SEV stubs to x86 architecture=0D
  target/i386/monitor: Return QMP error when SEV is disabled in build=0D
  target/i386/cpu: Add missing 'qapi/error.h' header=0D
  target/i386/sev_i386.h: Remove unused headers=0D
  target/i386/sev: Remove sev_get_me_mask()=0D
  target/i386/sev: Mark unreachable code with g_assert_not_reached()=0D
  target/i386/sev: Restrict SEV to system emulation=0D
  target/i386/sev: Declare system-specific functions in 'sev_i386.h'=0D
  target/i386/sev: Remove stubs by using code elision=0D
  target/i386/sev: Move qmp_query_sev_attestation_report() to sev.c=0D
  target/i386/sev: Move qmp_sev_inject_launch_secret() to sev.c=0D
  target/i386/sev: Move qmp_query_sev_capabilities() to sev.c=0D
  target/i386/sev: Move qmp_query_sev_launch_measure() to sev.c=0D
  target/i386/sev: Move qmp_query_sev() & hmp_info_sev() to sev.c=0D
  monitor: Restrict 'info sev' to x86 targets=0D
  MAINTAINERS: Cover AMD SEV files=0D
=0D
 qapi/misc-target.json                 |  77 ++++----=0D
 include/monitor/hmp-target.h          |   1 +=0D
 include/monitor/hmp.h                 |   1 -=0D
 include/sysemu/sev.h                  |  20 +-=0D
 target/i386/sev_i386.h                |  32 +--=0D
 hw/i386/pc_sysfw.c                    |   2 +-=0D
 hw/i386/x86.c                         |  25 ++-=0D
 target/i386/cpu.c                     |  17 +-=0D
 {accel =3D> target/i386}/kvm/sev-stub.c |   0=0D
 target/i386/monitor.c                 |  92 +--------=0D
 target/i386/sev-stub.c                |  83 --------=0D
 target/i386/sev-sysemu-stub.c         |  70 +++++++=0D
 target/i386/sev.c                     | 268 +++++++++++++++++++++++---=0D
 MAINTAINERS                           |   7 +=0D
 accel/kvm/meson.build                 |   1 -=0D
 target/i386/kvm/meson.build           |   8 +-=0D
 target/i386/meson.build               |   4 +-=0D
 17 files changed, 438 insertions(+), 270 deletions(-)=0D
 rename {accel =3D> target/i386}/kvm/sev-stub.c (100%)=0D
 delete mode 100644 target/i386/sev-stub.c=0D
 create mode 100644 target/i386/sev-sysemu-stub.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


