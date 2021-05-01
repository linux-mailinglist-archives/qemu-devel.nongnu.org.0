Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E4A3706B0
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 11:42:53 +0200 (CEST)
Received: from localhost ([::1]:50836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcm9E-0004Cl-S8
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 05:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxR-0000YR-Or
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:42 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxQ-0005YK-CL
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:41 -0400
Received: by mail-ej1-x62c.google.com with SMTP id r9so734433ejj.3
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 02:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WXi6ivluLlCuasWuRyqmbwfhegfcqonoJlZ+TWVzTOY=;
 b=riDg7aSprhsqSUDZ2LltRjLmOcFtNfDyntBbk+EnlgGatny8YED7HiDvH5vwwJYRq0
 dbpleTFyjViSYh3idybK6KopJHVXYdOHy33SKItgE5hEQqlmnC5nx0H+YlnFau+wyG0n
 wsiYwlP5o++49N11ZNRraC6OHS3LRNhwQZiHA66ml9tqfTXEmnhNaodbFw0sr1YPxrtD
 N+Oj9tfd1Sm3RFZ69FtyX7fpb9lL0mvlx/WPKLZtAtFMTfY9+8N1vyS6abI9ym2nd3tY
 rax7uZHCG2mNUN6swFBTiHOkll96v4HwaN/05HoMKKj7WYe4Pd3zRfr273LNZ+0bO2bg
 OdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WXi6ivluLlCuasWuRyqmbwfhegfcqonoJlZ+TWVzTOY=;
 b=dw40axgtSiHs/nu8dZyeeAasdO1kvuPLFhaJkf9mS9y99UY4e7m8cqm5EcNq/ugQqc
 L5pD84GXqizyz1YFZGTUVBqfFhcS4+y0HzNRxZiw6FW/4bLb5+W3A6OU3rEN9roIJxbW
 dvH70suy0xpHKuoliCJOCx66eMNfcIx1UFS1G8sDz6gCzmHsNC5O0HwYM1dIGOcF/QHL
 baSNJ+Tt8iN9XPrDu4Wgtr+t9V6P7gTJI/EW+RSKGj5/APVfT/LQoi76IUqGudEYvCpa
 EZpRj2xL5xxwxlhgeaudd/jbaE30q/Yqy1KSO7jXg2Alrsfs7N1ENbk8R+PKn9uZyoCr
 +eqQ==
X-Gm-Message-State: AOAM532WKSL92CknUM5CVnJ/lB17SFx9GE6eJEabxQsEoXId41dxoEe3
 UXVJ0tvpbpTDkJgpsqnYSSMBiYXeFYA=
X-Google-Smtp-Source: ABdhPJwqX9u5IWqLt0xZoRvKO0kxFVSDip9uaW+vz+7nz5NjcZF/oDhkWjUE8HOcLfAwo7O5NbKNkQ==
X-Received: by 2002:a17:906:f1d4:: with SMTP id
 gx20mr8339958ejb.108.1619861438044; 
 Sat, 01 May 2021 02:30:38 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id ga33sm4632721ejc.11.2021.05.01.02.30.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 02:30:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/10] gitlab-ci: use --meson=internal for CFI jobs
Date: Sat,  1 May 2021 11:30:26 +0200
Message-Id: <20210501093026.189429-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210501093026.189429-1-pbonzini@redhat.com>
References: <20210501093026.189429-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
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

If we use the system Meson but it is too old, the subsequent "meson configure"
will fail.  Always use the submodule when building with CFI.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.yml | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 52d65d6c04..dcb6317aac 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -19,17 +19,21 @@ include:
   before_script:
     - JOBS=$(expr $(nproc) + 1)
   script:
+    - if test -n "$LD_JOBS";
+      then
+        scripts/git-submodule.sh update meson ;
+      fi
     - mkdir build
     - cd build
     - if test -n "$TARGETS";
       then
-        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS --target-list="$TARGETS" ;
+        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=internal} $CONFIGURE_ARGS --target-list="$TARGETS" ;
       else
-        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS ;
+        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=internal} $CONFIGURE_ARGS ;
       fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
     - if test -n "$LD_JOBS";
       then
-        meson configure . -Dbackend_max_links="$LD_JOBS" ;
+        ../meson/meson.py configure . -Dbackend_max_links="$LD_JOBS" ;
       fi || exit 1;
     - make -j"$JOBS"
     - if test -n "$MAKE_CHECK_ARGS";
-- 
2.31.1


