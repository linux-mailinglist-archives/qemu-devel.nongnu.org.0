Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6024B670B5B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:11:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu9G-00006Y-BD; Tue, 17 Jan 2023 17:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9D-00005b-S3
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu96-0007Xs-4V
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hulNKOYkgTkwf0QwU7ikkHIwpsmJsFQjittKiUz75KY=;
 b=htNAu2vzfOIrKYSJxFx+3SbjM9SQgFMyy3KkDdn3mVSqroh7Jr4qBFJ/XiY6WIqxPjMiqm
 4CWUpAlogTTLJnuXixvcaOIBhS2NbUjJ8pDhLvT4MFzsADB5OYny8IdyvTHOvmJ8BAZjMp
 dbA2J0sv5AdV30xlx64BmK/9MK5Dr3o=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-26-tu75bYN3M6-KDlgAkC2OvQ-1; Tue, 17 Jan 2023 17:09:27 -0500
X-MC-Unique: tu75bYN3M6-KDlgAkC2OvQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 c10-20020a05621401ea00b004c72d0e92bcso16501428qvu.12
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:09:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hulNKOYkgTkwf0QwU7ikkHIwpsmJsFQjittKiUz75KY=;
 b=I3Zs722wVYQDeXqIL6WDpaeV0icXX+Nf7mAUrQanUOIcb0QyR/MuWETzIT0QvsS7OL
 jX9ZQUHnFrXYdx2IHnC4OIWfNmvvPxWcAKec+UM2ka+O8NSrFvDA/aPsj5y+fyi9nYK3
 5OBA2KXIZdwLYk7WuXkMbX9gWoqPcJBewZKcSAi5GXEDfYqkflpBqlc5VyuHYwkCrOU+
 lnCJd8XUHo3lJ/e9wid3c4Bif880KV8aXc26t7/NFOPCQxWuhc9XR9GNRMEUcs5rHfFA
 2waPFsfJIgK4vVCGAcXCi4iqk2oPu7ACIKzdu35jeBmwt5SdfQ2Dd2w+XxE0P/eW3lE3
 Oc6A==
X-Gm-Message-State: AFqh2kq4P+dG/IgKUpy13jBUTZsARJ8/YDpL8dL107zysJhR3l9BVT4g
 xsPSdVyDjRyeTM6WU5WVYAbWO3pj7/gbXvBXqxQh1XxGIkD5iy2mVs+6pFAGNvZ1aLwkJCgJU8w
 Fj2pcp0fNyL2xYfyHo2I4Eo04KYjLAkbdytxUBSU2FngyTXecGLZwZvAXxaF6HBI8
X-Received: by 2002:a05:622a:1a15:b0:3b6:43dd:9016 with SMTP id
 f21-20020a05622a1a1500b003b643dd9016mr3535932qtb.3.1673993366037; 
 Tue, 17 Jan 2023 14:09:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvI36Mic+7eskdYAEhrI5uMm+AuxR/UHD1rSM+dUTbPm70f0iIl66GlQwf+UYkLKkLMMls4Ew==
X-Received: by 2002:a05:622a:1a15:b0:3b6:43dd:9016 with SMTP id
 f21-20020a05622a1a1500b003b643dd9016mr3535903qtb.3.1673993365756; 
 Tue, 17 Jan 2023 14:09:25 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:09:25 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 04/21] madvise: Include linux/mman.h under linux-headers/
Date: Tue, 17 Jan 2023 17:08:57 -0500
Message-Id: <20230117220914.2062125-5-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230117220914.2062125-1-peterx@redhat.com>
References: <20230117220914.2062125-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

This will allow qemu/madvise.h to always include linux/mman.h under the
linux-headers/.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/qemu/madvise.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/qemu/madvise.h b/include/qemu/madvise.h
index e155f59a0d..b6fa49553f 100644
--- a/include/qemu/madvise.h
+++ b/include/qemu/madvise.h
@@ -8,6 +8,10 @@
 #ifndef QEMU_MADVISE_H
 #define QEMU_MADVISE_H
 
+#ifdef CONFIG_LINUX
+#include "linux/mman.h"
+#endif
+
 #define QEMU_MADV_INVALID -1
 
 #if defined(CONFIG_MADVISE)
-- 
2.37.3


