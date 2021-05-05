Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA483738A7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:39:24 +0200 (CEST)
Received: from localhost ([::1]:33576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEw7-00020i-Ds
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leEuH-0000RW-Ik
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:37:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leEuE-0007Os-Un
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620211044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WBXVyQvFe+7MSsRuDjQqI6fXIB4RWXYa5ZgYMae7E5Q=;
 b=XmhC12QSybnqR3yL0Q5JpYF1/ze8/oBPksDn+DICYb9ExlR/tgfeHg+eZQN318jKf+z+/9
 4zFUUmT3jU5KOI5mRSa47C/4WLyd0RvQNvJ1GjcMoPz04LHzVHMJ41uaTr4McvReXrUcNJ
 OH3OTGnqOLrGsoxLxQxPFlDYoB2OZWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-rx_fyIsENDywOQ4eAiOMaA-1; Wed, 05 May 2021 06:37:22 -0400
X-MC-Unique: rx_fyIsENDywOQ4eAiOMaA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E7CA801AC9;
 Wed,  5 May 2021 10:37:21 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-253.ams2.redhat.com
 [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39E765C3E0;
 Wed,  5 May 2021 10:37:04 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] replace all use of strftime() with g_date_time_format()
Date: Wed,  5 May 2021 11:36:55 +0100
Message-Id: <20210505103702.521457-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 virtio-fs@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GDateTime APIs provided by GLib avoid portability pitfalls, such=0D
as some platforms where 'struct timeval.tv_sec' field is still 'long'=0D
instead of 'time_t'. When combined with automatic cleanup, GDateTime=0D
often results in simpler code too.=0D
=0D
Daniel P. Berrang=C3=A9 (7):=0D
  migration: use GDateTime for formatting timestamp in snapshot names=0D
  block: use GDateTime for formatting timestamp when dumping snapshot=0D
    info=0D
  net/rocker: use GDateTime for formatting timestamp in debug messages=0D
  usb/dev-mtp: use GDateTime for formatting timestamp for objects=0D
  io: use GDateTime for formatting timestamp for websock headers=0D
  linux-user: use GDateTime for formatting timestamp for core file=0D
  virtiofsd: use GDateTime for formatting timestamp for debug messages=0D
=0D
 block/qapi.c                     | 11 ++++------=0D
 hw/net/rocker/rocker.h           | 11 +++-------=0D
 hw/usb/dev-mtp.c                 |  9 +++-----=0D
 io/channel-websock.c             | 10 ++-------=0D
 linux-user/elfload.c             | 36 ++++++++------------------------=0D
 migration/savevm.c               | 13 +++++-------=0D
 tools/virtiofsd/passthrough_ll.c | 25 ++++------------------=0D
 7 files changed, 30 insertions(+), 85 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


