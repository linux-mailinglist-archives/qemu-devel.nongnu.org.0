Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 416F757A2FE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 17:28:31 +0200 (CEST)
Received: from localhost ([::1]:41970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDp9C-0000EQ-Fa
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 11:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oDp3S-0007ts-Mq
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 11:22:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oDp3H-0001iL-JU
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 11:22:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658244142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uP2bM1Y6w694dKaBv5jHCLYNROB0+qfGrphLGTGJdKs=;
 b=Ucb6WhRbf5OU65uagWWuX+Pt2V1ZjGjlBzcwiF/uWWDesbyqzvSUce3EmxRPqnj40EoOhG
 qqIE9o44bCtcTl1nZsvZzPpmso7SHcxmVoR8sfQrPlZU6wpr5mrmW8Uq7d9ONli4J+lif9
 35CnvdTQ4FPAu/z9cwOuTSkIFaqTJVM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-uQutRIdwOKmhbi5kV_WkGQ-1; Tue, 19 Jul 2022 11:22:21 -0400
X-MC-Unique: uQutRIdwOKmhbi5kV_WkGQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDDC43C02193;
 Tue, 19 Jul 2022 15:22:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8900A492C3B;
 Tue, 19 Jul 2022 15:22:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B33F018000A3; Tue, 19 Jul 2022 17:22:18 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 0/6] Kraxel 20220719 patches
Date: Tue, 19 Jul 2022 17:22:12 +0200
Message-Id: <20220719152218.825707-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 782378973121addeb11b13fd12a6ac2e69faa33f:

  Merge tag 'pull-target-arm-20220718' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-07-18 16:29:32 +0100)

are available in the Git repository at:

  https://gitlab.com/kraxel/qemu.git tags/kraxel-20220719-pull-request

for you to fetch changes up to c34a933802071aae5288e0aa3792756312e3da34:

  gtk: Add show_tabs=on|off command line option. (2022-07-19 14:36:42 +0200)

----------------------------------------------------------------
ui: dbus-display fix, new gtk config options.
usb: xhci fix, doc updates.
microvm: no pcie io reservations.

----------------------------------------------------------------

Felix xq Queißner (1):
  gtk: Add show_tabs=on|off command line option.

Gerd Hoffmann (3):
  microvm: turn off io reservations for pcie root ports
  usb: document guest-reset and guest-reset-all
  usb: document pcap (aka usb traffic capture)

Marc-André Lureau (1):
  dbus-display: fix test race when initializing p2p connection

Mauro Matteo Cascella (1):
  usb/hcd-xhci: check slotid in xhci_wakeup_endpoint()

 hw/i386/microvm.c           | 11 ++++++++++
 hw/usb/hcd-xhci.c           |  3 ++-
 ui/dbus.c                   |  4 +++-
 ui/gtk.c                    |  4 ++++
 docs/system/devices/usb.rst | 41 +++++++++++++++++++++++++++++++++++++
 qapi/ui.json                |  7 ++++++-
 qemu-options.hx             |  6 +++++-
 7 files changed, 72 insertions(+), 4 deletions(-)

-- 
2.36.1


