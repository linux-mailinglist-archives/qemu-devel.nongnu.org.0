Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8B53D26E3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:41:01 +0200 (CEST)
Received: from localhost ([::1]:60170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6aol-0000vk-Pg
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akI-0000ZX-Ko
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:22 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:36416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akG-0002hd-Hg
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:22 -0400
Received: by mail-ed1-x535.google.com with SMTP id h2so7335408edt.3
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OvCsuQTCKolldXkD8XBLFsvZqVgvWjLwnNgNmih/Hb4=;
 b=RDRSHW339576z/92GaOatm5QaGzgP8imMuasYHnaL64afzqGxoTFnivnRsvYIKkFDG
 wHo+iixDSqIx5fkMrybPSW3DzN2T55YdJ97XLDTNWD7QdphJtKgoOQIicCXGrNFjEiW4
 hCY9y5j6JDDTcFehutbKL7qPbwSI2FJ6cwwqSkQV+4zquxWFHLM11v7jMF8fTX3du/jt
 94BonQ4j+wWRL0ppgvub5of/rpAEONLie3qNt8r4h52BZxE+UF53BpVI1fLO92X5vJsT
 53gAN/iGcsVqWTUBNZczh1DRGbaOFOZlqPYpVAnqEaNQJZMHvCsI1jg192fSRi0EANcW
 aa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OvCsuQTCKolldXkD8XBLFsvZqVgvWjLwnNgNmih/Hb4=;
 b=h9RqO2YkDp4fCvr+KHAzSJCuPlTYy1e9gJUfeazclhdujvFFziJLZ5txGN0Dt5MlJu
 cV3w/Id39Oo+DElKzbTK2qIaSIlO1ca/75qyzXqrUJGTB0MHvHBfrZsOTuMWB4qob0TQ
 1HrKUXdL84aOivn3ySgqarYLxJavf2SSgDP3peTBGCpvmTUu7w1SoWeLYMLciCp7QQPG
 0HC+hmuQz7SP0XD7pOqE8CdAD3ylskajqjWk4q37+o9KEtWfyO71WBnJvVJ7syjmw3XM
 RFn1QnVUn9fFnIvmsbtlsI8SAYLSVZGon6Frpf9wR3AD0QPWX7/GSHlu2c+UEEskntqZ
 5vQw==
X-Gm-Message-State: AOAM532QLt1FDkf9KosofUb7j6QZUQhktnfcdU0ZVtzkUf7DUkipjpie
 O9MuLJmh63kgUpLFY50D1RG9sMpRFF1S9Q==
X-Google-Smtp-Source: ABdhPJz4mZhDx89egdXDVYajtzdgesIXmjru3ZdYrNgIIW+lkJ3ifof6tpZGv4AsiNuwin8EQ0eT+w==
X-Received: by 2002:a50:8d4e:: with SMTP id t14mr288069edt.138.1626968176194; 
 Thu, 22 Jul 2021 08:36:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id qo6sm9638628ejb.122.2021.07.22.08.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:36:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/15] vl: Parse legacy default_machine_opts
Date: Thu, 22 Jul 2021 17:36:00 +0200
Message-Id: <20210722153612.955537-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722153612.955537-1-pbonzini@redhat.com>
References: <20210722153612.955537-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jason Andryuk <jandryuk@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Andryuk <jandryuk@gmail.com>

qemu can't start a xen vm after commit d8fb7d0969d5
"vl: switch -M parsing to keyval" with:

$ ./qemu-system-i386 -M xenfv
Unexpected error in object_property_find_err() at ../qom/object.c:1298:
qemu-system-i386: Property 'xenfv-3.1-machine.accel' not found
Aborted (core dumped)

The default_machine_opts handling doesn't process the legacy machine
options like "accel".  Call qemu_apply_legacy_machine_options to provide
the legacy handling.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Message-Id: <20210713021552.19110-1-jandryuk@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4df1496101..f4d8630fc6 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2126,6 +2126,7 @@ static void qemu_create_machine(QDict *qdict)
         QDict *default_opts =
             keyval_parse(machine_class->default_machine_opts, NULL, NULL,
                          &error_abort);
+        qemu_apply_legacy_machine_options(default_opts);
         object_set_properties_from_keyval(OBJECT(current_machine), default_opts,
                                           false, &error_abort);
         qobject_unref(default_opts);
-- 
2.31.1



