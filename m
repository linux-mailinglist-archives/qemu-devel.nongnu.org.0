Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF833152D8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:31:05 +0100 (CET)
Received: from localhost ([::1]:36340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Uym-0006Uq-VL
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9Uvu-0005Ht-8X
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:28:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9Uvs-0003nk-JL
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:28:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612884483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7zC0Zkzhfl93Yh/SvTXIV0vxa8IK9wAAoKWwz6tiy5o=;
 b=jDsoNZF4WEvtpQjYtRO6gvgwTkMvNqnZG/grf1SGq74H6ybNlNjgCAOgZ//tQbCIe0BJSq
 +NtGoBCWJdmv2EOizfiwlcEyrMoWfPfmcfivtgt/lypbMIWsP7tgFe13oUyLkXNLu9TPqm
 kQjArp0UEZfs7cOCNSdEHNhvVlxt5to=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-8ZaumoUOPgW96Ljod7bUnA-1; Tue, 09 Feb 2021 10:28:02 -0500
X-MC-Unique: 8ZaumoUOPgW96Ljod7bUnA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53CC4100CCE5;
 Tue,  9 Feb 2021 15:28:00 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8F1A5D730;
 Tue,  9 Feb 2021 15:27:59 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] NBD socket backlog
Date: Tue,  9 Feb 2021 09:27:57 -0600
Message-Id: <20210209152759.209074-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: nsoffer@redhat.com, berrange@redhat.com, rjones@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

in v2:
- also adjust backlog of QMP nbd-server-start [Dan]
- tweak qemu-nbd backlog to -e when not persistent [Nir]
- allow qemu-nbd -e0 for symmetry with QMP [new patch 2]

Eric Blake (2):
  qemu-nbd: Use SOMAXCONN for socket listen() backlog
  qemu-nbd: Permit --shared=0 for unlimited clients

 docs/tools/qemu-nbd.rst |  4 ++--
 blockdev-nbd.c          |  7 ++++++-
 qemu-nbd.c              | 15 +++++++++++----
 3 files changed, 19 insertions(+), 7 deletions(-)

-- 
2.30.0


