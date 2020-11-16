Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D432B5369
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 22:06:47 +0100 (CET)
Received: from localhost ([::1]:47046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keli2-0000Rj-AL
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 16:06:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kelbc-0004MM-OL
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 16:00:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kelbS-0000Ju-Fh
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 16:00:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605560389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZnM32ebrDJ5lGLnqTXO9IDBoKjcQ1VoDEkgAS/GQz9k=;
 b=Qa+iCrq8/5psqCyCIsLeXcmvEs5N4bJWqYTqNDLfZKVtQmdeswJZIKSIe5n82wv7/EJax6
 MDFgIbkk4HNL7eKChMurG+WjGW3FDipkojiawk3VtNZOcGFq88cymXnrzAkO01KRM+2w0E
 ex6hiYb3NWw1TZDcU9C7gX58x9QvLJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-DQVcV_qXNRKNLZzV9QdkdA-1; Mon, 16 Nov 2020 15:59:45 -0500
X-MC-Unique: DQVcV_qXNRKNLZzV9QdkdA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76E8E1084C8B
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 20:59:44 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4442B19C66
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 20:59:44 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] NBD patches for -rc2, 2020-11-16
Date: Mon, 16 Nov 2020 14:59:40 -0600
Message-Id: <20201116205942.109534-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit cb5ed407a1ddadf788fd373fed41c87c9e81e5b0:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2020-11-15' into staging (2020-11-16 17:00:36 +0000)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2020-11-16

for you to fetch changes up to 2f3c1fd39668b9e565a4e0ba1d62ff5db05d62a5:

  iotests: Replace deprecated ConfigParser.readfp() (2020-11-16 14:51:12 -0600)

----------------------------------------------------------------
nbd patches for 2020-11-16

- silence Coverity false positive
- modernize iotests python code related to nbd

----------------------------------------------------------------
Eric Blake (1):
      nbd: Silence Coverity false positive

Kevin Wolf (1):
      iotests: Replace deprecated ConfigParser.readfp()

 nbd/server.c                             | 4 ++--
 tests/qemu-iotests/nbd-fault-injector.py | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.28.0


