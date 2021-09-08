Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F154041BD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 01:25:02 +0200 (CEST)
Received: from localhost ([::1]:60296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO6w9-0006b5-Q1
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 19:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6sD-0007BH-AW
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:20:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6sB-0002uK-Pn
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:20:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631143255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p6u3sclI6JBi/0aQ8m/8uYmNWK6u/Efc+CTX33mwcn4=;
 b=UAbntxhNMDLfhVBJUanQ/nbNFX8SsAgORd8PabEo0ooHKj4cGHZLtZJV1Ap4C+4U+v4W1m
 9JXqOZLnbflNIhvAsLodB2QDw6saRyC5xk4oXokL4grrM0ug0kgsIlLCH43ermB775L6GW
 OxaKR8ypL7bHx7uyTyNf2AXNhuX1iS8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-1-U5T_N-Pea7ZEr0JgWsYA-1; Wed, 08 Sep 2021 19:20:52 -0400
X-MC-Unique: 1-U5T_N-Pea7ZEr0JgWsYA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c4-20020a1c9a04000000b002e864b7edd1so1787wme.6
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 16:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p6u3sclI6JBi/0aQ8m/8uYmNWK6u/Efc+CTX33mwcn4=;
 b=aAzTX9t8esGM88D7I0OpURMWVfDugAunxUp951Cddz68aIhH9wC57pVzZ8PKsiqAO2
 Hp7PM5gX9yMw75POEbRl/AWpLJkrsH2KtXrhsck5e2qt/Q8f4XSl+MBzYB+ccJJG3HbQ
 ++KYbA4mkax8N55+8NN5cKAKlnR+I/v/Fxugo56LG21KrwgA45GrV8XmWmeUDRQDPncj
 4DUtQrkl2GQceLcWFiscPDWZCtB2Uyw4SzNORSK8khkVpDgtsDxEd344ogI563/Sy+wd
 xSuf2Zb6vI2esPT0QRZg0g6f27Bv7yMCj/yPXqyEDEdazfrov5MFSGOMkREwJ/3Zg0MS
 S2iA==
X-Gm-Message-State: AOAM533T5zRdojSqSjhnVDUJtgGkQ2YW+CM5XW5j3RtvWXvaKb/yxLtw
 C3/swt9ooAR2zpes+WWeaeEoGms/yCSYR36VUPsh+N2e/EfMPgsOG63VGBlbFxTppQ5qEn/N06l
 ggaoRLpL+6rYlm9N+CC3VGcDkahAQJGnwPBnwlqFyhsBb8+BYBHT1qCJaID19+qGW
X-Received: by 2002:adf:fb8d:: with SMTP id a13mr108077wrr.164.1631143250668; 
 Wed, 08 Sep 2021 16:20:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrh/n5wSnZqfaTQvrzl6IJ2DKh1pSXkkHEuOdKtVrOvCH+TWDpEiwg1GoyEgBtyhNoco5QeA==
X-Received: by 2002:adf:fb8d:: with SMTP id a13mr108055wrr.164.1631143250497; 
 Wed, 08 Sep 2021 16:20:50 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id c3sm30713wrd.34.2021.09.08.16.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:20:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 05/10] block/null: Mark 'read-zeroes=off' option as unsafe
Date: Thu,  9 Sep 2021 01:20:19 +0200
Message-Id: <20210908232024.2399215-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908232024.2399215-1-philmd@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See commit b317006a3f1 ("docs/secure-coding-practices: Describe how
to use 'null-co' block driver") for rationale.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/null.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/block/null.c b/block/null.c
index cc9b1d4ea72..11e428f3cc2 100644
--- a/block/null.c
+++ b/block/null.c
@@ -99,6 +99,13 @@ static int null_file_open(BlockDriverState *bs, QDict *options, int flags,
     return ret;
 }
 
+static bool null_taints_security_policy(BlockDriverState *bs)
+{
+    BDRVNullState *s = bs->opaque;
+
+    return !s->read_zeroes;
+}
+
 static int64_t null_getlength(BlockDriverState *bs)
 {
     BDRVNullState *s = bs->opaque;
@@ -283,6 +290,7 @@ static BlockDriver bdrv_null_co = {
     .bdrv_parse_filename    = null_co_parse_filename,
     .bdrv_getlength         = null_getlength,
     .bdrv_get_allocated_file_size = null_allocated_file_size,
+    .bdrv_taints_security_policy = null_taints_security_policy,
 
     .bdrv_co_preadv         = null_co_preadv,
     .bdrv_co_pwritev        = null_co_pwritev,
-- 
2.31.1


