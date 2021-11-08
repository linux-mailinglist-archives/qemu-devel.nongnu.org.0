Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639C1448201
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 15:43:15 +0100 (CET)
Received: from localhost ([::1]:45146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk5re-0003S3-Iq
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 09:43:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5l9-0008Bp-RZ
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:32 -0500
Received: from [2a00:1450:4864:20::52d] (port=41743
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5l6-00075K-DA
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:31 -0500
Received: by mail-ed1-x52d.google.com with SMTP id ee33so63596319edb.8
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 06:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0imeq6XwpJU8H3v5+Ve4y8cLcm+ED+v+MPUZI233d9w=;
 b=QaZt+YAmBUW5a6MctBpHgI+tY2auSOap1a4K6O5Xgp6F1P8Dt4hJizjtM59eU4hGgM
 13QR7ejtjIH3PCesywXLOE41fidOtYTCGnxNuuFu007moCbdrKXaoNomtR2CfIITk240
 V2zWMrha+/Bv8Q5HpYtPwLJiZlgBSF/VlpPcU3pMQd64v8CElsmgC+VXD0G0NkxRfS9/
 +zuUhHxrJXkSnKaf16LXNjo8Ng6NvNTkTlDt2NBgXW9uGItkVCRdh73cIdGos+XLUbC9
 ypWzOHwjO+FQy5pZAMvfeYeO5JJcCqST8br4VQLJR1g8kN97KMwsGuhB5jQXu96X1yhz
 N3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0imeq6XwpJU8H3v5+Ve4y8cLcm+ED+v+MPUZI233d9w=;
 b=dqClLsJhaMFDDH/c7ZlaXyuBwJGeuu7RMysKMKxqM9UgCqNn4MKjqgIwqLE9TMISnK
 vMnagso0ILXpU/pcp3Yuv40GIxn1dLsWKfpsquae/2CrRW+mQf4XV23xfial31z36T+N
 uZ8xVz/mFIv2BWdluePIIo25E8Sj7TSAVWqYvr3eM4KD10sgz393l8ssZbV+UQmvECSO
 f8WfgdOJdU/lBtm7h1GA7i7ZZ2IHf42nfv2CjMc1qflbyVKsU6wGXeVxz0cVSdK0F7Wk
 7No53aW1gowAnQtin50MNUepXHmk4Qd/RS5r9jJeS8CzcFb2OV4F74TnIZ3Ld8c7NaqN
 bKXA==
X-Gm-Message-State: AOAM53316dLM4f3shn0rSDN5VyzxlVp6EwOvwNojuCJCghzS+K2zphKI
 4ffoXNCY+bGsKzo6cXxXOXJcyinohR8=
X-Google-Smtp-Source: ABdhPJzeaGPyaF9QimNp3gyd+1HP+4cT9F5KMP3bTg8bVOVNok4Yw/xoFC6NKWqkZB2JbzsBDW23mg==
X-Received: by 2002:a05:6402:520b:: with SMTP id
 s11mr65088edd.213.1636382181513; 
 Mon, 08 Nov 2021 06:36:21 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id hp3sm8366662ejc.61.2021.11.08.06.36.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:36:21 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/10] meson: perform snappy test with the C++ compiler if used
Date: Mon,  8 Nov 2021 15:36:10 +0100
Message-Id: <20211108143616.660340-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108143616.660340-1-pbonzini@redhat.com>
References: <20211108143616.660340-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Snappy is written in C++ and as such needs to link against libstdc++.  When
linking statically, this means that the compile test cannot succeed unless
performed with a C++ compiler.  Do so if link_language is set to C++; if it
is C, the test will usually fail and snappy will be disabled.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 47df10afc2..6bfed294d0 100644
--- a/meson.build
+++ b/meson.build
@@ -197,6 +197,10 @@ add_project_arguments('-iquote', '.',
 link_language = meson.get_external_property('link_language', 'cpp')
 if link_language == 'cpp'
   add_languages('cpp', required: true, native: false)
+  cxx = meson.get_compiler('cpp')
+  linker = cxx
+else
+  linker = cc
 endif
 if host_machine.system() == 'darwin'
   add_languages('objc', required: false, native: false)
@@ -1109,7 +1113,7 @@ if not get_option('snappy').auto() or have_system
                            required: get_option('snappy'),
                            kwargs: static_kwargs)
 endif
-if snappy.found() and not cc.links('''
+if snappy.found() and not linker.links('''
    #include <snappy-c.h>
    int main(void) { snappy_max_compressed_length(4096); return 0; }''', dependencies: snappy)
   snappy = not_found
-- 
2.33.1



