Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E813E4317
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:47:23 +0200 (CEST)
Received: from localhost ([::1]:45952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1sQ-00018l-6V
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mD1qj-0007UD-0e
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:45:37 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mD1qh-0008GG-9H
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:45:36 -0400
Received: by mail-wr1-x430.google.com with SMTP id b11so4397089wrx.6
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 02:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kxGJd17Zc6wHX5EeehREDUvFM+lG65MX3aEsC1BwSI8=;
 b=IbtMLAU39a8/eTiN9joa01nDDlHrGzciUIH2OZOdIN+CkpJnGzJdmsPq2znivg62vZ
 x6WHIDbcq7CBbSez4QgEJCNIpRjD3a39jRlJa57mauLGFTWrIB93J92XB8ZiCMG991CJ
 Nk0lMiI38qOpG/3ygtBzahATRP/aOPFT9lmi2mXaOKDVlXYdleP2NObPqu/U+XXZl0bg
 XWTYsVYotPJ2UFt2OgC1UxoW0wGWDoTfIWhi1ofl6AlK6+3IQizvBs7Tm6RFtFFcU9uf
 s81gR3pgOtvFMrrZuHSNOr3lcBB/c1RGDKOZ8MCc4NxYtl6gzLkb50Gdpb+Xgy5qyzFL
 oYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kxGJd17Zc6wHX5EeehREDUvFM+lG65MX3aEsC1BwSI8=;
 b=p4raTPDI/lcGLHurjDW/B5B2dfUytJsPm3HuSxNSr9/RP+DPEKzep+wpBXU3ZdQ74c
 kuTzBbPUvH7JgGUqPsoNYAser5i9oR0giZgai7gSXxmYji1yXjk02vP1gxCEifw2fzwf
 zb2l6WhcoViZevwfYlRGHLfyd+hFpavmnsT9CSE1a+hF/A7iP9g1a5GfCS3TA7e0xpKA
 BEBk2r7rcZE9ZADbcsnteHfV9U0yC70VNSm6NHrDqti3fFERCPWrhTUcWIMkdP5bnf38
 1WSnwZOXNVSGP1s9CgEQmdJfh5IbNkiTL24PyHrmaTMsruBf/LTP/s2r2Gmo5xgkN4xO
 MUUw==
X-Gm-Message-State: AOAM531O7Su3Z87md2a+83SAe+Uo2/S/NHx36Wxvx01Tm7GDxLdVLOJo
 v4/ZTuDlj6Dl8e+EsFt835AGdTudXwYudg==
X-Google-Smtp-Source: ABdhPJwCXmYjbU5xHTZ0bb3R5NZbwUYWAdjGSpuNmlTchMwQsRWuzGfmFHqVJNW2Ao5ayjVkw/UDSQ==
X-Received: by 2002:a05:6000:232:: with SMTP id
 l18mr23993422wrz.24.1628502333417; 
 Mon, 09 Aug 2021 02:45:33 -0700 (PDT)
Received: from avogadro.redhat.com ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id y21sm20142820wma.38.2021.08.09.02.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 02:45:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] meson: fix logic for gnutls check
Date: Mon,  9 Aug 2021 11:45:30 +0200
Message-Id: <20210809094530.230065-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809094530.230065-1-pbonzini@redhat.com>
References: <20210809094530.230065-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Alyssa Ross <hi@alyssa.is>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alyssa Ross <hi@alyssa.is>

The logic before was

	if not get_option('gnutls').auto() or have_system

Which is equivalent to

	if get_option('gnutls').enabled() or get_option('gnutls').disabled() or have_system

This means that the check for gnutls is performed even if gnutls is
disabled, which means that the build system will insist on having
libtasn1 if gnutls is found, even if gnutls support is disabled.

When gnutls is disabled, the check for gnutls shouldn't be performed,
to ensure that further build system logic (like the check for
libtasn1) doesn't make decisions based on the presence of gnutls,
rather than the gnutls option.

After making this change, I can successfully ./configure --disable-gnutls
on my system with gnutls installed, but not libtasn1.

Signed-off-by: Alyssa Ross <hi@alyssa.is>
Message-Id: <20210806144947.321647-1-hi@alyssa.is>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index af9bbb83db..b3e7ec0e92 100644
--- a/meson.build
+++ b/meson.build
@@ -824,7 +824,7 @@ endif
 
 gnutls = not_found
 gnutls_crypto = not_found
-if not get_option('gnutls').auto() or have_system
+if get_option('gnutls').enabled() or (get_option('gnutls').auto() and have_system)
   # For general TLS support our min gnutls matches
   # that implied by our platform support matrix
   #
-- 
2.31.1


