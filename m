Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3120B1F5AF9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 20:07:57 +0200 (CEST)
Received: from localhost ([::1]:35660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj58m-0003ot-7u
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 14:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jj56N-0001i1-RM
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 14:05:27 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50439
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jj56M-0002j8-AW
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 14:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591812325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cVO1H/LJjMhPwy1NjI/LyqOueTTUkrpYCH8Cntq6jQ8=;
 b=YrC6mtEUEZqjSJPGNSoY02wP4xHgo8e0quQK6KpU/GDRjGeacu1QTYq2IbYV9/thQ0eKI/
 hz9+L1qKSCrDYQ8LnV795Hr5HTAMYISPd9SbfTqI4JxkD5A2kF0CMhQ6hXhLUTLJBhNMBd
 pbVeDEwg3TcuwaBRFWl25CfyokkPtFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-ke8n5poxOZenZ-jK0t4Ziw-1; Wed, 10 Jun 2020 14:05:16 -0400
X-MC-Unique: ke8n5poxOZenZ-jK0t4Ziw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D09698014D4
 for <qemu-devel@nongnu.org>; Wed, 10 Jun 2020 18:05:15 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A02EF7A8DD
 for <qemu-devel@nongnu.org>; Wed, 10 Jun 2020 18:05:15 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/3] NBD patches through 2020-06-09
Date: Wed, 10 Jun 2020 13:05:10 -0500
Message-Id: <20200610180514.3751958-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 23:51:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 31d321c2b3574dcc74e9f6411af06bca6b5d10f4:

  Merge remote-tracking branch 'remotes/philmd-gitlab/tags/sparc-next-20200609' into staging (2020-06-09 17:29:47 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2020-06-09-v2

for you to fetch changes up to 5c86bdf1208916ece0b87e1151c9b48ee54faa3e:

  block: Call attention to truncation of long NBD exports (2020-06-10 12:58:59 -0500)

In v2: patch 2 adjusted per review (only sending the changed patch)

----------------------------------------------------------------
NBD patches for 2020-06-09

- fix iotest 194 race
- fix CVE-2020-10761: server DoS from assertion on long NBD error messages

----------------------------------------------------------------
Eric Blake (2):
      nbd/server: Avoid long error message assertions CVE-2020-10761
      block: Call attention to truncation of long NBD exports

Vladimir Sementsov-Ogievskiy (1):
      iotests: 194: wait for migration completion on target too

 block.c                    |  7 +++++--
 block/nbd.c                | 21 +++++++++++++--------
 nbd/server.c               | 23 ++++++++++++++++++++---
 tests/qemu-iotests/143     |  4 ++++
 tests/qemu-iotests/143.out |  2 ++
 tests/qemu-iotests/194     | 10 ++++++++++
 tests/qemu-iotests/194.out |  5 +++++
 7 files changed, 59 insertions(+), 13 deletions(-)

-- 
2.27.0


