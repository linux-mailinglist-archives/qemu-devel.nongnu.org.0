Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8B44D1695
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:48:44 +0100 (CET)
Received: from localhost ([::1]:59582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYKZ-0003Is-EA
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:48:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7G-0007hy-L9
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:34:58 -0500
Received: from [2a00:1450:4864:20::62b] (port=33411
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7F-0005n7-7T
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:34:58 -0500
Received: by mail-ej1-x62b.google.com with SMTP id kt27so38663125ejb.0
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NPVSM5h3QYb2XDdVtG+61+4jXM7EeqRWXIbfYATigp8=;
 b=Tv2cCijIbHpOkm0vgK/AwgaBYHna/yJRKWIAvaomiWiEBqWvXI4hMjkD6qE5WVs+ue
 fr0y8Cz6vvp0M1cOJ4LMGEgtcMp7dOU1/oKl2Pu/3LAhdT2robyweCbMytl9DBRtYvod
 e9oXf1zri6OE1XvEpKFkssOWY4Yg6gjlkeTuLp4BhONbdHnkFt06+i4k6U7w8FhGd311
 RfxyuIlhB8peqrNnQmAcYresVIhDHedz4VCpS8m4bXArkEi4P4MiqU5pcxpU6hJBucDC
 c23FdadzngsP06coVXh9Dt4yZq/MRwQPyWMGxYDoPPrDDGDcOkWxki67htKmdgByMNdO
 n95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NPVSM5h3QYb2XDdVtG+61+4jXM7EeqRWXIbfYATigp8=;
 b=RCXhMYXPAvjBGVi0tWXPnpHRpYv3ew6tV+AJ1pj43W72EfuEiuSY6LqZhapUS+MbZb
 8cAEvY2Nkv8Xk+YIvp5cs3jU7fb40O+y/ou7aEzDNzhzyEixYHAD6t37nj5RHZ0C/W9G
 CED/+YD4JXU4IvVhsLrUFRoyV+P9Bg6/JLmOCZgmXkjxPf89+Ya3WyvIpWiIUVSgTPgV
 MmLOBr1VZc7g2Z5rvfsqJznq5ioHLxmcM5UhKc6z8NlC5GgGucxgZCej1LGYkwfPW8Fj
 ryIiaaF53f8mOGdBdCFPalAo/73vrlKmvuQFe2VmZisybVq7SJ8jjAkycHhP6u4GBo7K
 ZF6g==
X-Gm-Message-State: AOAM532YVDVRlm3drMiG6z4iPhzzUW8YPjo8Du8uwCRBxvs3xWI8klKB
 HYSX8htWIeBlc0QaW2ADliLkzv2ff3A=
X-Google-Smtp-Source: ABdhPJwDJADkdiTBmj9aOiGR3/3nSZzbuCgvduZCqIxoS+eREs9oOQ+3abajpK3sv5l97feV3R/IJA==
X-Received: by 2002:a17:907:d89:b0:6db:570f:53fd with SMTP id
 go9-20020a1709070d8900b006db570f53fdmr1219090ejc.682.1646739296038; 
 Tue, 08 Mar 2022 03:34:56 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:34:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/22] meson: fix generic location of vss headers
Date: Tue,  8 Mar 2022 12:34:27 +0100
Message-Id: <20220308113445.859669-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This is a left-over, despite requesting the change before the merge.

Fixes: commit 8821a389 ("configure, meson: replace VSS SDK checks and options with --enable-vss-sdk")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220222194008.610377-2-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 8df40bfac4..b871098dbb 100644
--- a/meson.build
+++ b/meson.build
@@ -1936,7 +1936,7 @@ have_vss = false
 if targetos == 'windows' and link_language == 'cpp'
   have_vss = cxx.compiles('''
     #define __MIDL_user_allocate_free_DEFINED__
-    #include <inc/win2003/vss.h>
+    #include <vss.h>
     int main(void) { return VSS_CTX_BACKUP; }''')
 endif
 
-- 
2.35.1



