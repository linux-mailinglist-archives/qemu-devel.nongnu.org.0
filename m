Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AC02B127B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 00:07:43 +0100 (CET)
Received: from localhost ([::1]:35978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdLgs-0007rc-By
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 18:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kdLfV-0007Ef-VS
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 18:06:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kdLfO-0005Vx-7A
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 18:06:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605222368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1yrtE0/u+EsD+9zXZgdvpb9Z+jLc+qjixlEdUUA1oIQ=;
 b=JkUWG22HRayARVEomKe+u8tRqaTOaBT/+JSUTBDg04zYeVQCOTxpl+V7RCz0DjItvWxdlj
 MngdwJv/lUg9b2I3eQTB/w5rRYssQutgiDwSG7xgiylXLygZeVCaeXmetTggqlWNqGZesl
 QY0M4To6RjeotzrXl9wSMtaNm7F7mqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-hySZaVKWOCGtGEj99bwCmg-1; Thu, 12 Nov 2020 18:06:05 -0500
X-MC-Unique: hySZaVKWOCGtGEj99bwCmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58C68107AD74;
 Thu, 12 Nov 2020 23:05:57 +0000 (UTC)
Received: from gimli.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 277F819C59;
 Thu, 12 Nov 2020 23:05:54 +0000 (UTC)
Subject: [PULL 0/1] vfio fix for QEMU 5.2-rc2
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Nov 2020 16:05:53 -0700
Message-ID: <160522223115.22563.1877553897618141184.stgit@gimli.home>
User-Agent: StGit/0.21-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alex =?utf-8?q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Philippe =?utf-8?q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Edmondson <dme@dme.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit cb5d19e8294486551c422759260883ed290226d9:

  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-macppc-20201112' into staging (2020-11-12 11:33:26 +0000)

are available in the Git repository at:

  git://github.com/awilliam/qemu-vfio.git tags/vfio-update-20201112.0

for you to fetch changes up to e408aeef8663fd6e3075aef252404c55d710a75e:

  Fix use after free in vfio_migration_probe (2020-11-12 15:58:16 -0700)

----------------------------------------------------------------
VFIO update 2020-11-12

 * Fix coverity reported use-after-free (Kirti Wankhede)

----------------------------------------------------------------
Kirti Wankhede (1):
      Fix use after free in vfio_migration_probe

 hw/vfio/migration.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


