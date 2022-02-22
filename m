Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D92CC4BFFCB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:09:50 +0100 (CET)
Received: from localhost ([::1]:57696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYfd-0005Ng-VV
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:09:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMYcn-0002Cd-0C
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:06:53 -0500
Received: from [2a00:1450:4864:20::32e] (port=43582
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMYck-0005LW-7b
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:06:52 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso2358834wmj.2
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h48RlULXj7TuHzxSWaheQcbjme79UvnxhX69Dmo/Q8Y=;
 b=EOptV1qPgw2fpXiParg7XK/2rgRry+/UfLuoevACOLmlL42/WJ/66LuzW4jQ0gplDd
 h9FO190C/r66bhQH9F0uB98Fg2zFIm4TEFiBBhvtftgmSXD1yJDCZwGfLKTCuav3TcAZ
 0dcsmnsAGEKZsKs/C/Yyt4Q+yWPLh61DbTSsLhKFLZZned2qksbb9GcfF2TBdOTqnwjW
 Tqi3bPbxM6VPLZqy565qOkXbm+tWQheF0xm4ievYuy8qOVhUyToRZnpbQgjbI5+6tDSG
 WG1PybEAIO2QNqk4dzvwS7sBoYhgbl0pNzjF5qTzGtL/2+/tmhHOlIz7aiUvOjSv0Qel
 JL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h48RlULXj7TuHzxSWaheQcbjme79UvnxhX69Dmo/Q8Y=;
 b=Suxre7kLNjhOF6AkWTWVqlyD2iYdHMrMXoHLw5uGGPs3r7mXHh97sXYVjNMMw6vhnY
 FvjpGwLjnsEUBarGO1AehEYlaVlgOlvu5zcjanUowRD+uabPcWICxAWEgOxklH9rCXZj
 AVzlCnUAX0heh2Ae0dvfusrk4WQZKiOkePBjrnoaArT0k/1Y4d/ruYi7A48II+3k38yP
 VhyBCWDN4pfmBnwqlEk7csnBPP9m8c+PFcnhW7sp77siSauxxIIbmYHGBkYUuRPaIEbE
 kfCv9EyjRuXo+E5JMOe9LrPfm4hco3cLAukqaNgdpuP/IqQ/X6X/DeeDMAlrrSD+f6j7
 o9tw==
X-Gm-Message-State: AOAM533J5NGcYXJEqIB3SmIrQg87csKoopsqmwaIsSr6GyUoe5VGJTJ3
 0ptijVGb8vME93yHLPbf4nWME/acbjO7Yw==
X-Google-Smtp-Source: ABdhPJyt3aBewDXD67SIzlSgNxienjBdG3FI4KunNSus8I+80oGLTeoc6IoQsOOEWlL1Y+dbc6IAzA==
X-Received: by 2002:a7b:c455:0:b0:380:a646:eb0e with SMTP id
 l21-20020a7bc455000000b00380a646eb0emr4056178wmi.170.1645549608293; 
 Tue, 22 Feb 2022 09:06:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc44a000000b0037c32873258sm2813113wmi.2.2022.02.22.09.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:06:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] ui/cocoa: updateUIInfo threading, autorelease pools
Date: Tue, 22 Feb 2022 17:06:43 +0000
Message-Id: <20220222170645.860661-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset was originally provoked by Akihiko Odaki noting
that we have some unnecessary creation and deletion of autorelease
pools in the Cocoa UI code. Patch 2 deletes them; but to get there
we need to do a bit of cleanup of the updateUIInfo support,
which wasn't considering threads.

Tested only very lightly.

Peter Maydell (2):
  ui/cocoa.m: Fix updateUIInfo threading issues
  ui/cocoa.m: Remove unnecessary NSAutoreleasePools

 ui/cocoa.m | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

-- 
2.25.1


