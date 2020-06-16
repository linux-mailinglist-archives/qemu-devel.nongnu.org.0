Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4701FB5A2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 17:07:10 +0200 (CEST)
Received: from localhost ([::1]:56454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlDB7-0007Cy-OF
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 11:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCR2-0004J5-E4; Tue, 16 Jun 2020 10:19:32 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:32780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCR0-00071u-Q6; Tue, 16 Jun 2020 10:19:32 -0400
Received: by mail-ot1-x342.google.com with SMTP id n6so16069938otl.0;
 Tue, 16 Jun 2020 07:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GSZfWFoXNTSGnh+M3lmAlBzkhHMx2WNUVXqbsauaOG4=;
 b=pZeZIXermwJMrDKQ83R4TtmZScmBcqjj/CtZ1flh0tH1nm4Oc64wMkXHo2lFfK4ox7
 q21U7Zzf/V+up3EriCmcq+Jik4zCoLoKMyOxcjH/+Zr2FkiPY8QVTKoImOyBpgedyUYQ
 MzMlWEEqY5cy6UbWYCMNjewl56z2Qfo3WVwl0XFjfj1YuayjpQAEkDpml/B0JZcdaPPb
 YiMwPhjBCryVmsOo1RrzI8Moo1ymoZl8ofn4mBiBNyo8suYEPdFNe/XLUJYUQeFN21FF
 N0PuiVS0aQ/Tg6RKffpq172HzRhlP2vVwbVdpAP5TV+vq2N6wT7wJmxpr3BikMmVBDAD
 08ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GSZfWFoXNTSGnh+M3lmAlBzkhHMx2WNUVXqbsauaOG4=;
 b=eA4fGGvLPpSzVEc3gOJPZ8E9nS/tRxwQH1CF0A9dAWxCoP+sP3rrBkfE2ehhCoARDD
 otIRPFWXVkLH3LtrV6M444/LzTFFV1WirXSS3Me7E/pZCXK7GduGKGEH6P/ZTM4O+XZp
 LOj8BssyDmDG5dmFEOEv9oyLs2JIf2Oxo8vR47rYNY5I9lVHfCGLEjYRZvb1dQ2Lw+FR
 I26M+AFuQPsKge+CYSOd1/Bf0zECK8i+doveRExIGDa1WgrNHMupodWpIUmAbkUxk/X6
 54uctTiTil0x3SP5KP63EqA7YDy5qEBGf0LBzHvf/9wCYYx2RGOAeWPd5iO3pLrkQZKH
 hHUg==
X-Gm-Message-State: AOAM533aoCw/xkDYZv2fl3lG0FcaeVqt1KpcOQqvt2DObZipMiEm5AcT
 U8B1/GOgkLLUPRbjS0OV3zX92AvHjLM=
X-Google-Smtp-Source: ABdhPJwA8v5akFDw+7piDRGgsNddhM/t6lethh0+hfEQmDc66qTEPI/nvOftRYt/unmH8n7zB3iDlg==
X-Received: by 2002:a05:6830:1f1b:: with SMTP id
 u27mr2693775otg.327.1592317168834; 
 Tue, 16 Jun 2020 07:19:28 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id q2sm4180208oti.36.2020.06.16.07.19.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 07:19:27 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 69/78] hostmem: don't use mbind() if host-nodes is empty
Date: Tue, 16 Jun 2020 09:15:38 -0500
Message-Id: <20200616141547.24664-70-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=flukshun@gmail.com; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-stable@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Since 5.0 QEMU uses hostmem backend for allocating main guest RAM.
The backend however calls mbind() which is typically NOP
in case of default policy/absent host-nodes bitmap.
However when runing in container with black-listed mbind()
syscall, QEMU fails to start with error
 "cannot bind memory to host NUMA nodes: Operation not permitted"
even when user hasn't provided host-nodes to pin to explictly
(which is the case with -m option)

To fix issue, call mbind() only in case when user has provided
host-nodes explicitly (i.e. host_nodes bitmap is not empty).
That should allow to run QEMU in containers with black-listed
mbind() without memory pinning. If QEMU provided memory-pinning
is required user still has to white-list mbind() in container
configuration.

Reported-by: Manuel Hohmann <mhohmann@physnet.uni-hamburg.de>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20200430154606.6421-1-imammedo@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
(cherry picked from commit 70b6d525dfb51d5e523d568d1139fc051bc223c5)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 backends/hostmem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index e773bdfa6e..21b1993e49 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -363,8 +363,10 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
         assert(sizeof(backend->host_nodes) >=
                BITS_TO_LONGS(MAX_NODES + 1) * sizeof(unsigned long));
         assert(maxnode <= MAX_NODES);
-        if (mbind(ptr, sz, backend->policy,
-                  maxnode ? backend->host_nodes : NULL, maxnode + 1, flags)) {
+
+        if (maxnode &&
+            mbind(ptr, sz, backend->policy, backend->host_nodes, maxnode + 1,
+                  flags)) {
             if (backend->policy != MPOL_DEFAULT || errno != ENOSYS) {
                 error_setg_errno(errp, errno,
                                  "cannot bind memory to host NUMA nodes");
-- 
2.17.1


