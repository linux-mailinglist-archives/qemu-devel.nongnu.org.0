Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A229B3F0DC3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:57:32 +0200 (CEST)
Received: from localhost ([::1]:33442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTYx-0005kA-FX
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTWs-0003UE-TX
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:55:22 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTWr-0008Gl-BG
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:55:22 -0400
Received: by mail-wr1-x430.google.com with SMTP id f5so5693282wrm.13
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Da6EsThSeszrgYQUblATB14MI1TjP70OBrsaWnOnaT8=;
 b=f+CX2mZITghy9c5CD+6wzpH1v3tI9sXGbnrgzRQQ087XSeHKG+QT4hOresVsFzCHpK
 zqe4ijy1LAJ10yAEZ9lbje++skqmAadR8rkv2+Gw9M5hOvXXUSgdsoYzyrYyKNQ5Q5mh
 I8NQsVkdqB/edgvwUIAuFvXloTY4amD+hrzdNH80Iz/vU9cQrgnD93xylWvYdN6mQRMk
 3STU3q1eiVLuMZHaCOMS+3Pl1t3d+zcRFtm/Q4r0nDV2kg587vgMICC9tqf5QECJxTQP
 t443tbo+yE9FMBxZwofSUbf0Yvo+4evRoXWz/HuVGY/UZz95XqcwwX7VObFKa7L/pCxE
 MI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Da6EsThSeszrgYQUblATB14MI1TjP70OBrsaWnOnaT8=;
 b=ZCvSeayrMvTP0KrvBzNMy/AO63LhpmuAXM2ikvgxZOh5+Nb/lzAvxKucUg6gxoWclK
 Yyxos2uPnKAuLlBO+T+7afYokcGpKA3tkicmuogPTe3vhODaFLBIv7jnpwVCYJAclqhg
 iUV5ST7bmiWZKaTFPlVeZKvZ8tzX5Y8/liz22arMkTDhYCHeIts0TQJr31jgkLOaRkND
 qGuJY/blD/nDNy/LxizzsO6xfFQcE61rz1tpTXzjTPYGQW3g4PBwR5LV3l1NAGDurwmD
 AYXRMmnj6uz1eFQQRn0gTbtQ42plC+Fpnvr6F59jybS0217lKnhf/mkRhas+z1VyQEHi
 3c+w==
X-Gm-Message-State: AOAM532u/0bl+ddmZi95MnWdyj/mYVGFQKlumnpU1mQBngEMaL9xNZAP
 HgpqUgsd/JSI/xcVzFa2iyaV1IK10X4=
X-Google-Smtp-Source: ABdhPJyreDljs36MXGKvBo+6ItgE41/Odf5EXxMlYrCoDr+2GpA+iwF81hgGNuLSpmFU4DkBt9exRw==
X-Received: by 2002:a5d:5085:: with SMTP id a5mr13724774wrt.62.1629323719645; 
 Wed, 18 Aug 2021 14:55:19 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id e17sm1043447wru.7.2021.08.18.14.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:55:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] target/mips: Replace TARGET_WORDS_BIGENDIAN by
 cpu_is_bigendian()
Date: Wed, 18 Aug 2021 23:55:12 +0200
Message-Id: <20210818215517.2560994-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing review: 1-3=0D
=0D
MIPS CPU store its endianess in the CP0 Config0 register.=0D
Use that runtime information instead of #ifdef'ry checking=0D
TARGET_WORDS_BIGENDIAN by introducing the cpu_is_bigendian()=0D
helper.=0D
=0D
Since v1:=0D
- Addressed rth's comments (call cpu_is_bigendian/get_lmask once)=0D
- Add rth R-b on patches 4-5=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  target/mips: Call cpu_is_bigendian & inline GET_OFFSET in ld/st=0D
    helpers=0D
  target/mips: Replace GET_LMASK() macro by get_lmask(32) function=0D
  target/mips: Replace GET_LMASK64() macro by get_lmask(64) function=0D
  target/mips: Store CP0_Config0 in DisasContext=0D
  target/mips: Replace TARGET_WORDS_BIGENDIAN by cpu_is_bigendian()=0D
=0D
 target/mips/tcg/translate.h              |   6 ++=0D
 target/mips/tcg/ldst_helper.c            | 122 +++++++++++++----------=0D
 target/mips/tcg/translate.c              |  71 ++++++-------=0D
 target/mips/tcg/nanomips_translate.c.inc |  20 ++--=0D
 4 files changed, 122 insertions(+), 97 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

