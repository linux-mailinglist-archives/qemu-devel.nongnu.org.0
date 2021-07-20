Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D7E3D006A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 19:42:26 +0200 (CEST)
Received: from localhost ([::1]:40856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5tlB-0004nD-Sm
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 13:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5td1-000648-CO
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:33:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5tcy-0005hQ-UF
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:33:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626802436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qxHVkCjQ6a5kL/cftUQN55WMndbzC7tqsVOoMpLDISI=;
 b=E/t07dlvR6FExqvdpmCbRW+IFLKFC2wr52qBzt1Q6B8/7rqUnXZr562Eqs2SDHB6lptkRk
 AzDyzRZK2yvdV+OuEYlPS4lfvPQThOiqzyrlwFdexGEpzGz89fcecpRG7gjpo7b1Mu4SNv
 g8Rk7BhaLSJowiCcQ5nKvJLrx9f+LY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-4tSpNlljN7-IefY7uFKUNQ-1; Tue, 20 Jul 2021 13:33:55 -0400
X-MC-Unique: 4tSpNlljN7-IefY7uFKUNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E40C21015DA2;
 Tue, 20 Jul 2021 17:33:53 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-193.rdu2.redhat.com [10.10.119.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E63C269CB6;
 Tue, 20 Jul 2021 17:33:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/17] iotests/297: Add 'directory' argument to run_linters
Date: Tue, 20 Jul 2021 13:33:31 -0400
Message-Id: <20210720173336.1876937-13-jsnow@redhat.com>
In-Reply-To: <20210720173336.1876937-1-jsnow@redhat.com>
References: <20210720173336.1876937-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow run_linters to work well if it's executed from a different
directory.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/297 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 961c9170d21..b2bf7928c5d 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -71,6 +71,7 @@ def get_test_files(directory: str = '.') -> List[str]:
 
 def run_linters(
     files: List[str],
+    directory: str = '.',
     env: Optional[Mapping[str, str]] = None,
 ) -> None:
 
@@ -81,6 +82,7 @@ def run_linters(
     # fixed (in tests, at least)
     subprocess.run(
         ('python3', '-m', 'pylint', '--score=n', '--notes=FIXME,XXX', *files),
+        cwd=directory,
         env=env,
         check=False,
     )
@@ -108,6 +110,7 @@ def run_linters(
                 '--namespace-packages',
                 filename,
             ),
+            cwd=directory,
             env=env,
             check=False,
             stdout=subprocess.PIPE,
-- 
2.31.1


