Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4B2664769
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:27:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH66-0003F4-1y; Tue, 10 Jan 2023 11:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5i-00030R-Bc
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5g-000516-R5
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lZsOVWPR+s9kRXm5uSXMvjV3P56UvRsZYwNaZye5lpg=;
 b=KdnYS92k4WWCCirBlYu92MY4hA+XDgtPI7aTjx8/dCqIUqJ3Ih4hEEzINvb/xWJfWoc7MB
 jVDiSlIgvjEFBVwU1N8UlNnMUnVWRZH62bVYxmtxmi6GtmxBWott410fTqfNw2OP36hfZe
 3ntJKfJVFka3GjHz8wo3N1enJ400Glw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-HTAHk57ONLmtqlZQW_8usg-1; Tue, 10 Jan 2023 11:03:04 -0500
X-MC-Unique: HTAHk57ONLmtqlZQW_8usg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l17-20020a05600c1d1100b003d9a145366cso6482401wms.4
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:02:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lZsOVWPR+s9kRXm5uSXMvjV3P56UvRsZYwNaZye5lpg=;
 b=nvP3IcObF0lbIy3rGsh5G+vg5RGXtJQ6KEjqe6FOOQzmzbCEd3jb3oFOetT/e1aup3
 iVCDHNyE+kjD+kN42oopY27eHeECG6GPfehnq2FuSjffL8Mp/2/XfyV+prSS/0xYhcRK
 VM6gzWyFzPCTLd+AiSudG0aaLR0rmUwX7NVIs3bXL4XFmolHNVb0JF4TrMv8PvwmOvRi
 yMoUWY9fy/82DNiAKf3FZy4jSFvH2JMaEAmvHpMZSo5gXpwYt21xFolTOyINfMrPm5Mm
 BBA2MTHDIf8TVjA/P7GxnjxVRMUwRR7P+61YVkUsotzC4jDZ7tjsfk4T9b/8/PsOY3RK
 VTIg==
X-Gm-Message-State: AFqh2kok3i/OZmFLXjTWFcqfL7DyUaUt6QB0ZxlGFQAxuChg8MYJDLOu
 GvEHyUXZ8PpgypO/GUU93rYWUu8a61XqCAINlw3KuGMO6PgPKol5IM2gA6OrTTTE9vh1SXzfb7w
 scOJ6sGQ2kUtkc3lwQNpQJg+rMnrhyKdb+EmVF28bLjiHvAreqQNSsyOrklfxjpiA0xI=
X-Received: by 2002:a05:600c:4fc5:b0:3d9:ecae:84f2 with SMTP id
 o5-20020a05600c4fc500b003d9ecae84f2mr7281991wmq.25.1673366571921; 
 Tue, 10 Jan 2023 08:02:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu9uN2cq+l/sGtaTY1cWuT8pYHG/ie45N/e4PefFCZfOEMhmo8yuYPs29x9wHaVaC+JFyZBjA==
X-Received: by 2002:a05:600c:4fc5:b0:3d9:ecae:84f2 with SMTP id
 o5-20020a05600c4fc500b003d9ecae84f2mr7281964wmq.25.1673366571695; 
 Tue, 10 Jan 2023 08:02:51 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a05600c19cd00b003c6f1732f65sm21812719wmq.38.2023.01.10.08.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:02:51 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Subject: [PULL 06/29] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Date: Tue, 10 Jan 2023 17:02:10 +0100
Message-Id: <20230110160233.339771-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Eric Auger <eric.auger@redhat.com>

To avoid compilation errors when -Werror=maybe-uninitialized is used,
replace 'case 3' by 'default'.

Otherwise we get:

../target/i386/ops_sse.h: In function â€˜helper_vpermdq_ymmâ€™:
../target/i386/ops_sse.h:2495:13: error: â€˜r3â€™ may be used
uninitialized in this function [-Werror=maybe-uninitialized]
   2495 |     d->Q(3) = r3;
        |     ~~~~~~~~^~~~
../target/i386/ops_sse.h:2494:13: error: â€˜r2â€™ may be used
uninitialized in this function [-Werror=maybe-uninitialized]
   2494 |     d->Q(2) = r2;
        |     ~~~~~~~~^~~~
../target/i386/ops_sse.h:2493:13: error: â€˜r1â€™ may be used
uninitialized in this function [-Werror=maybe-uninitialized]
   2493 |     d->Q(1) = r1;
        |     ~~~~~~~~^~~~
../target/i386/ops_sse.h:2492:13: error: â€˜r0â€™ may be used
uninitialized in this function [-Werror=maybe-uninitialized]
   2492 |     d->Q(0) = r0;
        |     ~~~~~~~~^~~~

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Stefan Weil <sw@weilnetz.de>
Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
Message-Id: <20221221163652.1239362-1-eric.auger@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 3cbc36a59d1a..c442c8c10cdc 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2466,7 +2466,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, uint32_t order)
         r0 = s->Q(0);
         r1 = s->Q(1);
         break;
-    case 3:
+    default:
         r0 = s->Q(2);
         r1 = s->Q(3);
         break;
@@ -2484,7 +2484,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, uint32_t order)
         r2 = s->Q(0);
         r3 = s->Q(1);
         break;
-    case 3:
+    default:
         r2 = s->Q(2);
         r3 = s->Q(3);
         break;
-- 
2.38.1


