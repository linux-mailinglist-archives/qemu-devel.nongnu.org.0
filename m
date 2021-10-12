Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC2B42A3AC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:54:27 +0200 (CEST)
Received: from localhost ([::1]:60984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGMU-0005yM-4b
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFin-0000xt-5k
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:25 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:38430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFik-0007ar-M4
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:24 -0400
Received: by mail-ed1-x531.google.com with SMTP id d9so55753874edh.5
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2OGn+S76MId8XJEbb53T+rgcMaIZkJDsd20b1SjwZfQ=;
 b=a/8AWxdh2Xp33i9wRjmkkjqRhIgPxhui4SRbj3zs9pPzrvFc1EP36k5VTNNCrHvzUk
 ujV4iPHFoSfNdJoC2/HPCljMuuhXrcWJFiQJ/uUaDr2W4ouIAdEg2eoLiqZORQAIe1Zc
 qB1f9uN5xSsE7EXybMy+yWRebGcvMbQVBqyDKp7OV6N6A8PiAUgsqPSgddZU00XW4lef
 xPEqdln0+Ap5fB3hFyIsw6BkPjliAVGmaK/R67tnv1BPOUWJWtRaNn60Q3RznJysG9Az
 bIltWhlLhaLy9rLIJ44YTv/JZjnliuvqlKb4JcvBMYFUP3bvqJ9rSfGHINZwzLzkX4G5
 P71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2OGn+S76MId8XJEbb53T+rgcMaIZkJDsd20b1SjwZfQ=;
 b=Ol2hseejD22jGZ0WUck7O/lgWkykyuvGS5Pw3N4nb1u7d1xLUQoh+5bPVcbMKEvxGU
 DfrGLsIMAGS+u5LahqU1t/HZSajWeGjbf1VrBw+fpeclLGaDyExdxlVdvMRBNxlKAE8V
 e6JFQQdJcJn7kf/bEJhAhGkqmgYTlLfae6jKwvHGxT142ir5VLNxXUZJLwVCb8DTtX0O
 s7lZ+vHqHNF1IPrutMYZtay6W2/qVkq5kQzx2EDoKgZMtTgfnctVBNvQd+jQC5XvF4WM
 jIX2CmGUBDxwXBJDdk+YvJ37Iw8GxkxiT4DYmPSX9xbvtgAeJIGKas6KRf+dv9aOWM9s
 Mg8g==
X-Gm-Message-State: AOAM530LeJqkwoTCQVbrh0Vapbwa0Dq53BuVn4L4OWiN64lFntGxpknm
 qkhA1tjn9mEIhAc0388P68zgt/n7/fw=
X-Google-Smtp-Source: ABdhPJz1/eQytysYrxWEgthJCnDSWw+Pltr6I7k1EloSIs/n6Q/ZQg3NaQjTJih3V057YF6XcoKFVQ==
X-Received: by 2002:a17:906:2f94:: with SMTP id
 w20mr33766340eji.14.1634037201430; 
 Tue, 12 Oct 2021 04:13:21 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm4742802eja.6.2021.10.12.04.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:13:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/24] configure: accept "internal" for
 --enable-capstone/slirp/fdt
Date: Tue, 12 Oct 2021 13:13:00 +0200
Message-Id: <20211012111302.246627-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012111302.246627-1-pbonzini@redhat.com>
References: <20211012111302.246627-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: marcandre.lureau@redhat.com, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Options such as "--enable-capstone=git" do not make much sense when building
from a tarball.  Accept "internal" for consistency with the meson options.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211007130829.632254-17-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index d00ba0cbd2..d2f754d5d1 100755
--- a/configure
+++ b/configure
@@ -1019,7 +1019,7 @@ for opt do
   ;;
   --enable-slirp=git) slirp="internal"
   ;;
-  --enable-slirp=system) slirp="system"
+  --enable-slirp=*) slirp="$optarg"
   ;;
   --disable-vde) vde="disabled"
   ;;
@@ -1193,7 +1193,7 @@ for opt do
   ;;
   --enable-fdt=git) fdt="internal"
   ;;
-  --enable-fdt=system) fdt="system"
+  --enable-fdt=*) fdt="$optarg"
   ;;
   --disable-linux-aio) linux_aio="disabled"
   ;;
@@ -1479,7 +1479,7 @@ for opt do
   ;;
   --enable-capstone=git) capstone="internal"
   ;;
-  --enable-capstone=system) capstone="system"
+  --enable-capstone=*) capstone="$optarg"
   ;;
   --with-git=*) git="$optarg"
   ;;
-- 
2.31.1



