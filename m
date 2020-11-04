Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B492A609C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 10:36:56 +0100 (CET)
Received: from localhost ([::1]:39298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaFDr-0001AA-23
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 04:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kaFCf-0008N1-Kh
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 04:35:41 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kaFCe-0003uk-1x
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 04:35:41 -0500
Received: by mail-wm1-x335.google.com with SMTP id 205so1663541wma.4
 for <qemu-devel@nongnu.org>; Wed, 04 Nov 2020 01:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FoSf+hhuH+dHHDXDg9BGptWHgztXyeO+C7BKfZ1Y70Y=;
 b=Rm23U3YA9enz7DE07H2Ph4QVsCpPMKUc2ds2a+Ea0ljsgT8/oyTrouZLhNPBq58SSh
 J498xfn4miUJvztI2Fmd2eg8ZWJzK289+1CEWz3Ar3ktqG94FCejOpcDQrpdWq0sMu1d
 lfSE2eQDvwTUH5EULyZvikvMEfOPZ4ILI9+5Wc2WmTF0C0KL32yV01Tflpgzt/C4HO66
 5zi5UhIN9ag0Ix2sC3XZ3yjNOGIovs3V/LrlNACen98nN4yUNCY4cVbQoGiuNbFpLxkh
 7qHeiUJi0CKfYjybbi/0tk8jSeKTaYiqQf8VKro0/L5Cgm5+jnuvsGVXfkF6bs8+D6NS
 uJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=FoSf+hhuH+dHHDXDg9BGptWHgztXyeO+C7BKfZ1Y70Y=;
 b=IJ+u82DkUrNXbqX7AAm/PBuTbSjdDyKzYiZmhbT8I+kMWzICkPEXiebpXz7T08AcQD
 OCfE0DMFz9PQ8fONc9yCDhC+G9/miYaw+7otQZzqD5abfk2x8Oea4QtcLeyZCb2phRNV
 Eh7QysquRG+ydJRr3uuvcI1kVkeqTvu51LFeUSPO7LOWUVqHNKULGaY5zsIIKyXwbcXL
 iGSKtY2Ufrm+64t4qkM+CCLkcV1/6g0qlZoPRv2g4y3xEP28ENjCaMMypFBc/fGRlUix
 xz5WeQobLjkCXTNnEliZi0R/zYaSNxFtmZSYsgqcw/GMVFUk3wfRucrI/l+kyCJ4ZyPs
 ezGg==
X-Gm-Message-State: AOAM532SJxZrDzaeQB4sPhjXvgoRzrp2adh9+UVT9I2Y4knFySQtBKfT
 fzWobWUCZIY7hXtA6jXi+ax1Xsb2DrY=
X-Google-Smtp-Source: ABdhPJwX96aN7qhly53iiTAex3fcoSe11gqfX/5wdGbiswFuSUH1JgmbpqKgVL8RI7hUaBxemn7C5w==
X-Received: by 2002:a7b:c015:: with SMTP id c21mr3571604wmb.22.1604482537732; 
 Wed, 04 Nov 2020 01:35:37 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id b7sm1646244wrp.16.2020.11.04.01.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 01:35:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] exec: Ensure variable page size is only used with
 TARGET_PAGE_BITS_VARY
Date: Wed,  4 Nov 2020 10:35:32 +0100
Message-Id: <20201104093534.3064440-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simple patch while trying to figure out Fuloong-2E 16KB page size.=0D
Better safe than sorry =3D)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  MAINTAINERS: Cover exec-vary.c (variable page size)=0D
  exec: Ensure variable page size is only used with=0D
    TARGET_PAGE_BITS_VARY=0D
=0D
 include/qemu-common.h | 4 +++-=0D
 exec-vary.c           | 4 +++-=0D
 MAINTAINERS           | 1 +=0D
 3 files changed, 7 insertions(+), 2 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

