Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2142B6B48
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:11:58 +0100 (CET)
Received: from localhost ([::1]:57100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4WK-0005iO-Sg
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Ew-00039A-LU
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:58 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:42192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Eu-0007Hp-PC
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:58 -0500
Received: by mail-ej1-x642.google.com with SMTP id i19so30379426ejx.9
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ax4JFkEmtB9bFkwgtcdzLquJHfwUo36YwYi9uzfBSKY=;
 b=NJKHokCZvr50w62/FWf4TTt2ZHDVEgZMvS2nxl/1AKTd7YYghIdNTsM926Lg/bXAGa
 3BkhOVHOSWgu17AVQQiouh9qslkK6DNxgoG6Sc+GNplyB0EP7jQfxHQSIOFaEwYZ8DsK
 Fhsrp7FVtBCfZXuABq4WL93ilnc92RSYLg40+lYIYrxDP5YYQmYXRfxVa0GqX/U2Lhl1
 Vjgr/XJwKGDDY/ByLwRu/ylAWfhOxq++W8UCpwp5ArAfVVyJUSvVJ/CI9XheFsFoo5es
 oV0nic+zOS3E+yI9qp1r0qDjf7PUXTmHjg8W6KaRA/0fkQzBrF3Q6dULbjWDyP83R9/R
 sGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ax4JFkEmtB9bFkwgtcdzLquJHfwUo36YwYi9uzfBSKY=;
 b=KKduinzOEnBQ+GnDUTVgIy+uRI201rcsIyHJwJznUOFzYePk+CIFim88eX1bKNaoqN
 YpPXpvOyt9DI3BY05QiM83zez6AM7gbmCB6F2ygIUsl92IVXkhZRJXsIrSeQL4qzRMoE
 pC537nYxUNefi+Xsxd8yLnpjAyVN3WMRpRuf5iaSFP0fPw9qLk/CuPiUKedX/Rf/053w
 +LJxtsrf1z2pgCjESVVgx2eNUKLzOLMyplHBN3Q64vJlqexzJC+Fz6YQzMgZ5m6y2DBq
 7uJvEeVuIoyK77B+VTFzDJg6ts9/oMwJVic0c7wZxRrQ05jiUjgSF4MT3C0TiG7eJrUH
 Ckag==
X-Gm-Message-State: AOAM533FINWgup55O5a/QOfcUlQWmjqQMGodeJkSu0e4egttQ8LCIZ8Z
 W/dYdwAxuSBOluZs2LK7+PAdRsxfJGY=
X-Google-Smtp-Source: ABdhPJzwWLy7KVpTf74wlqX1A3l0afNNpHOn/YQQ11XyGpdb3Pp/XwfMgpkXMl1n1fOBvmjKR/LOcg==
X-Received: by 2002:a17:906:e2c3:: with SMTP id
 gr3mr19653166ejb.471.1605632035158; 
 Tue, 17 Nov 2020 08:53:55 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:54 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/29] scripts: kernel-doc: use :c:union when needed
Date: Tue, 17 Nov 2020 17:53:12 +0100
Message-Id: <20201117165312.118257-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Sphinx C domain code after 3.2.1 will start complaning if :c:struct
would be used for an union type:

	.../Documentation/gpu/drm-kms-helpers:352: ../drivers/video/hdmi.c:851: WARNING: C 'identifier' cross-reference uses wrong tag: reference name is 'union hdmi_infoframe' but found name is 'struct hdmi_infoframe'. Full reference name is 'union hdmi_infoframe'. Full found name is 'struct hdmi_infoframe'.

So, let's address this issue too in advance, in order to
avoid future issues.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/6e4ec3eec914df62389a299797a3880ae4490f35.1603791716.git.mchehab+huawei@kernel.org
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 524fc626ed..b95bae3654 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1092,7 +1092,11 @@ sub output_struct_rst(%) {
 	print "\n\n.. c:type:: " . $name . "\n\n";
     } else {
 	my $name = $args{'struct'};
-	print "\n\n.. c:struct:: " . $name . "\n\n";
+	if ($args{'type'} eq 'union') {
+	    print "\n\n.. c:union:: " . $name . "\n\n";
+	} else {
+	    print "\n\n.. c:struct:: " . $name . "\n\n";
+	}
     }
     print_lineno($declaration_start_line);
     $lineprefix = "   ";
-- 
2.28.0


