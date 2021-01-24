Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367FD301EB6
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 21:30:47 +0100 (CET)
Received: from localhost ([::1]:42126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3m22-0001hG-9C
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 15:30:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3lzl-0000DQ-8C; Sun, 24 Jan 2021 15:28:25 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3lzi-0005I1-Dy; Sun, 24 Jan 2021 15:28:24 -0500
Received: by mail-wr1-x430.google.com with SMTP id 7so10258105wrz.0;
 Sun, 24 Jan 2021 12:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kZdgPCGjjFaMHL7CSDAi8Z55EsSivWTkPQ5KHWDEe28=;
 b=AUAIIkIotywGjjO8fnmnLnyUidojKJCjmkMezAbhwGVW0JhJAoLlfovLX8H3QDklur
 CJwsa3ZCmsJjwAYsNO46gIYat/4t7EQj4SIU/MogOavexdr27FdjZEtd6bnTSlI0kRni
 H9xYO1vIAkKQ2cwvpJSFrGsFAmoy285IEVQW4g9vQOa0J116hfB5bdDIuP59O5ok+GK8
 ORL/QPdGaMFTkDuyNuT8gFEQ/W+cpXmJC/Z0YtoNKJKLGOZs/C2qwerJSHbx05JUR/pR
 zsue8JqFCz8U00kfLd0pg2POsepBYCgaqezjOsAeAKFfhy/QAsaM3lWRgMXbgw/eu+20
 8gFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=kZdgPCGjjFaMHL7CSDAi8Z55EsSivWTkPQ5KHWDEe28=;
 b=Zlm2QE/uvflBSQ620Gx2xvzYQSn1eMkbf5JT/EAjFoi/4vBWgeErJLll4zeiXtcMl5
 G/K+m99/fCnBtTlQpImFt5TMDzVo8ZJ0utRItix/gryBKo0e4SCplKWcVOgY9ZsSCkzt
 fSj8nek7k7Q1Zlvg1cCMa1e11GqmlEEKFIWbReWbBbQXI7dZiJDP7hvkuUQ9hpUaPG9/
 UPJqCUs/rLzoUsdlfh+e+IV0v71dwTFyvpi5TBT+VVIatfFbsKZEUzDsLA0K96YlLJbX
 GxTKDQkYxTHdvRXLMik0UFPtY/ULR7w3UL7nvWBZft5LK1meWSjNOyWSc0WWthqt2zaI
 C2PA==
X-Gm-Message-State: AOAM531QhK1M5BXKml8jc5zHsHLlrjDVW75NKw1WjXk1GlwPyHF+LAJf
 rQlKavUONXA32JcYsBhRq9SLft/v7Wo=
X-Google-Smtp-Source: ABdhPJzo6WztNdO138eeUOeMWAiChDSDSk8gyy8lcCjDVfRY5OAq6NFpPfm2zR0HwaOTvZXwoC2ZYA==
X-Received: by 2002:a05:6000:10cd:: with SMTP id
 b13mr9919937wrx.163.1611520099921; 
 Sun, 24 Jan 2021 12:28:19 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id o17sm13911971wrp.34.2021.01.24.12.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 12:28:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 0/6] hw/sd: Support block write in SPI mode
Date: Sun, 24 Jan 2021 21:28:11 +0100
Message-Id: <20210124202817.2624557-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Pragnesh Patel <pragnesh.patel@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are Bin's SD patches from his v2, rebased on sd-next.=0D
=0D
v2:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg775712.html=0D
=0D
Based-on: <20210124201106.2602238-1-f4bug@amsat.org>=0D
=0D
Bin Meng (6):=0D
  hw/sd: ssi-sd: Support multiple block read=0D
  hw/sd: sd: Remove duplicated codes in single/multiple block read/write=0D
  hw/sd: sd: Allow single/multiple block write for SPI mode=0D
  hw/sd: Introduce receive_ready() callback=0D
  hw/sd: ssi-sd: Support single block write=0D
  hw/sd: ssi-sd: Support multiple block write=0D
=0D
 include/hw/sd/sd.h |   2 +=0D
 hw/sd/core.c       |  13 +++++=0D
 hw/sd/sd.c         |  56 +++-------------------=0D
 hw/sd/ssi-sd.c     | 117 ++++++++++++++++++++++++++++++++++++++++-----=0D
 4 files changed, 125 insertions(+), 63 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

