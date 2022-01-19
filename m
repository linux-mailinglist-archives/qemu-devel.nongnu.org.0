Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7961C494117
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 20:44:24 +0100 (CET)
Received: from localhost ([::1]:37852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAGsY-0004Ur-Gw
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 14:44:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAGo3-0002AI-9O
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 14:39:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAGo1-0007HL-N5
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 14:39:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642621181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ejk3Q+lty02bdm4Jmcx1ftZGjTXc3rm/+kGTJzyhbXQ=;
 b=ElgtrV8LKPmlsciVVReJFHah0pdV5LCDCAOfTHiQ5dH8r78RfTq+jeuyQz/zcBNWV88rj/
 NctWRBAKU6q/vyhUMEcKZUF15KVc7uTlKb6oz+ayIUL/ehJqCIbFsHSWdvYUGHM/U5V0PO
 y7mjxLtIF13nsz3QyaSTAsKdY0aaoLE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-T-eOchAKNCWgaspuzgFOIg-1; Wed, 19 Jan 2022 14:39:38 -0500
X-MC-Unique: T-eOchAKNCWgaspuzgFOIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B900F1083F60;
 Wed, 19 Jan 2022 19:39:36 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EBD3196F1;
 Wed, 19 Jan 2022 19:39:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] python: use avocado's "new" runner
Date: Wed, 19 Jan 2022 14:39:13 -0500
Message-Id: <20220119193916.4138217-3-jsnow@redhat.com>
In-Reply-To: <20220119193916.4138217-1-jsnow@redhat.com>
References: <20220119193916.4138217-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
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


