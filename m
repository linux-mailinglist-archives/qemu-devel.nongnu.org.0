Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150AB465EC8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 08:37:12 +0100 (CET)
Received: from localhost ([::1]:48376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msgeU-00045k-IP
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 02:37:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9N-0005Uk-Rm
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9J-0006EU-0X
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638428696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ar+ahkfpHS6YlZtdUI9+D65HtY5H3alJZN3w8bOZyWA=;
 b=a+68kpmXPW/gCf7mLdTers5WfEuisjVGkglPOtYSDCgucFbErw5LJRRtiTwUhJB7vQj8u2
 X3VvbKMf0Q7ML3M8+KSYp4bDLUBDV+uQC4LM1/9A22g5WAYlGDOE/htl/qiWOh4cbkw9lW
 vjxJNbi+14IQgEI/yGR7oaCY90s8kUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-cKAhcrgIPfyDIIHXzW3iiA-1; Thu, 02 Dec 2021 02:04:53 -0500
X-MC-Unique: cKAhcrgIPfyDIIHXzW3iiA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05DBB363A6;
 Thu,  2 Dec 2021 07:04:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 960125F4E7;
 Thu,  2 Dec 2021 07:04:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0DB95113865F; Thu,  2 Dec 2021 08:04:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 00/11] vl: Explore redesign of startup
Date: Thu,  2 Dec 2021 08:04:39 +0100
Message-Id: <20211202070450.264743-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: damien.hedde@greensocs.com, berrange@redhat.com, mark.burton@greensocs.com,
 edgar.iglesias@gmail.co, mirela.grujic@greensocs.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patches are meant to back the memo "Redesign of QEMU startup &
initial configuration" I just posted.  Read that first, please.

My running example for initial configuration via QMP is cold plug.  It
works at the end of the series.

I'm taking a number of shortcuts:

* I hack up qemu-system-FOO instead of creating an alternate program.
  Just so I don't have to mess with Meson.

* Instead of creating QAPI/CLI infrastructure, I use QMP as CLI: each
  argument is interpreted as QMP command.  This is certainly bad CLI,
  but should suffice to demonstrate things.

* Instead of feeding the CLI's QMP commands to the main loop via a
  quasi-monitor, I send them directly to the QMP dispatcher.  Simpler,
  but I'm not sure that's going to work for all QMP commands we want.

* Phase advance is by explicit command @until-phase only.  Carelessly
  named.  We may want some other commands to advance the phase
  automatically.

* There are no safeguards.  You *can* run QMP commands in phases where
  they crash.  Data corruption is left as an exercise for the reader.

* Possibly more I can't remember right now :)

Markus Armbruster (11):
  vl: Cut off the CLI with an axe
  vl: Drop x-exit-preconfig
  vl: Hardcode a QMP monitor on stdio for now
  vl: Hardcode a VGA device for now
  vl: Demonstrate (bad) CLI wrapped around QMP
  vl: Factor qemu_until_phase() out of qemu_init()
  vl: Implement qemu_until_phase() running from arbitrary phase
  vl: Implement qemu_until_phase() running to arbitrary phase
  vl: New QMP command until-phase
  vl: Disregard lack of 'allow-preconfig': true
  vl: Enter main loop in phase @machine-initialized

 qapi/misc.json             |   27 -
 qapi/phase.json            |   31 +
 qapi/qapi-schema.json      |    1 +
 include/hw/qdev-core.h     |   31 -
 hw/core/machine-qmp-cmds.c |    1 +
 hw/core/machine.c          |    1 +
 hw/core/qdev.c             |    7 +
 hw/pci/pci.c               |    1 +
 hw/usb/core.c              |    1 +
 hw/virtio/virtio-iommu.c   |    1 +
 monitor/hmp-cmds.c         |    8 -
 monitor/hmp.c              |    1 +
 softmmu/qdev-monitor.c     |    3 +
 softmmu/vl.c               | 2833 ++----------------------------------
 ui/console.c               |    1 +
 MAINTAINERS                |    1 +
 hmp-commands.hx            |   18 -
 qapi/meson.build           |    1 +
 18 files changed, 180 insertions(+), 2788 deletions(-)
 create mode 100644 qapi/phase.json

-- 
2.31.1


