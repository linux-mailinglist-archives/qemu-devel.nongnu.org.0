Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D55C4B9FE9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:15:30 +0100 (CET)
Received: from localhost ([::1]:42744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKfh3-0003Js-HZ
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:15:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfQA-0003X7-Df
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:58:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfQ9-00015S-0E
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:58:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645099080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BHTIv7qyZcRoQcTGvFPSchrkQIFiNrgU1BTo/kD2vwk=;
 b=MuA939kWkZaCQDql7Ap3LmLDpTflNHq1H4tI/auy/z82rT7GB9FRtd420OnvS1mTFoWkJi
 RC6m4eDOmH85JIQ8ICzdqqUnvcCGcDr9AFPG0idFRVk5thEk/mwhgPdLmdWucqz83/bojG
 /1IagMbaMM9pq16igXYl5uXNJwL8LrM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-8_5Q1PDaPSitNm1JgMyggA-1; Thu, 17 Feb 2022 06:57:57 -0500
X-MC-Unique: 8_5Q1PDaPSitNm1JgMyggA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CB851F2DA;
 Thu, 17 Feb 2022 11:57:56 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80FC0108648D;
 Thu, 17 Feb 2022 11:57:53 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/10] MAINTAINERS: take over seccomp from Eduardo Otubo
Date: Thu, 17 Feb 2022 11:57:22 +0000
Message-Id: <20220217115723.1782616-10-berrange@redhat.com>
In-Reply-To: <20220217115723.1782616-1-berrange@redhat.com>
References: <20220217115723.1782616-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo has indicated that he no longer has time to be involved in
a QEMU maintainership role. As one of the more frequent contributors
of patches and design ideas to seccomp, I'll take over in an "Odd
Fixes" role.

Acked-by: Eduardo Otubo <otubo@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1fe647eb08..7f345e30eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2978,8 +2978,8 @@ F: docs/sphinx/fakedbusdoc.py
 F: tests/qtest/dbus*
 
 Seccomp
-M: Eduardo Otubo <otubo@redhat.com>
-S: Supported
+M: Daniel P. Berrange <berrange@redhat.com>
+S: Odd Fixes
 F: softmmu/qemu-seccomp.c
 F: include/sysemu/seccomp.h
 F: tests/unit/test-seccomp.c
-- 
2.34.1


