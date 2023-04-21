Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B5C6EA71A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:36:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn8z-0008C8-Kw; Fri, 21 Apr 2023 05:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn8x-000840-29
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn8v-00031M-Is
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QHH/rhb7LzSAHW6poksuTPs4ZCgAMWLJKQD/UMNwHog=;
 b=U9a8G3u1E3zhYIi9r52+kLyiiVwnwnXdIDacfYK6gdj47SWfMuJD2F2Gtrf3pzOzaY7olX
 JxbQzflrvX5CLgGXGEBHtIezS5iNcMVukcA70vD38Td/b0rYHN23lSnAfq4BxyWuD1Z/6+
 0SwwTze3IRl46NpkS82adDm0UZzX8e8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-CJNN9PTpN5m4cl5DeMKIoA-1; Fri, 21 Apr 2023 05:33:23 -0400
X-MC-Unique: CJNN9PTpN5m4cl5DeMKIoA-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5069f2ae8eeso7116728a12.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069601; x=1684661601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QHH/rhb7LzSAHW6poksuTPs4ZCgAMWLJKQD/UMNwHog=;
 b=D4obZ7AJ2CrDduDxCOeuHDWo9gABJ/l6exhJDInJNb1kl+UrU7Qq2MixtqHK2mqbrt
 D318l+r9QzUT0+HwjBKdoxhFcrGGBi3GsmYXok2LXfgY97vaGK3RpD5WOsfz6RXEEM3L
 PI5CBOWf6xZMy2RMqRPsRogqQJfdLAcClpvffh2kY4qjeJPoF3Xn/PSzdyrrnsWS9Zs+
 97hYqMykJU4FOcNUr3SoOibhinNxKmn3+y0rBn0wanU02i6VRkH6QHiHQnQtJrNQvuMN
 hbK5PYUVFY1XbtpqggeC+bvZNFoWZd5KNAX/6U8Om6+J2i/aFrbp+YGCPtQ8gAnFB2ok
 IORA==
X-Gm-Message-State: AAQBX9csOjsSIMXViCQPv7ey3HhoLux66GUmNHtowGGG2dVfA7zbCCK7
 4NrdcFMZeNn8HjxzAClzyE3gR0QuwXFqwxiOW2CIHYTabcxZVeMul0crdXassDzF9nqziQMmwQS
 pjFN0G3UtQlDDiVlsemcAJ2IYm6i6bDvn874n53JMNv2Rd3P96O97QRPtlaFshu3a9H2BmhH/Vq
 2FxA==
X-Received: by 2002:a17:906:1d51:b0:953:7d80:c40e with SMTP id
 o17-20020a1709061d5100b009537d80c40emr1938514ejh.0.1682069601700; 
 Fri, 21 Apr 2023 02:33:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350bLzpWc6UmYsBc1DCaE2fWE+Lwt6FDtlUb/RsfH/oyFLyNq8yverdtj2s3TxwMoCc3m0LVhaQ==
X-Received: by 2002:a17:906:1d51:b0:953:7d80:c40e with SMTP id
 o17-20020a1709061d5100b009537d80c40emr1938495ejh.0.1682069601406; 
 Fri, 21 Apr 2023 02:33:21 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a1709063b1100b0094e6db4d4a1sm1817196ejf.186.2023.04.21.02.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 03/25] build-sys: add slirp.wrap
Date: Fri, 21 Apr 2023 11:32:54 +0200
Message-Id: <20230421093316.17941-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This allows to build with --enable-slirp / -D slirp=enabled, even when
libslirp is not installed on the system.  "meson subprojects download"
will pull it from git in that case.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230302131848.1527460-4-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitignore             | 2 ++
 subprojects/slirp.wrap | 6 ++++++
 2 files changed, 8 insertions(+)
 create mode 100644 subprojects/slirp.wrap

diff --git a/.gitignore b/.gitignore
index 61fa39967b54..1ea59f481921 100644
--- a/.gitignore
+++ b/.gitignore
@@ -20,3 +20,5 @@ GTAGS
 *.swp
 *.patch
 *.gcov
+
+/subprojects/slirp
diff --git a/subprojects/slirp.wrap b/subprojects/slirp.wrap
new file mode 100644
index 000000000000..ace4f26102f5
--- /dev/null
+++ b/subprojects/slirp.wrap
@@ -0,0 +1,6 @@
+[wrap-git]
+url = https://gitlab.freedesktop.org/slirp/libslirp
+revision = 15c52d697529eb3e78c5d8aa324d61715bce33b6
+
+[provide]
+slirp = libslirp_dep
-- 
2.40.0


