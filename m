Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5C435E360
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:02:10 +0200 (CEST)
Received: from localhost ([::1]:51900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLUP-0006Lp-Sx
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lWLOb-0001Qn-FX
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:56:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lWLOX-0000BA-9o
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618329364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mkf9qx30D2F5oIiW6Apw7mMkxuT36rJAl6jjUAlE2m8=;
 b=c8RY8RgkaLCv+3EexavroQTsJUO7RvD1JQUZL8d+oUrJ2G5WV8U+qapqj7TOkbFkUFivAL
 ggXrDUJ+Ykcg7vk1Vp9EMBc4/T3Z7dyLZ7bzPaVOi1LNS7beoJgVa/kqTnzHwvV2Z4yI9P
 AnYbM4tTRotb2HLkaFLvvUP08qetgdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-4pnRDm-5PBuf5A0n3vpWXQ-1; Tue, 13 Apr 2021 11:55:59 -0400
X-MC-Unique: 4pnRDm-5PBuf5A0n3vpWXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 736CF1020C21
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 15:55:58 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 696D560DA0;
 Tue, 13 Apr 2021 15:55:54 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 0/7] RFC: Asynchronous QMP Draft
Date: Tue, 13 Apr 2021 11:55:46 -0400
Message-Id: <20210413155553.2660523-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: crosa@redhat.com, John Snow <jsnow@redhat.com>, ehabkost@redhat.com,
 stefanha@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Does not apply to the QEMU tree; this is against a blank repository.)=0D
=0D
Hi! This is a Draft RFC for an asyncio-based Python library that=0D
implements a QMP client. The intent is to eventually publish this=0D
library directly to PyPI, so the design focus of this library is to be=0D
"useful" instead of providing as low-level an interface as possible.=0D
=0D
I am sending this to solicit general, high-level design feedback on the=0D
overal layout and approach. Many minor details are still left to be=0D
implemented, and a lot of the docstrings and documentation need to be=0D
audited to make sure they still apply as I've shuffled things around a=0D
lot in the course of development.=0D
=0D
There are some pretty notable things missing still; in particular I need=0D
to develop an Event API (there is a tiny stub added as a hack, but it's=0D
very simplistic), and I also need to develop a sync bridge so that this=0D
library could be used in existing iotests if we eventually expect to=0D
replace the old QMP library with this one.=0D
=0D
Scattered throughout these files are "RFC" comments and other "FIXME"=0D
and "TODO" items where I've tried to stub out some of the things I am=0D
still unsure of.=0D
=0D
Thanks!=0D
=0D
John Snow (7):=0D
  util: asyncio-related helpers=0D
  error: Error classes and so on.=0D
  protocol: generic async message-based protocol loop=0D
  message: add QMP Message type=0D
  models: Add well-known QMP objects=0D
  qmp_protocol: add QMP client implementation=0D
  linter config=0D
=0D
 .flake8         |   2 +=0D
 error.py        | 163 +++++++++++=0D
 message.py      | 196 ++++++++++++++=0D
 models.py       | 177 ++++++++++++=0D
 protocol.py     | 704 ++++++++++++++++++++++++++++++++++++++++++++++++=0D
 pylintrc        |  53 ++++=0D
 qmp_protocol.py | 420 +++++++++++++++++++++++++++++=0D
 util.py         |  87 ++++++=0D
 8 files changed, 1802 insertions(+)=0D
 create mode 100644 .flake8=0D
 create mode 100644 error.py=0D
 create mode 100644 message.py=0D
 create mode 100644 models.py=0D
 create mode 100644 protocol.py=0D
 create mode 100644 pylintrc=0D
 create mode 100644 qmp_protocol.py=0D
 create mode 100644 util.py=0D
=0D
--=20=0D
2.30.2=0D
=0D


