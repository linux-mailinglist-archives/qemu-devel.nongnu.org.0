Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6B250CA4C
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:02:31 +0200 (CEST)
Received: from localhost ([::1]:56070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFPC-0007M0-It
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFA-0006dB-5i
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:08 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:43724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFF8-00054B-PM
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:07 -0400
Received: by mail-ej1-x632.google.com with SMTP id m20so432868ejj.10
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SfhKCmUO//k2KKxCugtKMMJyeYbHUaz7sxHNSvDAQHc=;
 b=WOelcUrtpQjjTL+OjYHy1a1eTTtvNuw9kedW7CTY/Nx2dHeyvEPdH4Sa3+DczETq96
 r50ADoJ+T0fxZ6uqHzoxl2czLGSs2fHy2yH8ocRk1TCEGtgSWQkeiH+DQMVOQKQQj803
 /r8WAtmoaYlC7JlMyh7CE+Qf+tzWFFJjysg2DjaKkkmYKCNXtlQj5cLQl5jeIgn4ZCIh
 9v2WExzqQvEXTuPnEUVV4NHLWji6MOkpDnDBCFc3EQnUf4rZUImoek1wg9YwJ9wrnBn3
 z9soPJAqWhtmBI+M4vUk8VUyOGaMdhJJQdU7vlmoVoxddePhKufMwT+VOGsEvFMQoej4
 RdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SfhKCmUO//k2KKxCugtKMMJyeYbHUaz7sxHNSvDAQHc=;
 b=fgw9G1ffyGVWW/PPf75KM/PrUFGnBsdMgiv7nz/Ul1llEojn0qDQ6LdlRY/TmImNh2
 Qn2Ev/wjoSn+UuMqBsPgcfPn6L/eGkIpk7wSkv8UoZeEsZFAdkK+RydUQIfDE3FyItDk
 ZqaI2MoqJcA9qiKdpZUW7eszfZtcgqBXR7r4cAj7BaVVslAbJFC2mMLKwomiLr4HnldN
 CYYE9HgFoWUJvfIOQq02uBvNO1IX3DnG8M4XBHYVv+sNqOGdWPKM1qh6MIQQApYq865S
 OiN3xpEo8sRmIgAr0KQvqyAvAC5B0kv/U/tbmhmfGu6K+O98W9A83CmOGvDjlC6L9m6l
 HcFw==
X-Gm-Message-State: AOAM5317aG9aBvbkudLcdba08ZWQK1D33RXL/2hj6VMPJM07qNete2Dl
 3bqChrjifER1R1lguUNUUBSE+o8k1FVy3g==
X-Google-Smtp-Source: ABdhPJz9QTiW2u8iRk+xZ6WNJw6ZUZcyhDKeHKol3Phi/Ns9B5v416t7XBHMfKxApM6N73CUhJXGoA==
X-Received: by 2002:a17:906:408c:b0:6e8:d649:5e41 with SMTP id
 u12-20020a170906408c00b006e8d6495e41mr8426338ejj.519.1650718325572; 
 Sat, 23 Apr 2022 05:52:05 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/34] configure: pc-bios/qemu-icon.bmp does not exist
Date: Sat, 23 Apr 2022 14:51:21 +0200
Message-Id: <20220423125151.27821-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The file has been removed in commit a8260d3876 ("ui: install logo icons to
$prefix/share/icons", 2019-01-21), do not try to symlink it in the build tree.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index 049f669a94..a6ed3498f2 100755
--- a/configure
+++ b/configure
@@ -3019,7 +3019,6 @@ LINKS="Makefile"
 LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
 LINKS="$LINKS pc-bios/s390-ccw/Makefile"
-LINKS="$LINKS pc-bios/qemu-icon.bmp"
 LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
 LINKS="$LINKS tests/avocado tests/data"
 LINKS="$LINKS tests/qemu-iotests/check"
-- 
2.35.1



