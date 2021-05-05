Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBB5374355
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:09:23 +0200 (CEST)
Received: from localhost ([::1]:52914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leL1W-0004ik-Ms
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leKtl-00066S-Fc
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:01:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leKte-0002O1-Sj
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620234065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dXiqUMGNseF8aEoCidrrmNydk4TNmOpI8OAZgIN0M9M=;
 b=Jfx94TRaZx2tQ3JCTyLTQ76Ipo6yOxEu0Sewfzwu+Qw41d0ZEURG6tn2HwpJ3sSc3b8/JZ
 Nspz9qN9mYfJTsB+pHHC1/l+xPU2cTQsmKju11jVhS7W3xo26F7GMZfN6y/2X4G9giOGoy
 ndIZfI91axfoHN8jNYhcOFOEyJIFMoc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-ezFrNEcSPjK7kd1QlTiEaA-1; Wed, 05 May 2021 13:01:03 -0400
X-MC-Unique: ezFrNEcSPjK7kd1QlTiEaA-1
Received: by mail-wm1-f69.google.com with SMTP id
 y184-20020a1ce1c10000b0290143299f39d7so1805648wmg.4
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 10:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dXiqUMGNseF8aEoCidrrmNydk4TNmOpI8OAZgIN0M9M=;
 b=ViH/2f48A5kqWoVxlGSWWqMoWAheDWVT0z03cFzO0iPk6HgLzTUL9NUVUHDg2RxKdC
 5ZMvnQnAvhfkCagI6JLdQDdLO7mEJW1RYyuzod2Dl5zz1tzo7+7seOzgGuERb5pIEhY4
 SIuwaNvAFKCp5fvh3bZPACu5SSJqSBM2v7GfZBi1nDHITJogdqpDeWHeHDZujVeJEpMl
 XMhGgMw69R/Nayvehn8vA2J2O8w48ETbys3mjo1vNtAaKeNu7o8SepmSV0nnmqvDv/eP
 o3b76oylWDckxfDOx+1+Os6FgToHpu7Gnwd4gYN3qQTiBV/K5VLLhHxL7aqxS401/QPK
 ih+w==
X-Gm-Message-State: AOAM53034jFGjfuWCGOs7dc5G5/3JJAQaoPnbDg91Y1OWYG424GMhzSV
 AqUbtHLtxUcetNBwnmv0Q4eHcfnPQqGnGczDXIQ6RIDRfM0fO5ILLQ0gbuGbY/Imdta9TUyc8pa
 mzNWdNnX/4pAkUOo3UvEhb/d47DUN3GRUc7eOaaiI+2YLL/6aBUmQYT/RkJIWbwhh
X-Received: by 2002:a7b:c248:: with SMTP id b8mr11424875wmj.150.1620234062147; 
 Wed, 05 May 2021 10:01:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE9b3pj/YxZNlRHG2GkXBUvD3WDR/aewpjObwARt5wff69Kml4yF8lCFHOeEDahXzD3Sem3A==
X-Received: by 2002:a7b:c248:: with SMTP id b8mr11424837wmj.150.1620234061759; 
 Wed, 05 May 2021 10:01:01 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id m7sm6814316wrv.35.2021.05.05.10.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 10:01:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] bsd-user/syscall: Replace alloca() by g_new()
Date: Wed,  5 May 2021 19:00:51 +0200
Message-Id: <20210505170055.1415360-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505170055.1415360-1-philmd@redhat.com>
References: <20210505170055.1415360-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".

Replace it by a g_new() call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 bsd-user/syscall.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 4abff796c76..dbee0385ceb 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -355,9 +355,8 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     case TARGET_FREEBSD_NR_writev:
         {
             int count = arg3;
-            struct iovec *vec;
+            g_autofree struct iovec *vec = g_new(struct iovec, count);
 
-            vec = alloca(count * sizeof(struct iovec));
             if (lock_iovec(VERIFY_READ, vec, arg2, count, 1) < 0)
                 goto efault;
             ret = get_errno(writev(arg1, vec, count));
-- 
2.26.3


