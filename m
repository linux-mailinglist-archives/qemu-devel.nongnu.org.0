Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7496DDED8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 17:05:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmFYj-0000ny-8Q; Tue, 11 Apr 2023 11:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmFYh-0000nN-Kf
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:05:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmFYf-0002wd-Nb
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681225520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=93Y1l3vulHUWfyaRvfQ8MyXosjwZ0oRRtzzaqncq/6A=;
 b=HwuMjyj7BicVphTcH6D0d+ciFAivnEEthfhredEcCeZL4Z7Srl2EODdBlg0SfgKxapJKh/
 eYfh6+Avo/JBvrox0AVSLyqqqG9tDc8+oNKphkbJMEBeAsT7XV1fF+WPqWP9hQ4r3FScsV
 qsYaI6egrIi34FMfwh3Qgkv25i/hz1o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-IbRhA4JhNWaGTCrKOfS4ow-1; Tue, 11 Apr 2023 11:05:17 -0400
X-MC-Unique: IbRhA4JhNWaGTCrKOfS4ow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCD4C3C0F23E;
 Tue, 11 Apr 2023 15:05:16 +0000 (UTC)
Received: from localhost (unknown [10.39.194.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3442740BC797;
 Tue, 11 Apr 2023 15:05:16 +0000 (UTC)
From: Hanna Czenczek <hreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Cc: Hanna Czenczek <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH 0/4] vhost-user-fs: Internal migration
Date: Tue, 11 Apr 2023 17:05:11 +0200
Message-Id: <20230411150515.14020-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

RFC:
https://lists.nongnu.org/archive/html/qemu-devel/2023-03/msg04263.html

Hi,

Patch 2 of this series adds new vhost methods (only for vhost-user at
this point) for transferring the back-end’s internal state to/from qemu
during migration, so that this state can be stored in the migration
stream.  (This is what we call “internal migration”, because the state
is internally available to qemu; this is in contrast to “external
migration”, which Anton is working on, where the back-end’s state is
handled by the back-end itself without involving qemu.)

For this, the state is handled as a binary blob by qemu, and it is
transferred over a pipe that is established via a new vhost method.

Patch 3 adds two high-level helper functions to (A) fetch any vhost
back-end’s internal state and store it in a migration stream (a
`QEMUFile`), and (B) load such state from a migrations stream and send
it to a vhost back-end.  These build on the low-level interface
introduced in patch 2.

Patch 4 then uses these functions to implement internal migration for
vhost-user-fs.  Note that this of course depends on support in the
back-end (virtiofsd), which is not yet ready.

Finally, patch 1 fixes a bug around migrating vhost-user devices: To
enable/disable logging[1], the VHOST_F_LOG_ALL feature must be
set/cleared, via the SET_FEATURES call.  Another, technically unrelated,
feature exists, VHOST_USER_F_PROTOCOL_FEATURES, which indicates support
for vhost-user protocol features.  Naturally, qemu wants to keep that
other feature enabled, so it will set it (when possible) in every
SET_FEATURES call.  However, a side effect of setting
VHOST_USER_F_PROTOCOL_FEATURES is that all vrings are disabled.  This
causes any enabling (done at the start of migration) or disabling (done
on the source after a cancelled/failed migration) of logging to make the
back-end hang.  Without patch 1, therefore, starting a migration will
have any vhost-user back-end that supports both VHOST_F_LOG_ALL and
VHOST_USER_F_PROTOCOL_FEATURES immediately hang completely, and unless
execution is transferred to the destination, it will continue to hang.


[1] Logging here means logging writes to guest memory pages in a dirty
bitmap so that these dirty pages are flushed to the destination.  qemu
cannot monitor the back-end’s writes to guest memory, so the back-end
has to do so itself, and log its writes in a dirty bitmap shared with
qemu.


Changes in v1 compared to the RFC:
- Patch 1 added

- Patch 2: Interface is different, now uses a pipe instead of shared
  memory (as suggested by Stefan); also, this is now a generic
  vhost-user interface, and not just for vhost-user-fs

- Patches 3 and 4: Because this is now supposed to be a generic
  migration method for vhost-user back-ends, most of the migration code
  has been moved from vhost-user-fs.c to vhost.c so it can be shared
  between different back-ends.  The vhost-user-fs code is now a rather
  thin wrapper around the common code.
  - Note also (as suggested by Anton) that the back-end’s migration
    state is now in a subsection, and that it is technically optional.
    “Technically” means that with this series, it is always used (unless
    the back-end doesn’t support migration, in which case migration is
    just blocked), but Anton’s series for external migration would make
    it optional.  (I.e., the subsection would be skipped for external
    migration, and mandatorily included for internal migration.)


Hanna Czenczek (4):
  vhost: Re-enable vrings after setting features
  vhost-user: Interface for migration state transfer
  vhost: Add high-level state save/load functions
  vhost-user-fs: Implement internal migration

 include/hw/virtio/vhost-backend.h |  24 +++
 include/hw/virtio/vhost.h         | 124 +++++++++++++++
 hw/virtio/vhost-user-fs.c         | 101 +++++++++++-
 hw/virtio/vhost-user.c            | 147 ++++++++++++++++++
 hw/virtio/vhost.c                 | 246 ++++++++++++++++++++++++++++++
 5 files changed, 641 insertions(+), 1 deletion(-)

-- 
2.39.1


