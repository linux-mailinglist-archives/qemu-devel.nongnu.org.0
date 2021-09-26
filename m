Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD90418B5E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:03:50 +0200 (CEST)
Received: from localhost ([::1]:34300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcFQ-0000m6-W8
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcCs-0007KU-FP; Sun, 26 Sep 2021 18:01:11 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcCq-0000Nw-5Z; Sun, 26 Sep 2021 18:01:09 -0400
Received: by mail-wr1-x434.google.com with SMTP id d21so46228645wra.12;
 Sun, 26 Sep 2021 15:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hk516RwLtnA+J+S1W9+zxqbCKy6xKPg380zaTXEsGVw=;
 b=aoG4gnmM1fg2WAdBKyVSRHoqDsUaup4PHYQ2ksLIUYPM0NG/e6gwsfB6ZO6QXbKEMb
 4XEDKBPDa8iyrmGPth9VTVoqiTt1n/LvKQnFTce0pgAIPcRcgxnWWz7oo7WHBV0U8gl2
 6vNJcNBMOJ1yVsE/WBV+0R/hlVHh6LnDytgKk+QB2Ff0cV4V17lwIp1Jps0lXpQF9Ivh
 KNQ0tbneCQVQv8WqJXNOdzbRJ3QJjo38ytQe7/duOaQzMKcSMdTLVxZFgDkRcEwdW/1A
 VfhdaGZkb8m8x/SEhihW/ICkwhboCWBSI+ekBCW3TnNfJPW+X10UXJTLXHhpBgu7JvSX
 2Lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Hk516RwLtnA+J+S1W9+zxqbCKy6xKPg380zaTXEsGVw=;
 b=tKT/rTXbmPM8BGns0NsQUSlyYW3osO6eBJA0N2wiLrFxkmbpbcA+9VdcXp9sUM+uaS
 0kHRyUgIOnMlbAnruhK462S98vb/NzgPuh7LFmcfD8ofmMwpE1DatpWH103/XzX3AC9h
 0eO6N+OmNdF1y3O29gY4hgwaEamSU0mVrnT8VyeeqK1oIaFMk9+5eKcqLtjcanY9A0pu
 vvaMdFvsMqiqNHlbnJGwHfuGkjvNvA6p81auaJ339YiJY0aj2piX0vsIGXN+WydxLMcr
 ulDqEbwmh4VaFuyOi9Iepsmo34vcVOvEjQoKgj9Pev+xGhuxmG+L3fpXApSyieZJGQ8G
 tZ2A==
X-Gm-Message-State: AOAM533V5QWvHFzomOf7kZtK/f4nS1HJF7olxFij85UA+5C0pvg2J0Rn
 sxazIGnCf08CxKHmYIZgpYS9b0+QFG0=
X-Google-Smtp-Source: ABdhPJxH2G8thzBIprgr9LruAqq5HGxvY+hirOAWBhQls/TYXKC7Zn8LQran++FstJgPQgMEwSQxyg==
X-Received: by 2002:adf:e646:: with SMTP id b6mr24377479wrn.153.1632693665810; 
 Sun, 26 Sep 2021 15:01:05 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 r9sm14560752wru.2.2021.09.26.15.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:01:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] user-mode: Avoid processing unnecessary meson rules
Date: Mon, 27 Sep 2021 00:01:01 +0200
Message-Id: <20210926220103.1721355-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only process linux-user/meson.build on Linux (respectively on BSD).=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  bsd-user: Only process meson rules on BSD host=0D
  linux-user: Only process meson rules on Linux host=0D
=0D
 bsd-user/meson.build   | 4 ++++=0D
 linux-user/meson.build | 4 ++++=0D
 2 files changed, 8 insertions(+)=0D
=0D
-- =0D
2.31.1=0D
=0D

