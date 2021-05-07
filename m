Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC8637674B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:55:15 +0200 (CEST)
Received: from localhost ([::1]:33918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1so-0001vW-QJ
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1if-00085L-KQ
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1iW-000142-ST
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620398675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+MYJWIsLohbCHlMSEIGcZQyDaEDuU9Kl0ow5213YNc=;
 b=C08KcZ1kPHCiN59eRkWnfgLji7+7c2gy17NPT6hPF+uMpXmQyagPqB5S1hKivR39p9fnhv
 HZwBYmukYos5R9b/G13xNley3m0SywM5tMbwfel/Z1PwBNpRMqQkXPvQNkOXVaKeXljkio
 UPb8mzrzK8Xp2IVD9iH1/JQiuVd3m2s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-xljEdoMGPFGkQmFvHex3Og-1; Fri, 07 May 2021 10:44:31 -0400
X-MC-Unique: xljEdoMGPFGkQmFvHex3Og-1
Received: by mail-wm1-f71.google.com with SMTP id
 w21-20020a7bc1150000b029014a850581efso2319704wmi.6
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 07:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C+MYJWIsLohbCHlMSEIGcZQyDaEDuU9Kl0ow5213YNc=;
 b=nNtApEeL4F0L8Q69hLrv4qa/iSxNFbHLXEVIpwxQopRJwOb7M5pRRsoBpWcXi4i0Lq
 z9ysnWPrZLinqmvdXsmcSBHi8DUmdKQIyc6/u6fLGxybS9PEb+E4lHbGeMld6jNlwtd2
 cV1uFYFxcwNBx0q8cMGQBk5ocC0ndHPmO/e15/0kSpwdRGtRVeDB8UB4dCiJpQT1U3gk
 MijXHVV1JKZFDtOuDAI0o0Au7O/qqs9HAu7aKImHEsGZyQNEJXC5F9LWDo9AXqKZYsMT
 wqjreR4+QqUnhti+BTpgqn6hxAH8dixc8VP7LvvOUd8S0qcremAq80JpqqENwjj9mPGo
 CySg==
X-Gm-Message-State: AOAM530MhfB+ezqf/lQk4Qtm5rxldb0vkMvk7MOyxPYAWZcNtuKAsTQN
 RmQ84bxzGPyGoXbjVaw3H3jrJcj2+Iq9HS4nnJ+g6xsVMyVF1VfUvhRvz+aW10yLSXAX1aPyKBn
 9jSMuAsCUYcoB9AZKbvtg5qshhPkEJwKhoA4el6fuECwLkpAssFcPqeH8u1ivTfK7
X-Received: by 2002:adf:f80f:: with SMTP id s15mr12876035wrp.341.1620398670283; 
 Fri, 07 May 2021 07:44:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyV3LXdgDeT9W3nPy2PYFEyT0xnL/c2fIbnfgtcygElbhUWgwrD2nI+U4GtCxZ9QE5ZsaU17g==
X-Received: by 2002:adf:f80f:: with SMTP id s15mr12876009wrp.341.1620398670157; 
 Fri, 07 May 2021 07:44:30 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id r13sm8833726wrn.2.2021.05.07.07.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:44:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/17] target/ppc/kvm: Replace alloca() by g_malloc()
Date: Fri,  7 May 2021 16:43:13 +0200
Message-Id: <20210507144315.1994337-16-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507144315.1994337-1-philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".

Use autofree heap allocation instead, replacing it by a g_malloc call.

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/ppc/kvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 104a308abb5..23c4ea377e8 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2698,11 +2698,11 @@ int kvmppc_save_htab(QEMUFile *f, int fd, size_t bufsize, int64_t max_ns)
 int kvmppc_load_htab_chunk(QEMUFile *f, int fd, uint32_t index,
                            uint16_t n_valid, uint16_t n_invalid, Error **errp)
 {
-    struct kvm_get_htab_header *buf;
+    g_autofree struct kvm_get_htab_header *buf = NULL;
     size_t chunksize = sizeof(*buf) + n_valid * HASH_PTE_SIZE_64;
     ssize_t rc;
 
-    buf = alloca(chunksize);
+    buf = g_malloc(chunksize);
     buf->index = index;
     buf->n_valid = n_valid;
     buf->n_invalid = n_invalid;
-- 
2.26.3


