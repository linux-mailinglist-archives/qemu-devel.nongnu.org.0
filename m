Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E7C3E41FB
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:03:15 +0200 (CEST)
Received: from localhost ([::1]:49966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1Bi-0004aq-Et
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mD1A6-0001Cf-F7
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:01:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mD1A2-0001Sx-Cz
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628499688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HF6iuOeKKNMDVlJVp3Z3YJ06raTSZfHFR70vKmSOfzw=;
 b=Kj9tbY8DelZcHce1/gA8MLDnaiQGsMdzfTUWya6jEXp/Zn4VHjxX0tGfb8CFSs4WgyXC0K
 eBPZ1tQXgeusIxDAsqaj41Z6MiWBXUyLDZdBNR9wcW05AweS6k2OcQ85VQO8a6xtK44wYM
 C+gH9so23uSZYbyjkk7DtUpn0pQnt2I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-GxmBFBHEOySsLecxa9U_OA-1; Mon, 09 Aug 2021 05:01:24 -0400
X-MC-Unique: GxmBFBHEOySsLecxa9U_OA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65FA7100806B;
 Mon,  9 Aug 2021 09:01:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D15177701;
 Mon,  9 Aug 2021 09:01:20 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v9 02/16] python: Reduce strictness of pylint's duplicate-code
 check
Date: Mon,  9 Aug 2021 11:01:00 +0200
Message-Id: <20210809090114.64834-3-eesposit@redhat.com>
In-Reply-To: <20210809090114.64834-1-eesposit@redhat.com>
References: <20210809090114.64834-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.707, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Acked-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
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


