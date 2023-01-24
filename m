Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E534A67A0EF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:10:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNhR-00055j-Od; Tue, 24 Jan 2023 13:07:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhH-0004yr-2h
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:03 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhD-00073s-KH
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:02 -0500
Received: by mail-wr1-x431.google.com with SMTP id q5so10058960wrv.0
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AnZDkxLzgFFSav85Au8pAya0nVRLiogiOeok78nk0b8=;
 b=KYNP5p1rwdClS8daP3mgitLOL+o+UPsFXVQZJ8M8X14dGXT1gXzT+y7El//QysRwjM
 rWj8GwlUXfmItAQI+qhfGoJCwp+UVJeRptprTwSXmm3V1UwzoHaGzXl3YNmFO4dFucEZ
 fwOVB3APHxe6ID8gdgbQUfrEvaZGWSEOVoY3qVc2tnN5WkkGgNUh8/s1DB0nJkq7ffX4
 6TXuU9NEp/14oQQuFC/Ncce3FMFGLwlvycq83qcw11nGitr6inlX3TMuaMGB7M52NDa5
 2zj/nYh0hf2YGuEASU/reBwQBcl+qEIXjQGMCbTI8/QTcbpc1s9qjO0XwE3ysHbTWHxw
 z5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AnZDkxLzgFFSav85Au8pAya0nVRLiogiOeok78nk0b8=;
 b=gmow7GEHLs1DeeQ1TlqT4U0MO57bfiz5YJiqzwjzWAB8fmAQrKtb3XQscNkuPwrmsS
 k2hVfK92phe/1ZuUxPxxLOdV+9Dn4H0N3effKdpWxVT563D4ugCHtBjL4IvYWO16HKj9
 mIY16aqCXNtMHtbOxjPZfVcGwEWb710ipxxx1R8ZpfuIx4wNt6gq3ToUJ9QD7WkuyqgL
 yGl5hxswT6WizWXJgYVMWCXUeSn9Gl0vNjPNlwLmZEnDod7YogtUlaAh0GoHPJC/Ckr4
 Gk/ppkBcGiwZ/+zTeLgtS7sTvYfMr/GdQO9WxibWwoCbFLRhvM8yGMnU5nCz1sUesXpX
 NqNQ==
X-Gm-Message-State: AFqh2kqgxsJZJiAMzAde1AwohjejVNJo8Kc3yj21QIfXFiTrSuwfy30t
 z0F8zPkjfX5SIYQebW53jo6TlQ==
X-Google-Smtp-Source: AMrXdXuLGK6cz3vjaYjvkRoWRKV6NFqOVvNaMPq31LYQxVTXNd1KVP8xmbXe+EXfS42f6xUouxxrEg==
X-Received: by 2002:a5d:5450:0:b0:2be:4c99:1751 with SMTP id
 w16-20020a5d5450000000b002be4c991751mr16394967wrv.69.1674583618150; 
 Tue, 24 Jan 2023 10:06:58 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c4-20020adffb44000000b002bdc19f8e8asm2422687wrs.79.2023.01.24.10.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:06:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E3691FFC3;
 Tue, 24 Jan 2023 18:01:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian-Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v2 13/35] tests/docker: Install flex in debian-tricore-cross
Date: Tue, 24 Jan 2023 18:01:05 +0000
Message-Id: <20230124180127.1881110-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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


