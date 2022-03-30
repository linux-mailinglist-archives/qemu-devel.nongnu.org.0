Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE7F4EC0E7
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 13:55:36 +0200 (CEST)
Received: from localhost ([::1]:33998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZWvH-0008Ck-CO
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 07:55:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZWoG-0001dH-BO
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 07:48:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZWoB-0004ZJ-6f
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 07:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648640892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tlQSoFRkg41gLXYXGtN4RHNfmP40bhogdJ8McgbOh3M=;
 b=fAJAzjtZufz9+jNRLw2//fyWBRVnmmtIhJYctvk2vc5Zgz5gIXjhh09BA0q69cawlj/HjL
 i4wGEdPbObjPL+DsogC1koDEb+91sMTlaLV1YwVZZgrfDOGWczsTb96CVfZuPnWBtmHZEt
 N4NDPab7u2lQE/VoakX9OaDLfxfJn8E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-zF6UxlL4MNSjvBJNw3a7Eg-1; Wed, 30 Mar 2022 07:48:10 -0400
X-MC-Unique: zF6UxlL4MNSjvBJNw3a7Eg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 881FA899EC2;
 Wed, 30 Mar 2022 11:48:10 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D92D9428F1E;
 Wed, 30 Mar 2022 11:48:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.0] meson.build: Fix dependency of page-vary-common.c to
 config-poison.h
Date: Wed, 30 Mar 2022 13:48:08 +0200
Message-Id: <20220330114808.942933-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before compiling page-vary-common.c, we have to make sure that
config-poison.h has been generated (which is in the "genh" list).

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/948
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index aef724ad3c..04ce33fef1 100644
--- a/meson.build
+++ b/meson.build
@@ -2881,7 +2881,7 @@ if get_option('b_lto')
   if get_option('cfi')
     pagevary_flags += '-fno-sanitize=cfi-icall'
   endif
-  pagevary = static_library('page-vary-common', sources: pagevary,
+  pagevary = static_library('page-vary-common', sources: pagevary + genh,
                             c_args: pagevary_flags)
   pagevary = declare_dependency(link_with: pagevary)
 endif
-- 
2.27.0


