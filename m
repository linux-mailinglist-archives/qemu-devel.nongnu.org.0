Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C082306DC7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 07:47:40 +0100 (CET)
Received: from localhost ([::1]:38324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l515f-0002XY-1V
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 01:47:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l511b-0000ty-BW; Thu, 28 Jan 2021 01:43:29 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l511X-00054c-6K; Thu, 28 Jan 2021 01:43:27 -0500
Received: by mail-pj1-x1035.google.com with SMTP id l18so3701881pji.3;
 Wed, 27 Jan 2021 22:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tzlSB8RptGMbFL1ldDE2HK28AgnehYV0J78KA757CyM=;
 b=BDCd7tjVRuwu8CC43x8kFQ1T9ilFOCBfFj19wVTvUuJfZoqvWTjuOZb7SyFy44VtWO
 RXTXsJoKQRf/+0+5J7XhkPIJr+PUXP7uypK3nSO+E5KQFZE95FybA1e8TSus2KtIGGTP
 B1gzmjmYehU4lF1hErr1032qa/N0+D9xkjh6OVXXijL8moRaArekRSJMvzc0RDzL05og
 YG3dwMPk2HU3jO4StXrafPEp1iN9iJs62O3xFTkVKC+SpVpcWUo+YvtCfUQqm5NetWe9
 TYmFkwiuX+EajPdPce5yeH8nF+EeIw4Uos5I0KFuqTTSFo/fAsueDXItp+kl4mrw+98d
 kivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tzlSB8RptGMbFL1ldDE2HK28AgnehYV0J78KA757CyM=;
 b=XCsNHFIaCfNZLE3Mm6wvHF5opRiGAODEfW91Z664SchsKT9mFtuL46okxPE065ff2t
 BI3UlVoFkW6CZVFV039hNpnfqiiKNPfg53dxRjLNrUo6YPJ1JIdEB5bTbwrfLEZWA26k
 lfVfAvVCYZXB0YLyQQ9MFxkkqgO2x9AJoXdQ9Nb6/jqBEGOvwPvvbtCqZAWGIDE5go+h
 72CLFffbRT9k+hT+xD7iz/vp9EboVJMrtcQbMOvjzs69i3aye5VCIU8I8soOVZklGEAE
 5rCXg2TFOkUrIkTzxtedZYGpqdwC1cqj9YjXx2drDozola6LTHaqe+Lc0Faqelmcnwpp
 3Hjw==
X-Gm-Message-State: AOAM533+xvCKZ66Q7tq9ZSsHrvP3rodahlcBlWJJta1qwo4MjVydEbls
 TuPl+gNy/vLr8gG47uH0WAg=
X-Google-Smtp-Source: ABdhPJxebjvUBdMl5fmL+KYjDIc/m+/ZRdEx1v8YRV9LSBNHnkI46BxmD4txjerH9p67ml2h0kMVsA==
X-Received: by 2002:a17:902:e54e:b029:de:8c70:2ec4 with SMTP id
 n14-20020a170902e54eb02900de8c702ec4mr15301242plf.56.1611816200928; 
 Wed, 27 Jan 2021 22:43:20 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id v19sm3800609pjh.37.2021.01.27.22.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 22:43:20 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/sd: sd: erase operation fixes
Date: Thu, 28 Jan 2021 14:43:09 +0800
Message-Id: <20210128064312.16085-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This includes several fixes related to erase operation of a SD card.

Based-on:
http://patchwork.ozlabs.org/project/qemu-devel/list/?series=226785


Bin Meng (3):
  hw/sd: sd: Fix address check in sd_erase()
  hw/sd: sd: Move the sd_block_{read,write} and macros ahead
  hw/sd: sd: Actually perform the erase operation

 hw/sd/sd.c | 53 +++++++++++++++++++++++++++++++----------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

-- 
2.25.1


