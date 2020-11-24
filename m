Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456DF2C2AFE
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 16:16:42 +0100 (CET)
Received: from localhost ([::1]:42256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kha3c-0000x6-C1
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 10:16:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kha2C-0000QD-Jp
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:15:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kha26-0005eb-Mw
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:15:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606230905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g36kgsm4avD8+74pQuNLNzThPFvghl4lWSXtQ7+3i9c=;
 b=Da0cTC0GarUTNe6c/sCnJGgJY0JuwPBLjZD5tHx7iWbGeCjSxA+/l7eMQBr1gC1CW3tGnE
 gLXKXqoDSn4n5cDsoHCfkDqy+YF6taWQG3EdigXpGHmwrdRsn3oyLa7LCjhguWghvRRBpI
 neVqP0ojVmzpFotYS8UadS8vp9HPdFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-U8F5FzpNNYCiRA2PZPlKhg-1; Tue, 24 Nov 2020 10:15:02 -0500
X-MC-Unique: U8F5FzpNNYCiRA2PZPlKhg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0A293E757
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 15:15:01 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82BBF1001281;
 Tue, 24 Nov 2020 15:15:01 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] PCI host devaddr property fix for 5.2
Date: Tue, 24 Nov 2020 10:14:59 -0500
Message-Id: <20201124151500.2945356-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d536d9578ec3ac5029a70b8126cb84bb6f2124a4=
:=0D
=0D
  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' int=
o staging (2020-11-24 10:59:12 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/ehabkost/qemu.git tags/machine-next-for-5.2-pull-request=
=0D
=0D
for you to fetch changes up to 28afbc1f11f5ae33b69deb162a551110717eec94:=0D
=0D
  Revert "hw/core/qdev-properties: Use qemu_strtoul() in set_pci_host_devad=
dr()" (2020-11-24 10:06:54 -0500)=0D
=0D
----------------------------------------------------------------=0D
PCI host devaddr property fix for 5.2=0D
=0D
----------------------------------------------------------------=0D
=0D
Michael S. Tsirkin (1):=0D
  Revert "hw/core/qdev-properties: Use qemu_strtoul() in=0D
    set_pci_host_devaddr()"=0D
=0D
 hw/core/qdev-properties-system.c | 25 +++++++++++++------------=0D
 1 file changed, 13 insertions(+), 12 deletions(-)=0D
=0D
--=20=0D
2.28.0=0D
=0D


