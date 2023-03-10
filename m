Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2326B4BD0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 16:58:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paf7q-0006WJ-63; Fri, 10 Mar 2023 10:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paf7l-0006V0-Bo
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 10:57:41 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paf7e-0004Ki-UC
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 10:57:41 -0500
Received: by mail-wr1-x431.google.com with SMTP id l25so5496146wrb.3
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 07:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678463848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yZFLaGxfEPNFoKZlt9a/NACIb4vdUL/ex8BHf3vfMlU=;
 b=NRaOSVr1sc6/pg6KEwR8+UQDB6uUwjmqFOPICP6dQ16aZOY67e8Z1iJQAT+qDRlspy
 dt1yMZ/W2KaTeFOJTxPKpqBz0l+8IYj2WEUDcQBhlDAI9xPAnzBIwa8myBjEVTlyUr07
 mkPo4pszF0xL18Fd2yL+nfZVBul7WIQAAMj4c5C1x/K0wsXXJf89ADtm8Ycwh33/72Cn
 ARkN7XRlydrJj3brn/MOPnCY2/EbfbZZWXZARgS1xJROMR5avS4fXn50lj3En1gB7TLb
 +CDerkDSTHE/U47YWOmBIGHW+oKP+inBjqXr0g1i6vSw6BgHkrgGoWjHjlwuCrEIBX6z
 Zryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678463848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yZFLaGxfEPNFoKZlt9a/NACIb4vdUL/ex8BHf3vfMlU=;
 b=ZyvIOQlQgFLToDY+RhWelOiMjxcA9EVef3sWWka90/ZEsqUloIZP1IBalgEACJOkOz
 5wEEZp2C0HYtA89ZNuVmci5oEqKWt51wbdERijpdN/8nviZ2AABGNviy/kXLruTBpQgx
 JhdOUHL6tTiKmRO5xiWzyaYXOSRZxOxWLhyrSXZmyhdHgAzmGQyrdqspD28vnPOICrPD
 ba0SwysjfYirjRgDVvGlHoc0yrMXuho2ZjItOwNER3XvGbsRWZ2mOtJ4n7BHGl6TqtbR
 28HA0KBhLmQ3D9DBP1jVx+ijgmEXQl1D8f6I+24IG7+4fQSFJTSAftLu+Mv6d6LdckXl
 hybA==
X-Gm-Message-State: AO0yUKUeKJAD0hC+J31UsJHvKc09qy7krwB6xUT2TdcvhRfNnzcyRpdB
 CfkW10fvdc4zrhOuhWtphtKoBIUN5+TtqtWq9p8=
X-Google-Smtp-Source: AK7set8RGcydEbWcjQEQ1W4ACncsDMJcIyVpTV1KHtuImWclBEsvkMOIS3erPVbkDdW1u4G1P5Dhow==
X-Received: by 2002:a5d:66ce:0:b0:2bf:f735:1310 with SMTP id
 k14-20020a5d66ce000000b002bff7351310mr17854643wrw.2.1678463848598; 
 Fri, 10 Mar 2023 07:57:28 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a056000010b00b002c71b4d476asm113432wrx.106.2023.03.10.07.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 07:57:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 06A761FFBB;
 Fri, 10 Mar 2023 15:57:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: [PULL 3/5] contrib/gitdm: add Tsukasa as an individual contributor
Date: Fri, 10 Mar 2023 15:57:24 +0000
Message-Id: <20230310155726.2222233-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310155726.2222233-1-alex.bennee@linaro.org>
References: <20230310155726.2222233-1-alex.bennee@linaro.org>
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

I wasn't sure if you want to be added as an individual contributor or
an academic so please confirm.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Message-Id: <20221219121914.851488-7-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index 53883cc526..e2263a5ee3 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -37,3 +37,4 @@ akihiko.odaki@gmail.com
 paul@nowt.org
 git@xen0n.name
 simon@simonsafar.com
+research_trasio@irq.a4lg.com
-- 
2.39.2


