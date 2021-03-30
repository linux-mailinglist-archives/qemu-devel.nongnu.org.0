Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CAD34EF57
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 19:24:36 +0200 (CEST)
Received: from localhost ([::1]:60102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRI6V-0005qn-Fd
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 13:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lRI1D-0000J6-Cs
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:19:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lRI10-0003Wb-5O
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617124730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=I7PZ8JIAvpxFAxJRWdQxnAtYwCXgDXzeYB8T5+GpxXI=;
 b=DVifgZGiSkWqOKnqrqaPeog1OAICW4T0Mp3TSnLOyvrEDPGHrBw2QTt3iTiOmAvEHa4Lvb
 L3O1wjkemyXPXqEZeh0oiusuPL9D1NIE5GkwxLn6pDb5JUvQacwCUJeveqTnqzd6yfJ7jc
 h8/vkNUD0w4qPyNaQ0YwbJ/QMGProiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-3diDUgweOGSyLJAelQz2dA-1; Tue, 30 Mar 2021 13:18:47 -0400
X-MC-Unique: 3diDUgweOGSyLJAelQz2dA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E2A3108BD06;
 Tue, 30 Mar 2021 17:18:46 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B561A60861;
 Tue, 30 Mar 2021 17:18:45 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 0/8] qapi: static typing conversion, pt4
Date: Tue, 30 Mar 2021 13:18:36 -0400
Message-Id: <20210330171844.1197918-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, this series adds static type hints to the QAPI module.=0D
This is part four, and focuses on error.py.=0D
=0D
Part 4: https://gitlab.com/jsnow/qemu/-/tree/python-qapi-cleanup-pt4=0D
=0D
Requirements:=0D
- Python 3.6+=0D
- mypy >=3D 0.770=0D
- pylint >=3D 2.6.0 (2.7.0+ when using Python 3.9+)=0D
=0D
Every commit should pass with:=0D
 - isort -c qapi/=0D
 - flake8 qapi/=0D
 - pylint --rcfile=3Dqapi/pylintrc qapi/=0D
 - mypy --config-file=3Dqapi/mypy.ini qapi/=0D
=0D
John Snow (8):=0D
  qapi/error: Repurpose QAPIError as a generic exception base class=0D
  qapi/error: Use Python3-style super()=0D
  qapi/error: Make QAPISourceError 'col' parameter optional=0D
  qapi/error: Change assertion=0D
  qapi/error.py: move QAPIParseError to parser.py=0D
  qapi/error.py: enable pylint checks=0D
  qapi/error: Add type hints=0D
  qapi/error.py: enable mypy checks=0D
=0D
 docs/sphinx/qapidoc.py |  3 ++-=0D
 scripts/qapi/error.py  | 37 +++++++++++++++++++------------------=0D
 scripts/qapi/mypy.ini  |  5 -----=0D
 scripts/qapi/parser.py | 14 +++++++++++++-=0D
 scripts/qapi/pylintrc  |  3 +--=0D
 scripts/qapi/schema.py |  4 ++--=0D
 6 files changed, 37 insertions(+), 29 deletions(-)=0D
=0D
--=20=0D
2.30.2=0D
=0D


