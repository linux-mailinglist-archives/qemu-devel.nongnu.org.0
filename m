Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFA53AE74D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:39:57 +0200 (CEST)
Received: from localhost ([::1]:58464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHLQ-0000E2-7s
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvHFb-0008Px-Qy
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:33:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvHFX-0002Dr-Oj
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:33:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624271631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jvZKhtgf+WktEK4EhVx9so3aM9d2FfmhQE7nqDjN7EQ=;
 b=M+Z6nJsWk8ADv1Zhyz/Z7ECSI20l/HmT1QIeRwWbdvAv0e9uynwEgHITSUzGjkRvZugv4a
 Z3qQH0v8Qy7KRsXvobOBFBv8niMFgTpmHj5ypmM5ICVrwLHJJXqsyw5sIrIvNgaLOBOEwA
 TTFFE/7u2Pt93ppSZfNdV3230a3m1yo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-j06iOrKKOO2JkZ6ki7NE0A-1; Mon, 21 Jun 2021 06:33:47 -0400
X-MC-Unique: j06iOrKKOO2JkZ6ki7NE0A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BB44804319;
 Mon, 21 Jun 2021 10:33:46 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-100.ams2.redhat.com
 [10.36.113.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21DEB5444E;
 Mon, 21 Jun 2021 10:33:43 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 02/16] python: Reduce strictness of pylint's duplicate-code
 check
Date: Mon, 21 Jun 2021 12:33:23 +0200
Message-Id: <20210621103337.36637-3-eesposit@redhat.com>
In-Reply-To: <20210621103337.36637-1-eesposit@redhat.com>
References: <20210621103337.36637-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Pylint prior to 2.8.3 (We pin at >= 2.8.0) includes function and method
signatures as part of its duplicate checking algorithm. This check does
not listen to pragmas, so the only way to disable it is to turn it off
completely or increase the minimum duplicate lines so that it doesn't
trigger for functions with long, multi-line signatures.

When we decide to upgrade to pylint 2.8.3 or greater, we will be able to
use 'ignore-signatures = true' to the config instead.

I'd prefer not to keep us on the very bleeding edge of pylint if I can
help it -- 2.8.3 came out only three days ago at time of writing.

See: https://github.com/PyCQA/pylint/pull/4474
Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 python/setup.cfg | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/python/setup.cfg b/python/setup.cfg
index 0fcdec6f32..d82c39aa46 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -78,6 +78,11 @@ good-names=i,
 # Ignore imports when computing similarities.
 ignore-imports=yes
 
+# Minimum lines number of a similarity.
+# TODO: Remove after we opt in to Pylint 2.8.3. See commit msg.
+min-similarity-lines=6
+
+
 [isort]
 force_grid_wrap=4
 force_sort_within_sections=True
-- 
2.31.1


