Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6376F6C4CA3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 14:59:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peyy6-0000zZ-Cg; Wed, 22 Mar 2023 09:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peyy4-0000z7-TA
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:57:32 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peyy3-00018b-8W
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:57:32 -0400
Received: by mail-wr1-x434.google.com with SMTP id l12so17173439wrm.10
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 06:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679493449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uI/PqPnh+syqktubN6Cm0y9rYGZLvTWBD1kNl80Dgig=;
 b=vxi78SETQOIfBY5C9bYL0F6CtD0NG38r2kCWBIk+qRMt6975wQWmipc9BTSm5sAjAJ
 oUX62Q9pgGgaWsQn7C/By1Uyx+jLOfG7aMPJFXF1LeHOSeUBXRBsLS0GKPTaKXPJJ2Uo
 oS31NupZs3N33qGNEljbMk3dlWZ+EaoBzU8V94YYcLJBaAOsZS3Fn0cRQIt/2LQ2FYzC
 QCP5niel7h5nDseZ7tMWtAH6mh9Kh013G8CIdn5e/X2LweZr5zHHImwdRUdEHxJaSp2m
 XFnYaSr/3UeNQ01Dhg22whtCh0i6b9UqA2ytk3UmfY+DL3zD0NzEwX5utLRfCmirw0Qs
 lpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679493449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uI/PqPnh+syqktubN6Cm0y9rYGZLvTWBD1kNl80Dgig=;
 b=qYC13beLh5zc/y2ROykw0eGoWiRnAhovrWeY4tRCir5cfiPfKOSfNztHYye7uxbu8S
 Zsjt4Dd1vJ3U5i6cKt6z3Zr0F/BVgCajjSBvEzMoCFe52GwFGFLifSC8Omqm7RiLajrh
 zyBt4Bb44Wd6bqy19zNFk+3gqFQveIDjcf2i0NU4RkdQkVk4weTxkCqT2S08MdM2HfrU
 WkX5EPyoWLGSC3HKM6cQrse5JQK9foEqMGHzlzlcJ6s3VZ2PMsYzmp9iH6oifK/4+6w2
 ixfHXFRdDBr/qKcC2h8vZEZhFBE6aCHhGQwz4Suk9tlUxY1vz2kPVsrxbPn5QJt0Eh0F
 UDUw==
X-Gm-Message-State: AO0yUKVUs9AJxGnio39S+952nYlTZKr0bmL+N16PsZh1X+7MHRT1Qr8Y
 mbzD3FfoFrJPL2Dp1IShFgjqRmgPSjkF374iHv6Csw==
X-Google-Smtp-Source: AK7set/fLYf/z1/XIfyD2wUCwccenUWGdQV1ndFnXPZKHtKg6uLLzWKJuOSgwxxNDFR/L7bJZ0k3tg==
X-Received: by 2002:adf:ebcf:0:b0:2cf:f35b:9aa2 with SMTP id
 v15-20020adfebcf000000b002cff35b9aa2mr5499493wrn.19.1679493449667; 
 Wed, 22 Mar 2023 06:57:29 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k5-20020adfe8c5000000b002d748d46565sm7188703wrn.74.2023.03.22.06.57.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Mar 2023 06:57:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jintao Yin <nicememory@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 1/2] gitlab-ci: Cover SPICE in the MSYS2 job
Date: Wed, 22 Mar 2023 14:57:20 +0100
Message-Id: <20230322135721.61138-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230322135721.61138-1-philmd@linaro.org>
References: <20230322135721.61138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Include the mingw-w64-x86_64-spice package so SPICE is covered:

  C compiler for the host machine: cc -m64 -mcx16 (gcc 12.2.0 "cc (Rev10, Built by MSYS2 project) 12.2.0")
  ...
  Run-time dependency spice-protocol found: YES 0.14.4
  Run-time dependency spice-server found: YES 0.15.1

In particular this would have helped catching the build issue
reported as https://gitlab.com/qemu-project/qemu/-/issues/1553:

  [1851/5253] Compiling C object libcommon.fa.p/ui_spice-core.c.obj
  FAILED: libcommon.fa.p/ui_spice-core.c.obj
  ../ui/spice-core.c: In function 'watch_remove':
  ../ui/spice-core.c:152:5: error: implicit declaration of function 'qemu_close_to_socket' [-Werror=implicit-function-declaration]
  152 |     qemu_close_to_socket(watch->fd);
      |     ^~~~~~~~~~~~~~~~~~~~
  ../ui/spice-core.c:152:5: error: nested extern declaration of 'qemu_close_to_socket' [-Werror=nested-externs]

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
See https://gitlab.com/philmd/qemu/-/jobs/3980693656#L2378
---
 .gitlab-ci.d/windows.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 87235e43b4..472bacd2e2 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -59,6 +59,7 @@ msys2-64bit:
       mingw-w64-x86_64-SDL2
       mingw-w64-x86_64-SDL2_image
       mingw-w64-x86_64-snappy
+      mingw-w64-x86_64-spice
       mingw-w64-x86_64-usbredir
       mingw-w64-x86_64-zstd "
   - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
@@ -108,6 +109,7 @@ msys2-32bit:
       mingw-w64-i686-SDL2
       mingw-w64-i686-SDL2_image
       mingw-w64-i686-snappy
+      mingw-w64-i686-spice
       mingw-w64-i686-usbredir
       mingw-w64-i686-zstd "
   - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
-- 
2.38.1


