Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECED40DBF1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 15:57:51 +0200 (CEST)
Received: from localhost ([::1]:51848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQrte-0004bp-5C
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 09:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQrp5-0006hz-GJ
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:53:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQrp1-0007ax-SE
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631800382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S+GgqUqG86t8WX2+YEOSL2OsLKrPA5E5KckEED4W9yA=;
 b=W4srM372z/FNwbWW7G6xSHEqlwXqXWWiOgepByN9Kw7BQln8ARaSf6Xgoi2X0fVe1stxb9
 0ftNYk3f7BRhraXQg51o1Jfi/Tlrkiyw/heips3WsVv4dTA+n7UBrY9CcQBDU5gDStkPSo
 2QIyeQn82i4p0cCcCxo2PUZW50G+/4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-C15L_-eDMKmZYvauXp3E1w-1; Thu, 16 Sep 2021 09:53:01 -0400
X-MC-Unique: C15L_-eDMKmZYvauXp3E1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A665F1010E18
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 13:53:00 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.194.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5283919736;
 Thu, 16 Sep 2021 13:52:46 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, slp@redhat.com, thuth@redhat.com
Subject: [PULL 0/2] virtiofs queue
Date: Thu, 16 Sep 2021 14:52:39 +0100
Message-Id: <20210916135241.150566-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 57b6f58c1d0df757c9311496c32d502925056894:

  Merge remote-tracking branch 'remotes/hreitz/tags/pull-block-2021-09-15' into staging (2021-09-15 18:55:59 +0100)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20210916

for you to fetch changes up to 046d91c83caac29e2ba26c63fd7d685a57463f6d:

  virtiofsd: Reverse req_list before processing it (2021-09-16 14:50:48 +0100)

----------------------------------------------------------------
virtiofsd pull 2021-08-16

Two minor fixes; one for performance, the other seccomp
on s390x.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Sergio Lopez (1):
      virtiofsd: Reverse req_list before processing it

Thomas Huth (1):
      tools/virtiofsd: Add fstatfs64 syscall to the seccomp allowlist

 tools/virtiofsd/fuse_virtio.c         | 1 +
 tools/virtiofsd/passthrough_seccomp.c | 1 +
 2 files changed, 2 insertions(+)


