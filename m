Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A870F61198E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 19:45:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooTOh-0002XW-2N; Fri, 28 Oct 2022 13:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1ooTOQ-0002Ro-7l
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 13:43:46 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1ooTOO-0005Yy-9R
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 13:43:41 -0400
Received: by mail-io1-xd34.google.com with SMTP id b79so5189636iof.5
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 10:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2cdWRM1ZgG8Vd8pIZk0lYalj0gNDw2CGP54+fz0lqxI=;
 b=3Ck4/v/CaesR1xuaKl0gzxRrYYdcYGnW3Te7+qqIXyJ9Q0ZiHtHZyEYUmNhpnd2RZx
 5I747IDy1yFNc78XHKlvi9sX2866YB0r9pa5NWSoi936yPUcNJGMSM+AO9YX+yO2hAo/
 QALiJgKHvWEQDpXFzFwlpcBNEvD7AQlZ+6rXYWoJpvlfdS/uyAKqGNQjwjdJna914kol
 UdJ3xgLay9mPwaiXqS7OvCWX/6kV+n4n6uMt6oLvz6Ci3lW+8DOJPMoM07owBZS4rcgP
 oJfAcZRrZDGIv1Wz5P5POWWc7jtEiZccFIoJ8SADRtpmr+YAOpmPOTrRIfi3DShzH2bq
 2tkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2cdWRM1ZgG8Vd8pIZk0lYalj0gNDw2CGP54+fz0lqxI=;
 b=dh58uhLm1MrbEn7ph81yvN287ABgG4xZsJrsYJrmt4oC2ossaB79nW/3uOOdUwO6Qt
 +LMu3iQh3zarb+rphzyaF2OExAylJWEM0mu8P7cymnJk2PKF9xIW1o4PTpafps2ImIzE
 I3s/aq7Tj2QSTUMqK/wqdYvlUY5LTM6X7miBTOvvHkSrvqJUPjHaLA2o9kxo7680e54r
 WNjmeUrAIyzRblNsKvJvfvWJTkzPOTXtscInDCL9Y3+IcHnj6hNskXMSAEg8CWDycwep
 gPwiSXz8axqa/J0h3aMhQa5rKprRlhibXDUZij/swM2W9/uWVZSAqaq8Vhz0PNrGjbr6
 Qiuw==
X-Gm-Message-State: ACrzQf3mwozxapEIUjtrmGh8kmARcrqYuYSmjvU5bl9gPjyB5UoOA8rh
 Qts4fHtwYHG+2eiCcPcoMTUpXucyAR6cGg==
X-Google-Smtp-Source: AMsMyM4flN8kF+l8kMJWOoCLsi6m7pLp0cZIQdooPL7IcA8WlNwfanT5GMdYRV+irwZO8A1zOnuJTw==
X-Received: by 2002:a05:6638:24c6:b0:364:609:ea7c with SMTP id
 y6-20020a05663824c600b003640609ea7cmr352385jat.262.1666979017872; 
 Fri, 28 Oct 2022 10:43:37 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 p8-20020a027808000000b003733e2ce4e8sm1930453jac.59.2022.10.28.10.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 10:43:37 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Baldwin <jhb@freebsd.org>
Subject: [PULL 0/1] Imp 202210 patches
Date: Fri, 28 Oct 2022 11:45:45 -0600
Message-Id: <20221028174546.88683-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 344744e148e6e865f5a57e745b02a87e5ea534ad:

  Merge tag 'dump-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2022-10-26 10:53:49 -0400)

are available in the Git repository at:

  ssh://git@github.com/qemu-bsd-user/qemu-bsd-user.git tags/imp-202210-pull-request

for you to fetch changes up to 41bf9322a0f8378b1194324cf7c6048253673046:

  bsd-user: Catch up with sys/param.h requirement for machine/pmap.h (2022-10-26 14:09:17 -0600)

----------------------------------------------------------------
bsd-user: 7.2 misc fixes

Light quarter: only one fix due to header file shuffling in FreeBSD

----------------------------------------------------------------

Muhammad Moinur Rahman (1):
  bsd-user: Catch up with sys/param.h requirement for machine/pmap.h

 bsd-user/host/i386/host-signal.h   | 1 +
 bsd-user/host/x86_64/host-signal.h | 1 +
 2 files changed, 2 insertions(+)

-- 
2.33.1


