Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF74A32D0FC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:41:11 +0100 (CET)
Received: from localhost ([::1]:48448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHlPq-0000h2-Ug
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:41:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lHlNv-0007l8-RY
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:39:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lHlNr-0003Jv-91
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:39:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614854346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/lsYl456KUx94r1uw6i6kgZgWVSqLd6xuHgzHYIO0aw=;
 b=J/S6hL3zs6aknzjtwBPLFsyEw9XF0rqzsI4HTfu+bglingBKRYtbOLTdFhRlvwhxTitjpK
 olxYcfQRy+QDh2zR2hGNHQEMvDYA+TUWitoDPw+sstToC5MSD5rZhDZtAkrvx3O7+IV3nP
 41j17VovCYN6xeGZYnjZTbudUXyjqK0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-wtIIny1bPKOek-_urQE4Mw-1; Thu, 04 Mar 2021 05:39:04 -0500
X-MC-Unique: wtIIny1bPKOek-_urQE4Mw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED2281005588
 for <qemu-devel@nongnu.org>; Thu,  4 Mar 2021 10:39:03 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-208.ams2.redhat.com
 [10.36.114.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94F6E39A70;
 Thu,  4 Mar 2021 10:38:59 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] virtiofs queue (minor security)
Date: Thu,  4 Mar 2021 10:38:57 +0000
Message-Id: <20210304103858.38400-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
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
Cc: mcascell@redhat.com, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit c40ae5a3ee387b13116948cbfe7824f03311db7e:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-03-03 16:55:15 +0000)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20210304

for you to fetch changes up to e586edcb410543768ef009eaa22a2d9dd4a53846:

  virtiofs: drop remapped security.capability xattr as needed (2021-03-04 10:26:16 +0000)

----------------------------------------------------------------
virtiofs minor security fix

Fix xattrmap to drop remapped security.capability capabilities.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Dr. David Alan Gilbert (1):
      virtiofs: drop remapped security.capability xattr as needed

 docs/tools/virtiofsd.rst         |  4 +++
 tools/virtiofsd/passthrough_ll.c | 77 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 80 insertions(+), 1 deletion(-)


