Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEE942DFAC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:51:04 +0200 (CEST)
Received: from localhost ([::1]:44598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3wd-0005rP-A5
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cN-0003uL-07
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:30:07 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:37749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cI-0000nQ-TL
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:30:04 -0400
Received: by mail-ed1-x52c.google.com with SMTP id y12so27680837eda.4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UY522I05rY+w4U+vf8hois7xkhx1heiogYfR44nWEcw=;
 b=lSp49Q+BPK9jtfAaQP6lrq1WVjVbG20KJp2aObglcUF8UPYVhEMxY0AZfBzJyx3VMN
 RlqI+2y/nGVgIBlhD1gWsPzSxYLXoIb834zf1O999B+26adK2DyC9Cnk4mNm7uu/r08h
 f8bbXo4fWcZ53M1JWCCHoEm8fG/rXc4HY9jJgiyewr0R+qy5ATgzFJfzifrrj9+AFCAT
 VtyULD3neXd1mYRlnGVTgNygR/SxG9FGpOfLHwpRJ3aHhvHQkYLUQezf+4rK1cPqt0fT
 Q9GL7dtM7myuVd/tIa2KW3gmPuB/WDcCE9kQk+XC/KwTevB/6uRqVdivcaCvQQkwrMUv
 yHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UY522I05rY+w4U+vf8hois7xkhx1heiogYfR44nWEcw=;
 b=DngqjzRDKrJ5QreHulQ7Lg0l2ylPaYG37iGsC3o772Pz5f9uS0dqxR3zZ/cZmGY/3P
 ovElJc7KLjQ7PTOJcaHKO9SVykrfOw5Cd3E9Nw1Rf9YySshudFGzL86gwETOwbQMU11P
 uD2Xi0Tx2DKCzw6Uc1KPQgXz2u+SYQeopC5NFLm4VJfRmVmUFhrHCCWVsXiBWf8AbCZq
 ruTiPy887tm8DPHR6GcQsoRQGJaUPQln9DVGdw1Cs4Z9h/N7qCQu27j2xj+ifZui1wPl
 UCaUXxX2r79YDfAI0OjDpAQHmuull4YuuKV8s72tyD8Etle1pQJbS6kabOV2KatnJwGh
 OYcQ==
X-Gm-Message-State: AOAM531pe9RX02rsczv7DSFCu3vIZCASxj0//DLgP2X28qr+U+427Kgo
 lF537JFhOUQdUZXWCXp06XUkpZNGzR0=
X-Google-Smtp-Source: ABdhPJxoJx5UbutmjybHzQLucGJbEMik7KsPfhsI3Xe+914tn7N/D6BMJmBXDjYT5t7KeELJbcMUJA==
X-Received: by 2002:a17:906:b819:: with SMTP id
 dv25mr5117492ejb.21.1634229001054; 
 Thu, 14 Oct 2021 09:30:01 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x22sm2658404edv.14.2021.10.14.09.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:30:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/26] configure: accept "internal" for
 --enable-capstone/slirp/fdt
Date: Thu, 14 Oct 2021 18:29:35 +0200
Message-Id: <20211014162938.430211-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014162938.430211-1-pbonzini@redhat.com>
References: <20211014162938.430211-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Options such as "--enable-capstone=git" do not make much sense when building
from a tarball.  Accept "internal" for consistency with the meson options.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211007130829.632254-17-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index b12b5f26b0..2ec410378e 100755
--- a/configure
+++ b/configure
@@ -1019,7 +1019,7 @@ for opt do
   ;;
   --enable-slirp=git) slirp="internal"
   ;;
-  --enable-slirp=system) slirp="system"
+  --enable-slirp=*) slirp="$optarg"
   ;;
   --disable-vde) vde="disabled"
   ;;
@@ -1193,7 +1193,7 @@ for opt do
   ;;
   --enable-fdt=git) fdt="internal"
   ;;
-  --enable-fdt=system) fdt="system"
+  --enable-fdt=*) fdt="$optarg"
   ;;
   --disable-linux-aio) linux_aio="disabled"
   ;;
@@ -1479,7 +1479,7 @@ for opt do
   ;;
   --enable-capstone=git) capstone="internal"
   ;;
-  --enable-capstone=system) capstone="system"
+  --enable-capstone=*) capstone="$optarg"
   ;;
   --with-git=*) git="$optarg"
   ;;
-- 
2.31.1



