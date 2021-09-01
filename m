Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F8B3FDE75
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:19:16 +0200 (CEST)
Received: from localhost ([::1]:39708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLS1D-0005w1-Fx
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRyd-0002ld-Mk
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:16:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRyb-00035o-6r
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6fRA6xJhy1JphaXxcsjCwoETYeXi4Cc5KAH37O1t3U8=;
 b=faoJiPCTVWMJShyt6KsxUmT296LDwBOa+y4KF/QRHXdvW7VC3b7Ayqk5G3P/8Lt0uLdvED
 hj23LXWjlt4tzhqe8lcpdHTIYe7Kb3DKKkyr2SLNrGTjf3C8d6N0R1J7NtIj2v1wjz1oBr
 LUHFw1NywSMJjYp22mna8Py/6W+YkLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-oBDy8ZaANb-od83D7_SjUg-1; Wed, 01 Sep 2021 11:16:27 -0400
X-MC-Unique: oBDy8ZaANb-od83D7_SjUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 106AB51DF;
 Wed,  1 Sep 2021 15:16:26 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0F601000358;
 Wed,  1 Sep 2021 15:16:25 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/56] python: Reduce strictness of pylint's duplicate-code
 check
Date: Wed,  1 Sep 2021 17:15:25 +0200
Message-Id: <20210901151619.689075-3-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
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
Acked-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210809090114.64834-3-eesposit@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 python/setup.cfg | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/python/setup.cfg b/python/setup.cfg
index 14bab90288..83909c1c97 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -105,6 +105,11 @@ good-names=i,
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


