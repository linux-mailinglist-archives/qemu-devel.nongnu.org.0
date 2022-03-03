Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C094C4CC33B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:51:19 +0100 (CET)
Received: from localhost ([::1]:38224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPofe-0004x4-QL
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:51:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPodA-0001eq-UB
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:48:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPocz-0000AI-CY
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646326111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wftHLEKfhQ0me0DeXvDyP37DGqTtpLGk4wt3Q6G+cpU=;
 b=NoTjOsaEgdxvROgyd9PZWYXQ8yo+lns2E1k6yv52plwT26PSmezyFAQKHOL4wadpZFEMgj
 imEI5aziLgmNIfssiDJ3yLYj7wm5ltWO6RMQDuWjiXTrqFO+uF/1w/4FVI12JtTIcoXf3n
 FS6R7bpQHulwOXZM5sg0pvRdeYyEw08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-gG-mdqInM5SSQvc3ysKtLw-1; Thu, 03 Mar 2022 11:48:29 -0500
X-MC-Unique: gG-mdqInM5SSQvc3ysKtLw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A9F11006AA6;
 Thu,  3 Mar 2022 16:48:28 +0000 (UTC)
Received: from localhost (unknown [10.39.195.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2782B86B81;
 Thu,  3 Mar 2022 16:48:15 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/4] qsd: Add --daemonize; and add job quit tests
Date: Thu,  3 Mar 2022 17:48:10 +0100
Message-Id: <20220303164814.284974-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

v1 cover letter:

https://lists.nongnu.org/archive/html/qemu-block/2021-12/msg00499.html


In v2, I followed Vladimir’s suggestion to look into whether we could
reuse os_daemonize().  Indeed we can, and it makes patch 3 (formerly 2)
much simpler!

I decided to leave patch 2 (formerly 1) largely unchanged, because it
seems to me like the point of contention is whether it’s at all
reasonable to introduce a second argument pass for this feature, and not
e.g. which arguments we parse during it.
I believe such an additional pass is a necessity for --daemonize, so
either we really don’t want this pass and so cannot add this feature
(and just drop this series); or we do want this feature, and then we
have to add this pass.


v2:
- Patch 1: Added, so we can use os_daemonize() in patch 3
  (os_daemonize() internally will only do something if the static
  `daemonize` variable is set, which this new os_set_daemonize()
  function does; otherwise, you can only set it by invoking
  os_parse_cmd_args(), which I would rather not (feels like abuse))

- Patch 2:
  - Tried to be more verbose in the commit description
  - Made it clear in process_options() that only QEMU-specific options
    are processed in order

- Patch 3: Vastly simplified by using the existing os_daemonize() and
  os_setup_post() functions


git backport-diff against v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/4:[down] 'os-posix: Add os_set_daemonize()'
002/4:[0006] [FC] 'qsd: Add pre-init argument parsing pass'
003/4:[0148] [FC] 'qsd: Add --daemonize'
004/4:[----] [--] 'iotests/185: Add post-READY quit tests'


Hanna Reitz (4):
  os-posix: Add os_set_daemonize()
  qsd: Add pre-init argument parsing pass
  qsd: Add --daemonize
  iotests/185: Add post-READY quit tests

 docs/tools/qemu-storage-daemon.rst   |   7 +
 include/sysemu/os-posix.h            |   1 +
 include/sysemu/os-win32.h            |   5 +
 os-posix.c                           |   6 +
 storage-daemon/qemu-storage-daemon.c |  58 +++++++-
 tests/qemu-iotests/185               | 190 ++++++++++++++++++++++++++-
 tests/qemu-iotests/185.out           |  48 +++++++
 7 files changed, 309 insertions(+), 6 deletions(-)

-- 
2.34.1


