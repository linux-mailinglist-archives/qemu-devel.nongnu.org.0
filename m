Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F490674083
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:05:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZHJ-0003QS-NB; Thu, 19 Jan 2023 13:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH5-0003Jd-VD
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:32 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH1-00011k-VG
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:31 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso4128800wmc.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AnZDkxLzgFFSav85Au8pAya0nVRLiogiOeok78nk0b8=;
 b=ozc5pjU1h8VaOS+tlIneVN2ZVYvKpR9+LTZk+I7iGjMCtiOdq5LJbeiLHMzdEbSp4U
 RE805l886AFxuZ/NeE8awXvGJd6Ba1TfeyyIHH9HEdz5t1fsrGeywdZoxamN8PafKUUQ
 hShVQ+VjWSURPCBC0j0c/qcxZLZno3N75sttHImUQnh+K3DQL+nyHq2vjl1BvnqDqCGD
 HcJIeJDpbvaWvZ55At7/Gtx9Vm/JN+en0wHvIZI8rOr1vb7VnQCDLBQfHdtECrap3YaF
 Gn7kb703d/BZgopAzch/bVF8XCkBxa5rej/oVQJvSxOvD+3XU9P4GunCV5zj5zrQKHAv
 yEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AnZDkxLzgFFSav85Au8pAya0nVRLiogiOeok78nk0b8=;
 b=uswVGIQkzpocS1uEplf++/XP7jDgk41JHRzFesWVijsaFP+hI7do2Ysm+aA41KgLQF
 ePw6si3hqk/HMaJmR9tBREwn5tfBDDwR2N+Ts0QU/4l9TouRokkXzTOMfRUjqe9y748C
 zJuLqBuOHgWX9FFhTjFJB8PMQHadMN+uurvvHaArmpV8wdlqhX9tVrpFj+ZZmBIl92UJ
 R0xw+FPmlh9wFGaPzfjk+XogNTHtfvGwupwLCr9BiP9J+MEQkrmWv1ZUR1NCvPXMEAb0
 +90sJogE8Ycaw++XuEe27e1hxKe/4r463qxwQP2PHmQdjPNTFRycD8pVt78+ricsMIeT
 tnnw==
X-Gm-Message-State: AFqh2koaSriGbOktoBrjzRVYMen9zf3J5RTdOHk0y4kS/wr8bTLla7RI
 fzmixh8NThyMRqyBkle24Eq8og==
X-Google-Smtp-Source: AMrXdXvxA7YEC3cEt5sjIg6ztYM8f5aY01PYsOJfQ/KKnC3TvZ5HHNq3yyoW+/7fEbQpvfD9tYPQQA==
X-Received: by 2002:a05:600c:4d81:b0:3d0:6c60:b4d1 with SMTP id
 v1-20020a05600c4d8100b003d06c60b4d1mr11780598wmp.6.1674151466614; 
 Thu, 19 Jan 2023 10:04:26 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a05600c190f00b003d9aa76dc6asm8156568wmq.0.2023.01.19.10.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:04:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 346C41FFC3;
 Thu, 19 Jan 2023 18:04:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bandan Das <bsd@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Bastian-Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH 13/18] tests/docker: Install flex in debian-tricore-cross
Date: Thu, 19 Jan 2023 18:04:14 +0000
Message-Id: <20230119180419.30304-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119180419.30304-1-alex.bennee@linaro.org>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
---
 tests/docker/dockerfiles/debian-tricore-cross.docker | 1 +
 1 file changed, 1 insertion(+)

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


