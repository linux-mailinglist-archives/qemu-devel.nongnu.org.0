Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1255692D3
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 21:48:04 +0200 (CEST)
Received: from localhost ([::1]:49750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9B0F-0002Sb-ED
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 15:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Akb-0003E2-Qs; Wed, 06 Jul 2022 15:31:56 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:42904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9AkZ-00067E-Sv; Wed, 06 Jul 2022 15:31:53 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id i186so16098743vsc.9;
 Wed, 06 Jul 2022 12:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P8HTBug/BrxsxU3MmDdqiWcYw9YTVPuLaNnZJgqOZMs=;
 b=Q9T30x9UymmZ7zMV4mzTVkr3VglgfriWez5f8XH8qFQEUNq5XrT1g2QEskRehxF9Xq
 +rrSjNPY3aej7zNOjrwvznVgO0cvacoMJQ+E1zkv1s1QLLmey+kEidmKu5koHyYZEtqB
 1PNyKs4ZqZf2lPVD/1c7irQ7IyFWRDkLil+vWr6TeRyYzMEKTnqi8Qn4ShpJIjVqZJej
 ulN0ayPMOpUsuVoJZai2x1YK7hakaCBYMaXFkuhvhHRdMsdX5JEqbaSSKI8kVUdosEPP
 KtPXvL2Hl58kDpIJpN1zVTucle0sfqjOoXnZ8HDSze8M2BqY9OgmAWEngLiXa06m7da4
 NwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P8HTBug/BrxsxU3MmDdqiWcYw9YTVPuLaNnZJgqOZMs=;
 b=vRhJVVTZc13KR6Q9lD7zBCoVYZT+Ud72LVxPbFkMtZ7y0uCMjavBwkeCLYN+JU6ik0
 jPKBMDzvIOLe2n1s5tfLIDQ3xI0QUDvVKNmvPQQdPstK0A5XaJdTaEUIesKwnBHgcFvB
 D5hd2G+snWaDyHw7vs8Wln1ulWhdv3VtMYDVzqF4HwArBaGGa4xRE2Qxy/mRlcn7/tUi
 mVnf9rVBchMJFEeVVARbX6JFF+QmhFXwUp5DoB4lBhtMMITuDsAsbznrtVTcGg591/hi
 UZsif9UC2llcp+9HWPWD5+vZTBjCoNOnndKlpY++53rN4sUeWa/I/cgAxQ+asDJEfFO9
 fSEg==
X-Gm-Message-State: AJIora/i1ZZJxfNLgVhKKWJizkZQ+BeN+3LmMM5vLLuUfgNxZQY1sjUg
 qVnA/u3+QR48U0F9/seXUsBI8pUyw24=
X-Google-Smtp-Source: AGRyM1vIeyvKbu/k/qzwOJQKrKnQhqWlO3Au40SAkDRVZtYCa6yH7lgTOP6C3KFczbFQ7PXJimwc8w==
X-Received: by 2002:a67:ac0d:0:b0:356:a09d:b063 with SMTP id
 v13-20020a67ac0d000000b00356a09db063mr13956867vse.69.1657135910396; 
 Wed, 06 Jul 2022 12:31:50 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 p2-20020ab01ec2000000b003828ebf6b49sm6034791uak.4.2022.07.06.12.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 12:31:49 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 1/5] target/ppc/kvm.c: do not return -1 on uint64_t return
Date: Wed,  6 Jul 2022 16:31:36 -0300
Message-Id: <20220706193140.468009-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706193140.468009-1-danielhb413@gmail.com>
References: <20220706193140.468009-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

kvmppc_read_int_dt() and kvmppc_read_int_cpu_dt() return an uint64_t,
while returning -1 when an error occurs. kvmppc_read_int_cpu_dt() claims
that it will return 0 if anything wrong happens, but it's returning -1
if kmvppc_find_cpu_dt() fails.

The elephant in the room is that returning -1 while claiming that the
return is uint64_t, results in 18446744073709551615 for the callers.
This reason alone is enough to not return -1 under these circunstances.

We'll still have the problem of having to deal with a '0' return that
might, or might not be, an error. We'll make this distintion clear in
the next patches.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 6eed466f80..109823136d 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1907,7 +1907,7 @@ static uint64_t kvmppc_read_int_dt(const char *filename)
 
     f = fopen(filename, "rb");
     if (!f) {
-        return -1;
+        return 0;
     }
 
     len = fread(&u, 1, sizeof(u), f);
@@ -1934,7 +1934,7 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
     uint64_t val;
 
     if (kvmppc_find_cpu_dt(buf, sizeof(buf))) {
-        return -1;
+        return 0;
     }
 
     tmp = g_strdup_printf("%s/%s", buf, propname);
-- 
2.36.1


