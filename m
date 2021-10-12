Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4861842A41F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 14:13:47 +0200 (CEST)
Received: from localhost ([::1]:42504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGfB-00076o-JP
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 08:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFik-0000pG-7e
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:22 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:37690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFii-0007Zf-Nb
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:21 -0400
Received: by mail-ed1-x531.google.com with SMTP id y12so66814519eda.4
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uBCh3FBpRTKb8F3VLtXmr6hJ+AmaUFecRv60QOVixJM=;
 b=OvGpb2yMB648VzBT62bJiqv2FJz9dkYEUGsRvRa0jvwZ6/9ABTPYQDSmFMoPzJyZAG
 XYsZxWyqq6JZIUMttIo+OnCbUK4lyjze3pc0ErpWdUkUNNV/LHo+9iX0ER9K57hBNAKW
 NvVlPEbZ2n+r3aAzNXsh4lArg+2hM3OHM4nutYU7DBRn9xG4aQWzO7aTAXvKxP96PXjz
 Z9urLUzF0VLnKCA6VK9ey5YFLAtfDaSwlV9srJVKuLNUqwR7rNSBew52uBF4HOyp+c+8
 DV8YUMB397gcXPkXgsTacq0e1/7NEafiURqTkNrbsLMv25IeLotD38iAyh5/YyCbO0N/
 /YpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uBCh3FBpRTKb8F3VLtXmr6hJ+AmaUFecRv60QOVixJM=;
 b=zMOPadwqMVI5PtYFaMn9dh53MJVLHTV4oKvV5+gwWct+J9BSnSrUqEkrzHasleVIZa
 AhL9ppvT63obODZLoGZ/jjkhqZjw6UV5DASBszq6aGruKV8mQgak/AKHXMmvAnJOsFGe
 f4aatmF8PM15C1bYbKfn7R4sbsSZMZIxlJVxSH1wY7egqYvq0FIfSIyCkzqtA2ZQFc2A
 NJznumS7crznPp3Y9kz2SNsvV0Zs1+56am9LB7Wqy9CQyJRWweM8aL8Fa5yosfbr9i5t
 R2NF6+C6omkFLdbj8eR+2BpAck2TeKiOi4FT9tpE1npLCFc+yUXx0CKo4a6HQwRAwmNf
 QOUg==
X-Gm-Message-State: AOAM533FnCfc99dMGfWD21e6/6soldGjWrE/jZmLhjMCZjbSKnQjJW49
 bJC0IkrWgCoBJSpRFmPG/8kgb6F2/Tc=
X-Google-Smtp-Source: ABdhPJxMJOWb3lhu2ZIzVRR2k5lZCh5+SNHzJivsbYm7icgez6LtB2N04GJsCBbbZi9cvZ41dnwSig==
X-Received: by 2002:a17:906:9414:: with SMTP id
 q20mr33205971ejx.241.1634037199349; 
 Tue, 12 Oct 2021 04:13:19 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm4742802eja.6.2021.10.12.04.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:13:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/24] configure: remove obsolete Solaris ar check
Date: Tue, 12 Oct 2021 13:12:57 +0200
Message-Id: <20211012111302.246627-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012111302.246627-1-pbonzini@redhat.com>
References: <20211012111302.246627-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: marcandre.lureau@redhat.com, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson already has its own logic to find the "ar" binary, so remove the
Solaris specific check.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211007130829.632254-14-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/configure b/configure
index 016814d23b..2091844ad6 100755
--- a/configure
+++ b/configure
@@ -2284,21 +2284,6 @@ EOF
   fi
 fi
 
-#########################################
-# Solaris specific configure tool chain decisions
-
-if test "$solaris" = "yes" ; then
-  if has ar; then
-    :
-  else
-    if test -f /usr/ccs/bin/ar ; then
-      error_exit "No path includes ar" \
-          "Add /usr/ccs/bin to your path and rerun configure"
-    fi
-    error_exit "No path includes ar"
-  fi
-fi
-
 if test "$tcg" = "enabled"; then
     git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
     git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
-- 
2.31.1



