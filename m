Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB5254B3E8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 16:53:26 +0200 (CEST)
Received: from localhost ([::1]:32906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o17v3-0005LQ-0T
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 10:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o17sS-00046C-RK
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 10:50:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o17sN-0001Zk-FI
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 10:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655218238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ez+Jp0deAp0qllrRa43Ovb37vY+5D1VDxadrLIYYwms=;
 b=WcnWZKc7AJ0DY4Ge+D2tjs3UsZUVfQGWHBet3YydDxlOIydjuNd+u1p3yPzNFdodm8SUEV
 Z5PRjkyjO4PkERTnXm1VEUdKYlL8SUKgTTu8s8vj4zJhbIflZHcAe5r/QHX/5yTrB7TJQC
 JldYscMmsi55ds2qfnSsmuTHtIYm4qE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-9YSLy3YiPl-sf4GScLnNag-1; Tue, 14 Jun 2022 10:50:36 -0400
X-MC-Unique: 9YSLy3YiPl-sf4GScLnNag-1
Received: by mail-wm1-f70.google.com with SMTP id
 m22-20020a7bcb96000000b0039c4f6ade4dso3884782wmi.8
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 07:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ez+Jp0deAp0qllrRa43Ovb37vY+5D1VDxadrLIYYwms=;
 b=da2JfhsA612j+STkdim0qH7GW0aduwym3atCpjFMjpL0ynuugolRPeQoppCtdR72Wt
 62cs6CNPSqtT9opg1KGycmTG38IZD9cbI0Rku0XeatwUcfu0ZFOdkIV1gKDStZduEg31
 lHd/XO6eBlDLpghws4B0hq6TM/1FpjcRo+xPdAX9EFk+SmqhSSR+R1jzVf/nQOmQW5M+
 iJSf6cksIcjFeJWscXKlTe/PrHjHpHtrCMxregzxanb+yvpLiM3MKrTNLXxuQDDQ1Sgp
 Y+2EWIFuj+ndW+Ge+/YqrigOUtxjVbZPo8xG90JDF9INcusxSmWfyaN64W0vE7mUoN0l
 MbNg==
X-Gm-Message-State: AJIora+ESmS0Md/lcIdP2qmJHovKawePLOi/KzpI981QePASvvadaYUD
 g1nq/+/0I3tVeeQdSnrLIX9J8MpWvWqVUQL2RqriU0jweFYd1vtsBZ8VFRq9YKWA/A5+V++GpWo
 6zbeMicsJncnxeauxglgKwvc8ZLp3RoB8nxVl325XZYtL5SmAOtHE4PvnH7PjsBuAI4g=
X-Received: by 2002:adf:f884:0:b0:21a:6a:7b55 with SMTP id
 u4-20020adff884000000b0021a006a7b55mr5224066wrp.376.1655218234195; 
 Tue, 14 Jun 2022 07:50:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sQyNlc8qOKWFxYCCdt64dbjFEGrjaA9muF4/3Uu/RgJCvwj+57ntD91oyBrhIdeucPR4tfuQ==
X-Received: by 2002:adf:f884:0:b0:21a:6a:7b55 with SMTP id
 u4-20020adff884000000b0021a006a7b55mr5224042wrp.376.1655218233834; 
 Tue, 14 Jun 2022 07:50:33 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 q2-20020a05600c2c0200b003942a244f51sm17684178wmg.42.2022.06.14.07.50.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 07:50:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: cleanup -fno-pie detection
Date: Tue, 14 Jun 2022 16:50:31 +0200
Message-Id: <20220614145031.1766976-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Place it only inside the 'if test "$pie" = "no"' conditional.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/configure b/configure
index f3dcbd10c3..e2b64334b5 100755
--- a/configure
+++ b/configure
@@ -1346,13 +1346,6 @@ static THREAD int tls_var;
 int main(void) { return tls_var; }
 EOF
 
-# Check we support -fno-pie and -no-pie first; we will need the former for
-# building ROMs, and both for everything if --disable-pie is passed.
-if compile_prog "-Werror -fno-pie" "-no-pie"; then
-  CFLAGS_NOPIE="-fno-pie"
-  LDFLAGS_NOPIE="-no-pie"
-fi
-
 if test "$static" = "yes"; then
   if test "$pie" != "no" && compile_prog "-Werror -fPIE -DPIE" "-static-pie"; then
     CONFIGURE_CFLAGS="-fPIE -DPIE $CONFIGURE_CFLAGS"
@@ -1365,8 +1358,10 @@ if test "$static" = "yes"; then
     pie="no"
   fi
 elif test "$pie" = "no"; then
-  CONFIGURE_CFLAGS="$CFLAGS_NOPIE $CONFIGURE_CFLAGS"
-  CONFIGURE_LDFLAGS="$LDFLAGS_NOPIE $CONFIGURE_LDFLAGS"
+  if compile_prog "-Werror -fno-pie" "-no-pie"; then
+    CONFIGURE_CFLAGS="-fno-pie $CONFIGURE_CFLAGS"
+    CONFIGURE_LDFLAGS="-no-pie $CONFIGURE_LDFLAGS"
+  fi
 elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
   CONFIGURE_CFLAGS="-fPIE -DPIE $CONFIGURE_CFLAGS"
   CONFIGURE_LDFLAGS="-pie $CONFIGURE_LDFLAGS"
-- 
2.36.1


