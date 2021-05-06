Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC59375B5F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 21:04:50 +0200 (CEST)
Received: from localhost ([::1]:40228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lejIn-0002k6-E0
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 15:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lejBG-0005FQ-Fd
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lejBC-0005Ui-QG
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620327416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m5nh9heGzcxXARtpC1cgmy3r4WFYQBXfO3RmqgO9gOo=;
 b=FHj5Z56D3BwKZKGHp0O74klGizIJsbsJgM5jrB80RS00ILtLGb3di5HbqnQVRZXRZTRABV
 bOS6LgAfNSFRnac0L/pwu04Bt6mK+FNQPHaK9AoJA5CuMDgluTC/11qIIeJkpKPR61lu58
 24nCsdm8wNhwgrXO/6y9JrgwsNCgZP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-cpN6B2AAP_ajgFbnNxBN3w-1; Thu, 06 May 2021 14:56:53 -0400
X-MC-Unique: cpN6B2AAP_ajgFbnNxBN3w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 657D91020C2A;
 Thu,  6 May 2021 18:56:52 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-37.ams2.redhat.com
 [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A38B019D9F;
 Thu,  6 May 2021 18:56:43 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, groug@kaod.org, jose.carlos.venegas.munoz@intel.com,
 ma.mandourr@gmail.com
Subject: [PULL 00/12] virtiofs queue
Date: Thu,  6 May 2021 19:56:29 +0100
Message-Id: <20210506185641.284821-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: virtio-fs@redhat.com, vgoyal@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit d90f154867ec0ec22fd719164b88716e8fd48672:

  Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging (2021-05-05 20:29:14 +0100)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20210506

for you to fetch changes up to 67a010f64cc9e33ba19ab389dedaa52013a9de8a:

  virtiofsd/fuse_virtio.c: Changed allocations of locals to GLib (2021-05-06 19:47:44 +0100)

----------------------------------------------------------------
virtiofsd pull 2021-05-06

A pile of cleanups:

  Use of glib allocators from Mahmoud
  Virtio spec compliance and printf cleanup from me.
  Sugar to turn on xattr when defining xattr mapping from Carlos
  an assert cleanup from Greg

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Carlos Venegas (2):
      virtiofsd: Allow use "-o xattrmap" without "-o xattr"
      virtiofsd: Add help for -o xattr-mapping

Dr. David Alan Gilbert (2):
      virtiofs: Fixup printf args
      virtiofsd: Don't assume header layout

Greg Kurz (1):
      virtiofsd: Fix side-effect in assert()

Mahmoud Mandour (7):
      virtiofsd: Changed allocations of fuse_req to GLib functions
      virtiofsd: Changed allocations of iovec to GLib's functions
      virtiofsd: Changed allocations of fuse_session to GLib's functions
      virtiofsd: Changed allocation of lo_map_elems to GLib's functions
      virtiofsd: Changed allocations of fv_VuDev & its internals to GLib functions
      virtiofsd/passthrough_ll.c: Changed local allocations to GLib functions
      virtiofsd/fuse_virtio.c: Changed allocations of locals to GLib

 tools/virtiofsd/fuse_lowlevel.c  |  43 ++++++-------
 tools/virtiofsd/fuse_virtio.c    | 129 ++++++++++++++++++++++++++-------------
 tools/virtiofsd/helper.c         |   3 +
 tools/virtiofsd/passthrough_ll.c |  64 +++++++++----------
 4 files changed, 139 insertions(+), 100 deletions(-)


