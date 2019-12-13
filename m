Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EEF11E470
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Dec 2019 14:21:20 +0100 (CET)
Received: from localhost ([::1]:49190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifksh-0008Nl-7D
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 08:21:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ifkrI-0007Sq-SL
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 08:19:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ifkrH-0003Vj-Gl
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 08:19:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53361
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ifkr6-0003Mw-RN
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 08:19:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576243180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ef3OKMuWnMNMaiRsD2I//uEIEJ+UWf6C3bTLpURb/nw=;
 b=Shp1UWuHee8b8V9tBNcD8+ikM4vpP6JOWBCMG6/J6SjQxrhsXE1gbRDxyRS5QkQ2o72fUk
 QMqCe0eB4oEl4F1cY8lxFMAlmNeQyw/FzJ/WYMIheok3fQTxJdeHJ6sCfkB8Rc23Mf1T/z
 losSzme8fxCACEuV+Cj4Fw9DGNgVXWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-5lHY-xVCNEWdSVaG9RNFQg-1; Fri, 13 Dec 2019 08:19:36 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EEE29120F;
 Fri, 13 Dec 2019 13:19:35 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.117.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0725A60C05;
 Fri, 13 Dec 2019 13:19:33 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, cota@braap.org,
 rkagan@virtuozzo.com
Subject: [PATCH 0/2] rcu_read auto macro use
Date: Fri, 13 Dec 2019 13:19:29 +0000
Message-Id: <20191213131931.143878-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 5lHY-xVCNEWdSVaG9RNFQg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Hi,
  A couple more uses of the rcu_read macros; in qsp and
hyperv (neither of which list maintainers, so I guess
best through RCU).

The hyperv case saves a temporary.
The qsp case uses an rcu_read_lock around the lifetime
of a snapshot and carefully comments that; but now
it's automatic.

[Hyperv not tested]

Dave

Dr. David Alan Gilbert (2):
  hyperv: Use auto rcu_read macros
  qsp: Use WITH_RCU_READ_LOCK_GUARD

 hw/hyperv/hyperv.c | 22 +++++++++-------------
 util/qsp.c         | 22 ++++++++++------------
 2 files changed, 19 insertions(+), 25 deletions(-)

--=20
2.23.0


