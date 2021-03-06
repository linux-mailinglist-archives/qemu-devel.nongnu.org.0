Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44A032F98E
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 12:03:26 +0100 (CET)
Received: from localhost ([::1]:35678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUiT-000196-Ms
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 06:03:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZs-0005tp-HL
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:32 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZr-00088D-2X
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:32 -0500
Received: by mail-wr1-x434.google.com with SMTP id l11so1808961wrp.7
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EW+RazKmnfzV3iFKv1E/1XtA1W8hxsl/EMoQcnNU61o=;
 b=gN2tJF5Z2uVdSrzhhORbAVxyS+T87fLG79E4z998KIqAfOz8vTDLHhQCQ0yBnuCs09
 SI7zEX90ju6Z4TYPfyLXKBd0VbR3XxHSeK1gsfQVypLYYZ/tNelyrzjghLM/NrphaRw5
 k9FOrSaZtamPpSEghzI7dT1B/L5DSFwe+zQxspuaT6wA5kiNAncr68x6VsKolEnD1nVl
 FKVF1JDNOZptaCNtnx+nMN8xTgB4diTFxcHDzcRXqOpnkRgTM/41UigaFPIe9zxgzXlZ
 yY3ZdAs8cCZi9waeKYbISIVfGt+bFhGqikFjNIT7Ft1sGg/fhYeu5PS21KjdFuLQmlkD
 6Dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EW+RazKmnfzV3iFKv1E/1XtA1W8hxsl/EMoQcnNU61o=;
 b=Y8/MimhetxNIzN+cYo7ZC3f8VdsRNUypYSe9HkBg9Ia8Bo9+0iRxG0Zs4MRv6wYDV4
 +FWVoO1i9ysRbtQ8lfrxvYtKsO+FqD5yGI5rYk4strbcPqRZzDGldftRTE+mQbrXFnFw
 UaVO3884785B0e5d+Ca2W12X2lG1r3ouE7N+EQk7Rw4Ggj9VoY8RySExzdphqktjqHki
 PN/M44R3Gs7phNPEO3uE9GI+FBBC6G4n0OFi1H3NTB/9I59Y8Zmnxx8laSx5uU6HRowD
 FcbOG66NS3MGFtDcciWHHfHM2v9rjSo9zAapCjhb2KAkQ5dfRkzgYq/MNvUeE1QQ84Uv
 Iwnw==
X-Gm-Message-State: AOAM530bpe9AwkdBpfovXpEHI1k9XfRtARd4tGc603F82HawDtBcBqy3
 c2tIOCaH2BOGdZpnfI2DFF9eep2DkVQ=
X-Google-Smtp-Source: ABdhPJzW6engqE3cQ5Gl8gWdXKgG4YHg+OexuY7hTYh4BW2oxQNn3grqtQafjmiIeLT6V2cKRfdFhQ==
X-Received: by 2002:adf:f905:: with SMTP id b5mr13141765wrr.129.1615028069872; 
 Sat, 06 Mar 2021 02:54:29 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/23] elf_ops: correct loading of 32 bit PVH kernel
Date: Sat,  6 Mar 2021 11:54:06 +0100
Message-Id: <20210306105419.110503-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

Because sizeof(struct elf64_note) == sizeof(struct elf32_note),
attempting to use the size of the currently defined struct elf_note as
a discriminator for whether the object being loaded is 64 bit in
load_elf() fails.

Instead, take advantage of the existing glue parameter SZ, which is
defined as 32 or 64 in the respective variants of load_elf().

Fixes: 696aa04c84c6 ("elf-ops.h: Add get_elf_note_type()")
Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20210302090315.3031492-2-david.edmondson@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/hw/elf_ops.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 8e8436831d..78409ab34a 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -598,9 +598,7 @@ static int glue(load_elf, SZ)(const char *name, int fd,
             nhdr = glue(get_elf_note_type, SZ)(nhdr, file_size, ph->p_align,
                                                *(uint64_t *)translate_opaque);
             if (nhdr != NULL) {
-                bool is64 =
-                    sizeof(struct elf_note) == sizeof(struct elf64_note);
-                elf_note_fn((void *)nhdr, (void *)&ph->p_align, is64);
+                elf_note_fn((void *)nhdr, (void *)&ph->p_align, SZ == 64);
             }
             data = NULL;
         }
-- 
2.29.2



