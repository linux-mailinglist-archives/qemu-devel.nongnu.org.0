Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FFC67C9F0
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:31:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0La-0003Ep-6u; Thu, 26 Jan 2023 06:23:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LP-0002Uj-Jb
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:03 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LM-0003jP-I4
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:03 -0500
Received: by mail-wm1-x32e.google.com with SMTP id q8so894033wmo.5
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KFZeEOxJCVQspOHbF7wx+yMKgFZxmjaI0SvCk2jpZbs=;
 b=TBe1H0Ha4fhAw6OGRnrnNq42Pwmd4sOi7igco6shLhIVk88qsG7QkTsFiQ7Vo64vuH
 wwNEE/H6MGTWM/h74zzGlN4CrW4bjzpWbpCVr8LzV5gx2gJHsh51CD2h9ab5x03shGMy
 32tgE72zWuZIGHWuMJXM08MrNiBwt4E2RFXESL/pu+mn/9rSKvJ9ejeyn+64LITyg/Fl
 PcL1bOWVcXI7QEuqeKMe7FDCxUogJv8Awww2JADQzOuOg7K7BUSm7kLON+gjU+rxh1jm
 5AhsJKX7qRG28x1UJEzwmdiEV7y3P7X0ZdxBMQWad9OI+NSsQxnUvSl6Z910jGCifnN1
 xpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KFZeEOxJCVQspOHbF7wx+yMKgFZxmjaI0SvCk2jpZbs=;
 b=vkaZ+gkLxYXiqk4569yLpvWlyzkUYBAg+4IxpwfgGPd9NK97CTToR2wIdtzNsIXwKQ
 ZbREhn4887HKRYUCFN2MGcwjc7VUnSIVdbrzJ3SBWy7dSZ8zqp5nc1tAj3KR8TwhWPFf
 pKtyOu2g/ztfVq0lfY60NJJDF6R5BoQRlaA3pf56/CcVJXmbQFVzJBIT8aF1HQnxgVi1
 G95tfajYxtVaWNG8rqQl/rfsjcJGEER4lUdFGqmid+HQ4ofjVPTZYIzp3Dr5nGHL2OR1
 EealyCYkTJ4qaChT0zzzF4QeEoEbWAbYlwNRSlLgv3dt4tLlW5GSA7Sorlpt4u29qsCS
 0A1g==
X-Gm-Message-State: AFqh2krxz3TZeYSMDL1cSi8L1zpU9W4AZdPARpwLOcktF19enJZRJwxQ
 0DN9BlM/M9FB9OnbZaFYT2MoTLrFs1sDBlO4
X-Google-Smtp-Source: AMrXdXvM7qQqsiiksmiqLk7olMuQZxzKQ3RZ97WUiKpRhmQBimr7SC8lIO8os6F58FnNl2msFlUdsw==
X-Received: by 2002:a05:600c:a29f:b0:3d9:f42c:56c5 with SMTP id
 hu31-20020a05600ca29f00b003d9f42c56c5mr35001516wmb.4.1674732179557; 
 Thu, 26 Jan 2023 03:22:59 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a7bcbc6000000b003d237d60318sm1213191wmi.2.2023.01.26.03.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:22:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 17E351FFBB;
 Thu, 26 Jan 2023 11:22:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bastian-Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 13/35] tests/docker: Install flex in debian-tricore-cross
Date: Thu, 26 Jan 2023 11:22:28 +0000
Message-Id: <20230126112250.2584701-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

When flex is not available, binutils sources default to the
'missing' script, but the current script available is not in
the format expected by the 'configure' script:

  $ ./configure
  ...
  /usr/src/binutils/missing: Unknown `--run' option
  Try `/usr/src/binutils/missing --help' for more information
  configure: WARNING: `missing' script is too old or missing
  ...
  checking for bison... bison -y
  checking for flex... no
  checking for lex... no
  checking for flex... /usr/src/binutils/missing flex

  $ make
  ...
  updating ldgram.h
  gcc -DHAVE_CONFIG_H -I. -I. -I. -D_GNU_SOURCE -I. -I. -I../bfd -I./../bfd -I./../include -I./../intl -I../intl  -w -DLOCALEDIR="\"/usr/local/share/locale\""   -W -Wall -Wstrict-prototypes -Wmissing-prototypes -w -c `test -f 'ldgram.c' || echo './'`ldgram.c
  `test -f ldlex.l || echo './'`ldlex.l
  /bin/sh: 1: ldlex.l: not found
  make[3]: *** [Makefile:662: ldlex.c] Error 127
  make[3]: Leaving directory '/usr/src/binutils/ld'
  make[2]: *** [Makefile:799: all-recursive] Error 1

By pass the 'missing' script use by directly installing 'flex'
in the container.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230112155643.7408-1-philmd@linaro.org>
Reviewed-by: Bastian-Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230124180127.1881110-14-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index 34b2cea4e3..5ae58efa09 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -20,6 +20,7 @@ RUN apt update && \
        bzip2 \
        ca-certificates \
        ccache \
+       flex \
        g++ \
        gcc \
        git \
-- 
2.34.1


