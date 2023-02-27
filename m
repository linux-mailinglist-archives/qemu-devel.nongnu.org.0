Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B306A48B6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:57:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhjI-0004DB-Hd; Mon, 27 Feb 2023 12:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhjG-0003xo-6L
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:56:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhjA-0004RE-PD
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677520556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0xCIMK3GDtkJe9Flw7SkNWB8UL8BwHpOxUH4LfXjV3w=;
 b=EcFOsxV9RxCdvlAHNwa+N0TlXbQ1vBTurKgcmnR2PFXTF4Bu4IJSO4sApArzEq4w3n3fR/
 uHoLc5SVZJ0Y/yOplXxpsvpk7FnVmIL20PGxmk9ewQ0sEEhwjYrb99g5zocL+yj8XasMMF
 jdICGNxQyHqqr1A7kzD0rZIS1sYtXqI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-115-bsOt78P9PW6S6n-UvC23VA-1; Mon, 27 Feb 2023 12:55:54 -0500
X-MC-Unique: bsOt78P9PW6S6n-UvC23VA-1
Received: by mail-ed1-f69.google.com with SMTP id
 dm14-20020a05640222ce00b0046790cd9082so9802529edb.21
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 09:55:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0xCIMK3GDtkJe9Flw7SkNWB8UL8BwHpOxUH4LfXjV3w=;
 b=5QxWDauMjQdiGxUVuK2SWTpc/WXLnihwjHx/nUGQwtrBSTWZWlJpldnPqiCc+gNIOO
 ylvXtpPYiE1+k9XPgQYlS43UCfbcqfAVcR0q+VpN3OG06lzffhFUfqSkkaZEo4IrsezX
 9ru+Vecxc+IeT9BUl/D7CHkf2zV72tgzUgGmYj7wS8Y7BG6KK34DlcFyL+Ty2owU5/qs
 1SuWcl9Syh73VvS9KROOctFfZg08pYvZGJ2+fEimsy42kGPSJyu61IBEFUv8bFYK75TY
 nx6K5qgoATGQyCxQH28Mm3TnknLyIidxQI2uU9IDRazo+Vs7pgXRqY3EKqSFsbU2EXow
 JsvQ==
X-Gm-Message-State: AO0yUKVgtv8OHZgBzqq7iT4J+L88QBSDCZ6GEVStLN99Vyx2qDPKesa0
 B0v/bRSqFlSIPNYdC0zH0mG9poH8o7jo4EFeGQ0N1OAdlrBqNCj2FfK/VKPhMwRdWq1YnwLOhkE
 YpNbSWNwXTsrIfSBEwA+uX9lGOgMeaD/AmUUCggI1OfKnoTwES9ABUiqts4UeK9u3jGWnNrRg
X-Received: by 2002:a05:6402:4d:b0:4ac:cb71:42c with SMTP id
 f13-20020a056402004d00b004accb71042cmr319833edu.37.1677520553411; 
 Mon, 27 Feb 2023 09:55:53 -0800 (PST)
X-Google-Smtp-Source: AK7set9LCUxjjFNnmWiuwk2le2hcYSSlJvBzBl2MWNzFe27hZv9rOtM1VC2Jdo3kj/pXWaude+fo1Q==
X-Received: by 2002:a05:6402:4d:b0:4ac:cb71:42c with SMTP id
 f13-20020a056402004d00b004accb71042cmr319819edu.37.1677520553147; 
 Mon, 27 Feb 2023 09:55:53 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 24-20020a508e18000000b004af6c25ef98sm3436570edw.8.2023.02.27.09.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:55:52 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PULL 10/13] target/i386: add FSRM to TCG
Date: Mon, 27 Feb 2023 18:55:21 +0100
Message-Id: <20230227175524.710880-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227175524.710880-1-pbonzini@redhat.com>
References: <20230227175524.710880-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Fast short REP MOVS can be added to TCG, since a trivial translation
of string operation is a good option for short lengths.

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 4d2b8d0444df..34e2cead870e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -661,7 +661,7 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
 #define TCG_7_0_ECX_FEATURES (CPUID_7_0_ECX_UMIP | CPUID_7_0_ECX_PKU | \
           /* CPUID_7_0_ECX_OSPKE is dynamic */ \
           CPUID_7_0_ECX_LA57 | CPUID_7_0_ECX_PKS | CPUID_7_0_ECX_VAES)
-#define TCG_7_0_EDX_FEATURES 0
+#define TCG_7_0_EDX_FEATURES CPUID_7_0_EDX_FSRM
 #define TCG_7_1_EAX_FEATURES 0
 #define TCG_APM_FEATURES 0
 #define TCG_6_EAX_FEATURES CPUID_6_EAX_ARAT
-- 
2.39.1


