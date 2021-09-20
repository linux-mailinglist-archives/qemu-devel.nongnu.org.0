Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F41D410F95
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 08:42:59 +0200 (CEST)
Received: from localhost ([::1]:45242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSD0z-0003KM-PK
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 02:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSCyz-0001DH-7U
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:40:53 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSCyx-0004IK-NB
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:40:53 -0400
Received: by mail-wr1-x434.google.com with SMTP id i23so26929621wrb.2
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 23:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s5i/nrmuLqKYjhJSNFR0Rf5VEUuslQhRWANTWm1SZRo=;
 b=cyCal7ejGVtjsTYzaFDAPRQ7w+2cJ6pmtTE2XX3wJgPNPZ7xWezEU/0sMTS8SAWc3s
 qkopLgyHrf7yVfz6wHLfvS9l7qBXFWesG394WSw89ynf0+cafFHV1P3NiUVuukDaSn6H
 C1BDzGGX/yVCFYojCThh5vQBmyhqcbhZIcCn43W2seCdZbsSMyQ7j1GHaB2dWgzATeNy
 c2RRl77U28FnbkXxZg0fFEJVak5tzvLR7pyo0bW51lmtfNMeORrgSmbv9MSLAL0rGSHr
 eVhvYyGWjZWJty7Z72npYogfY/w3QWWKDJ8TwaxFOvOizHBA6uRQeJsvKhgHnUD+ioS5
 Z0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=s5i/nrmuLqKYjhJSNFR0Rf5VEUuslQhRWANTWm1SZRo=;
 b=pR43z8UeMTvhgluudGmPfD+ZZprXmmAX3r+SRQHI1aHHt/cyipq44kQ5ksdcQMR+3D
 FL09Gk7xiE1TTXikxtyYKgKrPN/irRRBULZacBOlC6QZvfoF6TRLrQgJe9a04u75qBU2
 6EBh7UYzcaNw/BeKfdEnSz7+LiLd5Tp6QObNwVXmpKMxz2xjT/JJ7Xt38pGR4/4O1FcG
 GM/1PFqj/ll0BYdE/JzthLCbXjDl9QwS63qa0qA3flsJlBVTsKGmyLDk2RcMUJCs4Rxt
 0pNqkmkllpWPgTxABjTCaTimwUvosWJIvsVOJywbH59U0/jHq+Em342uXYuwEHw00OXe
 61Ng==
X-Gm-Message-State: AOAM530+fL1Hk7vOaJf9EspLyR+5v0O6UzgDR+Zzs5J7+px0pPb93mwY
 u97yJamiuCt9RYIuMXxujzJSXcBtOLQ=
X-Google-Smtp-Source: ABdhPJzOal7+pbkHljVtoM/nFibmbaw+mP9C3a0yMRoXcsywe96zD0Zdw0Ga53n4aE9uefQM+HsHBw==
X-Received: by 2002:a05:6000:11c6:: with SMTP id
 i6mr26021807wrx.177.1632120050012; 
 Sun, 19 Sep 2021 23:40:50 -0700 (PDT)
Received: from x1w.. (14.red-83-35-25.dynamicip.rima-tde.net. [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id q7sm14917948wru.56.2021.09.19.23.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 23:40:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/input/lasips2: QOM'ify the Lasi PS/2
Date: Mon, 20 Sep 2021 08:40:45 +0200
Message-Id: <20210920064048.2729397-1-f4bug@amsat.org>
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
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Slowly nuking non-QOM devices: Lasi PS/2's turn.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/input/lasips2: Fix typos in function names=0D
  hw/input/lasips2: Move LASIPS2State declaration to=0D
    'hw/input/lasips2.h'=0D
  hw/input/lasips2: QOM'ify the Lasi PS/2=0D
=0D
 include/hw/input/lasips2.h | 31 ++++++++++++++++--=0D
 hw/hppa/lasi.c             | 10 +++++-=0D
 hw/input/lasips2.c         | 64 +++++++++++++++++++-------------------=0D
 3 files changed, 70 insertions(+), 35 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

