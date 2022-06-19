Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DE35507A6
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 02:17:50 +0200 (CEST)
Received: from localhost ([::1]:40264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2idR-0001JA-7A
	for lists+qemu-devel@lfdr.de; Sat, 18 Jun 2022 20:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2ibS-0007T1-Ez
 for qemu-devel@nongnu.org; Sat, 18 Jun 2022 20:15:46 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:38674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2ibQ-0001wr-OC
 for qemu-devel@nongnu.org; Sat, 18 Jun 2022 20:15:46 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 p3-20020a17090a428300b001ec865eb4a2so2512133pjg.3
 for <qemu-devel@nongnu.org>; Sat, 18 Jun 2022 17:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ujn5G+wwPlkF3YRhTOae2EhzDxKtq1O/qgyrxfdb2t8=;
 b=NgUNnZjAO1+LMKA0zYI8X+0f3FfmucQYaadfnA9B7IuOIeHwr5RmrHwZgHsYczdfBq
 OygypcezEBTeW+k039MJl8Sed3UTBI0tRGyvXR9DdRAcPz8WNj5isL644855EXR9TnRu
 pmYJsMILxcmgy4kF3pYirVevxtx87uJ/qF6a5UzJ8CrHFyMY6FsRd2fbddoYIalkUz0r
 QNrQWMZEBTMXT8ZoGFBQBbzqur4UYeWFkvZbEHW70cNVec2j1ZUfLtcvuV1hfK7mBEvu
 EUdnSzfPf4NMkfc7waUqWPuxzsCojEhVC1clL6iWJXQMN++Vaoh/u0P4t9p9qX82hUqx
 nl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ujn5G+wwPlkF3YRhTOae2EhzDxKtq1O/qgyrxfdb2t8=;
 b=8DCDBTf0hOUkOYzkulhczwwzCUUiNU1nEdoBfmpqCUPTlew8Tky/p/h84Zr+ySUAJJ
 7kCWNVd9Hz0joKa45HM2+KuXnKZ0Fts3Xxx1siVfgtvjFxpNt9PEBFjoYZd+qhWx5fkr
 JX/1xn9kHV5CLuhDILpYY++168VUT/tj1VRAHZnvafYBuyoJp7gKWZZvcQR/yDkgjfZN
 Ge60i3blTsZTGyv8Aagyt14TLK2ty+XOT6L8AM/Blj3y9Q7r+cuicjz9p6EfV2UdwyJt
 1lNDfKW5k57w8VTfokEPM5E+A25yg7scK8D8/pzaJDXKjU/nEgM9bReqXJfYL7uUKcbn
 daTA==
X-Gm-Message-State: AJIora+uth1i9HG3pQAtYec+oTx9UIDrjM1TopHOzhA8ZJF1u0jdEd40
 eJhu1oOqB5D6fnbVWKBeCKF0abh1NeIEcA==
X-Google-Smtp-Source: AGRyM1uQKx0X8ZgAHXaGweOvA/1tU1tSgA0e7IhM6aP9E7TlZo5u0Ywydm6AqmJz2QimDfA7qjL0XQ==
X-Received: by 2002:a17:90a:1109:b0:1ea:f413:f72d with SMTP id
 d9-20020a17090a110900b001eaf413f72dmr16247372pja.127.1655597742869; 
 Sat, 18 Jun 2022 17:15:42 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:848a:b814:8a9c:88d6])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a17090a5d1100b001e0d4169365sm7790724pji.17.2022.06.18.17.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 17:15:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/2] target/arm: Fix issue 1078
Date: Sat, 18 Jun 2022 17:15:39 -0700
Message-Id: <20220619001541.131672-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Nicely summarized by the reporter, but I thought it would be
nicer to pull all of the logic into arm_pamax, rather than
leave it separated.


r~


Richard Henderson (2):
  target/arm: Extend arm_pamax to more than aarch64
  target/arm: Check V7VE as well as LPAE in arm_pamax

 hw/arm/virt.c    | 10 +---------
 target/arm/ptw.c | 26 ++++++++++++++++++++------
 2 files changed, 21 insertions(+), 15 deletions(-)

-- 
2.34.1


