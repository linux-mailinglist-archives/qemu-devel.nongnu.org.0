Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D14F3DA362
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:52:00 +0200 (CEST)
Received: from localhost ([::1]:41448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95W3-0003vm-Cz
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m95Rd-0003iE-PC
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:47:25 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:39713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m95Rc-0007Zw-7i
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:47:25 -0400
Received: by mail-ed1-x530.google.com with SMTP id y12so8035501edo.6
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 05:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=InPTgA7QqpX0ZseNHj/4LRLcFSFpucQ8s+I0td4sp/o=;
 b=oEtyqyLNiL1xZbcQm8ZKcFnrsj8NB3m9xqQ4f2a//bGlqwdHsv687AsQTm++GOo9K3
 OgLWgHNbdC6WCgA3UxRT16wSv0jwXwy6MywuqbpDCgA5z3SZMoJbcXIy4mVKAsNcCp7v
 Mvi++4XfNAnRvaUBiBBP8Oc9cO3yaA721sixkzDCoSJgPH+afetv866TslRMSQhNnOJO
 t++mScy2zwDGJnGhoG6iVZsQeURTG4FLS5KqagtpfTAfoXoZ+a8NgHzFTfHstzQLt4Hz
 ViPsdEhfBU3/5NAlURMLnoHO/rWkJsSKCxAm/XFEsuP5xvaRNzWGgH5DIytD9F7tLseg
 dcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=InPTgA7QqpX0ZseNHj/4LRLcFSFpucQ8s+I0td4sp/o=;
 b=R3W9B0oB3pgxl/stDSAM+/5xVNd9DMXT49/2W8ajO9AcDCrRkZiGK4DWCSRakjyZYY
 gOJoD7aDpW3yMyeVSqIKOfuGN8jDJ2Y43H5Lpl3lcuiyMTs/hjtHxYMVoL/kHW4PsfGT
 YE0tlj3AxXbiLGf1HierLfJflfbXVTTgWEUlfUKZDkLHt7xEbpDYfvRrPYaBFMhzHnEq
 hJWVOCbNk5lqnxKYsGgi82lZ+UA2kNUYksVSdoI0kUjmfmntcBE21Qh7fm1B2SK3mJDC
 LnVkF0VFF8e+3cCoISG8VAlGuM6lrSvdH/JGiqrOfJNSUoGF30s4WDHbss23rbDolRCs
 fDow==
X-Gm-Message-State: AOAM530H29kkfAc9+zn8Nr44Lt0HdGbxkN59MklcNCuVxKhpxDOgzzxl
 P3xYIo2sV3YKQhk4qHzXeSM77z/WhYmddw==
X-Google-Smtp-Source: ABdhPJwvp97ueMGC/bRaUFUojHX6W4M+EXG7We1yn51afoxkyGnRU0uJSqTq5MjKZJF9kXy6027arA==
X-Received: by 2002:a05:6402:60c:: with SMTP id
 n12mr5798342edv.189.1627562842928; 
 Thu, 29 Jul 2021 05:47:22 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id m12sm954659ejd.21.2021.07.29.05.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 05:47:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] libvhost-user: fix -Werror=format= warnings with __u64
 fields
Date: Thu, 29 Jul 2021 14:47:13 +0200
Message-Id: <20210729124713.208422-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729124713.208422-1-pbonzini@redhat.com>
References: <20210729124713.208422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

../subprojects/libvhost-user/libvhost-user.c:1070:12: error: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 3 has type ‘__u64’ {aka ‘long long unsigned int’} [-Werror=format=]
 1070 |     DPRINT("    desc_user_addr:   0x%016" PRIx64 "\n", vra->desc_user_addr);
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~              ~~~~~~~~~~~~~~~~~~~
      |                                                           |
      |                                                           __u64 {aka long long unsigned int}

Rather than using %llx, which may fail if __u64 is declared differently
elsewhere, let's just cast the values. Feel free to propose a better solution!

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210505151313.203258-2-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 2971ba0112..bf09693255 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -1067,10 +1067,10 @@ vu_set_vring_addr_exec(VuDev *dev, VhostUserMsg *vmsg)
     DPRINT("vhost_vring_addr:\n");
     DPRINT("    index:  %d\n", vra->index);
     DPRINT("    flags:  %d\n", vra->flags);
-    DPRINT("    desc_user_addr:   0x%016" PRIx64 "\n", vra->desc_user_addr);
-    DPRINT("    used_user_addr:   0x%016" PRIx64 "\n", vra->used_user_addr);
-    DPRINT("    avail_user_addr:  0x%016" PRIx64 "\n", vra->avail_user_addr);
-    DPRINT("    log_guest_addr:   0x%016" PRIx64 "\n", vra->log_guest_addr);
+    DPRINT("    desc_user_addr:   0x%016" PRIx64 "\n", (uint64_t)vra->desc_user_addr);
+    DPRINT("    used_user_addr:   0x%016" PRIx64 "\n", (uint64_t)vra->used_user_addr);
+    DPRINT("    avail_user_addr:  0x%016" PRIx64 "\n", (uint64_t)vra->avail_user_addr);
+    DPRINT("    log_guest_addr:   0x%016" PRIx64 "\n", (uint64_t)vra->log_guest_addr);
 
     vq->vra = *vra;
     vq->vring.flags = vra->flags;
-- 
2.31.1


