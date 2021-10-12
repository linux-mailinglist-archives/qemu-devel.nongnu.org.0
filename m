Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B9942A3A9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:52:55 +0200 (CEST)
Received: from localhost ([::1]:55986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGL0-0002gs-Vv
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFiX-00009m-6l
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:09 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:34745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFiV-0007Sc-BE
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:08 -0400
Received: by mail-ed1-x52a.google.com with SMTP id g10so78904039edj.1
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OnOlAgAuAHHd3s++OPWKn4r+CPQeiw5c9+4+OZCGJUc=;
 b=FrsnssRShUrsdFGp7Y4p8ghh9zFNb9XxS9kVpTnr4yXfO1Yn85IT1LgUYROcIeSksk
 +jYb/j9IbRjFT9hQIitx9YxS5CFPYEGCt6/d9e7y/jhKxHbr+evvD0VORq1C3JbbSN3U
 Tqpe62ssXVLY+gupc+wvkWash9Y0Pdc6tL10Cyq+g/IVtEiDsL35aVVoXCWRZ/MomCI5
 JcumjMvU6BLaKEwVdZ+MsdB5jr5537bWAWERdQEQiZmqpKGXa8/ILxf4QFpVrb+3/hSm
 QNjZLRg0A3q+ZIPUPtPehTsSsmzEYm0KSdG+MuSkYQIBvbVQk3k8R7WJwWMBrwBSvqED
 //7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OnOlAgAuAHHd3s++OPWKn4r+CPQeiw5c9+4+OZCGJUc=;
 b=jpnSw+R+tLaC850Ovh4RFJjJgdVW0V1PQjb7YrDZ8I0lJr4QFkb2p2ziAdTHmoDzsR
 yIJbUTByzhE+BPgUgr2un4EbH4zsO6QBbCgHMwoPVktOdBqWt6qfbbzXLOem+tGoOhyu
 qdCtNvDLxaNa76t35K+hlPgLJ6k74TdVUH0HRnnTSQsVgPDSQxKgmcnROFLgHv6ogM21
 mgCf35koOsbheUSw/KxgU8kUJ40rYbTb0nKMgDGklaAsEpUTQa03/70BmEFCoJ8QF2f6
 /fzvc5qqPiNQ3ciZwvhFWCHm6jPesz7C0NAnskoDm+jR+9IQIvpTMLhrCMiC39W4Jle7
 61rw==
X-Gm-Message-State: AOAM530CUBo/fkb702w09A1PuYqUt3dPAhiS5svqmpHFA5jhXAgHRaPy
 BJePX0kmJlAkNvXuT8JqLj1HsOzMsgA=
X-Google-Smtp-Source: ABdhPJy4lJLSnx188V1or1lYkMA3A0zHrKu8aWmevsjysvuvUn6DxbdaeYekd/6HKOaI+BxsVaesog==
X-Received: by 2002:a05:6402:5113:: with SMTP id
 m19mr49062633edd.231.1634037184995; 
 Tue, 12 Oct 2021 04:13:04 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm4742802eja.6.2021.10.12.04.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:13:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/24] configure: remove --oss-lib
Date: Tue, 12 Oct 2021 13:12:39 +0200
Message-Id: <20211012111302.246627-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012111302.246627-1-pbonzini@redhat.com>
References: <20211012111302.246627-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: marcandre.lureau@redhat.com, thuth@redhat.com,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffman <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OSS is a kernel API, so the option should not be needed.  The library
is used on NetBSD, where OSS is emulated, so keep the variable.

Cc: Gerd Hoffman <kraxel@redhat.com>
Cc: Volker Rümelin <vr_qemu@t-online.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211007130630.632028-2-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/configure b/configure
index 877bf3d76a..ab6bc0c994 100755
--- a/configure
+++ b/configure
@@ -1007,8 +1007,6 @@ for opt do
   ;;
   --enable-gettext) gettext="enabled"
   ;;
-  --oss-lib=*) oss_lib="$optarg"
-  ;;
   --audio-drv-list=*) audio_drv_list="$optarg"
   ;;
   --block-drv-rw-whitelist=*|--block-drv-whitelist=*) block_drv_rw_whitelist=$(echo "$optarg" | sed -e 's/,/ /g')
@@ -1815,7 +1813,6 @@ Advanced options (experts only):
   --disable-slirp          disable SLIRP userspace network connectivity
   --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter, experimental and slow)
   --enable-malloc-trim     enable libc malloc_trim() for memory optimization
-  --oss-lib                path to OSS library
   --cpu=CPU                Build for host CPU [$cpu]
   --with-coroutine=BACKEND coroutine backend. Supported options:
                            ucontext, sigaltstack, windows
-- 
2.31.1



