Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DE12DC435
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:29:46 +0100 (CET)
Received: from localhost ([::1]:40398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZgP-0005Fi-1u
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpZXF-0002EE-3g
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:20:18 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:39262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpZXC-0006V9-6O
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:20:16 -0500
Received: by mail-ej1-x631.google.com with SMTP id n26so33538108eju.6
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pMAHW/lOSnDs+tvYYnVBZJWjJu+36lZF4Eh2q1Iet6M=;
 b=dlAy3Zx5vrGFJyl+vypFGaBROPbvcdLph5HfmfW16gyIzlWAOvqKGK2QhP91d6TbtZ
 1WKKzgoZJoCPQSiKGnv2xUahGYG+YqkOeWqkT/8EkyF37lw9ZNt3S2KZwcfM5WstSdXl
 SBj/eFHx5g1a0/VDql1Ufv0WuWz0w2mGxYezaObCbytAYM7wJPtcAE2gSdj8jK4K6+62
 3xRK0cQ3SltKIrTfB5139ovG58uRHDTP2e32/83htubWxFcXNQq7RLIHChD8YG/Z8tT+
 dPLlkO4uJjyDIIcz0vOFtqf5FtFHOSdhO9eMZkI23twxOHDrbSRGwIYVhlEeGZeLwJpp
 fTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pMAHW/lOSnDs+tvYYnVBZJWjJu+36lZF4Eh2q1Iet6M=;
 b=BSf7gNXlLP6iJekshfxd1MgV0QkFhhVp+e0ccXY1Xxs0meMdsoXXibbaN4u7a+CaM3
 rFfYO4AXYqG1MGxejxfp3Q6EfkR13b8/GI5zjVngNMGLqTatImyWUSAOYoRLJQfdpd9D
 ae/Zxwc2uwrNOfyM+ZZMrRglfBb5qM6iaNOiUQGcVBJAfD556UWNL4Hb/zYQKIzR44rK
 hpipPKjciGsyZNbslgaasrZktIDBAHVnTbRy3yar+BQHanNTY0CC8u4Xu9AlSMF0zvAj
 XCQjauim8DYLer+QOeopE2zI4Kgh+W0fVN7AJRfqxnT4tc0nlGEVEYJ7dHH6t1H1IegR
 93HA==
X-Gm-Message-State: AOAM531YxVojKW1FFQUqFIoVUU8Px1QeNu6aLORzuyTBxUD8jl0Gr7ku
 /X/4CC1hhLgy2wmGF+vKWtiC+NylDOY=
X-Google-Smtp-Source: ABdhPJwoojxjXHPAv5STlbaFAPyWkZyQbpXKCpeuDhmMCtSHLfw0jev2C/l9Ubxi4zsWojw/Qe0/Fw==
X-Received: by 2002:a17:906:5f97:: with SMTP id
 a23mr20411053eju.128.1608135612921; 
 Wed, 16 Dec 2020 08:20:12 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a13sm21264501edb.76.2020.12.16.08.20.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:20:12 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] meson: use pkg-config method for libudev
Date: Wed, 16 Dec 2020 17:20:04 +0100
Message-Id: <20201216162006.433850-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216162006.433850-1-pbonzini@redhat.com>
References: <20201216162006.433850-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not bother asking CMake, this is a pkg-config dependency.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index ab622ae8bd..0b36fb38f1 100644
--- a/meson.build
+++ b/meson.build
@@ -399,6 +399,7 @@ endif
 libudev = not_found
 if targetos == 'linux' and (have_system or have_tools)
   libudev = dependency('libudev',
+                       method: 'pkg-config',
                        required: get_option('libudev'),
                        static: enable_static)
 endif
-- 
2.29.2



