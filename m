Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2ED458FF1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:05:27 +0100 (CET)
Received: from localhost ([::1]:43060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp9wk-0003hD-6h
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:05:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mp9to-0001PC-Ih
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:02:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mp9tk-0006ED-Mp
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:02:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637589740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1Xj8SXSSVDrdA5i87ZZXjqe2HQJ71f+RhbDtb1kw1I0=;
 b=gQgXEimAu5A1GG8lr3G0AxUtvl8uxxyZ0aRTkNfLfqZr385hM04okOUPBrX6tQXaZvIZ7l
 gYoCJ5KeW6Eippb7lnd3QL9mex4X2vTILsf8PHXkypXStDJjG7/zyNlTGu1s2vPbcaJgeC
 igPGk/ZLLY21ff37umV0YbNssSoFmE8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-YWTAWf9fMhCiHpOb0ZoqSA-1; Mon, 22 Nov 2021 09:02:15 -0500
X-MC-Unique: YWTAWf9fMhCiHpOb0ZoqSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5919E84B9FF
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 14:02:14 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27B7560862
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 14:02:14 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] NBD patches for 6.2-rc2, 2021-11-22
Date: Mon, 22 Nov 2021 08:02:10 -0600
Message-Id: <20211122140212.1511814-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The following changes since commit 49aaac3548bc5a4632a14de939d5312b28dc1ba2:

  Merge tag 'linux-user-for-6.2-pull-request' of git://github.com/vivier/qemu into staging (2021-11-22 10:33:13 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-11-22

for you to fetch changes up to e35574226a63f29e32eda8da5cc14832f19850e2:

  nbd/server: Simplify zero and trim (2021-11-22 07:37:15 -0600)

----------------------------------------------------------------
nbd patches for 2021-11-22

- Eric Blake: Avoid uninitialized memory on client hard disconnect
- Eric Blake: Take advantage of block layer 64-bit zero/trim

----------------------------------------------------------------
Eric Blake (2):
      nbd/server: Don't complain on certain client disconnects
      nbd/server: Simplify zero and trim

 nbd/server.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

-- 
2.33.1


