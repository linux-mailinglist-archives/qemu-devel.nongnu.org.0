Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 248CE316D5A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:53:35 +0100 (CET)
Received: from localhost ([::1]:60282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9tgE-0003ka-6H
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l9tYa-0007cV-J1
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:45:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l9tYT-000113-Q3
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612979132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vM+20U7m78/bHGcf1xMRnRFl8DSpPabWBuWEsgFCAgI=;
 b=SlvlSiu6mUH6rFkmMOhEkDxLfFkMs9yp/f+pdwC/s1m35HmktKqh6SsJVEuEH+u5SOV8ik
 2upn0/CnQBpBTXan1s7TMJHYjg8+LaG11ApYY+kliMfp/dX69bSqEGxFyqQ56KEqOnyM9S
 5n517YjDnPtUQp8KCbbXQlflv/iyNFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-JsKLQYOaOxWgiqmgFEEcjg-1; Wed, 10 Feb 2021 12:45:29 -0500
X-MC-Unique: JsKLQYOaOxWgiqmgFEEcjg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E64ED520D;
 Wed, 10 Feb 2021 17:45:27 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0502B19CAD;
 Wed, 10 Feb 2021 17:45:19 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] failover: trivial cleanup and fix
Date: Wed, 10 Feb 2021 18:45:15 +0100
Message-Id: <20210210174518.2493928-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, quintela@redhat.com,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 jfreimann@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first patch removes a duplicate assignment to=0D
allow_unplug_during_migration, and simplify the code.=0D
=0D
The second patch fixes a dangling object in failover_add_primary()=0D
that prevents to cleanup the internal structure after the object has=0D
been unplugged.=0D
=0D
v2: add a third patch=0D
=0D
The third patch reports a warning if the failover device is not found=0D
=0D
Laurent Vivier (3):=0D
  pci: cleanup failover sanity check=0D
  virtio-net: add missing object_unref()=0D
  failover: really display a warning when the primary device is not=0D
    found=0D
=0D
 hw/net/virtio-net.c | 18 +++++++++---------=0D
 hw/pci/pci.c        |  6 ++----=0D
 2 files changed, 11 insertions(+), 13 deletions(-)=0D
=0D
--=20=0D
2.29.2=0D
=0D


