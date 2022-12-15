Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C52E64DFEC
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 18:45:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5sHV-0002Vw-Q8; Thu, 15 Dec 2022 12:44:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p5sHP-0002Sr-14
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 12:44:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p5sHH-0001E0-UW
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 12:44:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671126255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QjkWbr+hDWylT3kF8m1PTuocniRtsbmn33U7ESFQ3JI=;
 b=Z51nPVU+rDa9ZsnfVEq8CUfa51Ssc4v/wPVy5RKa5vzHhDnLdMRVAqkNhLjr04G62bGyyF
 iJqF09wQvT9z3MeCEvjdPKeVi9pNRdljPl6AtyctwiwIAM8LaLpkh/ZkDMtaelgC1NGtFi
 7k5k2gXkGuLo1A6RQf3wqQpCPKVOg9Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-320-UoMBu59jNsWuvdogfCX7lg-1; Thu, 15 Dec 2022 12:44:13 -0500
X-MC-Unique: UoMBu59jNsWuvdogfCX7lg-1
Received: by mail-wm1-f70.google.com with SMTP id
 125-20020a1c0283000000b003d1d8d7f266so8170371wmc.7
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 09:44:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QjkWbr+hDWylT3kF8m1PTuocniRtsbmn33U7ESFQ3JI=;
 b=do2+p48VGStIHpcOPV71RHLEPjYBtg0WKxzaTW4PqJPg7dxFiEs7t4EtPY585b5Gkc
 J9kz5MVwJrcY+HaG7Yyw5sqOI29nRC868PVPqArRh/b0NnWIv3BF2yygpEg/S6CHH9gc
 hzob4my8MtDAoHgZSAtjyIT8Wr8Znv5Pf2bAgZI9rr1guNxsqvKxFnQH6i1mOlPQnEnX
 EpmMs2Rm2DonKsUM4Tlev4fF82AVCivFuCp6Mn+4PMdVfIXK5fadLHMZ/xHCYGxUTp1i
 yCLjnoLcPi7J8zRGKpjB5k9JPccC+Uz/VQDobKK3V9D0BkWevct/LHEjP6RXYPyVwjCy
 Q6tA==
X-Gm-Message-State: ANoB5ploxQN6Js/5vOR8F/T7lrcWs4C30N5aMzrhnt2iDXVPspvZ+/iX
 zub7/ZHKV3s55LXoNNQ6iGAkR4eZzfL1+mOAzeejBdVZSxR4BBoyyJRQP2VWMF8SnoxrS+pLDKU
 l74i8LqmDewcAYJSU8KYU7S3CvBeOIGM0NGcn8s/7Fhbfi4lhn0kO1T5Tx28x2oBa7uQ=
X-Received: by 2002:a05:600c:4f95:b0:3d0:1f6b:7156 with SMTP id
 n21-20020a05600c4f9500b003d01f6b7156mr23334968wmq.10.1671126251881; 
 Thu, 15 Dec 2022 09:44:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6twj4SeJeUg21EFEcQIo592Uy/+nMFzRUr0e3ratv7ZPu5kxgzkcf/OZ0TzXHTGxD9DUvSxQ==
X-Received: by 2002:a05:600c:4f95:b0:3d0:1f6b:7156 with SMTP id
 n21-20020a05600c4f9500b003d01f6b7156mr23334952wmq.10.1671126251630; 
 Thu, 15 Dec 2022 09:44:11 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 j41-20020a05600c1c2900b003b4ff30e566sm17790439wms.3.2022.12.15.09.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 09:44:11 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: afaria@redhat.com,
	qemu-block@nongnu.org,
	kwolf@redhat.com
Subject: [PATCH 1/2] coroutine: annotate coroutine_fn for libclang
Date: Thu, 15 Dec 2022 18:44:06 +0100
Message-Id: <20221215174407.500414-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221215174407.500414-1-pbonzini@redhat.com>
References: <20221215174407.500414-1-pbonzini@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


