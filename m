Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8F450CA41
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 14:56:32 +0200 (CEST)
Received: from localhost ([::1]:47806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFJP-0001XW-QK
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 08:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFE-0006kM-0v
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:12 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:41840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFC-00054Y-H0
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:11 -0400
Received: by mail-ed1-x52e.google.com with SMTP id d6so8355546ede.8
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d57+wLsg6C86Ce9YcdDwqygNOrnIY2eU+VWx4qkmQXk=;
 b=BksHf9jjqMieHnPl5iGFfIs7t7FjIvNOPx98//EcYVTrsFAB1VJcxs22iCPZMDZj/A
 NlDn9aYZ5KJOXijWvY2LVbGgnE1WMQsbk7pEDzl/pGgZUmP7nCw45rhVqZLuNQbhmN7y
 TRkS0drv2LzNL+YZDG+Ok+T0e8h0SAiQiq0PCZKIk4JVt6nXB+GNCyS8Mt4BJmDSD+/J
 HVbWW4+TLC+eQiuxUZAeIhklkKlf5T+l+Q7vX2xjseki5NKYfWMRMty3/9u6+fw2RBDt
 vslMftrrPIh18zkTUgUC5wk9xLqHlSc9uyiW5C1IPgNvryNEZHzyIYEUgiqwXvoaBuq5
 IqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d57+wLsg6C86Ce9YcdDwqygNOrnIY2eU+VWx4qkmQXk=;
 b=SC/1N4KkL2+JRMJxrGXOdfWaBKeMeYs92YbFVRRkwsexbgoc6bHjfdgbVAy8BbmAXe
 0w5/vOBDj9qIL/Pj/IrB5ilQ4RzyLRAc2LKn7JpWb+/lGJ8fFwfPj4+N6/CzokO1vWQm
 6yryI0oos2AgxhJ/A2nPyAMsJ3+rhoYHutlEgUsjPNBH5FiCIzuRJ81ibksE/eyTioZf
 QxCRFUl2WJtDEFhm1gsh7NYnxp6GZWxR3j/qpA5T4dzngjnXentwKzYp7keJQ5gKG85e
 nHDyN3H/lNJM9X2i0TpjjeGFqPOTPgnq+5Ocf3MnoXdtxMN0XXvSAt9sLfsu7TXXWbJZ
 zFUQ==
X-Gm-Message-State: AOAM5301KiqrS0iS32r2hO+LPDR8Zgy7kLT2I8gW4dVlXNcejrba37Jd
 KbP3tW1mxaQwGYXALN701saDFSlFu1sbRA==
X-Google-Smtp-Source: ABdhPJxG78MOp+J9QXstckb9xkwEvnExWo6WtshEgRDJRJT3+B8rSDcIYpOIKL9RJbZvA6Cm8VfNnA==
X-Received: by 2002:a05:6402:3485:b0:423:f3fd:75d9 with SMTP id
 v5-20020a056402348500b00423f3fd75d9mr10198791edc.319.1650718329188; 
 Sat, 23 Apr 2022 05:52:09 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/34] configure: gcov should not exclude fortify-source
Date: Sat, 23 Apr 2022 14:51:22 +0200
Message-Id: <20220423125151.27821-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no reason other than history (dating back to commit 1d728c3946, "tests: add gcov
support", 2013-01-06) for this, remove this unnecessary conditional.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/configure b/configure
index a6ed3498f2..e404b55da5 100755
--- a/configure
+++ b/configure
@@ -2625,9 +2625,7 @@ fi
 
 write_c_skeleton
 
-if test "$gcov" = "yes" ; then
-  :
-elif test "$fortify_source" = "yes" ; then
+if test "$fortify_source" = "yes" ; then
   QEMU_CFLAGS="-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $QEMU_CFLAGS"
   debug=no
 fi
-- 
2.35.1



