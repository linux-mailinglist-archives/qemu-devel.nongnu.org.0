Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B1720BA45
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 22:25:18 +0200 (CEST)
Received: from localhost ([::1]:37328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jouuT-000625-PB
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 16:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1joutE-0004QV-BA
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 16:24:00 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34355
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1joutC-0008Ff-1a
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 16:24:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593203036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SVvKCFoGwOD71puzg6ZUTJeche6NQoxUQ/4utWYEjyI=;
 b=XizMBYFLtksDWXFoTATPETjj6PzjNti566LBVGDWU3f8Pqafe9D89dYqD6i5M57WLlssOh
 zJuuBzyUQ2L+CxY6rHBufSzzRG72BY4BNAhtRAkbFkurvWUzGtvJqmdRQVXb2EB/Mh8Zxa
 uvtmtyaQYp2MnVqQ241rmPIs4s8V3ng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-DK-2LhApN4ScT7EdYLPkvw-1; Fri, 26 Jun 2020 16:23:52 -0400
X-MC-Unique: DK-2LhApN4ScT7EdYLPkvw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B24C804001
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 20:23:51 +0000 (UTC)
Received: from probe.redhat.com (ovpn-119-184.rdu2.redhat.com [10.10.119.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76D2271671;
 Fri, 26 Jun 2020 20:23:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] python/machine.py: refactor shutdown
Date: Fri, 26 Jun 2020 16:23:47 -0400
Message-Id: <20200626202350.11060-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 03:23:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, Eduardo Habkost <ehabkost@redhat.com>, philmd@redhat.com,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v4:

001/3:[----] [--] 'python/machine.py: consolidate _post_shutdown()'
002/3:[0010] [FC] 'python/machine.py: refactor shutdown'
003/3:[----] [--] 'python/machine.py: re-add sigkill warning suppression'

- Rebased
- Fixed exception handler to actually handle exception :(

v3:
 - Split _post_shutdown refactor into own patch (now 1/3)
 - Re-add sigkill warning squelch (now 3/3)

Applies straight to origin/master, ought to pass pylint and flake8:

> cd ~/src/qemu/python/qemu
> pylint *.py
> flake8 *.py

John Snow (3):
  python/machine.py: consolidate _post_shutdown()
  python/machine.py: refactor shutdown
  python/machine.py: re-add sigkill warning suppression

 python/qemu/machine.py | 108 ++++++++++++++++++++++++++++++-----------
 1 file changed, 79 insertions(+), 29 deletions(-)

-- 
2.21.3


