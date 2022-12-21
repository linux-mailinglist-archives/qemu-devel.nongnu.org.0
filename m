Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175766535CE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:04:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Qo-0001aK-5U; Wed, 21 Dec 2022 13:03:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QX-0001Ql-SH
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QW-0004QZ-7D
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=neorI5R9dYxm/+7T9pdqUTHAqRJ3IQekQ63O5eFICoE=;
 b=OlOKA1r/Tk0F/7JN+0EjvM8NLcVJhzMtaWROTaZzhqMYHu8W0xSxlHJvq2V9QXB/FgMDkX
 KOsQ3XK77raGRolzysfK//QlmnxHeuSj3PcYD7rItMgS5/A7LflCNvU8UZpp9gKVNrt5vm
 wJSFm/BFuVKnbkyC8h5EHDRZmds6m8Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-540-cVsU3dqBNLCUhgUX3Gf7Ww-1; Wed, 21 Dec 2022 13:02:46 -0500
X-MC-Unique: cVsU3dqBNLCUhgUX3Gf7Ww-1
Received: by mail-ed1-f72.google.com with SMTP id
 z16-20020a05640235d000b0046d0912ae25so11827287edc.5
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=neorI5R9dYxm/+7T9pdqUTHAqRJ3IQekQ63O5eFICoE=;
 b=gCVHIGDp2fLfRUPUN1oiiGtcXeXcIehVkdHmzS466PLGBfCLSwEODWHfvDfpJgABVz
 bT6qWmHtm1Bcv1bmci6yPjSTm64kZ72R5E1r7uI6ORl4HQwJpdCG5/5Ehv2Vpkp1Qb9M
 WJ4Dnblwem3TqSCl+hN5TjVkn9FbDNeyCh5WSjvLecLmh6tj+A8pRhNeI6F0JaPUQi7Y
 wn311HkPAjZM+wk25li40o4v4wB0PiewfGLKrIMWAgGqb7VgrFtqUypJasbYQglfCRA1
 yk20kURxct1LcZmtEbkKc968rOQB+/DtkmNKZNmLOMGZ3z/9ipX19VIhw7KV1HqJHYEY
 aHyA==
X-Gm-Message-State: AFqh2ko+eg0ZQ16Otrv3h/I4A8L7F1L4+UH4y4YiAo3YDqWlyNrPFkug
 82tZKV0fOZyxp3zY+omSXO2Zw1IVi6YoMXkuxAGOUtsjig0UjvqEzaahQiNhzhEaDRYhIHaZCn1
 t7stiEtH7FbRfLIipJEWFtwwlvMBTJEiyVFj+f5XKLHMZV2MFKmY3WQVpcXKCxDpHmgA=
X-Received: by 2002:a05:6402:685:b0:45c:be41:a473 with SMTP id
 f5-20020a056402068500b0045cbe41a473mr2322624edy.29.1671645764925; 
 Wed, 21 Dec 2022 10:02:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvj0uLDykb5JiQ1CRoxSsiADuq3GdlWal0pDBmjJC0Pgbfgc+jFr7Udeqqay7KJmLSe/5OWmA==
X-Received: by 2002:a05:6402:685:b0:45c:be41:a473 with SMTP id
 f5-20020a056402068500b0045cbe41a473mr2322606edy.29.1671645764675; 
 Wed, 21 Dec 2022 10:02:44 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 bq18-20020a170906d0d200b00782fbb7f5f7sm7317566ejb.113.2022.12.21.10.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:02:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kai Huang <kai.huang@intel.com>,
	Yang Zhong <yang.zhong@linux.intel.com>
Subject: [PULL 23/24] target/i386: Add SGX aex-notify and EDECCSSA support
Date: Wed, 21 Dec 2022 19:01:40 +0100
Message-Id: <20221221180141.839616-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
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

From: Kai Huang <kai.huang@intel.com>

The new SGX Asynchronous Exit (AEX) notification mechanism (AEX-notify)
allows one enclave to receive a notification in the ERESUME after the
enclave exit due to an AEX.  EDECCSSA is a new SGX user leaf function
(ENCLU[EDECCSSA]) to facilitate the AEX notification handling.

Whether the hardware supports to create enclave with AEX-notify support
is enumerated via CPUID.(EAX=0x12,ECX=0x1):EAX[10].  The new EDECCSSA
user leaf function is enumerated via CPUID.(EAX=0x12,ECX=0x0):EAX[11].

Add support to allow to expose the new SGX AEX-notify feature and the
new EDECCSSA user leaf function to KVM guest.

Link: https://lore.kernel.org/lkml/166760360549.4906.809756297092548496.tip-bot2@tip-bot2/
Link: https://lore.kernel.org/lkml/166760360934.4906.2427175408052308969.tip-bot2@tip-bot2/
Reviewed-by: Yang Zhong <yang.zhong@linux.intel.com>
Signed-off-by: Kai Huang <kai.huang@intel.com>
Message-Id: <20221109024834.172705-1-kai.huang@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ae502f0bfeab..6c742c891022 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1233,7 +1233,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .feat_names = {
             "sgx1", "sgx2", NULL, NULL,
             NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, "sgx-edeccssa",
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
@@ -1273,7 +1273,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .feat_names = {
             NULL, "sgx-debug", "sgx-mode64", NULL,
             "sgx-provisionkey", "sgx-tokenkey", NULL, "sgx-kss",
-            NULL, NULL, NULL, NULL,
+            NULL, NULL, "sgx-aex-notify", NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
-- 
2.38.1


