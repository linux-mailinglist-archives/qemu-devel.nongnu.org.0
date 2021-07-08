Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7BA3C15DF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:21:59 +0200 (CEST)
Received: from localhost ([::1]:51962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Vqg-0000Lf-Gp
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmp-0008UZ-BG
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:17:59 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:38635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmk-00088V-Hs
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:17:56 -0400
Received: by mail-ej1-x634.google.com with SMTP id gb6so10256124ejc.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x2xfU9jO8E1GjgBl47Ekpsb5ztShELAehOr420frCzE=;
 b=Q17cNCXWCEu6kHp8H0XGLnYvwfmBCXGp0lfiHGv4qjgjsNZbpoTuLetgXiFFOqAG8u
 d/fuaH+AyjbYg5ffDZJO1JAnkEYb4tRZ8Ro8wq9+/mFo23P8CbJ67IJBL/E0cO0d4y+W
 nMOM20V2eNQEIppOlLPS2POzuCgr+lXolNLiJ5zU/ygxn5jvPioOj8rVP1oOKd4QYZWo
 4dKOnLNkMifqn6tZp8gGZuXNOmwM5wJQnVU64odSf4+lfyGF69rhnyS0WaNh7epHXwXS
 muI8M/olhPvJl8PnKt7CEvMlvyjCY/7NmPddhBuJq9AH4cF9v7BHzdiitc1nnO+HHpq2
 7fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x2xfU9jO8E1GjgBl47Ekpsb5ztShELAehOr420frCzE=;
 b=leBnpbq6pqW1wKX/CqnWMWYUae8qjw8oefA8ux0D+GLfwjFF5rVGXNBiv8RQdZMhgj
 P1/xUkuq13mXImiu5mUmXRpQFR05fOHYan69JjFMgXv1A7j9ptGem3xTLTfraCNlcDf4
 LPfREFHozmI6uETYTsn/dzHUfUPpLTNaZSApQilUGWoxVfPWVTx23pVeXb20JHCdTarA
 9TEIthWeWoYiHfcbGvC+o6yXPFI0JiT/TMLSgnn6sTBBJe30WXpoHcIi5cTist/q4c0L
 eBdKJU+SjmiNOgnOLQjwbgZhWaEjnfI3N5rGi0cZunsTE+Zckk8VjxqJOBSkqqTqr4oD
 YyUQ==
X-Gm-Message-State: AOAM530IV6LYpuo6koYe788J873MP0SRchk/a6+CEdsEdprTTFAVxbQ6
 V1Yv+xwYdx/uWMM09tQ8kgazR6Pg7Fg=
X-Google-Smtp-Source: ABdhPJzbunsw1MYOw28GoIFy20WtJKJfh0cFW9bnJ/AWW8MPYFmLMZ578ZXz1QB7zibJe4izm/nTNw==
X-Received: by 2002:a17:906:7302:: with SMTP id
 di2mr30789593ejc.409.1625757472674; 
 Thu, 08 Jul 2021 08:17:52 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:17:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/48] osdep: fix HAVE_BROKEN_SIZE_MAX case
Date: Thu,  8 Jul 2021 17:17:04 +0200
Message-Id: <20210708151748.408754-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Frederic Bezies <fredbezies@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While config-host.mak entries are expanded to "1" for compatibility with
create-config.sh, tests done directly in meson.build expand to the empty
string and cannot be placed to the right of the && operator.  Adjust
osdep.h after commit e46bd55d9c ("configure: convert HAVE_BROKEN_SIZE_MAX
to meson", 2021-07-06) changed the way HAVE_BROKEN_SIZE_MAX is defined.

Reported-by: Frederic Bezies <fredbezies@gmail.com>
Fixes: e46bd55d9c ("configure: convert HAVE_BROKEN_SIZE_MAX to meson", 2021-07-06)
Resolves: #463
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/osdep.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index c91a78b5e6..60718fc342 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -256,7 +256,7 @@ extern "C" {
 /* Mac OSX has a <stdint.h> bug that incorrectly defines SIZE_MAX with
  * the wrong type. Our replacement isn't usable in preprocessor
  * expressions, but it is sufficient for our needs. */
-#if defined(HAVE_BROKEN_SIZE_MAX) && HAVE_BROKEN_SIZE_MAX
+#ifdef HAVE_BROKEN_SIZE_MAX
 #undef SIZE_MAX
 #define SIZE_MAX ((size_t)-1)
 #endif
-- 
2.31.1



