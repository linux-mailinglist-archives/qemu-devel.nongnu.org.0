Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5041376732
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:47:50 +0200 (CEST)
Received: from localhost ([::1]:38998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1ld-0000sY-9M
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1hR-0007Ou-T4
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:43:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1hQ-0000Wn-6X
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:43:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620398605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TX2Xz11Yxqn3cVVJ/gzPo0vFUN0FblHfQJn4P/Y+Hk0=;
 b=VRIbKc9xeT5EBBykfg3piVaJ+oJ5DyKaIqsujgchXmbpiDkBeSdW/iBc8b+uFx1sgZbuD8
 2x31q6pT3dnlYns6oqWMr/jdVyfZY4QRZ6zofFv+Zl/obaOF2HJJMDVWJlww+l7+TKo2Wx
 Ia/XmI7fINKbMWld8Up4Df8HOuikmno=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-JiIxie_pNkCuK9pKV4qpFQ-1; Fri, 07 May 2021 10:43:24 -0400
X-MC-Unique: JiIxie_pNkCuK9pKV4qpFQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso3695089wre.8
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 07:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TX2Xz11Yxqn3cVVJ/gzPo0vFUN0FblHfQJn4P/Y+Hk0=;
 b=Sy/lNCOVXLyL5OHzBBxX6F66Opk+wJP8cp3w0m7lwejyK+tSIr782p02atuworolSA
 2crEkSxoeH9eWi7sK6ABdYHB2Z1iws668nuuLtBs1hY+KakgxZ0+FLO+t6a997XEOr5w
 3OkJWIAODGyW2lR19SFViLT8YjezUqfZAecCzA3ss6+/dx8KWgy6fccDaIlHbLirBPDf
 91TK4VLmoO5u0MjEgxdxGvB6386h+/NIUDfmD3IXuUB8m1rJeWxE2v1JOODo2qkyGDmv
 pBJ9lXWT1LAiH9/n5/d27Os04P0nK4oJbVoS2i054MWRUWmv54OIWhFqD9ScSTeW9VRv
 7HvQ==
X-Gm-Message-State: AOAM531B+WOY9GUH8yKaO62p0SOOuW1GMeyb/XqP7aj3QnSasv333KK+
 HLpfQqqouiTtb2uEb5hsuPYg4EHmxQvrwlbnYa2z0CqITQV6MYG8jkjk1KXFGLzXdGE4TguX4I4
 wtnZpuT8jBswaSi9vFbZD4EO/fJETFF9gvqOpEAsqsWa+njR80umOlLtLKTGhgkn+
X-Received: by 2002:a5d:4810:: with SMTP id l16mr12460000wrq.44.1620398602713; 
 Fri, 07 May 2021 07:43:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbBHiRPbLZTqg/6vC8WRerq8TTv4Coun5JgZZb3kUj3oCXgJlkY4EzdyWqLFhr8EGOc5a3pw==
X-Received: by 2002:a5d:4810:: with SMTP id l16mr12459975wrq.44.1620398602565; 
 Fri, 07 May 2021 07:43:22 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id i14sm23099111wmq.1.2021.05.07.07.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:43:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/17] bsd-user/syscall: Replace alloca() by g_try_new()
Date: Fri,  7 May 2021 16:42:59 +0200
Message-Id: <20210507144315.1994337-2-philmd@redhat.com>
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".

Use autofree heap allocation instead (returning ENOMEM on failure).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 bsd-user/syscall.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 4abff796c76..6db05988f1b 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -355,9 +355,12 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     case TARGET_FREEBSD_NR_writev:
         {
             int count = arg3;
-            struct iovec *vec;
+            g_autofree struct iovec *vec = g_try_new(struct iovec, count);
 
-            vec = alloca(count * sizeof(struct iovec));
+            if (!vec) {
+                ret = -TARGET_ENOMEM;
+                goto fail;
+            }
             if (lock_iovec(VERIFY_READ, vec, arg2, count, 1) < 0)
                 goto efault;
             ret = get_errno(writev(arg1, vec, count));
-- 
2.26.3


