Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B15572C04FF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:55:03 +0100 (CET)
Received: from localhost ([::1]:55388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAQt-00042H-Qw
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:54:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1khAO5-0000Ow-4v
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:52:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1khAO2-00061h-Vn
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606132321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type;
 bh=XpECvjoskDsyKWctuB5Q4B9mj/zE5rbCdex2zQ3lu/w=;
 b=b+C9AdaJNn7JwnM3Nl0Nqo1sdp1lhzrx2gL4EhKqXkEpq4AjdDgmkPsI6rKZgGAyXqBhBN
 z3rfCFEzCXXUjvjLyQWoPS7taZZnxkQnT7JBIy6Q54Vl19v99kIKUNK+gTwrluWXR8q74a
 3chcGrNfYbR/kH3eu2vlA1XaGHwTYxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-nFoyypwdO2ajfmHHGwzjLQ-1; Mon, 23 Nov 2020 06:51:59 -0500
X-MC-Unique: nFoyypwdO2ajfmHHGwzjLQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 780ED802B56;
 Mon, 23 Nov 2020 11:51:58 +0000 (UTC)
Received: from thuth.com (ovpn-113-17.ams2.redhat.com [10.36.113.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D39419746;
 Mon, 23 Nov 2020 11:51:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/3] s390-ccw bios reboot fixes
Date: Mon, 23 Nov 2020 12:51:52 +0100
Message-Id: <20201123115155.232335-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

 Hi Peter,

the following changes since commit 8cc30eb1400fc01f2b139cdd3dc524f8b84dbe07:

  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20201122' into staging (2020-11-22 15:02:52 +0000)

are available in the Git repository at:

  https://gitlab.com/huth/qemu.git tags/pull-request-2020-11-23

for you to fetch changes up to 7a3d37a3f2335e18539e821d0c72abe0b22480bd:

  pc-bios/s390: Update the s390-ccw bios binaries (2020-11-23 10:16:09 +0100)

CI runs:

  https://gitlab.com/huth/qemu/-/pipelines/219883736
  https://travis-ci.com/github/huth/qemu/builds/203497483

----------------------------------------------------------------
* Two reboot fixes for the s390-ccw bios
----------------------------------------------------------------

Eric Farman (2):
      pc-bios: s390x: Ensure Read IPL memory is clean
      pc-bios: s390x: Clear out leftover S390EP string

Thomas Huth (1):
      pc-bios/s390: Update the s390-ccw bios binaries

 pc-bios/s390-ccw.img         | Bin 46704 -> 42608 bytes
 pc-bios/s390-ccw/dasd-ipl.c  |   3 +++
 pc-bios/s390-ccw/jump2ipl.c  |   2 +-
 pc-bios/s390-ccw/main.c      |   6 ++++++
 pc-bios/s390-ccw/s390-arch.h |   3 +++
 pc-bios/s390-netboot.img     | Bin 71328 -> 67232 bytes
 6 files changed, 13 insertions(+), 1 deletion(-)


