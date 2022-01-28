Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6302C49F057
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 02:06:59 +0100 (CET)
Received: from localhost ([::1]:37876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDFj6-00043n-Ni
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 20:06:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZR-0003dr-B9
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:57 -0500
Received: from [2607:f8b0:4864:20::f2a] (port=35428
 helo=mail-qv1-xf2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZL-0005OL-0d
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:55 -0500
Received: by mail-qv1-xf2a.google.com with SMTP id d8so4458787qvv.2
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 16:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JWZ402i5ewXs1Wu60Tk1F3ASdYHrZWbgDGK7bebAGe0=;
 b=IuWsy8doUnrvfd62vEl3azl8LhdhHc61GX9huVi+hHPgOGgYQE54qyF92Et2RMhy6x
 Cd2PRML+6chPbFNIEitt/T8sJXp2MnVj1cJC+pQ1oOclnsw/lQx9hqBBTzAfrAMsasyZ
 nHiWgOg//whPRM+boeAkNFUgpQ2kNqfHEbA6BDD3j/gR+EYoQNL5iWc5wgpGCbYvHT4P
 dXrbyngoHee8Tq4w8WvZxJERf7QVfrzaE8rl2fKoPnMHEZCXAVxexFx2bptLaMlSAG2Q
 Ot9jzspyFmSmvVAyjpBov8vFTn+GgYWiGi87Q1fj9wJT8agN3n5r918kU8mNxnjPqxoq
 MQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JWZ402i5ewXs1Wu60Tk1F3ASdYHrZWbgDGK7bebAGe0=;
 b=j1mOSzmqaKsxFr71d7pwUOCnYVlLDAp84zVRcCSY56vrbRVTaPzo7g8Ra6MLgIzbFL
 CiLT23KksXhkSQG9Y3nyzUvrkV6zQbN6AcI0BUGLCUL5Asr5SWMfkKA0bcQY5jLQ84ed
 3GbMqiyk6SdKn9hGNkvVLAr+3RplguRZZ3QANuvp3bC0ntb3UZWAasT4HpvVerfJNC4g
 aOI41Ir/iGKBy2JchURlvocQA5skH74Valnb7V+UQKoUkO7LGlN3jWjLnPBiysMpJk8O
 FAPonWmgEmub8QaEY8+mvQDbROksbpcinFaKZ5fE1OzAXn8q3ilYUaD7dlMYYMdjkaie
 q2wg==
X-Gm-Message-State: AOAM5322LsbPfKUA/UtLOPdlnEbeqsa78JLuqgnVXZyVFnnDMsgaFfVr
 C1Mh6pSKAWDSlqLLR7QrTNNYb7t6v1jsAg==
X-Google-Smtp-Source: ABdhPJyvjhHsjPToQP30l4SreF/03cQ7se0vA/H946DRxRpY66AgTiNVaspKp3rybUDul2sj/a/gVw==
X-Received: by 2002:a05:6214:2aa2:: with SMTP id
 js2mr455720qvb.55.1643331397859; 
 Thu, 27 Jan 2022 16:56:37 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id d8sm2182003qtd.70.2022.01.27.16.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 16:56:37 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/11] 9p: darwin: adjust assumption on virtio-9p-test
Date: Thu, 27 Jan 2022 19:56:11 -0500
Message-Id: <20220128005611.87185-12-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128005611.87185-1-wwcohen@gmail.com>
References: <20220128005611.87185-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Will Cohen <wwcohen@gmail.com>,
 Fabian Franz <github@fabian-franz.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Fabian Franz <github@fabian-franz.de>
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 tests/qtest/virtio-9p-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 41fed41de1..6bcf89f0f8 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -1270,7 +1270,7 @@ static void fs_unlinkat_dir(void *obj, void *data, QGuestAllocator *t_alloc)
     /* ... and is actually a directory */
     g_assert((st.st_mode & S_IFMT) == S_IFDIR);
 
-    do_unlinkat(v9p, "/", "02", AT_REMOVEDIR);
+    do_unlinkat(v9p, "/", "02", P9_DOTL_AT_REMOVEDIR);
     /* directory should be gone now */
     g_assert(stat(new_dir, &st) != 0);
 
-- 
2.34.1


