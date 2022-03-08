Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0214D0DAE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 02:49:03 +0100 (CET)
Received: from localhost ([::1]:48292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nROyE-0002yt-Gi
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 20:49:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nROtq-0008Tq-OX
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:44:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nROtn-0006LU-ML
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646703867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PXDTZU21xbh6gR8bH7FuT3K/VH1ZkwS3Exw6SntXaMQ=;
 b=TzqP+IJYfu0e6j1cva+B4AOOr4M9efzFapuFYLVspi3S6lNEJ7s7oaQctEjuag8nPJ9jcC
 /wiH/o7Aq76SCFPPm/pP14EQxMfbZ5b/5AJY9DAcrBPW724vyIhGFMWYxFy/R6oV+s2tBL
 sc+CBxtOa48vVxxZUrYVe9eRvw6xclY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-F1IFr019OBKXBlVXlgKjBQ-1; Mon, 07 Mar 2022 20:44:23 -0500
X-MC-Unique: F1IFr019OBKXBlVXlgKjBQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CD052F35
 for <qemu-devel@nongnu.org>; Tue,  8 Mar 2022 01:44:22 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39AB945C87
 for <qemu-devel@nongnu.org>; Tue,  8 Mar 2022 01:44:22 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/15] NBD patches for 7.0-rc0
Date: Mon,  7 Mar 2022 19:44:04 -0600
Message-Id: <20220308014419.3056549-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit b49872aa8fc0f3f5a3036cc37aa2cb5c92866f33:

  Merge remote-tracking branch 'remotes/hreitz-gitlab/tags/pull-block-2022-03-07' into staging (2022-03-07 17:14:09 +0000)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2022-03-07

for you to fetch changes up to 395aecd037dc35d110b8e1e8cc7d20c1082894b5:

  qemu-io: Allow larger write zeroes under no fallback (2022-03-07 19:28:00 -0600)

I'm also trying to get v3 patches posted for my NBD_CAN_MULTI_CONN
patch series, but given the close proximity of soft freeze, getting
that into 7.0 may not be feasible.

----------------------------------------------------------------
nbd patches for 2022-03-07

- Dan Berrange: Allow qemu-nbd to support TLS over Unix sockets
- Eric Blake: Minor cleanups related to 64-bit block operations

----------------------------------------------------------------
Daniel P. Berrangé (12):
      crypto: mandate a hostname when checking x509 creds on a client
      block: pass desired TLS hostname through from block driver client
      block/nbd: support override of hostname for TLS certificate validation
      qemu-nbd: add --tls-hostname option for TLS certificate validation
      block/nbd: don't restrict TLS usage to IP sockets
      tests/qemu-iotests: add QEMU_IOTESTS_REGEN=1 to update reference file
      tests/qemu-iotests: expand _filter_nbd rules
      tests/qemu-iotests: introduce filter for qemu-nbd export list
      tests/qemu-iotests: convert NBD TLS test to use standard filters
      tests/qemu-iotests: validate NBD TLS with hostname mismatch
      tests/qemu-iotests: validate NBD TLS with UNIX sockets
      tests/qemu-iotests: validate NBD TLS with UNIX sockets and PSK

Eric Blake (3):
      nbd/server: Minor cleanups
      qemu-io: Utilize 64-bit status during map
      qemu-io: Allow larger write zeroes under no fallback

 docs/tools/qemu-nbd.rst          | 13 ++++++
 qapi/block-core.json             |  3 ++
 include/block/nbd.h              |  3 +-
 block/nbd.c                      | 25 ++++++----
 blockdev-nbd.c                   |  6 ---
 crypto/tlssession.c              |  6 +++
 nbd/client-connection.c          | 12 +++--
 nbd/server.c                     | 13 +++---
 qemu-io-cmds.c                   | 16 ++-----
 qemu-nbd.c                       | 25 +++++++---
 tests/qemu-iotests/common.filter |  9 ++++
 tests/qemu-iotests/common.tls    | 31 +++++++++++--
 tests/qemu-iotests/233           | 99 ++++++++++++++++++++++++++++++++++------
 tests/qemu-iotests/233.out       | 58 +++++++++++++++++++----
 tests/qemu-iotests/241           |  6 +--
 tests/qemu-iotests/241.out       |  6 +++
 tests/qemu-iotests/testrunner.py |  6 +++
 17 files changed, 268 insertions(+), 69 deletions(-)

-- 
2.35.1


