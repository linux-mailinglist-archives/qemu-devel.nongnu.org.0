Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C323ADD57
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 08:22:09 +0200 (CEST)
Received: from localhost ([::1]:42008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luqqO-0004B7-WD
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 02:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luqoX-0000cM-5b
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 02:20:13 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:46916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luqoU-0002HH-C8
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 02:20:12 -0400
Received: by mail-pg1-x530.google.com with SMTP id n12so2661057pgs.13
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 23:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ibe+o1PKC4rWs5E2MU303jvReSMM3Q3wORKGtiNqY04=;
 b=j9X5fRCeGA4jHT+PzWToR0Nh1I6Ttot2xPHQKxHY/hjmUuY+YZZ/ih4LpRld4GtUlY
 Wns/TkKWOZ8U+XKskoVYlrnuAWaBa4nUHmeKTWIQq24q/EsY+irl21A2jfoyM0t5T1lu
 lvjHaPLMbDjbJmyvg+cXXDBL011DVPsMunS5qP/YZas1WvtAfntP5iEoyI9xsKscnFf7
 4vRNTsRzj4RiNeukS1adQx6dxpaTXWUXK7+/IFYqhxPk5GVb44mT7dlOV7hCcBvrYK2p
 EDcd7rlqD7mHTZXCTHKX/yaDxhdbn3iPdNgZ3+tSS2FbsMRSlFJz8Xcc8qA697XGtLI0
 zZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ibe+o1PKC4rWs5E2MU303jvReSMM3Q3wORKGtiNqY04=;
 b=sPVesgZDnsWLl7nVSwhRyAMCh8v9e/BzVoc3GWHXO+3fUO6h5RMhaM53WD5k3ab59Y
 y+nHN1zwZjq95MV7qiu63yoNvH0fPkn1JznQdHGlaQkAcPyoU0G8cF8+z5UIy0/uTKbs
 KFGdIt5/8t5s6v2hglKDuTtsHfnjbXDBEC/5hzsRlhXKfx6HuJJm/3RcwbIKM1QLPfjc
 SP1MKqciG3ZtFpqo4tb+KdYiQUqyJDSHqbhIsciqTh4WnZdErqs3vfriu6Ad0mU4QoNB
 pCjJPCdT3gIs2i/9/Pz2msEvO9qEbBLku8djg31ByMO/yG2dElwi/8eh2tErhItqurXo
 9Kig==
X-Gm-Message-State: AOAM53343OdcjLdiWErhVIcSkwHC/jNiQQR+zt71xjyOvjAzlcQHYPGu
 PGcpaCVddM1iL470OSCL/C3StYdq+jy4sA==
X-Google-Smtp-Source: ABdhPJzeECdUveeShHTYA5qbMWOCNlfohNa/8qfJ41dcjJNANj0atIp1SZMZs8RW7+k3lXXM4jGRZA==
X-Received: by 2002:a63:1b0c:: with SMTP id b12mr18127528pgb.334.1624170008831; 
 Sat, 19 Jun 2021 23:20:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s123sm11607661pfb.78.2021.06.19.23.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 23:20:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/avr: Convert to TranslatorOps
Date: Sat, 19 Jun 2021 23:20:04 -0700
Message-Id: <20210620062007.1398574-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: mrolnik@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've reached a point where *all* targets must use the translator loop.  
Do that.

r~

Richard Henderson (3):
  target/avr: Add DisasContextBase to DisasContext
  target/avr: Change ctx to DisasContext* in gen_intermediate_code
  target/avr: Convert to TranslatorOps

 target/avr/translate.c | 288 ++++++++++++++++++++++-------------------
 1 file changed, 158 insertions(+), 130 deletions(-)

-- 
2.25.1


