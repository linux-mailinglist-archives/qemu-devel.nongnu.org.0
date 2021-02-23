Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A533233FC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 23:56:17 +0100 (CET)
Received: from localhost ([::1]:42662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEgbI-0004dl-DC
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 17:56:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lEgYO-00013J-Gq
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 17:53:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lEgYN-0001kE-5h
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 17:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614120794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G9WWihMJZpXwGt27jaDzFO/R89quSMbnjsHUnH9SgKc=;
 b=hdiTeGCkG/cZb0SoVwonEtBfQTo91HqTVnlrC0dYlqM/ol2HOqbCzTx3NC4GkAOpX+ZY22
 fzKxJtff+griTTcAUchnlPXwmzw5bPiMAfjjM0cOxLrO8lFXIhe629l/RxhCBDITN95j2E
 zXbequqgYXcSQex4KqIk0gdyjM3GSg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-t5KPYu4WNxWXIOJYeM68Iw-1; Tue, 23 Feb 2021 17:53:11 -0500
X-MC-Unique: t5KPYu4WNxWXIOJYeM68Iw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 204411005501;
 Tue, 23 Feb 2021 22:53:10 +0000 (UTC)
Received: from horse.redhat.com (ovpn-117-211.rdu2.redhat.com [10.10.117.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C18E15D6A1;
 Tue, 23 Feb 2021 22:52:59 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 0A62E22054F; Tue, 23 Feb 2021 17:52:59 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v3 0/2] virtiofsd: Enable posix_acl by default
Date: Tue, 23 Feb 2021 17:52:48 -0500
Message-Id: <20210223225250.23945-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

This is V3 of the patches. Changes since v2 are.

- I dropped the patch to give user an option to enable/disable acls.
  Now acls are enabled by default if xattrs are enabled and fuse
  client offers FUSE_POSIX_ACL capability.
 
Miklos mentioned that ACLS might not have lot of overhead as these
can be cached. So it might make sense to enable these by default.

If we run into performance issues, then we can add another patch to
give option to enable/disable and disable it by default.

Luis Henriques reported that fstest generic/099 fails with virtiofs.
Little debugging showed that we don't enable acl support. This
patch series should fix the issue

Vivek Goyal (2):
  virtiofsd: Add umask to seccom allow list
  virtiofsd: Enable posix_acls by default if xattrs are enabled

 tools/virtiofsd/passthrough_ll.c      | 29 +++++++++++++++++++++------
 tools/virtiofsd/passthrough_seccomp.c |  1 +
 2 files changed, 24 insertions(+), 6 deletions(-)

-- 
2.25.4


