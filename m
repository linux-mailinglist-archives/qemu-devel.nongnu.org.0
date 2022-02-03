Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E434A8B60
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:17:21 +0100 (CET)
Received: from localhost ([::1]:40450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgfY-0003vt-61
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:17:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0T-0005Jj-CV
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:53 -0500
Received: from [2a00:1450:4864:20::529] (port=45843
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0K-0008Ir-UH
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:53 -0500
Received: by mail-ed1-x529.google.com with SMTP id p7so7424808edc.12
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iwKrw8tO5y25zYOksvfVojKXZjXfywa7yUC+Id68b80=;
 b=qAllR6+ynfn44cnZH9G2jh6JvPtlT16EdOXBVYHFrmDQFGQZFWMKm/HbLKUGQ5eUcu
 5KjPAGf2etaydWICRY0Vy0twGytKrVEYqhiyssOTVQLZ+KkR4EMr4t1BkIzclU3EZ937
 YeEj/P3gGEROyIjOWnIhkF40Je49MPNwyBCeieeatH7mv1vNdxMg5PzjxV2UJ2UTY05P
 hac5ZKP8gNu6IDH5HIrCCIOfxDX0NNLJCMD1CHxQPJNdq58bn2zAWx7YWxkOm1UwdUzW
 N8jNGq23dzmkF+ACt6EweLbTTOnX1RpwbGr+SWXXQfAb0dh5tEzBwar5cGR8fWyPj7Zt
 iXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iwKrw8tO5y25zYOksvfVojKXZjXfywa7yUC+Id68b80=;
 b=AOMelmzsJ57YYmpr1Tp05JQYXgqPMHtdTyiKwNF23Ew4oOnPAo5jdS2e+0p0OUJezf
 N2ceGBlkTi8imy10f3V4TVcDhM0C2vObQQ0yEv7ET+cjU3eIrPd4gK+r7TMHhQPK2clV
 mYL+AmOp2I/rT/BVyNgkdp0u0U+6lm5B5WkeClPK6n+s5O2jFuK/h3kA8VcPjyALztGz
 Rl+oOQA8uX4DKCGYGO8ezXAuqIXwgENIB+UwAXzVe/uio7Ba1FL651sWnDah0xiiFZ9f
 JwWObF1jijdLHjRQR1MLIBOcBrUGwUc3kboOYfQlPDo+ZC0xZiEWRwPlqaC/gmx1I7jA
 yiJQ==
X-Gm-Message-State: AOAM530/39Pxk6Uo8mvQyz4Ex+lc0JWy5Mxmt/U/Yfiq4+SXCRfaBTba
 gkfSP19xLJLqOqFNrD3sDwvE8zuVC7g=
X-Google-Smtp-Source: ABdhPJwVvoLNaXmx3cu+zcF9Ch8sLEbUFxGFqdEHkEidA0ycwLA65//CmSY330xGUNw+HnbjTPsuPg==
X-Received: by 2002:aa7:cd08:: with SMTP id b8mr36023133edw.265.1643909654753; 
 Thu, 03 Feb 2022 09:34:14 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/27] qga/vss-win32: fix midl arguments
Date: Thu,  3 Feb 2022 18:33:50 +0100
Message-Id: <20220203173359.292068-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Microsoft midl compiler doesn't take "-options" form, nor does it take
OUTPUT filename. The -I option seems needless as well (at least with
VS15).

It's not clear what was actually used when it was introduced in commit
b39297aedfabe9.

strings says "Created by MIDL version 7.00.0555 at Fri Dec 21 13:36:39
2012".

I doubt the makefile rule actually ever worked.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/vss-win32/meson.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
index 90825edef3..78bdf5e74a 100644
--- a/qga/vss-win32/meson.build
+++ b/qga/vss-win32/meson.build
@@ -26,8 +26,7 @@ if midl.found()
   gen_tlb = custom_target('gen-tlb',
                           input: 'qga-vss.idl',
                           output: 'qga-vss.tlb',
-                          command: [midl, '-tlb', '-I' + config_host['WIN_SDK'],
-                                     '@INPUT@', '@OUTPUT@'])
+                          command: [midl, '@INPUT@', '/tlb', '@OUTPUT@'])
 else
   gen_tlb = custom_target('gen-tlb',
                           input: 'qga-vss.tlb',
-- 
2.34.1



