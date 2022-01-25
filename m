Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ADD49BC76
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 20:48:56 +0100 (CET)
Received: from localhost ([::1]:40696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCRoF-0002rx-4t
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 14:48:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nCRQw-0005BA-HE
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 14:24:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nCRQr-0000Iw-VH
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 14:24:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643138649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=4LRIwzGcNAazGZGPRsodZeiZr3L3Eez3XCI9yEMOgJ0=;
 b=BlPD5l0x1MpaG5wCrfNhTx5u0+W51Qvd7+TeGyE/MNmkPqEBRQthT3XkZ89Vqq09f3gkVW
 rKa3w5bzZf9ZdLdWvgoKckljB51dPNeOIRu7Ol5z1rW8yrItGPpLJd9xe2GxbQ2yDau1uu
 P/iUeIgTJ+rPwM/vOiYdyUdMwpqtsrI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-PAEY_peNPtCYCMZrRgDmYQ-1; Tue, 25 Jan 2022 14:24:08 -0500
X-MC-Unique: PAEY_peNPtCYCMZrRgDmYQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 l16-20020aa7c3d0000000b004070ea10e7fso7033127edr.3
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 11:24:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=4LRIwzGcNAazGZGPRsodZeiZr3L3Eez3XCI9yEMOgJ0=;
 b=pNkhBJd82Y75Jr8cICpYiTkQs6eRGYpJhVR9+yoeb2GPVuY54DEQPgghLJTD5ltuB4
 3/iLkv4CgbCGW3Z+zs9jR+iSw7b1W9+TohLfvCWrPgNaPHniZKU1M1V4XEIcHu6GBsKr
 6UtSxQgdI2K2mePNPmettx7IuO+IZCTcBBuL84Xx085sNmVIHfyvd+9EvkZYUcJc1evR
 18YEE54KEZon8W2xhdvAN7dccXw2cQB+L+xNUyM6QflZCc+TNRlR3ru58v94m6oVTYia
 8E0AmcjqzkW4Jbz8ELbilY6duKpiu4wHYekZbqWUij/AAWADPdrxvlp4l70qZ9smFbxa
 sMCQ==
X-Gm-Message-State: AOAM5306UAA5DSHEkGRjUahMkB7VGvTEEPXmiLhjnYJMHMQ2QxUL9aTJ
 17CPdpzf2dLTSk5Qz6IkIsy2Z0p0n2z1GaaTFnEZ54kFHpuYiyfI5rC66ig35/tip8FRz8hCG+y
 /0VZ0atXZs3IIAFUCax2b7oHZ6dLXA2FggOWj0lEajTSzIWvIrOwoM2hAn8oC
X-Received: by 2002:a17:906:9750:: with SMTP id
 o16mr16933504ejy.682.1643138647013; 
 Tue, 25 Jan 2022 11:24:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwy7ZKUVDV9VSCgr9epHP33CncFI7/qlzkkCJiy4Ogne17Hg62RjHGa8N7x85bB44AKwQdI1w==
X-Received: by 2002:a17:906:9750:: with SMTP id
 o16mr16933481ejy.682.1643138646666; 
 Tue, 25 Jan 2022 11:24:06 -0800 (PST)
Received: from redhat.com ([176.12.185.204])
 by smtp.gmail.com with ESMTPSA id oz3sm6511674ejb.219.2022.01.25.11.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 11:24:05 -0800 (PST)
Date: Tue, 25 Jan 2022 14:24:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] cpuid: use unsigned for max cpuid
Message-ID: <20220125192232.99101-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

__get_cpuid_max returns an unsigned value.
For consistency, store the result in an unsigned variable.

Found by running ./configure --extra-cflags=-Wconversion

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Richard, if appropriate pls queue this.
Thanks!

 configure                 | 2 +-
 util/bufferiszero.c       | 2 +-
 tcg/i386/tcg-target.c.inc | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index e1a31fb332..938f43a59a 100755
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


