Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C262F444473
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:14:02 +0100 (CET)
Received: from localhost ([::1]:35782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHxh-0002AD-Tx
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHp8-0003UT-O1
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:12 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHp0-0000Z5-Dh
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:08 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso4862978wmd.4
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GMP3uUjLWtP0WS92hT7gluftEH4jK1vIjm6dISQNfvM=;
 b=F1dI5f0SwVmBu8bN2i+1ruJ8p1MLb9FUc+NZ0lAAfc9i9rK+qPp4mddaZMuIu/QaTG
 7XMFXSQoM2feawsMOn5Q4Vnu5BkUg8fZ/hbpN0jFntljppMrV8yeV/tlOvR42KtvQv2E
 hwqqAEO7SHvV2JtaEOSuFUUbR9O2zW6uv+9RSaM+gaJ3c/nyk4GqdpoPrs54FMArBIsC
 m/gUBhU4kAQwOucdJp/wxpO6Ve7ElpBc4+ItTEGjz69Yh+zwkqiRwlv/Jk5o9w+w8kfK
 XKkeDZkvUUo3hMioS3ga0w5aXOngi2dn6EO+jkFu+GmnAI5TLSYJluOwjF3bAbD4/62j
 kxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GMP3uUjLWtP0WS92hT7gluftEH4jK1vIjm6dISQNfvM=;
 b=VzmKcmOOIFDyASgZl+ngAD1zO6WdZHjPs+lEXUuOZqpr4ByEQuAF1ipfsd3qkLtbQQ
 iWzdFxT74ZKpY3L9//kKVYm/KiYxpSHmm1F73xNTB0kMYF9e1gZk+b7jt98tuWX26uwH
 zD+Gl6stAYTrVaepX74H6OU3nFVrr51LkuOu85vDUR91tTCF6l9VGThYkKoZZSV6Somr
 0sGKEGJDLPVp9eKJ7Ut4+tta6+s8aIDS3liL4CocVv+C1cZyJLpyJua6wXy7EFi72ffa
 eYC14bfJqWum20+xlOdqqZjlruC5q+L+/J/EqJGCHqak0Qyt7Lbx54gkitRQ3G1LKFO9
 7ojg==
X-Gm-Message-State: AOAM531F+noxGj1JXF4L7imhHZvL0A5V4M0g10Z3X7X9+NlkzYWLEeMe
 j9gZwdUzCqASMSQ2Js1aMMhnMqJYjTo=
X-Google-Smtp-Source: ABdhPJwf9kyxkpjjoxr5TvAb0ePNK8U1DwjlbizXzaQGzlaaxq+7yNRLIhvs1A3EDIWaGRKXU2ILvw==
X-Received: by 2002:a05:600c:4e8d:: with SMTP id f13mr79740wmq.7.1635951901103; 
 Wed, 03 Nov 2021 08:05:01 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.05.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:05:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/27] vl: deprecate -watchdog
Date: Wed,  3 Nov 2021 16:04:30 +0100
Message-Id: <20211103150442.387121-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

-watchdog is the same as -device except that it is case insensitive (and it
allows only watchdog devices of course).  Now that "-device help" can list
as such the available watchdog devices, we can deprecate it.

Note that even though -watchdog tries to be case insensitive, it fails
at that: "-watchdog i6300xyz" fails with "Unknown -watchdog device",
but "-watchdog i6300ESB" also fails (when the generated -device option
is processed) with an error "'i6300ESB' is not a valid device model name".
For this reason, the documentation update does not mention the case
insensitivity of -watchdog.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/deprecated.rst | 5 +++++
 softmmu/vl.c              | 1 +
 2 files changed, 6 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index be19317470..6155b32ee6 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -160,6 +160,11 @@ Use ``-display sdl`` instead.
 
 Use ``-display curses`` instead.
 
+``-watchdog`` (since 6.2)
+'''''''''''''''''''''''''
+
+Use ``-device`` instead.
+
 ``-smp`` ("parameter=0" SMP configurations) (since 6.2)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index af0c4cbd99..570120f5c4 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3256,6 +3256,7 @@ void qemu_init(int argc, char **argv, char **envp)
                     error_report("only one watchdog option may be given");
                     exit(1);
                 }
+                warn_report("-watchdog is deprecated; use -device instead.");
                 watchdog = optarg;
                 break;
             case QEMU_OPTION_action:
-- 
2.31.1



