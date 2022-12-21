Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A846535CB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:03:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Q9-0000qk-W1; Wed, 21 Dec 2022 13:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Q6-0000nd-Ry
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Q4-0004K4-Up
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/jY4sDZGlqpxnHZO0MFdt7TM4ihTKq+v+miIcD6185U=;
 b=LJ4a3h/qdTyo/z8zOi1yZqql5kGNsSBsGpuB565SZ9Ba2dEMqpsUo3/9ZuV/97/N3ylWix
 +GnNNF86aG60klx3C64Eqv1vIKZmMAiHPDxjvVgi8XbgJr4od3qgpzq/bu8xPrp2iVm9w6
 ezorUGjunmFMMiZ3tPkyFkkkelGJ6pE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-83-4ZPrhC9bO5Kr2BL57if6cQ-1; Wed, 21 Dec 2022 13:02:18 -0500
X-MC-Unique: 4ZPrhC9bO5Kr2BL57if6cQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 dn11-20020a17090794cb00b007c14ea70afcso10967196ejc.0
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/jY4sDZGlqpxnHZO0MFdt7TM4ihTKq+v+miIcD6185U=;
 b=6E2V+7UMNSjQpfH+NSPqiC072SsljWA3aptSlxYLmaCNrv4w4t5PIIqgOxYpErGn2A
 3feMFwy8qJubS6jw1B/FAnUiqJEvWTeYzI/pZHTeTj6zPMHhSoLXiUI+rxtLRha+Jexx
 SBP9JbspznfhIFvsaH1BFBmChROIxrrQgbR3jb52adAV5+qevVZOv7h0YZmLXgjmqBa3
 lxloDV6mee6QH6YuvbzK09hdfZsqExDMNSZD3TuuTaXfpcxqe3CPgTFG5yUzW1G9MgMi
 HZ8NrFEYcB2SFgRJt68gKF9gDuJuMbv9VfzEbXXpo40+O8VqfXEmMDR51REVtMwKDnBr
 xSXQ==
X-Gm-Message-State: AFqh2kq67N6Y42O3sK8Rb2Dcz9VJB3bnoi9Qtwh2SVUVboT9eXn5jeTI
 fsG0ybhaNk723mFzo8qvVVjubettMlIKDQbUd1WpCoDLFf/L+YweDMScPIFUjaSodL6pHMw+9Dx
 zyIQcZhZizb5Gz7ukhcOj+0XBy5Vfaj2K8Q2ZKj0NanEeihr+miRwLpheGJDq1fJ9I/M=
X-Received: by 2002:a17:906:1583:b0:83f:384f:ea23 with SMTP id
 k3-20020a170906158300b0083f384fea23mr1822343ejd.57.1671645737158; 
 Wed, 21 Dec 2022 10:02:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuwb1VCOXVnCFh2LkoXSzWZz5NPURz0zpcK8ezXdgzLZN7SKBf0iixt8nDFJd0Xx77lHmFzqQ==
X-Received: by 2002:a17:906:1583:b0:83f:384f:ea23 with SMTP id
 k3-20020a170906158300b0083f384fea23mr1822326ejd.57.1671645736960; 
 Wed, 21 Dec 2022 10:02:16 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 r20-20020aa7da14000000b0046b9c536fc5sm7218763eds.63.2022.12.21.10.02.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:02:16 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/24] meson: tweak hardening options for Windows
Date: Wed, 21 Dec 2022 19:01:29 +0100
Message-Id: <20221221180141.839616-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

meson.build has been enabling ASLR _only_ for debug builds since
commit d2147e04f95f ("configure: move Windows flags detection to meson",
2022-05-07); instead it was supposed to disable it for debug builds.

However, the flag has been enabled for DLLs upstream for roughly 2
years (https://sourceware.org/bugzilla/show_bug.cgi?id=19011), and
also by some distros including Debian for 6 years even
(https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=836365).

Enable it unconditionally; we can fix the reversed logic of commit
d2147e04f95f later if there are any reports, but for now just
enable the hardening.

Also add -Wl,--high-entropy-va, which also controls ASLR.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index 5c6b5a1c757f..d61c7a82f112 100644
--- a/meson.build
+++ b/meson.build
@@ -193,10 +193,7 @@ qemu_ldflags += cc.get_supported_link_arguments('-Wl,-z,relro', '-Wl,-z,now')
 
 if targetos == 'windows'
   qemu_ldflags += cc.get_supported_link_arguments('-Wl,--no-seh', '-Wl,--nxcompat')
-  # Disable ASLR for debug builds to allow debugging with gdb
-  if get_option('optimization') == '0'
-    qemu_ldflags += cc.get_supported_link_arguments('-Wl,--dynamicbase')
-  endif
+  qemu_ldflags += cc.get_supported_link_arguments('-Wl,--dynamicbase', '-Wl,--high-entropy-va')
 endif
 
 if get_option('gprof')
-- 
2.38.1


