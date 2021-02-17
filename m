Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC82231E304
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:33:26 +0100 (CET)
Received: from localhost ([::1]:55068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWJx-0004FT-Ev
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lCWHq-0003Jw-58
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:31:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lCWHn-0001wZ-00
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:31:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613604668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hTwaqpagcUSWCcIQFajzWjo4kHwK4AD9KT+fBm+dNcY=;
 b=EkHUKD4Bu8//+tAPQQbCPPQfsB48OwXU6gpPLxb7G8MRMf4FOlegbWwjEoWFuFvTQNitok
 9qrzotZkWx/tdaiZ6oHojHXg0t7GCoEKKnnq0fg+iJVT0Z0Huii74tTzlw/8NxvLETfahA
 RxwjvKSz+1tLiRa1HP97QmYevvWJ07A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-DSOWF6gDNNij4Wb6GgDChQ-1; Wed, 17 Feb 2021 18:31:06 -0500
X-MC-Unique: DSOWF6gDNNij4Wb6GgDChQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B04D0801989;
 Wed, 17 Feb 2021 23:31:05 +0000 (UTC)
Received: from horse.redhat.com (ovpn-114-123.rdu2.redhat.com [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EB485D9C2;
 Wed, 17 Feb 2021 23:30:58 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id E43D6220BCF; Wed, 17 Feb 2021 18:30:57 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v2 0/3] virtiofsd: Add options to enable/disable posix acl
Date: Wed, 17 Feb 2021 18:30:43 -0500
Message-Id: <20210217233046.81418-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
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
Cc: lhenriques@suse.de, stefanha@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com, miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is V2 of the patches. Changes since v1 are.

- Rebased on top of latest master.
- Took care of Miklos's comments to block acl xattrs if user
  explicitly disabled posix acl.

Luis Henriques reported that fstest generic/099 fails with virtiofs.
Little debugging showed that we don't enable acl support. So this
patch series provides option to enable/disable posix acl support. By
default it is disabled.

I have run blogbench and pjdfstests with posix acl enabled and
things work fine.

Luis, can you please apply these patches, and run virtiofsd with
"-o posix_acl" and see if it fixes the failure you are seeing. I
ran the steps you provided manually and it fixes the issue for
me.

Vivek Goyal (3):
  virtiofsd: Add an option to enable/disable posix acls
  virtiofsd: Add umask to seccom allow list
  virtiofsd: Change umask if posix acls are enabled

 tools/virtiofsd/passthrough_ll.c      | 119 ++++++++++++++++++++++++--
 tools/virtiofsd/passthrough_seccomp.c |   1 +
 2 files changed, 113 insertions(+), 7 deletions(-)

-- 
2.25.4


