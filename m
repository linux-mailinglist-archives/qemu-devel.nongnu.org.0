Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2866E9024
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:27:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRUl-0008K7-RK; Thu, 20 Apr 2023 06:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppRUj-0008J0-5H
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:26:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppRUh-00046P-Pu
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:26:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681986386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MixBzwKpNzN8vnzKRI6MHoLElLQUWr71FVJ+JO9iV3U=;
 b=cR8l0/8L/ijPZRtYznOq9km1YZEkb30oahzOkd+y1AS/aYKtKq48dxh0AnSOjXU9meDQIm
 YqF/2/hP49gEs71H4YHCh2+Xik3bKbO2zgZcU122o2+3ZThPb2wxakzrvH5N50Xvrejjac
 887tKHqgSNPB9KtLbyN3vrHp62kIIaM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-lzZFIbgYNhCza-1VGIBiKg-1; Thu, 20 Apr 2023 06:26:23 -0400
X-MC-Unique: lzZFIbgYNhCza-1VGIBiKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6B171C087B3;
 Thu, 20 Apr 2023 10:26:22 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.42.28.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB8932166B33;
 Thu, 20 Apr 2023 10:26:21 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Het Gala <het.gala@nutanix.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 1/3] qapi: support updating expected test output via make
Date: Thu, 20 Apr 2023 11:26:17 +0100
Message-Id: <20230420102619.348173-2-berrange@redhat.com>
In-Reply-To: <20230420102619.348173-1-berrange@redhat.com>
References: <20230420102619.348173-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

It is possible to pass --update to tests/qapi-schema/test-qapi.py
to make it update the output files on error. This is inconvenient
to achieve though when test-qapi.py is run indirectly by make/meson.

Instead simply allow for an env variable to be set:

 $ QAPI_TEST_UPDATE= make check-qapi-schema

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qapi-schema/test-qapi.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
index 2160cef082..d58c31f539 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -206,6 +206,7 @@ def main(argv):
     parser.add_argument('-d', '--dir', action='store', default='',
                         help="directory containing tests")
     parser.add_argument('-u', '--update', action='store_true',
+                        default='QAPI_TEST_UPDATE' in os.environ,
                         help="update expected test results")
     parser.add_argument('tests', nargs='*', metavar='TEST', action='store')
     args = parser.parse_args()
-- 
2.40.0


