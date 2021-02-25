Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A56F325A06
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 00:04:12 +0100 (CET)
Received: from localhost ([::1]:57934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFPg3-0007MS-1J
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 18:04:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFPeo-0006Nb-JN
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 18:02:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFPeh-0006u7-Co
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 18:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614294165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lF1Dgv6yd8+LWhY1EZ2z2lkU+rsjV5/foE8PjHeLhd0=;
 b=HLaAlh8CfO0hu1Zm13Z9ahJKDmve1vjc/ZmwW09krfKbN+V2XIxcV1VyYIcAQFdb9MRMwe
 X0u3N9x4m6rqkB2vATsYL4kvWMm9Vai4NN+jXMN1+A/HmE+27ObQEJQ+4n+/4u+Nt9Ut1e
 xcXl7fOm7RFw2YECidwjVlAyN4/PM1M=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-8f2GmbRkMgGJuCya_xNfjg-1; Thu, 25 Feb 2021 18:02:43 -0500
X-MC-Unique: 8f2GmbRkMgGJuCya_xNfjg-1
Received: by mail-ej1-f70.google.com with SMTP id p6so3258278ejw.1
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 15:02:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Oge+BX++/MBEqJ55SlQBObphogPKjwvKzTplxJ+QKVs=;
 b=o2a6+XkjrKIFsH1dKkLjlTo9OBbxmYaYWFCw1ksrBPMce9pSa6VPtftaB3LtClT0bh
 +DMpok2F5HVm/Tfgju+Ec/tKy6BXbouzkJG06qEbRmuIHGMA+AadoF8kkXZFRgoSyUT2
 D+Xka0HEC234rCzmhfVlpn686tBQckd2VV8gKKwKJlPkDgXYXqX4qLcSVQHV81U/5IpP
 S4zqYtw1Q/6aKZVaCMD0e0q0cObvNKkQGrgh/xqKcs3LsRulm0dtTG72DnOm9SLjBxO5
 mnZCzd+Ts6HV8LG9V82zwYJ/G5o2xnzxC/mqteBmRZR8eVAwnlzXWYWh+CoJb98ygnsC
 P91Q==
X-Gm-Message-State: AOAM533NfA/atPduBeep4FoJLKG9QRDWzPEg23U8+klTQyN0Bj+vQEDW
 Gujq3vpliV/xc1TsxjWVd/53t0YtZy2LU/xO9IHBEMq/1Husq9uwuVQPiQUhGVVw0MKpwuz9MEC
 handyP6lXOHcTswlrroNUb1I+6Fv0eMA5x9ixy4hd7c97zCa9wVLabGL3FBDm2jRW
X-Received: by 2002:a17:906:af91:: with SMTP id
 mj17mr4044586ejb.230.1614294162178; 
 Thu, 25 Feb 2021 15:02:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8brcM1aIzfSQXxZ1+Urm4W14R3thP5Fc6jxtMMpEAwil5QOF56qjb/3DpyQzsHtKKW9sMPw==
X-Received: by 2002:a17:906:af91:: with SMTP id
 mj17mr4044532ejb.230.1614294161840; 
 Thu, 25 Feb 2021 15:02:41 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t25sm4591601edt.41.2021.02.25.15.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 15:02:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	David Edmondson <david.edmondson@oracle.com>
Subject: [RFC PATCH 0/3] hw/block/pflash: Mmap read-only backend files with
 MAP_SHARED
Date: Fri, 26 Feb 2021 00:02:35 +0100
Message-Id: <20210225230238.3719051-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Xu Yandong <xuyandong2@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Zheng Xiang <zhengxiang9@huawei.com>,
 haibinzhang <haibinzhang@tencent.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series aims to reduce the memory footprint of flash devices=0D
when the backing file is read-only.=0D
=0D
When a backing file is read-only, the model considers the flash=0D
is in "protected" mode. No write are allowed, but the MMIO=0D
state machine is still usable.=0D
=0D
This series introduces a new memory region helper to mmap files=0D
and use it with the pflash device (only with read-only backing=0D
files).=0D
=0D
The goal is to reduce QEMU's memory footprint when multiple VMs=0D
are instantiated using the same read-only backing file, which is=0D
the case with the CODE flash from OVMF and AAVMF.=0D
=0D
Previous attempts:=0D
=0D
- Huawei=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg607292.html=0D
- Tencent=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg742066.html=0D
- Oracle=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg760065.html=0D
=0D
RFC because yet another approach to tackle this technical debt,=0D
and very little tested.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  exec/memory: Introduce memory_region_init_rom_device_from_file()=0D
  hw/block/pflash: Move code around=0D
  hw/block/pflash: use memory_region_init_rom_device_from_file()=0D
=0D
 include/exec/memory.h   | 85 +++++++++++++++++++++++++++++++++++=0D
 hw/block/pflash_cfi01.c | 34 ++++++++------=0D
 hw/block/pflash_cfi02.c | 30 ++++++++-----=0D
 softmmu/memory.c        | 98 +++++++++++++++++++++++++++++++++++++++++=0D
 4 files changed, 224 insertions(+), 23 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


