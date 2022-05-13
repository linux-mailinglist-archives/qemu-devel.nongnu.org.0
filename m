Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0ED5258EB
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 02:15:36 +0200 (CEST)
Received: from localhost ([::1]:54328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npIxz-0005N2-TW
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 20:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npIpC-0007MK-JI
 for qemu-devel@nongnu.org; Thu, 12 May 2022 20:06:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npIpA-0007ni-6d
 for qemu-devel@nongnu.org; Thu, 12 May 2022 20:06:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652400387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FC2FNO1LE7MC60AjofgfjqIcMDscN/YWRdjjucrzlEQ=;
 b=EN0hr/IcIMB6IwaM2P0E1mNEq1KcunaUa7qoEo9MPdzMz592utXQae1x3+f69XDB22cK0+
 gu44Ki5T5T0ODrsgMunhugXwnCJtl0/PjTfkN79jyKz+DrN7xud4xuTZk8NONY74Z8LiCb
 uKX8qMcT/LWuYpfRM7/UPU1KhaqO6us=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-P26kv79TPFSoXuvzfrWQ2Q-1; Thu, 12 May 2022 20:06:23 -0400
X-MC-Unique: P26kv79TPFSoXuvzfrWQ2Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23876185A794;
 Fri, 13 May 2022 00:06:23 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15AEF15341CE;
 Fri, 13 May 2022 00:06:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH 7/9] tests: add check-venv to build-tcg-disabled CI recipe
Date: Thu, 12 May 2022 20:06:07 -0400
Message-Id: <20220513000609.197906-8-jsnow@redhat.com>
In-Reply-To: <20220513000609.197906-1-jsnow@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 .gitlab-ci.d/buildtest.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 0aea7ab84c2..5c6201847f1 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -245,6 +245,7 @@ build-tcg-disabled:
     - make -j"$JOBS"
     - make check-unit
     - make check-qapi-schema
+    - make check-venv
     - cd tests/qemu-iotests/
     - ./check -raw 001 002 003 004 005 008 009 010 011 012 021 025 032 033 048
             052 063 077 086 101 104 106 113 148 150 151 152 157 159 160 163
-- 
2.34.1


