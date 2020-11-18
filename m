Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90352B7909
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:48:13 +0100 (CET)
Received: from localhost ([::1]:59038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJ8O-0006TX-Oe
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyV-0001xe-3H
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:37:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyT-0005Uk-7F
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9QgbgRIMOlCX9YjGuuVQ158TuoHu5EkhzlZ2uNu/S2Y=;
 b=Wm4Eqx44jIGQ/dSYCqei1sStqxuDo9yCldvE7UsH+5xsXIcrvMUIOXonUTEdgDwCrgOIp+
 Xo4S/VC1VskIr1KVR9KMzfbrXbXpNc9DP2kF7WevGAGiynQHCdqRUnpH/EpzWYl2R8JgYd
 VYwhCID5Or4xAV2SVAeE/EOstyLQyxY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-6djQb5JVOEyLO8KzgdUdyg-1; Wed, 18 Nov 2020 03:37:51 -0500
X-MC-Unique: 6djQb5JVOEyLO8KzgdUdyg-1
Received: by mail-wr1-f72.google.com with SMTP id p16so639385wrx.4
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:37:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dCNiADAr70bSCmAbdrkAw9n803u+VwgjWrtTATQoz24=;
 b=Z4savCYGskiBeP/ZIvmsqQ5v27Nwgi4NOFYAIu1oocVKRUH4opyoOzzysGH99BBKKq
 knkRvn/pYkeI5BG1patcG8jKHxWzD9JyWfmF4+p/Mmo588XSWlWXFx4w7x8xE+j7sHfQ
 JEevB4kw8QVWW/llly6Sck44siaIGuy3yDELV6Yz5Qx+eRmjxhIZs+Pz10WM4r7mzVV8
 vphBKkYCD8Dk5ZuUj/Ef9Vq/QYjQqq8PKjmnxDo/fQ6lKoChK8r0mrnIxMGEhW/gf1Cm
 gZcFl/qPz7hq0ZWC8J22PGqmx/fjLp+0ITefUvBjMZbqf+LhJrho0W1oDGGUfF2ZOW1X
 3I7g==
X-Gm-Message-State: AOAM533Ov4PBLIvGrEWW2G7kaFuXloSMwIxJLu5fVqm2Mn/BKT0IYWTH
 RxAN/ePMjWDIS5l55/77S7jpW0+gZI6s2eF/aikfHQGLE8tTeTxvyGt6KnF1vnNSuG8H++eeIIx
 TyCgMF+u1DjyoyVqKKBOTYC7KOin8T7MUNGP7A5b1CvYbXm3UOjU2sGXqC7r+OkFbdMo=
X-Received: by 2002:adf:ce07:: with SMTP id p7mr3903392wrn.39.1605688670539;
 Wed, 18 Nov 2020 00:37:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyeif8HmJiWUyvXAFA78+qyte3tfY5zEXsp8m0EhNOtPscEXDdy61VguZDNYLQl0v+2YQ38Qg==
X-Received: by 2002:adf:ce07:: with SMTP id p7mr3903359wrn.39.1605688670281;
 Wed, 18 Nov 2020 00:37:50 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id l13sm33393923wrm.24.2020.11.18.00.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:37:49 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/27] Virtio net failover fixes
Date: Wed, 18 Nov 2020 09:37:21 +0100
Message-Id: <20201118083748.1328-1-quintela@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi=0D
=0D
This is a big rework of the network failover setup.  General idea is:=0D
* We don't cache the name of the primary/standby devices=0D
  We have several problems there with stale pointers=0D
* After this:=0D
- We can always remove either the primary/standby devices without trouble=
=0D
- Pluggin/unplugging works=0D
- We go to device opts to see what the failover device are.=0D
  Notice that we are plugging/unplugging the device, so it is not critical.=
=0D
- Once there, I "fixed" managedsave for libvirt (now gives an error instead=
 o=3D=0D
f just hanging)=0D
* Fields not cached anymore:=0D
- primary_device_dict=0D
- primary_device_opts=0D
- standby_id=0D
- primary_device_id=0D
- primary_dev=0D
* I renamed the should_be_hidden() callback to hide device, but if=0D
  people preffer the old name I can leave it.=0D
* Add (some) doc to some functions=0D
* Remove almost 100 lines of code while fixing things.=0D
=0D
Please review.=0D
=0D
Later, Juan.=0D
=0D
Juan Quintela (27):=0D
  migration: Network Failover can't work with a paused guest=0D
  failover: fix indentantion=0D
  failover: Use always atomics for primary_should_be_hidden=0D
  failover: primary bus is only used once, and where it is set=0D
  failover: Remove unused parameter=0D
  failover: Remove external partially_hotplugged property=0D
  failover: qdev_device_add() returns err or dev set=0D
  failover: Rename bool to failover_primary_hidden=0D
  failover: g_strcmp0() knows how to handle NULL=0D
  failover: Remove primary_device_opts=0D
  failover: remove standby_id variable=0D
  failover: Remove primary_device_dict=0D
  failover: Remove memory leak=0D
  failover: simplify virtio_net_find_primary()=0D
  failover: should_be_hidden() should take a bool=0D
  failover: Rename function to hide_device()=0D
  failover: virtio_net_connect_failover_devices() does nothing=0D
  failover: Rename to failover_find_primary_device()=0D
  failover: simplify qdev_device_add() failover case=0D
  failover: simplify qdev_device_add()=0D
  failover: make sure that id always exist=0D
  failover: remove failover_find_primary_device() error parameter=0D
  failover: split failover_find_primary_device_id()=0D
  failover: We don't need to cache primary_device_id anymore=0D
  failover: Caller of this two functions already have primary_dev=0D
  failover: simplify failover_unplug_primary=0D
  failover: Remove primary_dev member=0D
=0D
 include/hw/qdev-core.h         |  28 ++--=0D
 include/hw/virtio/virtio-net.h |   9 +-=0D
 hw/core/qdev.c                 |  19 +--=0D
 hw/net/virtio-net.c            | 298 +++++++++++++--------------------=0D
 migration/migration.c          |  13 ++=0D
 softmmu/qdev-monitor.c         |  43 ++---=0D
 6 files changed, 167 insertions(+), 243 deletions(-)=0D
=0D
--=3D20=0D
2.26.2=0D
=0D


