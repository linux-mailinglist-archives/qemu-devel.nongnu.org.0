Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF4B667379
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 14:45:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFxsI-0006S1-7I; Thu, 12 Jan 2023 08:44:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFxsG-0006Ro-CW
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:44:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFxsE-0001vo-St
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:44:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673531045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSdwk7rx7n6/oy9xt+q2DUWtebGYUGy1htiKlokPXyM=;
 b=IE58OPk+gLikqobTZr6HMCostNu+7qiKm0HAYo2NEiMVYQ7Qh/ViakV1yRYTSYy8b0GZmq
 G8Gl2ebnKXtdY9Vn6O7KpI5WzfD8/x71HTHww9dinzHYzoHB1MGo8nPAYEZwX1jZKn0rpO
 zASGqy+og4XtxeaiOJT8SWPrPq6osjI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-94-Bk_bLNHKOGCnSKMu_-JTfQ-1; Thu, 12 Jan 2023 08:44:02 -0500
X-MC-Unique: Bk_bLNHKOGCnSKMu_-JTfQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 w3-20020a056402268300b00487e0d9b53fso12335131edd.10
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 05:44:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZSdwk7rx7n6/oy9xt+q2DUWtebGYUGy1htiKlokPXyM=;
 b=bs2SkH+uMKmwzBLEJnzcVvzJb7p6O4h4yOssO1p389Zf0oNTo79lBUpwLizqFnvzRp
 eq1TLHhSEfwWdR2otvgdhIFIikrCTmVGYSVTjYBGB1EGOVv8eCNN8DDl38z6vQCy981D
 zv/E01vfeYMi/VB6ScLNHG0omh57Jyr34xcc9fc3zr8RIxqBni+0i23jlwoudFnuVC9+
 u9A5J5x2//fti6Tz6pkS8l3HB8tYUBQZsacZwpTxZ5OPOogZqUetcrVUVJmOxWtHg8xU
 uCfL6xm+Nwgvf9OPjrN2Zls7bEOjWrpVoz34r6PNEt8eBFh2YswMq4IpPfUXlqqnW17m
 AAog==
X-Gm-Message-State: AFqh2krMulWTSXnxCr+/jAgYB2o9GXsReuSjw/rpQXgKboicKsWusNCT
 NbQ4dyia4mcvVpbVDn2M6NVhijc51Q7i9kgyXU5C0gOc9YVHOF0yDCRilKq44DbGyO57Anh9R9L
 o64F2jOuyBWJ3nrUp1KVwOzMfF+SOahcx3HghStqcnix+BANqGkTUps5iGmZIC8HmH7I=
X-Received: by 2002:a17:906:f282:b0:84d:16d0:717 with SMTP id
 gu2-20020a170906f28200b0084d16d00717mr20314508ejb.65.1673531040679; 
 Thu, 12 Jan 2023 05:44:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXviFI0PgEWoOHz5FPg5MW9ALJ+BhiCTXPxQBOOOd0ArLB3C6yiIfn78ciIt5BIKob4h+dAxUA==
X-Received: by 2002:a17:906:f282:b0:84d:16d0:717 with SMTP id
 gu2-20020a170906f28200b0084d16d00717mr20314495ejb.65.1673531040431; 
 Thu, 12 Jan 2023 05:44:00 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.gmail.com with ESMTPSA id
 lb24-20020a170907785800b008448d273670sm7370560ejc.49.2023.01.12.05.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 05:43:59 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL v2 14/29] enforce use of G_GNUC_PRINTF attributes
Date: Thu, 12 Jan 2023 14:43:50 +0100
Message-Id: <20230112134350.469317-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230112134350.469317-1-pbonzini@redhat.com>
References: <20230112134350.469317-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
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

From: Daniel P. Berrangé <berrange@redhat.com>

We've been very gradually adding G_GNUC_PRINTF annotations
to functions over years. This has been useful in detecting
certain malformed printf strings, or cases where we pass
user data as the printf format which is a potential security
flaw.

Given the inherant memory corruption danger in use of format
strings vs mis-matched variadic arguments, it is worth applying
G_GNUC_PRINTF to all functions using printf, even if we know
they are safe.

The compilers can reasonably reliably identify such places
with the -Wsuggest-attribute=format / -Wmissing-format-attribute
flags.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221219130205.687815-7-berrange@redhat.com>
[-Wsuggest-attribute=format and -Wmissing-format-attribute are
 synonyms, only include one; disable it for testfloat. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure            | 1 +
 tests/fp/meson.build | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configure b/configure
index 6f5e77a71361..643aed7533c2 100755
--- a/configure
+++ b/configure
@@ -1183,6 +1183,7 @@ add_to warn_flags -Wnested-externs
 add_to warn_flags -Wendif-labels
 add_to warn_flags -Wexpansion-to-defined
 add_to warn_flags -Wimplicit-fallthrough=2
+add_to warn_flags -Wmissing-format-attribute
 
 nowarn_flags=
 add_to nowarn_flags -Wno-initializer-overrides
diff --git a/tests/fp/meson.build b/tests/fp/meson.build
index 6258e2bd7d13..312a4d301fd9 100644
--- a/tests/fp/meson.build
+++ b/tests/fp/meson.build
@@ -37,6 +37,7 @@ tfcflags = [
   '-Wno-missing-prototypes',
   '-Wno-return-type',
   '-Wno-unused-function',
+  '-Wno-missing-format-attribute',
   '-Wno-error',
 ]
 
-- 
2.38.1


