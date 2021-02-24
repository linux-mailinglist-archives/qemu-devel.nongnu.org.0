Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856EA3242EF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 18:11:31 +0100 (CET)
Received: from localhost ([::1]:50940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lExhC-0004xa-FS
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 12:11:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lExVV-00041j-6M
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:59:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lExVT-0007Rq-GJ
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614185962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZOJojp25sO+FV0aZ+uT1+InEwXSznG86opF3CSgxubA=;
 b=auilFU8+O7VMA+U4P25GvpWPujPtTKllg/4l8Abt5eOfgPgqcP5caeP1q6XLvqBBLbR4te
 /yBT2IkbKCTtwraCO8yviMHFgB9dvOHPwOt16G1v+KsEq7XJR89QQ7fc4LhMpZ81o5wki8
 c6+l+RK99wAOhA8Eu//EZjsiyfBkB2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-EMDrCEOhOs2L4sRzv0H96g-1; Wed, 24 Feb 2021 11:59:19 -0500
X-MC-Unique: EMDrCEOhOs2L4sRzv0H96g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AAD0AFA91;
 Wed, 24 Feb 2021 16:59:17 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-86.rdu2.redhat.com [10.10.115.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D382019D9F;
 Wed, 24 Feb 2021 16:59:10 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 6296822054F; Wed, 24 Feb 2021 11:59:10 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v4 0/3] virtiofsd: Add support to enable/disable posix acls
Date: Wed, 24 Feb 2021 11:58:34 -0500
Message-Id: <20210224165837.21983-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This is V4 of patches.

In V3 I enabled posix_acl by default. Then I tested with cache=none and
a simple "cat foo.txt" results in two extra GETXATTR(system.posix_acl)
calls. (Note, this happens only if caller is not owner of file). And
this happens on every call of "cat foo.txt" because cache=none does
not cache anything in guest.

So this make me rethink the idea of enabling posix_acl by default. I
prefer not to have any performance regressions in any of the mode
out of the box.

Hence proposing this V4 where posix_acls are disabled by default and
user needs to enable it explicitly if the want posix acls. This probably
can change down the line once somebody can prove enabling it by deafult
really does not impact us much.

Change since V3.

- Do not enable posix_acl by default.
- Error out if user wants to enable it but xattr are disabled.
- Modified help message and docs/tools/virtiofsd.rst to add
  documentation for this new knob (Luis Henriques).
- Captured Reviewed-by tags from Stefan from V3.

Thanks
Vivek

Vivek Goyal (3):
  virtiofsd: Add umask to seccom allow list
  virtiofsd: Add capability to change/restore umask
  virtiofsd: Add an option to enable/disable posix acls

 docs/tools/virtiofsd.rst              |   3 +
 tools/virtiofsd/helper.c              |   1 +
 tools/virtiofsd/passthrough_ll.c      | 125 ++++++++++++++++++++++++--
 tools/virtiofsd/passthrough_seccomp.c |   1 +
 4 files changed, 123 insertions(+), 7 deletions(-)

-- 
2.25.4


