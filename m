Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3399F4E3DE6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 12:58:55 +0100 (CET)
Received: from localhost ([::1]:34278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdA6-00055s-6R
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 07:58:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8E-00028I-HE
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:56:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8B-0006NK-76
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:56:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647950214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PE6GhPnAGVHeIj8sAefGZPCuwq6GIsbrGB14+206zZc=;
 b=T5TAT4OojCWISNn8/MnJEBXV4IpcOWlaTJ5lPEm+wcwsyC1uW5t5Lcc2o9KSQ3NGRqnn8U
 Yyc9yxf220wjK18ptoSK8fq9wumwm1cxkdFt2xoik0oPDqhpeg3rDbILKaSMj50vaDg9sg
 G4cXpYyxRZ4wBwOhL6aYEZHj+GSq2TA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-fp3RIgu8ObWFooYG2ZdsSw-1; Tue, 22 Mar 2022 07:56:51 -0400
X-MC-Unique: fp3RIgu8ObWFooYG2ZdsSw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC2DF3801EC1;
 Tue, 22 Mar 2022 11:56:50 +0000 (UTC)
Received: from localhost (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A81711121314;
 Tue, 22 Mar 2022 11:56:50 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/25] tests: add (riscv virt) machine mapping to testenv
Date: Tue, 22 Mar 2022 12:56:23 +0100
Message-Id: <20220322115647.726044-2-hreitz@redhat.com>
In-Reply-To: <20220322115647.726044-1-hreitz@redhat.com>
References: <20220322115647.726044-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: laokz <laokz@foxmail.com>

Some qemu-iotests(040 etc) use PCI disk to do test. Without the
mapping, RISC-V flavor use spike as default machine which has no
PCI bus, causing test failure.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/894

Signed-off-by: Kai Zhang <laokz@foxmail.com>
Message-Id: <tencent_E4219E870165A978DB5BBE50BD53D33D2E06@qq.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/testenv.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index b11e943c8a..a864c74b12 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -235,6 +235,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
             ('aarch64', 'virt'),
             ('avr', 'mega2560'),
             ('m68k', 'virt'),
+            ('riscv32', 'virt'),
+            ('riscv64', 'virt'),
             ('rx', 'gdbsim-r5f562n8'),
             ('tricore', 'tricore_testboard')
         )
-- 
2.35.1


