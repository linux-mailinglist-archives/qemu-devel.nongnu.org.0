Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D391B05B2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 11:32:05 +0200 (CEST)
Received: from localhost ([::1]:60426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQSma-00084l-T6
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 05:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42174 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1jQSke-0006dU-2g
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 05:30:04 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1jQSka-00072x-PV
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 05:30:03 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42965
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jQSka-00071r-Cx
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 05:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587374999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jD2JVeMkiJjDvHbWXSLL6iHcH/ZZBGgPqL1fR+bLXb8=;
 b=aCv4f985gehGN2AkNEP48AVOIoiyHgLNsJcUK2H38hYOxJvFilZyFLfiqwFNxIWvGVXgzU
 ZXEadXI66Q/gsln1YGOhs2f46NiSWhmO0+x4IUupLa0uu7SIcSXMNmi+7OUKCC18FQmPdk
 8gVxtQAcr2gF5XKgseejNqkfqCm0BB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-XiXcKFn2NvudfFLCTqxwfA-1; Mon, 20 Apr 2020 05:29:57 -0400
X-MC-Unique: XiXcKFn2NvudfFLCTqxwfA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56ED3A0CC1;
 Mon, 20 Apr 2020 09:29:56 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2558F5D9CD;
 Mon, 20 Apr 2020 09:29:52 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] LUKS: Fix error message when underlying fs don't
 support large enough files
Date: Mon, 20 Apr 2020 12:29:50 +0300
Message-Id: <20200420092951.24578-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 03:29:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a repost of the same trivial patch I already, which fell through th=
e cracks.
Could someone queue it up so I close the bugzilla I have for this?

V2: fixed usage of local_err

Best regards,
=09Maxim Levitsky

Maxim Levitsky (1):
  block/crypto: better error message when creating too large files

 block/crypto.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

--=20
2.17.2


