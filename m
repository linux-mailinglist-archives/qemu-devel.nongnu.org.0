Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFE85F4529
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:08:32 +0200 (CEST)
Received: from localhost ([::1]:42176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofib1-0006b1-7L
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhqB-0001Ls-RX
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:08 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq3-0001q6-8c
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:07 -0400
Received: by mail-wm1-x331.google.com with SMTP id e18so8862276wmq.3
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=zUf9fzZkXh5cu60bmTDrP95OL++X52bXG+2ep3dVX1g=;
 b=kqFeYsxwWp7YQ+mxxRu7iMJHrEzNBNfbwWYi4toTQEZbI1kbx0wIrTWld6PHJ3WJ+i
 PBeRcuy3GS/X2PitXisI2oEvs+21F0GraCDwFg5JESs/RAH5ZXCFtK4trdT0UCObUR86
 OAaaieP9M7xjQpTPPiaE1Y5PO+fgwiqSNwPk35olhUtzOaQ+Ysl5MKXpvKZQfpPiVdE2
 GbTkTQXttvhI7Eb/XsvBnImP5o22Ouf7cZ2AAYH1E2JbCfGo9uKzfGoBYosKXIePBxdo
 OZf84pmxVUWp4ZZms+rRcXf/NEhqFIW1F1vTAFGtomIcfmKukNDZz61VkbliMno52t0h
 A11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zUf9fzZkXh5cu60bmTDrP95OL++X52bXG+2ep3dVX1g=;
 b=e2MXls8fMQ1OfugvKSqj3xkZrZJdOoNs4KAt5zOP4/gZaUZB0CYSSR8+JYTvsPRC+5
 iLjga/MgPnMPHdARLnOIi8VJDXI6Wg8C9hXkOWyZH697SkUjg4Ysp01nd+UJ2XBSbzi1
 eg7BBGS9LcGuzJvZECsoSFJUSo6HC2skCuxcm02X6v+fCbw9g5VROY2LB81/wuNU3L0O
 j8RMlSK6rq6i3kY1liQT19xifTS8FKT2ICfTVf5h4fR0Vv116GmspVKmAToM5b3YMNJR
 mSg4AHUY8Ocm+OQ38wrD0HhwuUJ0OXfnv5kx997afS6pB8R+tDOzLLzlkZoeVnsXtia7
 V+2A==
X-Gm-Message-State: ACrzQf0HLyb8th7v9iCQJILmTiC3zXduwclBPYQgpXzjh8F1hDEwRIKo
 yePVEtZ0/uXTayhb35Z0XX+3YQ==
X-Google-Smtp-Source: AMsMyM6UWjd6QIuQvwfZtywlydlwWVqnYkSsy40YAdsqmHZHQu3WOBua8tL0DdT33xcRWuTfG+YUFA==
X-Received: by 2002:a05:600c:1d28:b0:3b4:91f4:897d with SMTP id
 l40-20020a05600c1d2800b003b491f4897dmr10147910wms.137.1664889598114; 
 Tue, 04 Oct 2022 06:19:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m38-20020a05600c3b2600b003b4ff30e566sm4133411wms.3.2022.10.04.06.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:19:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E072E1FFE2;
 Tue,  4 Oct 2022 14:01:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Brook <paul@nowt.org>
Subject: [PULL 48/54] contrib/gitdm: add Paul to individual contributors
Date: Tue,  4 Oct 2022 14:01:32 +0100
Message-Id: <20221004130138.2299307-49-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

Also map his old codesourcery address to his canonical address.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paul Brook <paul@nowt.org>
Message-Id: <20220929114231.583801-49-alex.bennee@linaro.org>

diff --git a/.mailmap b/.mailmap
index 8c326709cf..1f7319b70b 100644
--- a/.mailmap
+++ b/.mailmap
@@ -65,6 +65,7 @@ James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
 Leif Lindholm <quic_llindhol@quicinc.com> <leif.lindholm@linaro.org>
 Leif Lindholm <quic_llindhol@quicinc.com> <leif@nuviainc.com>
 Radoslaw Biernacki <rad@semihalf.com> <radoslaw.biernacki@linaro.org>
+Paul Brook <paul@nowt.org> <paul@codesourcery.com>
 Paul Burton <paulburton@kernel.org> <paul.burton@mips.com>
 Paul Burton <paulburton@kernel.org> <paul.burton@imgtec.com>
 Paul Burton <paulburton@kernel.org> <paul@archlinuxmips.org>
diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index f816aa8770..6322b3476d 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -34,3 +34,4 @@ bmeng.cn@gmail.com
 liq3ea@gmail.com
 chetan4windows@gmail.com
 akihiko.odaki@gmail.com
+paul@nowt.org
-- 
2.34.1


