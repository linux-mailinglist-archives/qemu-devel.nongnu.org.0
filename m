Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7C53E3B48
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 18:10:07 +0200 (CEST)
Received: from localhost ([::1]:37960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mClNG-0006mV-7n
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 12:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mClM1-00052R-SX
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 12:08:50 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mClM0-00017k-KH
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 12:08:49 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so9727661wmd.3
 for <qemu-devel@nongnu.org>; Sun, 08 Aug 2021 09:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bcnlUBRcImU1T64VGmGbhAlyU3vlvpDevzNQmpQI9sA=;
 b=uyFFDWQwaa5Kx3OEScpXpuIPGZkgSSYyHXyoNPNH7KFos1XcE6kaRT3xySTWL7s8wx
 02Tnb5/s/D0Zd0PmuzYfiB7Mz8dbTaNla8WM+TkbMLu3RyepMuFvwkCSeNiLbmXca3E0
 FDq3yCHK8Ocl+4wT/OEb198ifORThNsfusNeNibcKDoDyS92lb2kjF49nsyrCmh0pibV
 uQ4GSf8hy7E/f/loC/yxlrFP5rdqi4syLhyXy4DCKUJrO8N5TCdx74KROuJpRBJPsHyW
 5/sxYyLWrEfcLzT94gUf42bjfsABHJY++tEfICuSmYVVKpRMA7IlVTq98B6T7dChOCVT
 u3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=bcnlUBRcImU1T64VGmGbhAlyU3vlvpDevzNQmpQI9sA=;
 b=RZ11gB2GiI7fWNmi9SknmCU4NPbx4dT8EcABfCikAkO5ycG5HobryR148cgPVGmsgI
 CEof9PhW0ffiBphgR9fPPBJdjPlJi0LgLFb3hCC9tUb+WyCU20MOD+vuZ4jKgAIZuUUS
 utwmrhPbo0X4MZw1ldCf4N0eR1rFkFfLw7Jry8+d7Oeb+7vcr3sU4R3DtpIIOi8mwf1b
 mipvn8QqSlDcvy3/PNti53899Ssxi03mlPM9h6GdoNErWokA9YDFpymPeNEnvXm7wSdX
 gDERqGwEnlBCfPny3oQo8Or2/6pSRrkNYQfSjxVG84g8Dg/TyD7p7xFQU7QOdpL+maNB
 SneQ==
X-Gm-Message-State: AOAM533hH2Rf+4eNHUY3sWmegSLmcn/uKoXbhAfubDkA5XclUvL4XNLK
 OU+HAgyCJnQaXC2agAkAjrAbCmOPn60=
X-Google-Smtp-Source: ABdhPJwrlU8SarYJryKwb9JA1Lu0Z0JUsJo2LSe6R6JODn/swjuwYHaZ3Wkc3nrbBqAFUA1uhPVt+w==
X-Received: by 2002:a7b:cd86:: with SMTP id y6mr29486076wmj.181.1628438926055; 
 Sun, 08 Aug 2021 09:08:46 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 p14sm5357081wro.3.2021.08.08.09.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 09:08:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 0/2] target/mips: Use tcg_constant_* in TX79 & MXU
Date: Sun,  8 Aug 2021 18:08:41 +0200
Message-Id: <20210808160843.84957-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  target/mips/tx79: Use tcg_constant_tl()=0D
  target/mips/mxu: Use tcg_constant_i32()=0D
=0D
 target/mips/tcg/mxu_translate.c  | 6 ++----=0D
 target/mips/tcg/tx79_translate.c | 6 ++----=0D
 2 files changed, 4 insertions(+), 8 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

