Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFD24E9B1D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 17:30:03 +0200 (CEST)
Received: from localhost ([::1]:52518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYrJi-0005Ex-IS
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 11:30:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nYrGC-0001Bg-Gv
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 11:26:24 -0400
Received: from [2a00:1450:4864:20::62e] (port=36633
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nYrG9-0001Zu-VH
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 11:26:23 -0400
Received: by mail-ej1-x62e.google.com with SMTP id bi12so29493714ejb.3
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 08:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ahHU9On8DzVOYZ7q/706KzuyPiyN3/14fDMqpopPWhs=;
 b=XTuJ2+dHuw/bfSygdAqS4oigDvIWamXys7VkKopZ+BBYAwKZ4pMoN11tdu+egZZrCe
 PNFWPMRI02DZ855FE8NzCD6XsHXO+eT2aP0WGrpOf9JSRkM8qr6/CvM/jCdaA/edVEQh
 JD34hz03+nS4XTn8FZ84tZIIYYlURIVFqAQLTOgMRr1XiOeSG5vnitXoPQuULy5vWQOk
 wV5S7Xi/Ypw0GnRh5r+Xm+W/Whvg/+rbJHON6NQHOa/YmvPy80S6VAwqSj60MUnZakqV
 fteua8rEZzW+lf4TQMfKxwhMfBEbpSS0Qdu2r5o0CsZk8/cpmmgV8igWUgYkeBzCIrbX
 1p2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ahHU9On8DzVOYZ7q/706KzuyPiyN3/14fDMqpopPWhs=;
 b=C8Jvj2kxpmiF6eVp+RiU6BD7Rl+FdPbhVCj8EBb60OAxRU8fRoYius5OUDda7VzhGs
 +Tdk91NgXF7LqIoYApmlvZSLQoKs2mSC0KhlXNsG9z2yKD2rYvINJBt1ND+EhnmE4dS3
 tnuLRXxklrnmudRYnf3CDQzSyLIUndRnJP8uC0ZQpZcBvd1SNqMc28WbjWfujPDpnM4n
 ibYzbHPw+jcW1OKJgCj15Sfb5uU/D6/vxA+x3UPu+o3EBcCxKxyzJfsJxHs0b3RhY+Bc
 1LIf3j8KCQ2DXYLN2gYCpT3u7cp/oPdZEnlW4rmBYV34+J5wc/wWQUJBEzLW7MfivmsX
 QwSA==
X-Gm-Message-State: AOAM5328JqVpQUmcdXcHi9QI0ejga2qcjSlbmZhcTghG+QC7HUeKfxI4
 5un7/EuoBh4SE8PKeO2BeMxAwA==
X-Google-Smtp-Source: ABdhPJyeX3fEorrRQSa4MoQA95xR+rzrMrkkxmAh4gwG56bVtEL2O8nCFzoRmURuSGIZl0AMZPuOQg==
X-Received: by 2002:a17:906:fd7:b0:6d6:e276:e6a5 with SMTP id
 c23-20020a1709060fd700b006d6e276e6a5mr27972389ejk.545.1648481180123; 
 Mon, 28 Mar 2022 08:26:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a056402431400b00419315cc3e2sm7230771edc.61.2022.03.28.08.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 08:26:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7D0951FFB7;
 Mon, 28 Mar 2022 16:26:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/2] some tests and plugin tweaks for SVE
Date: Mon, 28 Mar 2022 16:26:12 +0100
Message-Id: <20220328152614.2452259-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: aaron@os.amperecomputing.com, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



This is a quick pair of patches to help test fixes to the
instrumentation of SVE binaries and their interaction with TCG
plugins. It certainly shows the instrumentation isn't currently
working. Userspace code can trace the sha512-vector builds.

Alex Bennée (2):
  tests/tcg: add memory-sve test for aarch64
  plugins: extend execlog to filter matches

 docs/devel/tcg-plugins.rst                |  9 ++-
 contrib/plugins/execlog.c                 | 96 +++++++++++++++++++----
 tests/tcg/aarch64/Makefile.softmmu-target |  7 ++
 tests/tcg/aarch64/system/boot.S           |  3 +-
 4 files changed, 99 insertions(+), 16 deletions(-)

-- 
2.30.2


