Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C4D3B0536
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 14:52:00 +0200 (CEST)
Received: from localhost ([::1]:54594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvfsl-0005RN-2a
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 08:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvfqN-0002RT-Ir
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvfqI-0008Vk-UU
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624366165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1xNYAFaoSb+2YHr7FL912xr8FN2BJ3ws6vy33Y+zpDo=;
 b=ZIFDMMjlh853jktxXFuMOGrfEjRmwsQyVgPCeP4VnUvqmAM3GNH+HbtGekoeGTuZA1vlSw
 2Mex+Vq/+Hc+GjzVNKDY82Y/fO1Qg2oaj5zDV3J0CkKOlqBFJkFaSHlexbB17bmos4ZMjT
 Xjt6SgZ4LDdr5bIVkkjUb2SRJg/Gkgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-P0_7billPkuX4MhVCiuIAg-1; Tue, 22 Jun 2021 08:49:22 -0400
X-MC-Unique: P0_7billPkuX4MhVCiuIAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A067A100C611;
 Tue, 22 Jun 2021 12:49:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E929E60C13;
 Tue, 22 Jun 2021 12:49:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 47CC5180060E; Tue, 22 Jun 2021 14:49:15 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] [RfC] monitor/hmp: command register support
Date: Tue, 22 Jun 2021 14:49:10 +0200
Message-Id: <20210622124915.261060-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Helps making qemu more modular,=0D
see commit messages for details.=0D
=0D
Depends on the "modules: add meta-data database" patch series.=0D
=0D
Gerd Hoffmann (5):=0D
  monitor: allow register hmp commands=0D
  usb: drop usb_host_dev_is_scsi_storage hook=0D
  monitor/usb: register 'info usbhost' dynamically=0D
  usb: build usb-host as module=0D
  monitor/tcg: move tcg hmp commands to accel/tcg, register them=0D
    dynamically=0D
=0D
 include/hw/usb.h             |  7 +++++-=0D
 include/monitor/monitor.h    |  3 +++=0D
 accel/tcg/hmp.c              | 29 +++++++++++++++++++++++=0D
 hw/ppc/spapr.c               |  2 +-=0D
 hw/usb/dev-storage-bot.c     |  1 +=0D
 hw/usb/dev-storage-classic.c |  1 +=0D
 hw/usb/dev-uas.c             |  1 +=0D
 hw/usb/host-libusb.c         | 38 ++++++++----------------------=0D
 hw/usb/host-stub.c           | 45 ------------------------------------=0D
 monitor/hmp.c                |  7 ++++++=0D
 monitor/misc.c               | 33 ++++++++++++--------------=0D
 accel/tcg/meson.build        |  1 +=0D
 hmp-commands-info.hx         |  3 ---=0D
 hw/usb/meson.build           | 10 ++++----=0D
 14 files changed, 80 insertions(+), 101 deletions(-)=0D
 create mode 100644 accel/tcg/hmp.c=0D
 delete mode 100644 hw/usb/host-stub.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


