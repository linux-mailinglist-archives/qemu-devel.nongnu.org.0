Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D681F6E8A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 22:12:18 +0200 (CEST)
Received: from localhost ([::1]:43562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjTYe-0005Wn-Uw
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 16:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT9W-00004r-Jh
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:46:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33327
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT9U-0001Ev-Jm
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:46:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591904775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MrdrRYejp3x0pPisYrmqtFlKLM7DEQL3Jy2KygyfTlI=;
 b=Wbbd+JKjqNxKhM93aYMZBdCx8KqWb2DVhvoQhjsqXxJbIG+Wxcm35E+/yGpd2HPd++ZBg6
 o3m7bNv5ngF2bW4TW6cjdmWuWwdCjxBapgDS0GvGrjsXM9pSoOjfSNzZJF5BPnmU/7dZUC
 LvAHy3zp0XmadAPLkC9PlwO9NeIIR0Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-bme4Yv0vP8u6ImnceFK0ow-1; Thu, 11 Jun 2020 15:45:14 -0400
X-MC-Unique: bme4Yv0vP8u6ImnceFK0ow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5A85107ACF4;
 Thu, 11 Jun 2020 19:45:13 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7652C5D9DC;
 Thu, 11 Jun 2020 19:45:13 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 024/115] target/i386: fix phadd* with identical destination and
 source register
Date: Thu, 11 Jun 2020 15:43:18 -0400
Message-Id: <20200611194449.31468-25-pbonzini@redhat.com>
In-Reply-To: <20200611194449.31468-1-pbonzini@redhat.com>
References: <20200611194449.31468-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 14:52:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Janne Grunau <j@jannau.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Janne Grunau <j@jannau.net>

Detected by asm test suite failures in dav1d
(https://code.videolan.org/videolan/dav1d). Can be reproduced by
`qemu-x86_64 -cpu core2duo ./tests/checkasm --test=mc_8bpc 1659890620`.

Signed-off-by: Janne Grunau <j@jannau.net>
Message-Id: <20200401225253.30745-1-j@jannau.net>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 53 +++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 4658768de2..01d6017412 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1435,34 +1435,47 @@ void glue(helper_pshufb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 
 void glue(helper_phaddw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    d->W(0) = (int16_t)d->W(0) + (int16_t)d->W(1);
-    d->W(1) = (int16_t)d->W(2) + (int16_t)d->W(3);
-    XMM_ONLY(d->W(2) = (int16_t)d->W(4) + (int16_t)d->W(5));
-    XMM_ONLY(d->W(3) = (int16_t)d->W(6) + (int16_t)d->W(7));
-    d->W((2 << SHIFT) + 0) = (int16_t)s->W(0) + (int16_t)s->W(1);
-    d->W((2 << SHIFT) + 1) = (int16_t)s->W(2) + (int16_t)s->W(3);
-    XMM_ONLY(d->W(6) = (int16_t)s->W(4) + (int16_t)s->W(5));
-    XMM_ONLY(d->W(7) = (int16_t)s->W(6) + (int16_t)s->W(7));
+
+    Reg r;
+
+    r.W(0) = (int16_t)d->W(0) + (int16_t)d->W(1);
+    r.W(1) = (int16_t)d->W(2) + (int16_t)d->W(3);
+    XMM_ONLY(r.W(2) = (int16_t)d->W(4) + (int16_t)d->W(5));
+    XMM_ONLY(r.W(3) = (int16_t)d->W(6) + (int16_t)d->W(7));
+    r.W((2 << SHIFT) + 0) = (int16_t)s->W(0) + (int16_t)s->W(1);
+    r.W((2 << SHIFT) + 1) = (int16_t)s->W(2) + (int16_t)s->W(3);
+    XMM_ONLY(r.W(6) = (int16_t)s->W(4) + (int16_t)s->W(5));
+    XMM_ONLY(r.W(7) = (int16_t)s->W(6) + (int16_t)s->W(7));
+
+    *d = r;
 }
 
 void glue(helper_phaddd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    d->L(0) = (int32_t)d->L(0) + (int32_t)d->L(1);
-    XMM_ONLY(d->L(1) = (int32_t)d->L(2) + (int32_t)d->L(3));
-    d->L((1 << SHIFT) + 0) = (int32_t)s->L(0) + (int32_t)s->L(1);
-    XMM_ONLY(d->L(3) = (int32_t)s->L(2) + (int32_t)s->L(3));
+    Reg r;
+
+    r.L(0) = (int32_t)d->L(0) + (int32_t)d->L(1);
+    XMM_ONLY(r.L(1) = (int32_t)d->L(2) + (int32_t)d->L(3));
+    r.L((1 << SHIFT) + 0) = (int32_t)s->L(0) + (int32_t)s->L(1);
+    XMM_ONLY(r.L(3) = (int32_t)s->L(2) + (int32_t)s->L(3));
+
+    *d = r;
 }
 
 void glue(helper_phaddsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    d->W(0) = satsw((int16_t)d->W(0) + (int16_t)d->W(1));
-    d->W(1) = satsw((int16_t)d->W(2) + (int16_t)d->W(3));
-    XMM_ONLY(d->W(2) = satsw((int16_t)d->W(4) + (int16_t)d->W(5)));
-    XMM_ONLY(d->W(3) = satsw((int16_t)d->W(6) + (int16_t)d->W(7)));
-    d->W((2 << SHIFT) + 0) = satsw((int16_t)s->W(0) + (int16_t)s->W(1));
-    d->W((2 << SHIFT) + 1) = satsw((int16_t)s->W(2) + (int16_t)s->W(3));
-    XMM_ONLY(d->W(6) = satsw((int16_t)s->W(4) + (int16_t)s->W(5)));
-    XMM_ONLY(d->W(7) = satsw((int16_t)s->W(6) + (int16_t)s->W(7)));
+    Reg r;
+
+    r.W(0) = satsw((int16_t)d->W(0) + (int16_t)d->W(1));
+    r.W(1) = satsw((int16_t)d->W(2) + (int16_t)d->W(3));
+    XMM_ONLY(r.W(2) = satsw((int16_t)d->W(4) + (int16_t)d->W(5)));
+    XMM_ONLY(r.W(3) = satsw((int16_t)d->W(6) + (int16_t)d->W(7)));
+    r.W((2 << SHIFT) + 0) = satsw((int16_t)s->W(0) + (int16_t)s->W(1));
+    r.W((2 << SHIFT) + 1) = satsw((int16_t)s->W(2) + (int16_t)s->W(3));
+    XMM_ONLY(r.W(6) = satsw((int16_t)s->W(4) + (int16_t)s->W(5)));
+    XMM_ONLY(r.W(7) = satsw((int16_t)s->W(6) + (int16_t)s->W(7)));
+
+    *d = r;
 }
 
 void glue(helper_pmaddubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-- 
2.26.2



