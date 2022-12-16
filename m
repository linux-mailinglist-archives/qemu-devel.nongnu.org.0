Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C756364EA00
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:08:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p68Zf-0004lj-Pt; Fri, 16 Dec 2022 06:08:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p68ZY-0004kP-Fe
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:08:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p68ZT-0002HD-J0
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:08:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671188887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QjkWbr+hDWylT3kF8m1PTuocniRtsbmn33U7ESFQ3JI=;
 b=OxojrGS3vIHaxkqBtCSv1lJmtGBA4MafHDI/UGzIEzAemAZUoteKjGGaoBr9BJf480a2Y1
 TnjssXqwVDLNagMM9dkWlWpp0JnU0sxtywr89BNhcG5a4FBE8eOfLeRLKdKTo4Oy4Eal2q
 CT6i97SzDc9fuxjMJi4ZmHx8LSLkdbs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-306-5e2wD1mQPoCwgkbcCULFiQ-1; Fri, 16 Dec 2022 06:08:05 -0500
X-MC-Unique: 5e2wD1mQPoCwgkbcCULFiQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 z16-20020a05640235d000b0046d0912ae25so1663723edc.5
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 03:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QjkWbr+hDWylT3kF8m1PTuocniRtsbmn33U7ESFQ3JI=;
 b=kJuToo5C1HeJ+t7FeV61/mtiT8ZR8aARUF+Rr1+JPhO3HrFjYbRaAXBSLLxyQajvR4
 czPYTqkEieSfysru5PRGQfZJk3uxKF5sg8RMM9rGYm306b5gHUV/5Dn1TPs3+i16dy/O
 s0W/lkISgryE0YzfqOakEOrQNf8IK6UBX0CTVnR8bN/qX6m2K+6WgYnZR9vSN3ooqtlI
 LKGlgB/yg4C8Voj5GEyuF9utwDm1GPAyQekAa74PrZxQ3ffUzzxeI8RKVciyOc1fbjfd
 OfYbtGc5r4/A5ODy/AyJEyt+wWo97LzlOnnOD8Sly+mv9BMwhIGbs9Fvl6NKlQ6jUzg3
 iwbA==
X-Gm-Message-State: ANoB5plrdMujthZzkSnG+vj6+zFiBA94nJ6/AoH7sSULI4yZr92VLoTU
 PB+hFwQ6cMF35ukG1LtTQiuayOor7ul3dBnq4ggG8NsGiu/Qc0KfOQpIokFc39C9ShmsKgeRnQ7
 x+AtBvFuSYIlV0sD4cJmO5B3JdBHqwpMrA+6Pha5+86J2ZMWTNolCbTVW40/4ic2Lf4g=
X-Received: by 2002:aa7:cd78:0:b0:46c:be9f:7c3b with SMTP id
 ca24-20020aa7cd78000000b0046cbe9f7c3bmr25849829edb.19.1671188884250; 
 Fri, 16 Dec 2022 03:08:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5KR7076flWZZSAMwZPJPhUN1aQeduOVXTcQHwtZ09l5wPfj+CKzgr3n6o+GuDO5zmB7Uq7AA==
X-Received: by 2002:aa7:cd78:0:b0:46c:be9f:7c3b with SMTP id
 ca24-20020aa7cd78000000b0046cbe9f7c3bmr25849812edb.19.1671188884024; 
 Fri, 16 Dec 2022 03:08:04 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 i5-20020aa7c9c5000000b0046b00a9eeb5sm723942edt.49.2022.12.16.03.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 03:08:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: afaria@redhat.com,
	qemu-block@nongnu.org,
	kwolf@redhat.com
Subject: [PATCH v2 1/2] coroutine: annotate coroutine_fn for libclang
Date: Fri, 16 Dec 2022 12:07:57 +0100
Message-Id: <20221216110758.559947-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216110758.559947-1-pbonzini@redhat.com>
References: <20221216110758.559947-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alberto Faria <afaria@redhat.com>

Clang has a generic __annotate__ attribute that can be used by
static analyzers to understand properties of functions and
analyze the control flow.  Furthermore, unlike TSA annotations, the
__annotate__ attribute applies to function pointers as well.

As a first step towards static analysis of coroutine_fn markers,
attach the attribute to the marker when compiling with clang.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/coroutine.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 89650a2d7fab..b0c97f6fb7ad 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -42,7 +42,11 @@
  *       ....
  *   }
  */
+#ifdef __clang__
+#define coroutine_fn __attribute__((__annotate__("coroutine_fn")))
+#else
 #define coroutine_fn
+#endif
 
 typedef struct Coroutine Coroutine;
 
-- 
2.38.1


