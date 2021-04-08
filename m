Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7847F358E6B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 22:31:44 +0200 (CEST)
Received: from localhost ([::1]:49692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUbJX-00063e-J3
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 16:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lUbIQ-0005Vy-RR
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 16:30:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lUbIK-0001SR-El
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 16:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617913826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+jx7UZ9DkhQdQdY9crfTz96Mm5K6EIeFfcPjsV+jkik=;
 b=IXeJZwmQDfQMcV4zr9zn03ClCK3wNLlvlPj8MUnJPeqp/u2m07ZbwTHVp8qjurExaNNXhE
 Lv8JeKpDwDfAOKhceWPnTV0UTVyVa0AjTPSXhlbgPJ09ChfCzODczMYJmiaeEomCCo2MQY
 IFxl3r2cFjGpBUKtZgFcMDGMFDXLZHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-joe_Kyp7NDSMF_wJVtqO_w-1; Thu, 08 Apr 2021 16:30:24 -0400
X-MC-Unique: joe_Kyp7NDSMF_wJVtqO_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 747981CBD20
 for <qemu-devel@nongnu.org>; Thu,  8 Apr 2021 19:12:09 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-38.ams2.redhat.com
 [10.36.115.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 956715D9CC;
 Thu,  8 Apr 2021 19:12:01 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, kraxel@redhat.com,
 eblake@redhat.com, armbru@redhat.com, pabeni@redhat.com
Subject: [RFC PATCH 0/5] mptcp support
Date: Thu,  8 Apr 2021 20:11:54 +0100
Message-Id: <20210408191159.133644-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Hi,
  This RFC set adds support for multipath TCP (mptcp),
in particular on the migration path - but should be extensible
to other users.

  Multipath-tcp is a bit like bonding, but at L3; you can use
it to handle failure, but can also use it to split traffic across
multiple interfaces.

  Using a pair of 10Gb interfaces, I've managed to get 19Gbps
(with the only tuning being using huge pages and turning the MTU up).

  It needs a bleeding-edge Linux kernel (in some older ones you get
false accept messages for the subflows), and a C lib that has the
constants defined (as current glibc does).

  To use it you just need to append ,mptcp to an address;

  -incoming tcp:0:4444,mptcp
  migrate -d tcp:192.168.11.20:4444,mptcp

  I had a quick go at trying NBD as well, but I think it needs
some work with the parsing of NBD addresses.

  All comments welcome.

Dave

Dr. David Alan Gilbert (5):
  channel-socket: Only set CLOEXEC if we have space for fds
  io/net-listener: Call the notifier during finalize
  migration: Add cleanup hook for inwards migration
  migration/socket: Close the listener at the end
  sockets: Support multipath TCP

 io/channel-socket.c   |  8 ++++----
 io/dns-resolver.c     |  2 ++
 io/net-listener.c     |  3 +++
 migration/migration.c |  3 +++
 migration/migration.h |  4 ++++
 migration/multifd.c   |  5 +++++
 migration/socket.c    | 24 ++++++++++++++++++------
 qapi/sockets.json     |  5 ++++-
 util/qemu-sockets.c   | 34 ++++++++++++++++++++++++++++++++++
 9 files changed, 77 insertions(+), 11 deletions(-)

-- 
2.31.1


