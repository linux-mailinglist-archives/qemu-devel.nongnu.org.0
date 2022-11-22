Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B373763392E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:57:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQ0p-0002Kz-MJ; Tue, 22 Nov 2022 04:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0n-0002I7-Fr
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:17 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0l-0003nf-Nx
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:17 -0500
Received: by mail-wr1-x429.google.com with SMTP id i12so20010103wrb.0
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 01:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nKxwOIrXZEHyPecLBXJSR5FqRq//VNLD9ZuG0G6fm6M=;
 b=n+Jq6/XuhBjvLA6RtXBgDl4IsvQAMGV3j+1RYzlXQ8+J4l8WR4rKvqi0LV9RAYiT0l
 q7erT+hNknUxvSAlCrJ8DZJtj1EGS1k61XDicPpZH7ifnyWVyROVWMixjN9GHPecHxnt
 MReTemZIBiduK7gCiKBZzM7xZkBqORamkO8it3XOjfRoURIQv8UQpzUiy6at51fL0w94
 nbQQBEsdYISdmH1mZ4NxLZaKYh+7J3SEHXTI/1hcn8KOcb5ZWbxBw31/rEEESkFPqQwp
 iq4rjj3o14B/mRntvt9iWP7X1/HPRJlsPEuH55oroiehBo+4RS+du9O0CNmaQjpSKIgW
 uPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nKxwOIrXZEHyPecLBXJSR5FqRq//VNLD9ZuG0G6fm6M=;
 b=IcXKmkDmJMEY00fC9GCre2M7m8cmFBKDMnFFGPtoG3LD/LL0pXiERx86454Z72k0Uu
 SWnlKyfOcmXpo1hpvxRerv6n3HiJH6cgZervIubv1dNPX5oOsEmaMQPH5pwpAkwQzs6E
 HkvyB92T/abq2kbc8FDC7gowDEbKmY8iDqdwmvyZLp7D6Uum4rZwTHZXFnc3Q+qA4WZU
 FEAPHmXi7879HIFatp47SmHW1800CSmQ0YIUXgPcfEPGrcYeO0DJ+R3RAgbwLT97D3Vm
 X6WdmKIqNqQ4B+BdFZXhRHQT5LB8GYPHmn1Jnu87UIQmq1wfGduUP5B6H8lj1AHpNves
 KU+A==
X-Gm-Message-State: ANoB5pm4yQd0E2wAxqP82kjTW3VS/5dx/3gacKI/nJAMLhnKflis1hZW
 Ah9Ju+5wToebXTQOAAHPkRhavH/KnoWPWQ==
X-Google-Smtp-Source: AA0mqf61HLedf6i8g+iaUSYprcNP8x0p1ceF88KojfIlDY1nloneeSkkOquN1R8RfkCOXRUHCRIGOA==
X-Received: by 2002:a5d:5709:0:b0:241:d71c:5dde with SMTP id
 a9-20020a5d5709000000b00241d71c5ddemr5385017wrv.678.1669110974285; 
 Tue, 22 Nov 2022 01:56:14 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e18-20020adfdbd2000000b0022da3977ec5sm13530129wrj.113.2022.11.22.01.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 01:56:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 10F2F1FFBD;
 Tue, 22 Nov 2022 09:56:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 05/11] docs/devel: make language a little less code centric
Date: Tue, 22 Nov 2022 09:56:04 +0000
Message-Id: <20221122095610.3343175-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122095610.3343175-1-alex.bennee@linaro.org>
References: <20221122095610.3343175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

We welcome all sorts of patches.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221117172532.538149-6-alex.bennee@linaro.org>

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index fec33ce148..1319dfd3c2 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -3,11 +3,11 @@
 Submitting a Patch
 ==================
 
-QEMU welcomes contributions of code (either fixing bugs or adding new
-functionality). However, we get a lot of patches, and so we have some
-guidelines about submitting patches. If you follow these, you'll help
-make our task of code review easier and your patch is likely to be
-committed faster.
+QEMU welcomes contributions to fix bugs, add functionality or improve
+the documentation. However, we get a lot of patches, and so we have
+some guidelines about submitting them. If you follow these, you'll
+help make our task of contribution review easier and your change is
+likely to be accepted and committed faster.
 
 This page seems very long, so if you are only trying to post a quick
 one-shot fix, the bare minimum we ask is that:
-- 
2.34.1


