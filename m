Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBBC40BF53
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 07:31:48 +0200 (CEST)
Received: from localhost ([::1]:36570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQNWN-0003ix-4N
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 01:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQNUz-0002wA-Mj
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 01:30:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQNUv-0007tP-Tr
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 01:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631683815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YqoGOwO3DehUqHyctvzYUoO0vYxF97HGptURqN1AQsQ=;
 b=i0ed1z2xDdJeMgkmDpIIW1uc7DlJvtTGUShFLGtU0fkFKbskXqas698hEj1PwiPqzjxZgb
 yWbGRQmALi9kNHXAD7T+kQeoylEoWOQ85PHK846ELpdtNhwmjnBBPVwc34RYzux4OMBal2
 cOooh9eu5jGEtwWcZQeebD5JqP+Oxxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-lNk7IyuBPjyojveEhjt-LA-1; Wed, 15 Sep 2021 01:30:13 -0400
X-MC-Unique: lNk7IyuBPjyojveEhjt-LA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E14F3800FF4;
 Wed, 15 Sep 2021 05:30:12 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1007C19736;
 Wed, 15 Sep 2021 05:30:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] Update check-python-tox test for pylint 2.10
Date: Wed, 15 Sep 2021 01:30:10 -0400
Message-Id: <20210915053011.293335-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 G S Niteesh Babu <niteesh.gs@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

V2: It's not safe to use sys.stderr.encoding to determine a "console=0D
encoding", because that uses the "current" stderr and not a=0D
hypothetically generic one -- and doing this causes the acceptance tests=0D
to fail.=0D
=0D
Use UTF-8 instead.=0D
=0D
Question: What encoding do terminal programs use? Is there an inherent=0D
encoding to fprintf et al, or does it just push whatever bytes you put=0D
into it straight into the stdout/stderr pipe?=0D
=0D
John Snow (1):=0D
  python: Update for pylint 2.10=0D
=0D
 python/qemu/machine/machine.py | 3 ++-=0D
 python/setup.cfg               | 1 +=0D
 2 files changed, 3 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


