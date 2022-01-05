Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE92448541E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:11:21 +0100 (CET)
Received: from localhost ([::1]:48522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n570Z-0007MO-C3
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:11:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56pw-0004XP-KQ
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:22 -0500
Received: from [2a00:1450:4864:20::42a] (port=35342
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56pu-0006Qe-Fz
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:20 -0500
Received: by mail-wr1-x42a.google.com with SMTP id j18so83207418wrd.2
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G5uxx87hFBi0M9mB1agErF/vuJqt02hlQt8Pcz9U1wI=;
 b=PGiL6u9cD/HLMrY4fZhLGC6DhSTB4LCsp71c7C3+KHP4b/0lEeWCSPOYPMi7Dc+2GU
 ZLApvpGT3/tSoFyTfKsVrBPNaSyPwRRZZQDaH1EL7NlOtUZA3KYTOTlFm0Y5xiz+vpSq
 YZlrHMC4I/Ui7gTdKcH+n63LDWqBHYjKcZtxx8ueAxxCKi0+2G/2gIKZzVGPSrgU/pZb
 iA+fuvyh5ZvNtOGogjPAC+ND7MjoszBAkDdsbp2Eg7r6Y2G4q4au3Z4WY9UgWTTuh3t8
 LNVglxrTHx/uCwpoXgXJDLvivBiaRaoYE+ZiAMGArqOhxpzYCTZrbD1nSDY9WXG9lmAt
 k/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G5uxx87hFBi0M9mB1agErF/vuJqt02hlQt8Pcz9U1wI=;
 b=ZU5J2x+icRXtVr6pxLvXosPtNAxAr0wEkXfWHt+hLINh7Vt5SlMVxPjiw1yxGQKbMs
 /QWC8MtTJgXmqYCitdaMXtYLVd+XwGMZJG9fFR+C2GtgDQ9FMf7eiis2/+B7zTg5q5e1
 3EdaqCAcKqdb6U0ObKdY6KC9WWKwnJnnyTGOXUYmQBhovvexPlkITl49aLj7hC16QKGx
 pdmUgeWCF5IyT+kOLi4KePzr2TOR/ocWj4A+ZGgXaYWSZXlvQoNt+OnjK/T9HQMdloOX
 l4+TbhGB3d/IpcLB3Wl4X0iEEKIOQld12YdcHLJgxMi6TK9tz8vTqf9q0aquvpXvM585
 Yp7w==
X-Gm-Message-State: AOAM530u8MH9tWg+Velv81Lgl7dUCorDj6zy3VFNcU/QhuLx2KnBNGal
 Re4pYtPRcA5bTBzR2Ar3DpsRnw==
X-Google-Smtp-Source: ABdhPJwwaaw9rcFo/DTIPB6aAnxzIva05xUHoOvWd7jdVzD4xtqs+pRyjce4h5QIVob3gorzwZy8Rg==
X-Received: by 2002:a05:6000:50b:: with SMTP id
 a11mr15300806wrf.387.1641391215992; 
 Wed, 05 Jan 2022 06:00:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z11sm2933227wmf.9.2022.01.05.06.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 06:00:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 327F31FFD7;
 Wed,  5 Jan 2022 13:50:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 33/34] docker: include bison in debian-tricore-cross
Date: Wed,  5 Jan 2022 13:50:08 +0000
Message-Id: <20220105135009.1584676-34-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Binutils sometimes fail to build if bison is not installed:

  /bin/sh ./ylwrap `test -f arparse.y || echo ./`arparse.y y.tab.c arparse.c y.tab.h arparse.h y.output arparse.output --  -d
  ./ylwrap: 109: ./ylwrap: -d: not found

(the correct invocation of ylwrap would have "bison -d" after the double
dash).  Work around by installing it in the container.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/596
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211221111624.352804-1-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/debian-tricore-cross.docker | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index d8df2c6117..3f6b55562c 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -16,6 +16,7 @@ MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
+       bison \
        bzip2 \
        ca-certificates \
        ccache \
-- 
2.30.2


