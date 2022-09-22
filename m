Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BD65E6977
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:18:15 +0200 (CEST)
Received: from localhost ([::1]:50798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPq1-0006em-SK
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBL-0002GI-FE
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:14 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBB-0005TD-Uo
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:08 -0400
Received: by mail-wr1-x42d.google.com with SMTP id n12so16405411wrx.9
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=V+573S55AipTOAMAMMsIfcmoZJ0maiQeMsyNXIQuG+w=;
 b=WWj59uYvN2dNie+l5waxl37IkA4r6yBWqErmSCb0KRzV56Lg7geYoGpHWIbwGTErGo
 zWG5okIaZsTVkjT6OHTZK9WTt+y0zxksyTyhD2nxp1ZviuaLfrf+pxjQUg0A2Hr/fVKK
 /J0QNPIsroPkf0TVfsZmdnITDbratA1mXzB9T99/kCFjynzF+31AfyONxqgb2aJfhpDV
 hD5f8EmqOMwoP1R3nmvpuCn2V697i5DUOkktg0SRbO/aZR0D/pq7JgpGLZXiKEHYlL8Q
 AkIZmnJemQgdfhBYcbezDvtO/9wRGmA1CSw+vr8lTUZwGUCANY7j5mZl4KATkGw2xIuJ
 9KEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=V+573S55AipTOAMAMMsIfcmoZJ0maiQeMsyNXIQuG+w=;
 b=SDsmTzvskULx5jgU6gqEEtkUwjciFfjmTn5dO46LwMyzv7Rrd07oUE8jXYQVg0HLuG
 i5kFEYfoz9DibTbx7KNGAPzy3M6vUheCL7rhtSYtYmXd23he51/EzE6LByYBWzsJIqua
 lMyIjIg6cZxKSUEB29jJFwxSzvl7kTXEkndBLEEKnptLnO7fP40B8NP3FQvHFWO1BTqA
 Ao3j0+pUC6JdYvPjNZ+ZMvEm8WYMtlGpCAW1C+cclaQZ2Wiex1log9na1hHABmtpfxnS
 iDD9llnAGFntffZ00M4QN1dOtpb+n9MO+Hf/YeKyY1FVx4mRoNUTlfsKtJbBt+ooakVT
 boOw==
X-Gm-Message-State: ACrzQf2VTTo1VCCZDPpzHiieynS1MkbKWLE3AX7Oow+pcfEavlgbxIxc
 KfNzChhHTJbj4Di/KyOXC98ZC0qLhb2/8Q==
X-Google-Smtp-Source: AMsMyM5MspWAmHVGSa7qlgVHBSIwYMMapGfiS8cxb68TVYVdG4G/68Z+c3BadTV7MxmcmVuUtMREZg==
X-Received: by 2002:a5d:47c5:0:b0:22a:6c7a:10f3 with SMTP id
 o5-20020a5d47c5000000b0022a6c7a10f3mr2514204wrc.523.1663864560068; 
 Thu, 22 Sep 2022 09:36:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/39] configure: Remove unused meson_args variable
Date: Thu, 22 Sep 2022 17:35:31 +0100
Message-Id: <20220922163536.1096175-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The meson_args variable was added in commit 3b4da13293482134b, but
was not used in that commit and isn't used today.  Delete the
unnecessary assignment.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220825150703.4074125-3-peter.maydell@linaro.org
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index b5ace4cb49e..e42d43d6a50 100755
--- a/configure
+++ b/configure
@@ -311,7 +311,6 @@ pie=""
 coroutine=""
 plugins="$default_feature"
 meson=""
-meson_args=""
 ninja=""
 bindir="bin"
 skip_meson=no
-- 
2.25.1


