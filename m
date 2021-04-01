Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E478F35147E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:32:10 +0200 (CEST)
Received: from localhost ([::1]:55082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvYY-0002TC-00
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPK-0000mt-Ff
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:38 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:40545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPE-0006hH-3D
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:35 -0400
Received: by mail-ed1-x52f.google.com with SMTP id b16so1526765eds.7
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 04:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uxNED1duCyBdlkruJzl0xnqKRNFLuA5HiEispmsiklU=;
 b=PWIwEsAtqZBqWSOU9CNEtKO6peNbxdJs36RsGUFHDFmq3hJkOPDIzG+JhG46rjDWz2
 e3Ea8FQtXyDjiuMqO/IUgg2iPQfAILSECH9Lu4e7mobu8OtzPcRvKDclz3O2vqyiuSS6
 oATfjxqZCrn9LnWxDhBOoVV66+AOWTctqkDKD8ho+kpQ+mQztWqiJ04B+tdHC5wb3VjJ
 eLzq9JxNR6qFxlRZ3IexIO68t6dJv3Y3FJdLUhCWsAlok59gU+1uc7Vd0HhiJWdowl1h
 AqAEwEgXIlMzM61rJtN7otwE0nsIo2dYSct8+AjvwfnGaSJ7+wk6Rp/siO+ayaU1H9Gh
 LVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uxNED1duCyBdlkruJzl0xnqKRNFLuA5HiEispmsiklU=;
 b=hd3vKnZhzDGDSkloe9f3juWZZfxbbnPabMjJHKu8+cfUbMJ5jzBTq/SlBh1TOfGZxG
 OAQrzXC13rClQHEHd4Yn8CgTnydLQ92RaNwdJnbbP1bCHAS2r9OdGYWF7dJldlrYhhcI
 9uhSJWaAgHJ8qPCbWOze3vh07+3YwnZYfxKULj91/jgdnaksb7udSwMmSrB0EA2q+6ZI
 5hTY92auiUs+K0Z3wnl2x3lCDmOcsuLXVg+O2FdcoBTdN0dvR0u604I9TSGXZtAfbEwq
 lgC/j8V4IKgdOYvFwMaCC+d6Mp3poencAGwZ3BnGau8kZNJHLB1vYxaSaH34sHRK16JP
 Ocig==
X-Gm-Message-State: AOAM531ntgIi/USuOiyhKyFcwi/TOAw+OusDHEvdvmw8/uf+V0Duq/DR
 /TPRPHvC3nTjOKipCvT32LlR4ek70s4=
X-Google-Smtp-Source: ABdhPJyqDuqClVFBr+staTqdF7aRU9NdLf9feukpcJ/Q3lMQbK+Q8+8sGcJBORVIOGZZjuc2jOQJ2g==
X-Received: by 2002:aa7:d98b:: with SMTP id u11mr9541116eds.352.1617276150855; 
 Thu, 01 Apr 2021 04:22:30 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d15sm3383516edx.62.2021.04.01.04.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 04:22:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/12] configure: Do not use default_feature for EXESUF
Date: Thu,  1 Apr 2021 13:22:20 +0200
Message-Id: <20210401112223.55711-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210401112223.55711-1-pbonzini@redhat.com>
References: <20210401112223.55711-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Miroslav Rezanina <mrezanin@redhat.com>

Commit "c87ea11631 configure: add --without-default-features" use
default_feature to set default values for configure option. This value
is used for EXESUF too.

However, EXESUF is not option to be tested, it is just append to any
binary name so using --without-default-features set EXESUF to "n"o and
all binaries using it has form <name>no (e.g. qemu-imgno).

This is not expected behavior as disabling features should not cause
generating different binary names.

Reverting back to setting EXESUF to empty value unless needed otherwise.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
Message-Id: <20210331081845.105089-1-mrezanin@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 535e6a9269..8275df1506 100755
--- a/configure
+++ b/configure
@@ -365,7 +365,7 @@ tcg_interpreter="false"
 bigendian="no"
 mingw32="no"
 gcov="no"
-EXESUF="$default_feature"
+EXESUF=""
 HOST_DSOSUF=".so"
 modules="no"
 module_upgrades="no"
-- 
2.30.1



