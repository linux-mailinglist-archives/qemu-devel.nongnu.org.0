Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3098D41FC0D
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:07:34 +0200 (CEST)
Received: from localhost ([::1]:54454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWejl-0002hV-5h
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWM-0000oS-Ab
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:53:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWK-0000cT-R0
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:53:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZlL6otvRUOhsGg4LexEjqPgBur9Sbw4O6pWOtqIiK2E=;
 b=GZdx9slGGrzOtU9ZPOPmAIm7BlEZi22L3Kj/0gw2xDL3iTkk2WbAEqFk+qTX5o4zko35ta
 hmjW4b5KIUkpQlqXMdfqaPphlL7bnURMg9GH43Cdpb7oOLXEEOVtHB2vQphzPK6Zb4l6R+
 dwFw8DSMzMjSK7Wnz8J+rIsT7jAkYQM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-0qlgN0ApOaWsxcRphZUuMw-1; Sat, 02 Oct 2021 08:53:38 -0400
X-MC-Unique: 0qlgN0ApOaWsxcRphZUuMw-1
Received: by mail-wm1-f69.google.com with SMTP id
 y142-20020a1c7d94000000b0030cdc76dedeso7348199wmc.5
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZlL6otvRUOhsGg4LexEjqPgBur9Sbw4O6pWOtqIiK2E=;
 b=G/dZh3dsOUV8UvmspmTbsXiiQ18tc45Prft6GPcfh6EDeOwalW4Q1km4dsT5E0fZPE
 Gp+7ribuIf9HAAjLt7tPQNBfubUNEIinN5sWZN8QX/ESphZlg8bdQXbU+N99iVOFtaiO
 cZqGeTJ9h9g3C9DY7//N8kyT8NBekSj4pfzQyUQHLHcebtkKaFAj21+P91DJa8CiDfW+
 zxB8GqikKvVTygfwSsxH4RrtfBH28Rv8jw5jsC5NwZIrompzpCfLUYFJB+2rllgtb9Sx
 CB/MhQGfLh7WKSx43jCprLXlQHVbtSr2v/r/3nsDsim5C3uq5Um04kqDD+DgJ2Wm42F7
 WT+Q==
X-Gm-Message-State: AOAM533r0tGE4pV0kbouWt6OXm/1rL+tV+1ggfK8IkgVy7K6BTJdUJtb
 GmV1a0mE9RjJAe6v3MzdC7ziOGexuLJbzxKF8SDpqaCseN1+n8tBTEHg/WNN2c7KUZE03avGM0W
 GE9b5A2LNf55rR+ZlV74prIlpefq2zFTtW5OoXJFjk0kcAlaJ9TWhWbvE8iDwAi3j
X-Received: by 2002:adf:ea45:: with SMTP id j5mr3279499wrn.291.1633179217582; 
 Sat, 02 Oct 2021 05:53:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvngRg6mSfZAPhLoI1z88TfL+DRAdtPTmC0GBIdj7S99yXfNxRBj9wMpPO15fh3FpbNOAwJw==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr3279481wrn.291.1633179217363; 
 Sat, 02 Oct 2021 05:53:37 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 b15sm10237676wru.9.2021.10.02.05.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:53:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/22] target/i386/kvm: Restrict SEV stubs to x86
 architecture
Date: Sat,  2 Oct 2021 14:52:59 +0200
Message-Id: <20211002125317.3418648-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002125317.3418648-1-philmd@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SEV is x86-specific, no need to add its stub to other
architectures. Move the stub file to target/i386/kvm/.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 {accel => target/i386}/kvm/sev-stub.c | 0
 accel/kvm/meson.build                 | 1 -
 target/i386/kvm/meson.build           | 2 ++
 3 files changed, 2 insertions(+), 1 deletion(-)
 rename {accel => target/i386}/kvm/sev-stub.c (100%)

diff --git a/accel/kvm/sev-stub.c b/target/i386/kvm/sev-stub.c
similarity index 100%
rename from accel/kvm/sev-stub.c
rename to target/i386/kvm/sev-stub.c
diff --git a/accel/kvm/meson.build b/accel/kvm/meson.build
index 8d219bea507..397a1fe1fd1 100644
--- a/accel/kvm/meson.build
+++ b/accel/kvm/meson.build
@@ -3,6 +3,5 @@
   'kvm-all.c',
   'kvm-accel-ops.c',
 ))
-kvm_ss.add(when: 'CONFIG_SEV', if_false: files('sev-stub.c'))
 
 specific_ss.add_all(when: 'CONFIG_KVM', if_true: kvm_ss)
diff --git a/target/i386/kvm/meson.build b/target/i386/kvm/meson.build
index b1c76957c76..736df8b72e3 100644
--- a/target/i386/kvm/meson.build
+++ b/target/i386/kvm/meson.build
@@ -7,6 +7,8 @@
   'kvm-cpu.c',
 ))
 
+i386_softmmu_kvm_ss.add(when: 'CONFIG_SEV', if_false: files('sev-stub.c'))
+
 i386_softmmu_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
 
 i386_softmmu_ss.add_all(when: 'CONFIG_KVM', if_true: i386_softmmu_kvm_ss)
-- 
2.31.1


