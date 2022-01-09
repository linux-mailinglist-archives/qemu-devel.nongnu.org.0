Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F95488B00
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 18:24:19 +0100 (CET)
Received: from localhost ([::1]:34908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bvW-0001As-9k
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 12:24:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6be6-0005gT-O3; Sun, 09 Jan 2022 12:06:19 -0500
Received: from [2a00:1450:4864:20::32e] (port=36813
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6be4-0005RP-UC; Sun, 09 Jan 2022 12:06:18 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so8379842wmk.1; 
 Sun, 09 Jan 2022 09:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=POy3QGdwSitDjxf6uMt9f7B5riWSIPUKi3jXHHaFfA4=;
 b=nF7RfhefHGAfvtLOTq7xOVsfSsnsH/WZzxgYZiHPtvxnZcnMt6cj3DmDH+hiKf1sQ8
 lPzLCYSpbJKMVzg9uAG7esCVxhnSQy3jySa9fai9s3yeSQag7cgbkJENxJbVj0nR2cj6
 A9D35HPYGx0zObWXiwg0n6IzenuaaQqYKrLlJIVMzk2ZjJH2FJjNGlAr+W3StCS9LrRy
 2bIElUCg5MtGUa7hUQlrghwGRqolgUfhcxoodFHcWMzivwDQ2z94Wq6GwELft3ewxumN
 V6Z1zG/ONb8kGaH+ut6JP9RjpoS+LD/yyN0/5kWADa/JYLOQbGYL2Z5r18sJpH/ucSNe
 M/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=POy3QGdwSitDjxf6uMt9f7B5riWSIPUKi3jXHHaFfA4=;
 b=Nf9lmFY0eC4kVHAwBk/tuvw5QUzn3gHqSRQdAPe47YODdEGiZXE8SpTXd9BbnJ+WYM
 rWzGcKuwMIABOV/5MzrqSoDmkwxyZk7l9CNgI+RaVRvVORBSnyssLVW51XmsWtXsGHU7
 IFIZSCJnHp0mEWmL+TxrqyYoNWGRjGV+LrJVY367aHc3j2O6kincD6aCOQ0t+nx/z+rS
 hDYJZPKKNp93C8rpHmK8J9lNgWVg6Plkkea2kZ1r185gdmG/25ZfLgXN+gnB4zsit62m
 cbkX/TvtbDV+2pW6qUgBElg3NdUsPCG0ogEi6j3H408jFwylSLQCeV12jEviYNSx5y0H
 aX8A==
X-Gm-Message-State: AOAM533MsIo7raLt5emr322x+5/8MgpTwhlEE30rF+c0qyFmXglRjDmY
 HqbFMsB4tHMBGCA/Ce4iEanpfgZJ3Lw5mA==
X-Google-Smtp-Source: ABdhPJwOuVH5aeHia0bUtnltObCEbFxKO27rt0eCIfQWEczNcEyVQ3K57t5/kYHyOQX+J/uqaV6tKw==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr18660454wmc.58.1641747974502; 
 Sun, 09 Jan 2022 09:06:14 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id g9sm4814321wmq.22.2022.01.09.09.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 09:06:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 0/6] host: Support macOS 12
Date: Sun,  9 Jan 2022 18:06:06 +0100
Message-Id: <20220109170612.574104-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Few patches to be able to build QEMU on macOS 12 (Monterey).=0D
=0D
This basically consists of adapting deprecated APIs. I am not=0D
sure about these APIs, so tagging as RFC.=0D
=0D
I couldn't succeed to adapt the Cocoa code.=0D
=0D
CI job added to avoid bitrotting (ignoring the Objective C=0D
deprecation warning).=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  configure: Allow passing extra Objective C compiler flags=0D
  audio/coreaudio: Remove a deprecation warning on macOS 12=0D
  block/file-posix: Remove a deprecation warning on macOS 12=0D
  hvf: Make hvf_get_segments() / hvf_put_segments() local=0D
  hvf: Remove deprecated hv_vcpu_flush() calls=0D
  gitlab-ci: Support macOS 12 via cirrus-run=0D
=0D
 configure                         |  8 ++++++++=0D
 meson.build                       |  5 +++++=0D
 target/i386/hvf/vmx.h             |  2 --=0D
 target/i386/hvf/x86hvf.h          |  2 --=0D
 audio/coreaudio.c                 | 16 ++++++++++------=0D
 block/file-posix.c                | 13 +++++++++----=0D
 target/i386/hvf/x86_task.c        |  1 -=0D
 target/i386/hvf/x86hvf.c          |  6 ++----=0D
 .gitlab-ci.d/cirrus.yml           | 16 ++++++++++++++++=0D
 .gitlab-ci.d/cirrus/macos-12.vars | 16 ++++++++++++++++=0D
 10 files changed, 66 insertions(+), 19 deletions(-)=0D
 create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars=0D
=0D
-- =0D
2.33.1=0D
=0D

