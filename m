Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B8B59A2FB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:52:18 +0200 (CEST)
Received: from localhost ([::1]:45354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP6AL-0003jI-Nx
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oP5Oc-00012u-Ls
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:02:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oP5Oa-00027Y-Ne
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660928576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pM+IyLrEIm5Ms4IYg1Q/BNY6etFwZzdgve39XpewSVw=;
 b=FKYGO2BM6hoRwoK+ugq/jFGskg3ZvkQnwW+J3JHgBEn/o5dl7mJkgwJoUPRqJBsOoz1nv8
 OSuhWKC/53B/bJBOqFs2d4A9m2avZIpSK9OSKhVPcwYQQn+iF2+baUWvUnEZODU0L5HCMg
 Zb59nWLF49spzH0jYIAd4O7cFkfqifM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-567-bJ1_OROQNj2kRlfBd0sc-Q-1; Fri, 19 Aug 2022 13:02:54 -0400
X-MC-Unique: bJ1_OROQNj2kRlfBd0sc-Q-1
Received: by mail-ej1-f71.google.com with SMTP id
 oz39-20020a1709077da700b007313bf43f0dso1726316ejc.0
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 10:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=pM+IyLrEIm5Ms4IYg1Q/BNY6etFwZzdgve39XpewSVw=;
 b=u82JUUwn0fvqRxzwLINyXoaFarJcZpIo59pSjtHmfjmT2OAOENX7LW3PKTy1vmpQmv
 BcBLsn2+qZrF6EdvKuFJAn+AKlhE8ss/70G0c/nX97T/xAJsIT9cBPBzpQptVniIKpnK
 LP/oiaKRzJYkEhTjvA3EDk9ywLJh9hhN/bZzPPYzNXvuJaXH9qyKeY6rxmLxFPi3hi7v
 pcFSLZg4x43rcyVM2fYXrfaQybkPByDzVMHAQtzxuqojioF91xGvOHNnlyD1VtjCmydw
 k1pbnEHQsyeSRJxy8lDZo5YSd9RhNg9puHBDerhHgfg3Jp0lAg3RVxQVaGE8skdz6LAi
 D0vw==
X-Gm-Message-State: ACgBeo0QEkNpz/KgYX+r4kitPAYUAzcRj4IstkwBU8wnYA3m07TN7Sao
 wxyzaCDStIvquSliB10caBe+WZU35/CUwhUK7IKggmn30NbK2Fdwc9KOXc7+etWjCoK13K8wLRd
 dKjO9qniVLCLFPKIiXGMu0OlnIyXR82AR1jZvvY6qGEWxvPss9KIOOG4Rhgn7f3NbqJ8=
X-Received: by 2002:a05:6402:4392:b0:43e:5033:40f8 with SMTP id
 o18-20020a056402439200b0043e503340f8mr6831290edc.245.1660928573010; 
 Fri, 19 Aug 2022 10:02:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4ah9c0t08s2FYeGST3w217l/pw08vCmgE3LnVQRl06y8yNuvHu//M8chgZad8TgJ1vLV7KFA==
X-Received: by 2002:a05:6402:4392:b0:43e:5033:40f8 with SMTP id
 o18-20020a056402439200b0043e503340f8mr6831261edc.245.1660928572668; 
 Fri, 19 Aug 2022 10:02:52 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 c14-20020aa7c98e000000b0043bea0a48d0sm3353841edt.22.2022.08.19.10.02.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 10:02:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: improve error for ucontext coroutine backend
Date: Fri, 19 Aug 2022 19:02:51 +0200
Message-Id: <20220819170251.227526-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Instead of using feature_not_found(), which is not a good match because
there is no "remedy" to fix the lack of makecontext(), just print a
custom error.

This happens to remove the last use of feature_not_found(), so remove
the definition and the documentation.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                   | 11 +----------
 docs/devel/build-system.rst |  5 -----
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/configure b/configure
index 72ab03f11a..575dde1c1f 100755
--- a/configure
+++ b/configure
@@ -1468,15 +1468,6 @@ if test "$tcg" = "enabled"; then
     git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
 fi
 
-feature_not_found() {
-  feature=$1
-  remedy=$2
-
-  error_exit "User requested feature $feature" \
-      "configure was not able to find it." \
-      "$remedy"
-}
-
 # ---
 # big/little endian test
 cat > $TMPC << EOF
@@ -1639,7 +1630,7 @@ else
     ;;
   ucontext)
     if test "$ucontext_works" != "yes"; then
-      feature_not_found "ucontext"
+      error_exit "'ucontext' backend requested but makecontext not available"
     fi
     ;;
   sigaltstack)
diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 431caba7aa..1894721743 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -99,11 +99,6 @@ developers in checking for system features:
    Write a minimal C program main() function to the temporary file
    indicated by $TMPC
 
-``feature_not_found $NAME $REMEDY``
-   Print a message to stderr that the feature $NAME was not available
-   on the system, suggesting the user try $REMEDY to address the
-   problem.
-
 ``error_exit $MESSAGE $MORE...``
    Print $MESSAGE to stderr, followed by $MORE... and then exit from the
    configure script with non-zero status
-- 
2.37.1


