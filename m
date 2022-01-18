Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BFE491287
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 01:13:12 +0100 (CET)
Received: from localhost ([::1]:44116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9c7c-0006Yr-56
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 19:13:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n9bvg-0001Jk-P4
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 19:00:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n9bvc-00027s-Mq
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 19:00:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642464043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ejk3Q+lty02bdm4Jmcx1ftZGjTXc3rm/+kGTJzyhbXQ=;
 b=XCZq/A+X7isFptoKmYzmmDyu5wEBTkl6yk42I5Min3IoiJXzSqmV9kQwoMi0LB/P7Sb7wC
 xjQAQM5wZg49bLivLQ2sxiehng5ytMny108pLRf4u1ao6gbAPw64IUuLjAclIIZ1KCxjqR
 Huz6twIwiXYgqaEjd+SzsfheFhPqE14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-o9HSGCplNl6bl27WcelSkw-1; Mon, 17 Jan 2022 19:00:41 -0500
X-MC-Unique: o9HSGCplNl6bl27WcelSkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 634FB802924;
 Tue, 18 Jan 2022 00:00:40 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7193165718;
 Tue, 18 Jan 2022 00:00:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] python: use avocado's "new" runner
Date: Mon, 17 Jan 2022 19:00:30 -0500
Message-Id: <20220118000030.2978928-3-jsnow@redhat.com>
In-Reply-To: <20220118000030.2978928-1-jsnow@redhat.com>
References: <20220118000030.2978928-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The old legacy runner no longer seems to work with output logging, so we
can't see failure logs when a test case fails. The new runner doesn't
(seem to) support Coverage.py yet, but seeing error output is a more
important feature.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/avocado.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/python/avocado.cfg b/python/avocado.cfg
index c7722e7ecd..a460420059 100644
--- a/python/avocado.cfg
+++ b/python/avocado.cfg
@@ -1,5 +1,5 @@
 [run]
-test_runner = runner
+test_runner = nrunner
 
 [simpletests]
 # Don't show stdout/stderr in the test *summary*
-- 
2.31.1


