Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04A6670B6D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:11:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu9H-0000C8-Sz; Tue, 17 Jan 2023 17:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9G-00006t-5y
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9D-0007YL-M6
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z4pSYzeh/hEHH8/U7keCTUAk7hSnmmUcX2s4y6e9rfI=;
 b=PARwgXKsQOSoTLrwflsPwUZih3K3FqGGCr0EKrkXXezb74TyPe3f2IxONL4ieLvSx6Hb4L
 hQYYW7KMKbLKBhPT30OU0eEJRpCYYd+FSOSuPgDXXvVSODFdAZ4rZDxd1akZPK0zMhnKtn
 /JSZ3+TEy/mvkEc6L0Ilfea762/GLpE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-ww1AuZqBPIm3gWD10EO25A-1; Tue, 17 Jan 2023 17:09:33 -0500
X-MC-Unique: ww1AuZqBPIm3gWD10EO25A-1
Received: by mail-qk1-f197.google.com with SMTP id
 de38-20020a05620a372600b0070224de1c6eso23865438qkb.17
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:09:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z4pSYzeh/hEHH8/U7keCTUAk7hSnmmUcX2s4y6e9rfI=;
 b=azl3/bfO2sTgoOtXiImPZnNfzuJjfLhbCxum/YjRNZ++Gu6fAbGnISyoutLurB/S41
 eLAKTmKwjESkNjfp4QU+xxyj8L9/JUdtsaEAZ1iJ951UIo0ihV0SHMT+SMzqiM2LiPro
 WCeikeW48BdO0TsPmouW1v1s6pHSRTBJVQNkeVBtwrIVQIptYV7qfQ0+8fGvGHWmIAh8
 NxsF2H/ObBQZ369TjkZxD2jx8z0BM94olZZvJI79Ibe+Mqonv309HbJHQWpVi3LyoRCR
 g8EerwOAEJ9dywWAxb8fCjcuG6Fq3aSAA4CY98CtbQDu7jgEFsNUFnECTdQLYm29v1Lb
 PJFQ==
X-Gm-Message-State: AFqh2kqxUujy+Rz8dZQVkXByYLSu7eHHbqZik+sMugxmKRsCPFgALeYQ
 FxEe7bvmpdGhJWWjI/DkbPbhzVKWzYw+kymK5BFjzhDLmYKQ8+oghtqTbXBjEZnUG2cXvmTgIH9
 dkJ4OqSJo/G1O4L0HDSWL36CauPpGTmaQCq+qXSR9TWsKpq31iPAOTBF/7z2V0m8A
X-Received: by 2002:a05:6214:4381:b0:535:26a9:782 with SMTP id
 oh1-20020a056214438100b0053526a90782mr6729600qvb.37.1673993371917; 
 Tue, 17 Jan 2023 14:09:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsVasjuyiR4kYzwPUKstPsVbPVhVMkFUJvhSibumwUcGxKS5hp4Jgq0mnxFJ8LcBSZZvPFZEQ==
X-Received: by 2002:a05:6214:4381:b0:535:26a9:782 with SMTP id
 oh1-20020a056214438100b0053526a90782mr6729571qvb.37.1673993371624; 
 Tue, 17 Jan 2023 14:09:31 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:09:30 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 06/21] madvise: Add QEMU_MADV_COLLAPSE
Date: Tue, 17 Jan 2023 17:08:59 -0500
Message-Id: <20230117220914.2062125-7-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230117220914.2062125-1-peterx@redhat.com>
References: <20230117220914.2062125-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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

MADV_COLLAPSE is a new madvise() on Linux.  Define it.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/qemu/madvise.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/qemu/madvise.h b/include/qemu/madvise.h
index 3dddd25065..794e5fb0a7 100644
--- a/include/qemu/madvise.h
+++ b/include/qemu/madvise.h
@@ -68,6 +68,11 @@
 #else
 #define QEMU_MADV_SPLIT QEMU_MADV_INVALID
 #endif
+#ifdef MADV_COLLAPSE
+#define QEMU_MADV_COLLAPSE MADV_COLLAPSE
+#else
+#define QEMU_MADV_COLLAPSE QEMU_MADV_INVALID
+#endif
 
 #elif defined(CONFIG_POSIX_MADVISE)
 
@@ -83,6 +88,7 @@
 #define QEMU_MADV_REMOVE QEMU_MADV_DONTNEED
 #define QEMU_MADV_POPULATE_WRITE QEMU_MADV_INVALID
 #define QEMU_MADV_SPLIT QEMU_MADV_INVALID
+#define QEMU_MADV_COLLAPSE QEMU_MADV_INVALID
 
 #else /* no-op */
 
@@ -98,6 +104,7 @@
 #define QEMU_MADV_REMOVE QEMU_MADV_INVALID
 #define QEMU_MADV_POPULATE_WRITE QEMU_MADV_INVALID
 #define QEMU_MADV_SPLIT QEMU_MADV_INVALID
+#define QEMU_MADV_COLLAPSE QEMU_MADV_INVALID
 
 #endif
 
-- 
2.37.3


