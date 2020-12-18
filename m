Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4DD2DEAAE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 22:01:51 +0100 (CET)
Received: from localhost ([::1]:44042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqMso-0001bX-QX
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 16:01:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqMlY-00010g-GW
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:54:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqMlV-0002u6-1s
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:54:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608324856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8G7rK1+9CMAm0lbNyoSKVAwFiR91RgEkGOevG1efrgQ=;
 b=GRQrliFIZs6grn0TmTGUKugpuCCan9mr2iSm5AxU83Di+8KJ2fj7gXFgQMZoMnfBZ2RXN8
 a3ZsuyPY+Mx7tk2AE1Tj6Mautm4hdE+TJsm95PGN/bVDPQtOhI/azc5kyoVXnE8hdEGHc2
 7apXb4ggiH+81zt+9poS5iTBLAf1TjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-HlTN3LuQPBCPrWpD6GATKQ-1; Fri, 18 Dec 2020 15:54:14 -0500
X-MC-Unique: HlTN3LuQPBCPrWpD6GATKQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81C8E801817
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 20:54:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79C5810013C0;
 Fri, 18 Dec 2020 20:54:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CBE0A1130358; Fri, 18 Dec 2020 21:54:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] Drop support for QAPIGen without a file name
Date: Fri, 18 Dec 2020 21:53:56 +0100
Message-Id: <20201218205407.1326907-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, ehabkost@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow posted

    [PATCH 09/12] qapi/gen: move write method to QAPIGenC, make fname a str

    QAPIGenC and QAPIGenH in particular depend on fname being defined, but
    we have a usage of QAPIGenCCode that isn't intended to be associated
    with a particular file.

    No problem, move the write method down to the class that actually needs
    it, and keep QAPIGenCCode more abstract.

    Signed-off-by: John Snow <jsnow@redhat.com>
    ---
     scripts/qapi/commands.py |  2 +-
     scripts/qapi/gen.py      | 54 ++++++++++++++++++++--------------------
     2 files changed, 28 insertions(+), 28 deletions(-)

There is just one user of QAPIGen without a file name, and it's
awkward.  Let's get rid of it.

Since my work to get rid of it depends on parts of John's series, and
I'm pressed for time, I include the parts I need in my series.  John,
feel free to pick this into your complete series.

John Snow (6):
  qapi/commands: assert arg_type is not None
  qapi/events: fix visit_event typing
  qapi/main: handle theoretical None-return from re.match()
  qapi/gen: assert that _start_if is not None in _wrap_ifcond
  qapi/gen: use './builtin' for the built-in module name
  qapi/gen: write _genc/_genh access shims

Markus Armbruster (5):
  qapi/gen: Replace ._begin_system_module()
  qapi/gen: Expose a single module name space
  qapi/gen: Support for switching to another module temporarily
  qapi/commands: Simplify command registry generation
  qapi/gen: Drop support for QAPIGen without a file name

 scripts/qapi/commands.py | 60 ++++++++++++++++-----------------
 scripts/qapi/events.py   | 14 ++++----
 scripts/qapi/gen.py      | 72 +++++++++++++++++++++++-----------------
 scripts/qapi/main.py     |  2 ++
 scripts/qapi/types.py    |  2 +-
 scripts/qapi/visit.py    |  2 +-
 6 files changed, 82 insertions(+), 70 deletions(-)

-- 
2.26.2


