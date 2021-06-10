Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D64773A2947
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:22:06 +0200 (CEST)
Received: from localhost ([::1]:50602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHp7-0001ae-TZ
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrHjT-0006b1-V5
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:16:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrHjS-0001Ck-CQ
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623320173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eREFH8/1ruOOgqC2Q7hBpo6EM+mZzanplceDA5w2M+0=;
 b=jAI2KIvUWnqu4vhY2YyDpf/6kPM5Vm+nbA1zPEYrrEphznRZlAwFatykrxTceN0KRe1vSD
 6dZMk44tVaCcALHnWOeFdPD9/m/2c97S54Qd+vqCDhKa0l6RRNbArjimQZZgrbKLB180ef
 6wkgr5ThGIdAi44tY4KEa1oXFCLHTcA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-qA1k49OiOKGNMgvR_pNOhQ-1; Thu, 10 Jun 2021 06:16:11 -0400
X-MC-Unique: qA1k49OiOKGNMgvR_pNOhQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47ED0100C61A;
 Thu, 10 Jun 2021 10:16:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B81BD5D9F0;
 Thu, 10 Jun 2021 10:15:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0B92918000B2; Thu, 10 Jun 2021 12:15:53 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] modules: add support for target-specific modules.
Date: Thu, 10 Jun 2021 12:15:49 +0200
Message-Id: <20210610101553.943689-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 cfontana@suse.de, jose.ziviani@suse.com, pbonzini@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based on the "modules: add metadata database" patch series sent=0D
earlier today.  Adds support for target-specific modules to the=0D
module code and build infrastructure.  Builds one simple module=0D
(virtio-9p-device) for testing purposes.  Well, one module per=0D
target to be exact ;)=0D
=0D
Gerd Hoffmann (4):=0D
  modules: factor out arch check=0D
  modules: check arch on qom lookup=0D
  modules: target-specific module build infrastructure=0D
  modules: build virtio-9p modular=0D
=0D
 hw/9pfs/virtio-9p-device.c |  2 ++=0D
 util/module.c              | 30 ++++++++++++++++++++++++------=0D
 hw/9pfs/meson.build        | 11 ++++++++++-=0D
 meson.build                | 26 ++++++++++++++++++++++++++=0D
 4 files changed, 62 insertions(+), 7 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


