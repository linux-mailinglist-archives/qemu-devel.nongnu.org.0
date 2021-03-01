Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35B6328275
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 16:30:03 +0100 (CET)
Received: from localhost ([::1]:40604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGkUk-0007m4-1w
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 10:30:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGkTf-0006PT-0o
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:28:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGkTa-0000UQ-7n
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614612528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UAuiBHavZooHxnN7LWCPw/E7MZ3mA7Pt1E38NfgHBos=;
 b=eWth13szy13GvHfiNoQMg2gxQsfh8VCJ1BT4OV70TSfg8bwH6bN9iBJcyAhd/mVvpvzBYh
 oI6JbIsyzpLvp4i73QS2Hg/ZlXd6CjErUkZu6wUAxLUl5oXLzE+MUyMLf5BGIWiWhKgWeb
 fhp1z/CpH8jozUGXqXaFSb9PagIRUAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-j65lawNuO22BZOsAte9s1A-1; Mon, 01 Mar 2021 10:28:46 -0500
X-MC-Unique: j65lawNuO22BZOsAte9s1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 956C7801976;
 Mon,  1 Mar 2021 15:28:45 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 217305C1D1;
 Mon,  1 Mar 2021 15:28:44 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] storage-daemon: include current command line option in
 the errors
Date: Mon,  1 Mar 2021 10:28:42 -0500
Message-Id: <20210301152844.291799-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the location management facilities that the emulator uses, so that
the current command line option appears in the error message.

Before:

  $ storage-daemon/qemu-storage-daemon --nbd key..=
  qemu-storage-daemon: Invalid parameter 'key..'

After:

  $ storage-daemon/qemu-storage-daemon --nbd key..=
  qemu-storage-daemon: --nbd key..=: Invalid parameter 'key..'

The first patch tweaks the command line parsing so that argv is
not reordered by getopt_long and optind is only advanced by one
option+argument on every call to getopt_long.  This is required
by loc_set_cmdline.

Paolo Bonzini (2):
  storage-daemon: report unexpected arguments on the fly
  storage-daemon: include current command line option in the errors

 storage-daemon/qemu-storage-daemon.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

-- 
2.26.2


