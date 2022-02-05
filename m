Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DBD4AA575
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 02:55:01 +0100 (CET)
Received: from localhost ([::1]:53744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAI1-0004NV-13
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 20:55:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA6C-0003eI-Pm
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:42:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA69-0003Ha-PE
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:42:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EU2zPx6JC+R5DZIlP0yKSn9BYb3OIhPFICOQQCHTxuk=;
 b=hIu49R/5dIxKjJGCpOxF59dmjWfD/Tr4TzmcK2OS9USslj/akaLGoxW5/sJ5YbEsFW0PjV
 vw345kXM9qQRkig99v23MX5PpqufztpBAW0JfTdaXGCFUCEjAEVkmpcPRsbbdwpCAHw1sB
 49d303/jBR9QG7/Fx9e5Ts3Xd94ejz0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-OI_pxKtiNACcZ6ckK7FlkA-1; Fri, 04 Feb 2022 20:42:43 -0500
X-MC-Unique: OI_pxKtiNACcZ6ckK7FlkA-1
Received: by mail-wr1-f71.google.com with SMTP id
 k7-20020adfb347000000b001dd761d46c7so2780670wrd.4
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:42:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EU2zPx6JC+R5DZIlP0yKSn9BYb3OIhPFICOQQCHTxuk=;
 b=XL/x4YuSCtarhPtUCGLS3QRU/pMFZUTr8SeTSNBY9TfuWFcZoFHWkBsVblCE651X0h
 gIKXLkCEtlHxwN5nzTjV5Ot6MjA+qq3hRYIjo3JvO39SplE1AJHBCdREpvfByWwzo+j7
 +1Eum1RYfDc7C5lqiSs4vHXAF4HDM6LpD42lFOEV+xi++l7KdB/Gxd5OqowlA5xOFNZQ
 DDCAvKt31vPgnOpmZOMglBvFlaMzgAsWThJObDkyavf/rPrJe17rdo6ZShX0q3uFunTu
 5l9JX9LGyBuCGQXUxQI/TrZGGtASaP8/B7DxFkPx1HM0B5w8aagGqigs1JXxV4J6PFrW
 wDbw==
X-Gm-Message-State: AOAM5321hq+s2vBaWpLTPSLeGldtiWXtaWsVyu4bbV/QcCn+a1SvnyJv
 oXwUsqEOM6CdlPG1UVim02kxlnmfdN3lKhRTt47NSDocmDuYAonINVzgy08XNtumPTnY+cLU5TB
 F0DWrK/Nvt6FRQK9yvFripEl3oYTCwxW7mJAmvyjR+hZR1U+cs5yFZAfQ2oUw
X-Received: by 2002:a5d:6112:: with SMTP id v18mr1185020wrt.713.1644025362087; 
 Fri, 04 Feb 2022 17:42:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUlH3VquMQ0HTCYX8Bhkb9ae0C97Tkhr26hsMi7BXHUZ74wksRSMxh85c+n3yC/dkluv81Qw==
X-Received: by 2002:a5d:6112:: with SMTP id v18mr1185003wrt.713.1644025361875; 
 Fri, 04 Feb 2022 17:42:41 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id e17sm2584285wme.29.2022.02.04.17.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:42:41 -0800 (PST)
Date: Fri, 4 Feb 2022 20:42:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/32] cpuid: use unsigned for max cpuid
Message-ID: <20220205014149.1189026-2-mst@redhat.com>
References: <20220205014149.1189026-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220205014149.1189026-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

__get_cpuid_max returns an unsigned value.
For consistency, store the result in an unsigned variable.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 configure                 | 2 +-
 util/bufferiszero.c       | 2 +-
 tcg/i386/tcg-target.c.inc | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index e6cfc0e4be..dfb9019b24 100755
--- a/configure
+++ b/configure
@@ -2768,7 +2768,7 @@ cat > $TMPC << EOF
 #include <cpuid.h>
 int main(void) {
     unsigned a, b, c, d;
-    int max = __get_cpuid_max(0, 0);
+    unsigned max = __get_cpuid_max(0, 0);
 
     if (max >= 1) {
         __cpuid(1, a, b, c, d);
diff --git a/util/bufferiszero.c b/util/bufferiszero.c
index 695bb4ce28..ec3cd4ca15 100644
--- a/util/bufferiszero.c
+++ b/util/bufferiszero.c
@@ -272,7 +272,7 @@ static void init_accel(unsigned cache)
 
 static void __attribute__((constructor)) init_cpuid_cache(void)
 {
-    int max = __get_cpuid_max(0, NULL);
+    unsigned max = __get_cpuid_max(0, NULL);
     int a, b, c, d;
     unsigned cache = 0;
 
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 875311f795..4dab09f265 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -3747,7 +3747,7 @@ static void tcg_target_init(TCGContext *s)
 {
 #ifdef CONFIG_CPUID_H
     unsigned a, b, c, d, b7 = 0;
-    int max = __get_cpuid_max(0, 0);
+    unsigned max = __get_cpuid_max(0, 0);
 
     if (max >= 7) {
         /* BMI1 is available on AMD Piledriver and Intel Haswell CPUs.  */
-- 
MST


