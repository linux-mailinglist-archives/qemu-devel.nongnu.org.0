Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C13660F07
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 14:23:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE99S-0005TZ-Oc; Sat, 07 Jan 2023 08:22:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pE99G-0005Rg-46
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 08:22:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pE99D-0000le-TA
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 08:22:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673097724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZW3uzgO5FhEvEamPa5yCpfOZ4ojYnfsuT8yi+NTESc=;
 b=S+iHl79QUhzKrERK68CinUI+YoP6Ugnc00iEku6OaGr/dNeCqOh+GDfH2AIcFCSo8UDqhQ
 SCoAeZgml98i6QD3QhFY2vRqTAOmRqxKHC2Qxn5bLjtsNzre7P8pGuiTjWdCz4C+92mMih
 2aef2xFw21+WCqvRb/ZLp6FECYPqC+s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-308-JePA90FuNzGyKfuqldiCIg-1; Sat, 07 Jan 2023 08:22:02 -0500
X-MC-Unique: JePA90FuNzGyKfuqldiCIg-1
Received: by mail-wm1-f69.google.com with SMTP id
 i7-20020a05600c354700b003d62131fe46so4259482wmq.5
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 05:22:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TZW3uzgO5FhEvEamPa5yCpfOZ4ojYnfsuT8yi+NTESc=;
 b=lTSD6oRIMiNg4jISFgub+XS2FXUBgAVgDMmTKkQKi/i4XlAPnrQ+sELGlw6pY++TBV
 Iw1Xx1h4F68gShCTLUFadoGnZmxbPWZnGUysby/b3fYI1XoKRtviunzhLzOzGLYcrfWc
 GT8IVamho9jZ2+IBbEsH3YaRIhJyyGTnAC0DEw36EdY72nn4tNoOM6hEjqUq73iFYia0
 bdLkp7Nyzd1uh9nBCx4H5oVE3z8LF4XnWGMspO2qdqVL3bAfGsdM28eLq2v2B/xPLk0L
 KzqCIBP4DtauRKLNSQZezpaiTJoFF9+ouasphaOd+cWI18CyqCOezEwwNToGCkXj1NIR
 oA8A==
X-Gm-Message-State: AFqh2kpYatqjL3VpXTkYmzUNIaq8eabC7Z4v5qeuMCM/6tJwWHAeGDU4
 hbo9hgsNsH6+DhWecEpOrFiXZa10xPO4smwspXVUluD7fAe9bsWXVsYaKpUcEcMb0LWTd5vYJ0r
 D0wz4j/2f7vqAYOmrOevghYS7n0dKT8l0C5zHcJnJTiat5nz6oqj2hDyAqsQor1DWWQg=
X-Received: by 2002:a05:600c:4da0:b0:3d3:5027:4cce with SMTP id
 v32-20020a05600c4da000b003d350274ccemr43876630wmp.10.1673097720810; 
 Sat, 07 Jan 2023 05:22:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu88baLqKvfS471Yc8sHzXqcvq0G+4X6HWy2jBAQcEbEpkU1QAEUqFeDSinUu1LGIvqPzzGKQ==
X-Received: by 2002:a05:600c:4da0:b0:3d3:5027:4cce with SMTP id
 v32-20020a05600c4da000b003d350274ccemr43876623wmp.10.1673097720494; 
 Sat, 07 Jan 2023 05:22:00 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c4f8700b003c6bd12ac27sm6069179wmq.37.2023.01.07.05.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 05:21:59 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 11/24] configure: remove backwards-compatibility and obsolete
 options
Date: Sat,  7 Jan 2023 14:21:53 +0100
Message-Id: <20230107132153.108680-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230107132153.108680-1-pbonzini@redhat.com>
References: <20230107132153.108680-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                                     | 20 -------------------
 .../ci/org.centos/stream/8/x86_64/configure   |  2 +-
 2 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/configure b/configure
index 3f7d07d4bece..4e0dc3fb091f 100755
--- a/configure
+++ b/configure
@@ -845,17 +845,6 @@ for opt do
   ;;
   --with-coroutine=*) coroutine="$optarg"
   ;;
-  --disable-zlib-test)
-  ;;
-  --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
-      echo "$0: $opt is obsolete, virtio-blk data-plane is always on" >&2
-  ;;
-  --enable-vhdx|--disable-vhdx)
-      echo "$0: $opt is obsolete, VHDX driver is always built" >&2
-  ;;
-  --enable-uuid|--disable-uuid)
-      echo "$0: $opt is obsolete, UUID support is always built" >&2
-  ;;
   --with-git=*) git="$optarg"
   ;;
   --with-git-submodules=*)
@@ -875,19 +864,10 @@ for opt do
   ;;
   --gdb=*) gdb_bin="$optarg"
   ;;
-  # backwards compatibility options
-  --enable-trace-backend=*) meson_option_parse "--enable-trace-backends=$optarg" "$optarg"
-  ;;
-  --disable-blobs) meson_option_parse --disable-install-blobs ""
-  ;;
   --enable-vfio-user-server) vfio_user_server="enabled"
   ;;
   --disable-vfio-user-server) vfio_user_server="disabled"
   ;;
-  --enable-tcmalloc) meson_option_parse --enable-malloc=tcmalloc tcmalloc
-  ;;
-  --enable-jemalloc) meson_option_parse --enable-malloc=jemalloc jemalloc
-  ;;
   # everything else has the same name in configure and meson
   --*) meson_option_parse "$opt" "$optarg"
   ;;
diff --git a/scripts/ci/org.centos/stream/8/x86_64/configure b/scripts/ci/org.centos/stream/8/x86_64/configure
index a7f92aff90ce..75882faa9ca5 100755
--- a/scripts/ci/org.centos/stream/8/x86_64/configure
+++ b/scripts/ci/org.centos/stream/8/x86_64/configure
@@ -188,7 +188,7 @@
 --enable-tcg \
 --enable-tools \
 --enable-tpm \
---enable-trace-backend=dtrace \
+--enable-trace-backends=dtrace \
 --enable-usb-redir \
 --enable-virtiofsd \
 --enable-vhost-kernel \
-- 
2.38.1


