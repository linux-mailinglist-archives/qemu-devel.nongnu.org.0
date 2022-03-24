Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF45C4E68F1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:57:06 +0100 (CET)
Received: from localhost ([::1]:33100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXSdt-0007Es-Vl
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:57:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSEm-0000NM-8n
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:31:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSEZ-0005p0-SI
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648146650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=khy+4G3HsiLnaqW0agf1pKJyrY17+WgvdAZNlltzGdQ=;
 b=ciHI60kmDFRVYoVfrOED/+aaIZmR3AYkuQTJWNyass3G0OsGRjXWjmp18p8a4XUfnlt2jX
 U/HUZ1fe4MG+j/XOGxWUw+l6ipDhjuqAhD/aQ/QFTFIZuZrgycFlZqPhJ4M+c7KCwsLN+W
 QmYMKy1eUUYA9pzvxcXllsSY/em9vac=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-fhVOKWyEOiC-RDpxUqGYHg-1; Thu, 24 Mar 2022 14:30:47 -0400
X-MC-Unique: fhVOKWyEOiC-RDpxUqGYHg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FC1C85A5BE;
 Thu, 24 Mar 2022 18:30:47 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B51F8C27D8A;
 Thu, 24 Mar 2022 18:30:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/17] iotests: remove qemu_io_pipe_and_status()
Date: Thu, 24 Mar 2022 14:30:16 -0400
Message-Id: <20220324183018.2476551-16-jsnow@redhat.com>
In-Reply-To: <20220324183018.2476551-1-jsnow@redhat.com>
References: <20220324183018.2476551-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I know we just added it, sorry. This is done in favor of qemu_io() which
*also* returns the console output and status, but with more robust error
handling on failure.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index baf4995089..e903c8ede0 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -365,9 +365,6 @@ def qemu_io(*args: str, check: bool = True, combine_stdio: bool = True
     return qemu_tool(*qemu_io_wrap_args(args),
                      check=check, combine_stdio=combine_stdio)
 
-def qemu_io_pipe_and_status(*args):
-    return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))
-
 def qemu_io_log(*args: str) -> 'subprocess.CompletedProcess[str]':
     result = qemu_io(*args, check=False)
     log(result.stdout, filters=[filter_testfiles, filter_qemu_io])
-- 
2.34.1


