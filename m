Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B27025B1F7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 18:49:48 +0200 (CEST)
Received: from localhost ([::1]:60160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDVxD-0006X8-8H
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 12:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kDVwH-0005DQ-1v
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 12:48:49 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50008
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kDVwF-0006qq-3d
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 12:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599065325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tHDKc/REg/30yOgPpdb4g2AK0OfgET4VEn/0qpTHzlk=;
 b=VszKf4y6BGS5tqNRMqy8PIY4fFjbD/6jALbfierfdHNTFlEnBPu/8hhZ6QcWK1bMfqyF+l
 evemgTZlLpKaVYbwn+cQk/wVzD8i72IE7pAXmoh8nfdoJsQGvFPldaZJZg/QA3m3A/T98Z
 BQ8ierZEvQI0268MdT3hsNqNh8Ko1/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-kE_uApKNNiaRz5v05pLeYg-1; Wed, 02 Sep 2020 12:48:44 -0400
X-MC-Unique: kE_uApKNNiaRz5v05pLeYg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07E77640A2;
 Wed,  2 Sep 2020 16:48:43 +0000 (UTC)
Received: from localhost (ovpn-114-169.ams2.redhat.com [10.36.114.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A22785C1D7;
 Wed,  2 Sep 2020 16:48:42 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/3] mirror: Freeze backing chain for sync=top
Date: Wed,  2 Sep 2020 18:48:38 +0200
Message-Id: <20200902164841.214948-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:33:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On review of the “Deal with filters” series, Kevin noted that mirror
doesn’t freeze its backing chain, even though we keep references to the
base (for sync=top).  That seems like a recipe for disaster, and as the
test added in patch 3 shows, indeed it is.

Patch 1 could also be squashed into “mirror: Deal with filters”.

As for patch 2; maybe it would be sufficient to freeze the backing chain
only down to base_overlay and until mirror_dirty_init() is done.  Then
we bdrv_ref(s->base) so can always be attached to the target when mirror
completes.  But I think the conservative approach I implemented here is
fine until someone complains.


Max Reitz (3):
  mirror: Set s->base_overlay only if s->base is set
  mirror: Freeze backing chain for sync=top
  iotests/041: x-blockdev-reopen during mirror

 block/mirror.c             | 28 +++++++++---
 tests/qemu-iotests/041     | 92 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/041.out |  4 +-
 3 files changed, 116 insertions(+), 8 deletions(-)

-- 
2.26.2


