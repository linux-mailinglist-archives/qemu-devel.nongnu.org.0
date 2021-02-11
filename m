Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8453192BD
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:05:10 +0100 (CET)
Received: from localhost ([::1]:55652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHH3-0007lm-2C
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:05:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHBm-0003kL-Jj
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:59:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHBe-0005NP-VU
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:59:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613069972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oWNsKxFKzzXOd9mXiEd+tBR3bjq/7qDGtKsNZujs1jY=;
 b=MBeSebSPRPJHRLB4Zy7ahCytdnaO/vPy6zZ3KQhWtTZerJ3QXyPkkm/y4ct0DbSdWjp9Uv
 Z7EFjsH8wMl80q3FnmYpaOIYFYsEOj1V8hKsZDu3Zax3NNfWpLisWzr7jdIS1ZzOa9z18M
 lux2do4GYXsnSkIFiz+AER9rvBX/DBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-zh3Jp2h3NGScEzuy88-DXA-1; Thu, 11 Feb 2021 13:59:31 -0500
X-MC-Unique: zh3Jp2h3NGScEzuy88-DXA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B81F818A0863;
 Thu, 11 Feb 2021 18:59:29 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB8E077711;
 Thu, 11 Feb 2021 18:59:27 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/24] iotests/297: add --namespace-packages to mypy
 arguments
Date: Thu, 11 Feb 2021 13:58:34 -0500
Message-Id: <20210211185856.3975616-3-jsnow@redhat.com>
In-Reply-To: <20210211185856.3975616-1-jsnow@redhat.com>
References: <20210211185856.3975616-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
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
2.29.2


