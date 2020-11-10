Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35A92AD567
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:37:12 +0100 (CET)
Received: from localhost ([::1]:44118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRxX-0006mx-U4
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgX-0002DS-V7
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:37 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:34517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgV-0006rB-Kx
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:37 -0500
Received: by mail-wm1-x32e.google.com with SMTP id 23so1786499wmg.1
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BrLyYJDU5XDe47dExt9STY1Tj40m+eSWvhd62k1qW3w=;
 b=K5mSNbKxHFbpTnH10scoVkfQXuMPXyEj2aRliCGCxVW0bbQ86gMT2pBZXUkCk9v9Za
 UFRp/WBl7HNFnXx9VHOHqg2ICrr3EV+DuupVMLHs8GVRyPR/P1tfBlEVYM9RrV5LL2vW
 1EfwYRIB34lJ36z5XTpVC666JuwlYBlAFzg59UBPyBd92pWqdLG9ndGaSa1dCQK4Sshu
 dd+wQz2maKw71YO8e6xv51/Mf0tC6v6/nq4CEcsfH5uV7LlbhyRxT0z8RPFRMuRqVm/H
 qvJ35V5pyqawwNc6zvifBwf27xS38GcTJ8zs9cM6lGmeqTps6phho/+bfNpET6QdIMFR
 NiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BrLyYJDU5XDe47dExt9STY1Tj40m+eSWvhd62k1qW3w=;
 b=d2Y0WF/eAF+Cf2c6msV/hk1P5qwxfUBeoWq7DQ/5UNiuvVCS13nbsTGGD32UgPpffc
 OZoxgRB+gbYLrpZovBflbgVYbX4nZm/jmqTMm+j6N29sxYRKvZqMYr15hlR9WNcEXBRV
 Ehal8FEOC4HXqOsDYlm+yK1S/hBu8yS8yTbWb66kaWXmp/jeyH60y/9RRiCplH/6DZoO
 OhCMNVqFMD4NNTuBtLdFN2Y1DM74kpgeM2loqIVi2ZFtIwotvKbnEV9Vq4b8y16r4NdP
 KsiUHKGLMQwhiiYyGLWM3aeoTj/9eaLoqsyUw46FQYvY+5nL4nMF5L3HqYFeuQ2iOhob
 EDaQ==
X-Gm-Message-State: AOAM532TCfPPthLBOAZX4kuS0kD5YFbPH/Eugbabe2tu2tNDmEZkQoXr
 6lC6ZQXy9An8wGv6HmnOhJNK/I7Ze0UvvA==
X-Google-Smtp-Source: ABdhPJyVuYlvAatfqZ2uRpC5SsKq9u3h91nk5ah6MGfoh/O5RKZbnBFnBlfN5EYVEQ3RPF/PbJNSBg==
X-Received: by 2002:a1c:ed0b:: with SMTP id l11mr4088407wmh.46.1605007170690; 
 Tue, 10 Nov 2020 03:19:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 109sm16909498wra.29.2020.11.10.03.19.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 03:19:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/16] hw/arm/armsse: Correct expansion MPC interrupt lines
Date: Tue, 10 Nov 2020 11:19:10 +0000
Message-Id: <20201110111917.29539-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110111917.29539-1-peter.maydell@linaro.org>
References: <20201110111917.29539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We can use one MPC per SRAM bank, but we currently only wire the
IRQ from the first expansion MPC to the IRQ splitter. Fix that.

Fixes: bb75e16d5e6 ("hw/arm/iotkit: Wire up MPC interrupt lines")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201107193403.436146-2-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armsse.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index a93da37dcbb..baac027659d 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -1074,7 +1074,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                                         qdev_get_gpio_in(dev_splitter, 0));
             qdev_connect_gpio_out(dev_splitter, 0,
                                   qdev_get_gpio_in_named(dev_secctl,
-                                                         "mpc_status", 0));
+                                                         "mpc_status",
+                                                         i - IOTS_NUM_EXP_MPC));
         }
 
         qdev_connect_gpio_out(dev_splitter, 1,
-- 
2.20.1


