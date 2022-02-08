Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3184ADF0B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:13:34 +0100 (CET)
Received: from localhost ([::1]:59120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHU3Z-000674-Bz
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:13:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHRjy-00048t-43
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:45:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHRju-0001e8-1z
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644331505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5sMG7uXyzrao8MVsBkEXkoaC9MqrwA0paMDUYdG/GEM=;
 b=I1FKMnNX8sbPy6XofnWjae/hYMY0PvjPaQzyahgtHQG5SbK4hFY/kNSQIT7MTuuT46yl0q
 JR/Na844e9Wnr8j3mhE+LzHXPT8jz9PeGUEBdv5HbKh6GRPpaFkL0lu+sn/u5k/dI+mseG
 qKFgCOYWss8FA6+l3HzeISd9cxrAC7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-DJMFKX5bP4aycSW94oFrbg-1; Tue, 08 Feb 2022 09:45:01 -0500
X-MC-Unique: DJMFKX5bP4aycSW94oFrbg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30D1E94DC1;
 Tue,  8 Feb 2022 14:45:00 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBF867D3CF;
 Tue,  8 Feb 2022 14:44:58 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/3] introduce QMP-only binaries
Date: Tue,  8 Feb 2022 09:44:55 -0500
Message-Id: <20220208144458.1079634-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: damien.hedde@greensocs.com, berrange@redhat.com, mark.burton@greensocs.com,
 armbru@redhat.com, f4bug@amsat.org, mirela.grujic@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These three patches introduce a new system emulation binary qemu-qmp-*
that does nothing but start a QMP monitor (via systemd activation
protocol if possible, otherwise on stdio).  The idea is that the
creation of the machine would happen through new commands such as
machine-set, accel-set, etc.

Patches 1 and 2 simply avoid that {'execute':'quit'} crashes; that's
more or less the extent of my testing.

Paolo

Paolo Bonzini (3):
  migration: allow calling migration_shutdown without a prior
    initialization
  net: initialize global variables early
  introduce qemu-qmp-*

 hw/net/xen_nic.c            |  20 +++---
 include/net/net.h           |   1 +
 meson.build                 |  16 +++--
 migration/migration.c       |   4 ++
 net/net.c                   |   5 +-
 softmmu/{vl.c => climain.c} |   2 +-
 softmmu/meson.build         |   1 -
 softmmu/qmpmain.c           | 120 ++++++++++++++++++++++++++++++++++++
 softmmu/runstate.c          |   1 +
 9 files changed, 153 insertions(+), 17 deletions(-)
 rename softmmu/{vl.c => climain.c} (99%)
 create mode 100644 softmmu/qmpmain.c

-- 
2.31.1


