Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53E567A0DF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:08:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNi6-0005qd-Uu; Tue, 24 Jan 2023 13:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhI-00052P-Ff
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:04 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhF-00074K-5e
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:04 -0500
Received: by mail-wm1-x32f.google.com with SMTP id l8so12108022wms.3
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mzqjNebPlVWu0Pe1KPnh5yDsbQ+XscM6WFAjbvgpy9c=;
 b=SzpgbFSUul4UUPEBEbez2X4BrI+N0mmWlz5XXEm+yW5aSAm82JCGKb6rlxwQ/75KF+
 Fua3mSQAqIFAUGds4iLP0xT04n71zlCLcEuj7hP17sGhrdJ3W5dfbBn3z2+IDcIzqrxe
 xDQjLtrmxEz8v9gxNPAY3BlR5pgDxQkBjsPdn6uKOZbjcCD8VEpcXRG9VHEtcHPGAPu6
 kFf2pHAV1STXks32tI4ERKcBmTKTIqk9/KfZ7XHPrcKDSOZkLZ5J59zcttAhLPl1UJF8
 5ZyQ2AD6/NPgc7JljpBzPXu/sB/LH6a+1bbcz98KhPI0iFICUfNXswt41389YJJOS1UY
 Kjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mzqjNebPlVWu0Pe1KPnh5yDsbQ+XscM6WFAjbvgpy9c=;
 b=AIgekbqH/WL0Z8XbJv1pQj3VgIoSo2vvK/YjAXC6Xq+C9PNZdkyRNNBJZ3h51kPUxj
 VB89+JqcJ1RvDqylpPZtBs3oozqFH4pCfergiHxMMpxL77mkCtErnOVRbgXI6rjkOtK5
 2zKptUTpbweukhGQIMfsyfnsq5znebYpwO43H4u5AMaE/C89dImNDdGCwXYma6KgsZZi
 ivdhv9JAxSGik+KuffnZbymRABWJ3ZUPqlJTNH4eEEUUfDFBHIiqmCTE28lknvg0m94j
 56Dj6SLIWG09H6ZyBVETsS5ELMRg2uQdK5jw5Fy/0LkHFKkxZDqTP/UWqsiTuM5Er8oz
 YV+Q==
X-Gm-Message-State: AFqh2kpeIis/07hgi57brfGstYNkQK20MnEWRJSbCYpDYrfk5Fk566VR
 gpGMyZ9eO3DiKx+p9AxHn0L/Iw==
X-Google-Smtp-Source: AMrXdXtVcECke9cNXvmVyggHymIf3df/IHrzD80XUg+vWvJSHYbtO4k+FGkhvz8ZAzEkwuskvCpJVw==
X-Received: by 2002:a1c:4c04:0:b0:3d9:f0d8:708c with SMTP id
 z4-20020a1c4c04000000b003d9f0d8708cmr36891318wmf.26.1674583619626; 
 Tue, 24 Jan 2023 10:06:59 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o24-20020a05600c511800b003d9de0c39fasm19331828wms.36.2023.01.24.10.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:06:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DA12B1FFC8;
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
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 18/35] MAINTAINERS: Fix the entry for tests/tcg/nios2
Date: Tue, 24 Jan 2023 18:01:10 +0000
Message-Id: <20230124180127.1881110-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Thomas Huth <thuth@redhat.com>

tests/tcg/nios2/Makefile.target has accidentally been added
to the Microblaze section. Move it into the correct nios2
section instead - and while we're at it, it should also cover
the whole folder, and not only the Makefile.

Fixes: 67f80eb4d0 ("tests/tcg: enable debian-nios2-cross for test building")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230119130326.2030297-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c581c11a64..629ab5bbb1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -240,7 +240,6 @@ F: target/microblaze/
 F: hw/microblaze/
 F: disas/microblaze.c
 F: tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
-F: tests/tcg/nios2/Makefile.target
 
 MIPS TCG CPUs
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
@@ -262,6 +261,7 @@ F: hw/nios2/
 F: disas/nios2.c
 F: configs/devices/nios2-softmmu/default.mak
 F: tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
+F: tests/tcg/nios2/
 
 OpenRISC TCG CPUs
 M: Stafford Horne <shorne@gmail.com>
-- 
2.34.1


