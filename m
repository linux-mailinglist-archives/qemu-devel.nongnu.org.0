Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 050D06B4BD1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 16:58:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paf8R-0006nF-3u; Fri, 10 Mar 2023 10:58:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paf7m-0006W8-IF
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 10:57:43 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paf7e-0004Ky-UU
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 10:57:42 -0500
Received: by mail-wr1-x433.google.com with SMTP id g3so5492983wri.6
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 07:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678463849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6zDiFwGW/DvDHEIOg1D7Fm+5qEAPxrmz3h1kHYEyo1w=;
 b=KECn2jCru3lB/4/rd5z/uqq5DfCaUUO3k324s+1v+YfDliFsecxKnhgM9EqDv/btBa
 mbh0piS5sbzxwZiOHB1JE0jaVxLAW0pPGMmRsf//kZYBMwMtcYcFb7o2IkKk3Z1Uy3mj
 tPOsCgg3K1weBu+DJlXvrmK0XjeS+f4XFlKtSLF/8rERrA30kfwaiZAvPKxv2COlPVjP
 1ydbPKFDEabRW2558OX2HsTzYy59aKdgadssg34pcc8ikbwajEo6DDQFSZJg9mgj6Ghh
 DWAg8sujvuot/J7XT4pWr/r+Oy5hRSV2tWWD4y9QSuya1ajC840QENVV5L+cAd6hJ9oP
 BL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678463849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6zDiFwGW/DvDHEIOg1D7Fm+5qEAPxrmz3h1kHYEyo1w=;
 b=G2YtdvrX4xj5gkbiUsV2P6gyTU5z2xzBQN127UmqprsDDxEKtdGfs7+UNC2ia6Tzgq
 s20ZFOd0g6T4gxafHowZapBvXa6VhZ4vsBa8fhxoaYBJ8EU9t6uOQrrLuvRPGfZvFPHf
 z2hvR679l82GaYdCP25kkKd5zEej1uYuQPU4N5Cpz97eTSN6MyIulVdnMpKMXLHu0ZKH
 2OjmoqF9TqOrxo6Z+hl+gL/kcWB+ZybfTQdi6NV2Se6Ua1nte8+SvrNGPcsqbwSHI9fw
 j+AfiLzGQhjj9afpwGR9dXVnuCa34vxn/OW/RP08BTcMPJmD4VMSU5VDV+0Yw76MPONW
 hRNA==
X-Gm-Message-State: AO0yUKVotPqy2s/Gg15woUS3WSzo2lbwS6JGntlhY5QP5wojX42j7qLW
 1HzOhL5I/TI6vHVUXFCJxfQQUw==
X-Google-Smtp-Source: AK7set82DogwlODBlIcjD6W1qbsAlog18JvKB1wHKTJfu771zin4bhgpqDNHmbRTVWjMBZN6dnzwMQ==
X-Received: by 2002:adf:f612:0:b0:2bf:96ae:7cc8 with SMTP id
 t18-20020adff612000000b002bf96ae7cc8mr17271605wrp.4.1678463849141; 
 Fri, 10 Mar 2023 07:57:29 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h5-20020adff185000000b002c8476dde7asm96774wro.114.2023.03.10.07.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 07:57:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 388661FFBD;
 Fri, 10 Mar 2023 15:57:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PULL 5/5] contrib/gitdm: add Idan to IBM's group map
Date: Fri, 10 Mar 2023 15:57:26 +0000
Message-Id: <20230310155726.2222233-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310155726.2222233-1-alex.bennee@linaro.org>
References: <20230310155726.2222233-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

According to LinkedIn Idan works at IBM. Please confirm if you want
these contributions counted under IBM or as personal contributions.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Idan Horowitz <idan.horowitz@gmail.com>
Message-Id: <20221219121914.851488-11-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/group-map-ibm b/contrib/gitdm/group-map-ibm
index da62fa3f44..24d8dc1b86 100644
--- a/contrib/gitdm/group-map-ibm
+++ b/contrib/gitdm/group-map-ibm
@@ -12,3 +12,4 @@ jcfaracco@gmail.com
 joel@jms.id.au
 sjitindarsingh@gmail.com
 tommusta@gmail.com
+idan.horowitz@gmail.com
-- 
2.39.2


