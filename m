Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C3D6FC24F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:06:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJHm-0005eW-NC; Tue, 09 May 2023 05:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHk-0005cr-IC
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHj-00051x-0H
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683623126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u0lF41b+hn3LhFY0NQgeqz7xQczMxQr8wZ287hYzcnI=;
 b=DnqGdt1DU8qhf3jKocQVv2PW51evXjbA04ZhkfecEt10B8kEP0JhVFiqYIygYYrwDwRrbq
 IeQfHWA260F7aNPBvIEpx4e7IQ3/iaHhwfWv4C/9BCHaHoTv+kduoHreCwdKMtsALwlYrV
 6Pc/fPlDMhh06cnmx1qVBaISkv6NUtE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-eym4XqgKNEydykS4F7qcyw-1; Tue, 09 May 2023 05:05:25 -0400
X-MC-Unique: eym4XqgKNEydykS4F7qcyw-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50d89279d95so5132420a12.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683623124; x=1686215124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u0lF41b+hn3LhFY0NQgeqz7xQczMxQr8wZ287hYzcnI=;
 b=DYfR14OuO7SdH8mT507vPQB9jrOLD7vb2cuqJ53M7x50oKDwLWRg0skFNIFeZYkdnU
 PsQeqslmmMVs69cMEuZvd5f+he3w36nwHzSBh3FM669e6DHDWB/iCsrU+ppBHkD+sJeR
 483wL8bAc/ff11QygNoDzWyLSz5XeEKzhtyCz+veFISgxjz/iV4168KVONvqIXmpajMp
 3F0kaNXmiIhMEQ5reRWiz6EoOZ7iF8s+AL0nZAkSzbLbQjMjaydNPK0GnByYsE8BBmTM
 sHFRyMAaEjgvK/aPKw7gS1W8svGUzq7WBC1fIAnMxEQ7wQ2m5QwMmXzY2rpXZmrMqQ3Y
 dq3g==
X-Gm-Message-State: AC+VfDzFVwUYm/ofLLXBDOuOjU5tqS53y3cUo3jI+rxEEUj1KhwhBQiQ
 rPl5PoBofPhuXWydhA7TiNiTVT+Wwx5DT+BIENQnHW8BU0Zx/sJ+YDofOlzmmu2NFCGwbeKCHj9
 8UJbbZ4Qm+EQ9GpCA3YU09En5FR4B9QVcsJ3exnpRTq09ep0EiuXV4r64+rUbRNAa1jIJRaBVCv
 Q=
X-Received: by 2002:a05:6402:32b:b0:50b:7959:8b09 with SMTP id
 q11-20020a056402032b00b0050b79598b09mr10620743edw.15.1683623123926; 
 Tue, 09 May 2023 02:05:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5TzfPSdyPDZdlQfvq6ol9/fTFvzb+3Z+eMrXJMUgcrB+1wVSgB4rhI4VTV8vV6zQSppt6T3g==
X-Received: by 2002:a05:6402:32b:b0:50b:7959:8b09 with SMTP id
 q11-20020a056402032b00b0050b79598b09mr10620725edw.15.1683623123689; 
 Tue, 09 May 2023 02:05:23 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a056402068800b0050bc9c38fb4sm510205edy.69.2023.05.09.02.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 02:05:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
	qemu-stable@nongnu.org
Subject: [PULL 16/16] meson: leave unnecessary modules out of the build
Date: Tue,  9 May 2023 11:04:53 +0200
Message-Id: <20230509090453.37884-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509090453.37884-1-pbonzini@redhat.com>
References: <20230509090453.37884-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

meson.build files choose whether to build modules based on foo.found()
expressions.  If a feature is enabled (e.g. --enable-gtk), these expressions
are true even if the code is not used by any emulator, and this results
in an unexpected difference between modular and non-modular builds.

For non-modular builds, the files are not included in any binary, and
therefore the source files are never processed.  For modular builds,
however, all .so files are unconditionally built by default, and therefore
a normal "make" tries to build them.  However, the corresponding trace-*.h
files are absent due to this conditional:

if have_system
  trace_events_subdirs += [
    ...
    'ui',
    ...
  ]
endif

which was added to avoid wasting time running tracetool on unused trace-events
files.  This causes a compilation failure; fix it by skipping module builds
entirely if (depending on the module directory) have_block or have_system
are false.

Reported-by: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meson.build b/meson.build
index 229eb585f798..27782f8f52e1 100644
--- a/meson.build
+++ b/meson.build
@@ -3217,6 +3217,10 @@ modinfo_files = []
 block_mods = []
 softmmu_mods = []
 foreach d, list : modules
+  if not (d == 'block' ? have_block : have_system)
+    continue
+  endif
+
   foreach m, module_ss : list
     if enable_modules and targetos != 'windows'
       module_ss = module_ss.apply(config_all, strict: false)
-- 
2.40.1


