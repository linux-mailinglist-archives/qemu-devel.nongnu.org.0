Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AD63757F5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:53:47 +0200 (CEST)
Received: from localhost ([::1]:44906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legJu-0002uz-EJ
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1legBG-0002CG-3C
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:44:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1legB8-0002tD-3t
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:44:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620315880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wl0ZoWI76SoJifpMm6Y/ztRYNH+zXHKcCkkHtNs9Ujg=;
 b=CsaR6XzGN4CRSKGEw5AIk5DYp4qohrkzd+kmaRpI4sy3V0KkdWlR4dx5NKRY1wD78WHBI7
 EWlAXtbC60/ksZ9t2wbnH7AJiiAp+Uql/i2WcQzXvoJicwxOELl55Eexvfs2cUo/ptorN5
 PDDCSGlzDRqn6B1pUHYiJBhbN1JGZgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-B4HhdQX8MgmspNKFP7g1sA-1; Thu, 06 May 2021 11:44:36 -0400
X-MC-Unique: B4HhdQX8MgmspNKFP7g1sA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F8AD801AF8;
 Thu,  6 May 2021 15:44:35 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-111.ams2.redhat.com
 [10.36.113.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E3795B826;
 Thu,  6 May 2021 15:44:34 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/7] target/arm: Make sure that commpage's tb->size != 0
Date: Thu,  6 May 2021 17:44:18 +0200
Message-Id: <20210506154423.459930-3-cohuck@redhat.com>
In-Reply-To: <20210506154423.459930-1-cohuck@redhat.com>
References: <20210506154423.459930-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

tb_gen_code() assumes that tb->size must never be zero, otherwise it
may produce spurious exceptions. For ARM this may happen when creating
a translation block for the commpage.

Fix by pretending that commpage translation blocks have at least one
instruction.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210416154939.32404-3-iii@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 43ff0d4b8ac2..c8dbb03d6db8 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9097,6 +9097,7 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     unsigned int insn;
 
     if (arm_pre_translate_insn(dc)) {
+        dc->base.pc_next += 4;
         return;
     }
 
@@ -9166,6 +9167,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     bool is_16bit;
 
     if (arm_pre_translate_insn(dc)) {
+        dc->base.pc_next += 2;
         return;
     }
 
-- 
2.30.2


