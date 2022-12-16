Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E4164EAB0
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:33:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p68wa-0002E9-V2; Fri, 16 Dec 2022 06:32:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p68wX-0002Cz-Ql
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:31:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p68wW-0008Jf-HF
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:31:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671190314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bzys35u2towOsr1G33A5PF8fbhDxh0vpUy08dnBZRjA=;
 b=d84HPJhhXMi9/wxjtA/G808JQYOhGHrRT82ooxuHLbtC31lQmI5Gv5sgGIh+ZBGQw2HNJE
 gh45nmKY5p3Z7OkYnmoJUcuUkVTZbdUvlWVhMAGH265eArU0Lhd1C85bUHt+IzCe6qBsaW
 s4wK3ikmOgscIErMQRFBK0sm8Oz+y4g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-7FKRRj1uPBO5S8Qc0hGkpg-1; Fri, 16 Dec 2022 06:31:53 -0500
X-MC-Unique: 7FKRRj1uPBO5S8Qc0hGkpg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14DB8801779;
 Fri, 16 Dec 2022 11:31:53 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8304400F5A;
 Fri, 16 Dec 2022 11:31:52 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, Kevin Wolf <kwolf@redhat.com>,
 libvir-list@redhat.com, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 0/3] More work on deprecation/removal of clear text
 passwords
Date: Fri, 16 Dec 2022 06:31:49 -0500
Message-Id: <20221216113152.584460-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

This deprecates the -iscsi clear text 'password' option
and deletes the previously deprecated -spice 'password'
option.

Changed in v2:

 * Fixed section placement for iscsi deprecation docs
 * Fixed missing brackets in -iscsi help
 * Write in past tense for -spice password removal docs

Daniel P. Berrangé (3):
  block: mention 'password-secret' option for -iscsi
  block: deprecate iSCSI 'password' in favour of 'password-secret'
  ui: remove deprecated 'password' option for SPICE

 block/iscsi.c                   |  3 +++
 docs/about/deprecated.rst       | 16 ++++++++--------
 docs/about/removed-features.rst |  7 +++++++
 qemu-options.hx                 | 13 +++----------
 ui/spice-core.c                 | 15 ---------------
 5 files changed, 21 insertions(+), 33 deletions(-)

-- 
2.38.1


