Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB434374383
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:32:46 +0200 (CEST)
Received: from localhost ([::1]:39764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leLO9-0007fP-OZ
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leKu7-0006LD-1P
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:01:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leKtq-0002UG-Sc
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620234085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7g2k8F+O24ILX6i9wlywTWqxuX2ak4LnZOnLn8IJqNY=;
 b=W6meSEnd6zZOMhXlRgwoAWcmg9di8Nxgmap7/hpEtOXatr6oS5bD2BAfEFsaOkYPrCtzNY
 e7Gk9zWkNLWuzOx3bNse1p4MuS4Y6uAWT1mfcXEIyS3X7HK3E2VP7e5Lai7bm//EynyoOM
 4s2H/XDdb5swaV5FIsUPF9HfZMvHR0o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-S9xUMpVuNdaXo4GDrgGE9w-1; Wed, 05 May 2021 13:01:23 -0400
X-MC-Unique: S9xUMpVuNdaXo4GDrgGE9w-1
Received: by mail-wr1-f72.google.com with SMTP id
 93-20020adf80e60000b0290106fab45006so934453wrl.20
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 10:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7g2k8F+O24ILX6i9wlywTWqxuX2ak4LnZOnLn8IJqNY=;
 b=WlWaumhJH+IfP5dQjZ+MjygNksVDJ0S33zCjsdZELTjCAxpeInZwPCl3ABlPOkVaa1
 hKSURMi2H77EzUiuHm6z4r7uylw5aNe8bXcKvFgVjz2+KlHpSImkTImUI7EP7TCtLc4Z
 2GMkopYGvOywkKy6in3C69krQadjQIFoLowkgylyGkQSYT4aRDXZvw6XVPd3qvtkPNPF
 dFaIFUJID3DKdlRnoXKD826otDBKrdCUGRpNppRAOmWj9F3r+aIOzsL0T0uC5k5Ryv9b
 tUuuShMS6qHNj/XcF980Gsb2uPRM/csbfZON/AuLVp7lb+aXZI2vgkGAlzkSuZvo3JCf
 ERcA==
X-Gm-Message-State: AOAM530CMWcfTu3eGMt7Z4eVQyv3/E9gUnbS4TyYkq5NPRQ6Mj7kvwVO
 EV9wfFhLuCBFBmfKI1zP8gAncKzbx0DPt4byp1TybhO3AcoUxNcwvVYrAFUL8u4yarBve1EekwP
 NjgDXaQyZdpS9DC63kZHlS/xwhIysrqkh5F/B0KtGp4UpeBUI4JHCQ40CLFtFMxnn
X-Received: by 2002:a1c:1d50:: with SMTP id d77mr11295094wmd.114.1620234081848; 
 Wed, 05 May 2021 10:01:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmgH4JwP3i9dHZjwwiWSGdQcazy8feE/fCrd6Xa/tz3JD28tBwB4MYsNyH0CmUS+lyRxh2hg==
X-Received: by 2002:a1c:1d50:: with SMTP id d77mr11295057wmd.114.1620234081584; 
 Wed, 05 May 2021 10:01:21 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id q10sm15824317wre.92.2021.05.05.10.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 10:01:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] target/ppc/kvm: Replace alloca() by g_malloc()
Date: Wed,  5 May 2021 19:00:55 +0200
Message-Id: <20210505170055.1415360-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505170055.1415360-1-philmd@redhat.com>
References: <20210505170055.1415360-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 Kyle Evans <kevans@freebsd.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".

Replace it by a g_malloc() call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/ppc/kvm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 104a308abb5..ae62daddf7d 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2698,11 +2698,11 @@ int kvmppc_save_htab(QEMUFile *f, int fd, size_t bufsize, int64_t max_ns)
 int kvmppc_load_htab_chunk(QEMUFile *f, int fd, uint32_t index,
                            uint16_t n_valid, uint16_t n_invalid, Error **errp)
 {
-    struct kvm_get_htab_header *buf;
-    size_t chunksize = sizeof(*buf) + n_valid * HASH_PTE_SIZE_64;
+    size_t chunksize = sizeof(struct kvm_get_htab_header)
+                       + n_valid * HASH_PTE_SIZE_64;
     ssize_t rc;
+    g_autofree struct kvm_get_htab_header *buf = g_malloc(chunksize);
 
-    buf = alloca(chunksize);
     buf->index = index;
     buf->n_valid = n_valid;
     buf->n_invalid = n_invalid;
@@ -2741,10 +2741,10 @@ void kvmppc_read_hptes(ppc_hash_pte64_t *hptes, hwaddr ptex, int n)
     i = 0;
     while (i < n) {
         struct kvm_get_htab_header *hdr;
+        char buf[sizeof(*hdr) + HPTES_PER_GROUP * HASH_PTE_SIZE_64];
         int m = n < HPTES_PER_GROUP ? n : HPTES_PER_GROUP;
-        char buf[sizeof(*hdr) + m * HASH_PTE_SIZE_64];
 
-        rc = read(fd, buf, sizeof(buf));
+        rc = read(fd, buf, sizeof(*hdr) + m * HASH_PTE_SIZE_64);
         if (rc < 0) {
             hw_error("kvmppc_read_hptes: Unable to read HPTEs");
         }
-- 
2.26.3


