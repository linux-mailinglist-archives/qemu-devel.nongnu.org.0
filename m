Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5B7512CA7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:23:45 +0200 (CEST)
Received: from localhost ([::1]:58190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njyV6-00088i-9u
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy21-00005I-I8
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:41 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy1z-00054z-VA
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:41 -0400
Received: by mail-ed1-x530.google.com with SMTP id b24so4377081edu.10
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8NgOW6LYaLZurNiIrzAPcuPOivSFBpwaLVQJFdNQLFQ=;
 b=FRpKhy+C13OJM1YYkVfykg84CvAf2YWzW6GL6/PxMuNqEF3xRc1Or/WSvZuuclDTe+
 bw3dCAUou/djnY/i9ZHdRq4VYF/e8+bIQLR9jbEkCy5ZVCHDNMqW3ecaGTHv4f0uHbQr
 NVbj7SIBFKTU22lWLr3iO0TdNgaxV9VkusCq8PNrXGylyl3RCeCOdtYpEelDY8Fx/8VN
 JhmCGiW2aGLbQ2DzqMIRYCdF4n5jbIkHG4NVFmJL4QCOm/U2zPuqU1kE2H+p0JBaw2l2
 9g0jFmQiUuiq1Y0uNza0KG6Kd/OQeMEphoiq5d7rB1CNC2i2aSPjMSqYeCGCctQ4FD0A
 FjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8NgOW6LYaLZurNiIrzAPcuPOivSFBpwaLVQJFdNQLFQ=;
 b=LnuvzI16Od1mNhZJ3os8FUyvosaRDUFN7oW+i626Ow22SBlWhIjr21nG6MitjTMcYz
 uesB+4n6UX6+GmpvdRZU/tmbygE6FGoavx2/ElFdCp5+WZjDLGPwB8NwjP/BbxABSPET
 B8HTB6EmxAp+1fpZQf/C1+vEr4KIOFwnwuIfvfqEZA0/p+muDJnRx6jFrZZrAVELAOss
 wy2sGxrdt8Ql7mX20rOmRv8XnrKThPMLdP5rgggl1+XtC/QFDFHzvE4ByNvxao8W/aMk
 rwpZODkpI0XvwYhJgLCSD7VUsZXtDkuyUzGZQcx2ORMGzRSyF8+Nv91G151fPrw2FnzD
 e6XA==
X-Gm-Message-State: AOAM531HzLT75RPaBsT47tulVSBvnnjlVI470NDlRgQoNrTLZ8QmKcI+
 BVwLPFTIBtAegMB35bI3oUIzo7jvFjUbWg==
X-Google-Smtp-Source: ABdhPJwXfuEmRDQQIgfP0bWaaj/5FWo4k0KmLiB3XbBFygRsR0VKv6jOdzDMi6WZY7LC95Xiol3trw==
X-Received: by 2002:a05:6402:330b:b0:425:eded:7cfe with SMTP id
 e11-20020a056402330b00b00425eded7cfemr18948855eda.357.1651128818667; 
 Wed, 27 Apr 2022 23:53:38 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm5406804ejb.158.2022.04.27.23.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:53:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/18] configure: make fortify_source=yes by default
Date: Thu, 28 Apr 2022 08:53:19 +0200
Message-Id: <20220428065335.189795-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428065335.189795-1-pbonzini@redhat.com>
References: <20220428065335.189795-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Tokarev <mjt@tls.msk.ru>

Commit c87ea1163111917 "configure: add --without-default-feature"
changed fortify_source from "yes" to "$default_feature". But there's
no option to turn it on, we only turn it off for debug build.  I think
this should always be initialized to "yes" in the first place.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Message-Id: <20220422100825.3692002-1-mjt@msgid.tls.msk.ru>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index e8786d478e..a4942c13e4 100755
--- a/configure
+++ b/configure
@@ -308,7 +308,7 @@ debug_tcg="no"
 debug="no"
 sanitizers="no"
 tsan="no"
-fortify_source="$default_feature"
+fortify_source="yes"
 gcov="no"
 EXESUF=""
 modules="no"
-- 
2.35.1



