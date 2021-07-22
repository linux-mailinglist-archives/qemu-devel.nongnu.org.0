Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8EF3D26E4
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:41:05 +0200 (CEST)
Received: from localhost ([::1]:60608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6aoq-0001Ef-FH
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akL-0000e4-J0
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:26 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:38786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akI-0002lB-Dr
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:25 -0400
Received: by mail-ed1-x52e.google.com with SMTP id ee25so7314401edb.5
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rMzNUuNwWAM/TkiUDfnvx8sYrs7OMMGNvX1n8FypylU=;
 b=Q17pLBngmslcb/o2stvevIGeWB3WWcHCiG8X4YqWKOwk5IOCRd6p1pjrNlMM9v1awu
 3cn88n+i2KVR22IGNRq0zmjWGaAkXgy4cXtWp0BmMgias/CeD1Dfiqfj52g5KoLDkue+
 tGfUhIcm8nJfCebKyJtsSydahFPbQRAM1JvqMG534dCojAdHyV9RjzuDWD/0zX2RDJlR
 8HtDgQt6rC9DiJzkp+5CCRBxlCKTFzBSgeCUl0bo+Pko6jcGCVEHm8zTTEhSiyXut67P
 xhYideM1hRkyaZxLvDlrfO7T70697K2dVgNbdiDSaDsFMW8fNvg8G1aSNzlVJ/bB1Jt5
 hTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rMzNUuNwWAM/TkiUDfnvx8sYrs7OMMGNvX1n8FypylU=;
 b=GdHuJeY32SfUXeikD8O7HPVkrLnYWluElVNufK+dpXli1olqJPmN5wu2QHA8Zr52Eh
 Ri0Hhfrl4RGOGX7SlDalh38Fi0d3mPIw9o24UzRbfi+EMDTmkLfuZVvlV28AdgToGluq
 auIOIUcDocyW2/vulNvWO5m9ViIG1wPnW+eoGzvKWxblkiNqWQd8+sXGSFRIeVZde22v
 O5qbfSdt55bOaM7ebu8DgCvjniWfFrb+NBa8a5DU3KqmfvprT5lSHXDP7A7co8USMP0+
 mUPfVHxQg0pt3Oe+SEp7zdH9J3mxRUX7Pn2ZkCh5g4pM5d6TBl0gUus9JN4ZFyXgF4Nj
 3FLg==
X-Gm-Message-State: AOAM531/FOn6orxMlJBHs/J3zVdigkr0oiFEq5IRnCzwSJklBiNSMvIB
 VidDLSa6glG7KGtxBrGxIphdK2OCXEhIYA==
X-Google-Smtp-Source: ABdhPJxYkwmr4mZl2ZV933It6b4OvpaWeisgDcYPR74q3MxQHSbk7ibT26RjwZAchsoZpjDQgBKejQ==
X-Received: by 2002:a05:6402:711:: with SMTP id
 w17mr223341edx.233.1626968180996; 
 Thu, 22 Jul 2021 08:36:20 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id qo6sm9638628ejb.122.2021.07.22.08.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:36:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/15] configure: Drop obsolete check for the alloc_size
 attribute
Date: Thu, 22 Jul 2021 17:36:07 +0200
Message-Id: <20210722153612.955537-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722153612.955537-1-pbonzini@redhat.com>
References: <20210722153612.955537-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

We recently bumped our requirement for Clang to at least version 6.0.
And according to:

 https://releases.llvm.org/6.0.0/tools/clang/docs/AttributeReference.html

Clang v6.0 supports the alloc_size attribute. Thus we can drop this
check in the configure script now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210714072855.785566-1-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/configure b/configure
index 63f38fa94c..026704f15a 100755
--- a/configure
+++ b/configure
@@ -3266,18 +3266,6 @@ if ! compile_prog "$glib_cflags" "$glib_libs" ; then
 	       "build target"
 fi
 
-# Silence clang 3.5.0 warnings about glib attribute __alloc_size__ usage
-cat > $TMPC << EOF
-#include <glib.h>
-int main(void) { return 0; }
-EOF
-if ! compile_prog "$glib_cflags -Werror" "$glib_libs" ; then
-    if cc_has_warning_flag "-Wno-unknown-attributes"; then
-        glib_cflags="-Wno-unknown-attributes $glib_cflags"
-        CONFIGURE_CFLAGS="-Wno-unknown-attributes $CONFIGURE_CFLAGS"
-    fi
-fi
-
 # Silence clang warnings triggered by glib < 2.57.2
 cat > $TMPC << EOF
 #include <glib.h>
-- 
2.31.1



