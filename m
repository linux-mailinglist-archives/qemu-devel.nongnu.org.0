Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B6B37EF68
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:15:09 +0200 (CEST)
Received: from localhost ([::1]:43430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgy4J-0004Gh-KK
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2L-0001H7-3k
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2I-0005wC-36
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620861181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qK143M1NzvQyuzwgNrRM9hRzgwIcZfKa3vER5yYuiH4=;
 b=AIxnVBCg52zZRrHf4Ltl9KPQDD2ptst9m7O6vmkMcHJHj+NMzHixqSHzelGgbDKpXolrnb
 iR9aAT7IOi2pUGcIu+zZdEzb2SYw0mhdhsgmB64qvCIeEJFFTkcy+Br+xpueGBknRrJn3F
 ohHmbRE1vPyiJjqGcvI2wValHahURYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-jQ6ADq3vPM6I_7HK8OEoYw-1; Wed, 12 May 2021 19:12:57 -0400
X-MC-Unique: jQ6ADq3vPM6I_7HK8OEoYw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C58918397A6;
 Wed, 12 May 2021 23:12:56 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96DD5629DA;
 Wed, 12 May 2021 23:12:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 01/25] iotests/297: add --namespace-packages to mypy
 arguments
Date: Wed, 12 May 2021 19:12:17 -0400
Message-Id: <20210512231241.2816122-2-jsnow@redhat.com>
In-Reply-To: <20210512231241.2816122-1-jsnow@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mypy is kind of weird about how it handles imports. For legacy reasons,
it won't load PEP 420 namespaces, because of logic implemented prior to
that becoming a standard.

So, if you plan on using any, you have to pass
--namespace-packages. Alright, fine.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 tests/qemu-iotests/297 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index a37910b42d9..433b7323368 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -95,6 +95,7 @@ def run_linters():
                             '--warn-redundant-casts',
                             '--warn-unused-ignores',
                             '--no-implicit-reexport',
+                            '--namespace-packages',
                             filename),
                            env=env,
                            check=False,
-- 
2.30.2


