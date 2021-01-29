Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BF83088AD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:58:00 +0100 (CET)
Received: from localhost ([::1]:59890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SPX-0007oL-DH
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:57:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnL-0004Qx-U8
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:31 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnJ-0005xd-0o
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:31 -0500
Received: by mail-ed1-x52e.google.com with SMTP id z22so10125219edb.9
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Diap6CfCGcENhpM0PyFuX5PsRvTzNZhP3XoEyvjtpJg=;
 b=TJFUI2pBg2nKlxm18NlN/Fe0KCbpoKvuRmQmL6DkH1XKIacUewjTW6gO2GnN7sTFhP
 F8zuhu7dYzYp20Z9m/FcIy/5gLHXz6JVtyM24GtU3clelXM6qAltDxJ9IVLryLY87xOo
 aPh/vzMeUuMRN8SMzCJAcFO6b2VDtVNrigS91+O56o0ODtGXlzgqud5y3rdN+erroox5
 XWzyb4rXhE3mCHKF8AvmPlkSe2kYzMdTtGZvUlKRqzx5px41j+2p+wnp82f71+bktDxt
 zlY4BrrGFEquZ/Y5Vh0Pc45oCKCISZmleIdvtB2Px4PCQ6vx+b1KgKyR+/23ls+5BDw3
 PIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Diap6CfCGcENhpM0PyFuX5PsRvTzNZhP3XoEyvjtpJg=;
 b=IpbbO2BrT6XJt4IvBnGrpJCHMWjnZ2Z2i2tnPdXSsZ6mzkqdhaRZ77G3+W+M19EF1t
 X7tV26CRGHlCBGixW35kxWYrIjrHYeTfXeV+Ry4MAufwtwZiR0ggkNScI/5NcXbNfw+R
 reZJhF6qDDQJJvJuzy2aU1fq/dMlvvKkZgNtC/rmzHR9cg1rcie/ZYipb8fdFpnrh1ny
 nr+lSUX93HxG9AlqnCDB6fbc/2BPQGIqtYUO6eQHO6Q8jA6s1vbB/lj2Q4w57PWfqkZ6
 BpH6Pk0FSSX/WQHa/QJdmYWP+6zpd9oukGbpXpCC71NDJhasnV5D4Zd8vxfLLculMDL+
 pwfQ==
X-Gm-Message-State: AOAM533Pf/xav4XLNPKGgdZw8nH6n0Yo7IeV0ILPPKlcaqYqekga9I7X
 Q7N7C8S3NnXaRxIXRIRINggoFfZUbY+Ofw==
X-Google-Smtp-Source: ABdhPJxJLjFurzj2hC/SpPxAdHhbe3ECrnAdpZOx7MlSCIHzXXxlzlnEuclfCztgKoAOpMQ2lLbM3Q==
X-Received: by 2002:aa7:cf90:: with SMTP id z16mr4529545edx.218.1611919105924; 
 Fri, 29 Jan 2021 03:18:25 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/36] meson: honor --enable-rbd if cc.links test fails
Date: Fri, 29 Jan 2021 12:17:49 +0100
Message-Id: <20210129111814.566629-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
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

If the link test failed, compilation proceeded with RBD disabled,
even if --enable-rbd was used on the configure command line.
Fix that.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/meson.build b/meson.build
index 688124d3da..14e4cb35df 100644
--- a/meson.build
+++ b/meson.build
@@ -690,15 +690,21 @@ if not get_option('rbd').auto() or have_block
   librbd = cc.find_library('rbd', has_headers: ['rbd/librbd.h'],
                            required: get_option('rbd'),
                            kwargs: static_kwargs)
-  if librados.found() and librbd.found() and cc.links('''
-    #include <stdio.h>
-    #include <rbd/librbd.h>
-    int main(void) {
-      rados_t cluster;
-      rados_create(&cluster, NULL);
-      return 0;
-    }''', dependencies: [librbd, librados])
-    rbd = declare_dependency(dependencies: [librbd, librados])
+  if librados.found() and librbd.found()
+    if cc.links('''
+      #include <stdio.h>
+      #include <rbd/librbd.h>
+      int main(void) {
+        rados_t cluster;
+        rados_create(&cluster, NULL);
+        return 0;
+      }''', dependencies: [librbd, librados])
+      rbd = declare_dependency(dependencies: [librbd, librados])
+    elif get_option('rbd').enabled()
+      error('could not link librados')
+    else
+      warning('could not link librados, disabling')
+    endif
   endif
 endif
 
-- 
2.29.2



